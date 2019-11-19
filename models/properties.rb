require('pg')

class Property

  attr_accessor :value, :bedrooms, :buy_let_status, :square_footage, :address, :year_built, :build_type
  attr_reader   :id

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @address = info['address']
    @build_type = info['build_type']
    @year_built = info['year_built'].to_i()
    @bedrooms = info['bedrooms'].to_i()
    @square_footage = info['square_footage']
    @buy_let_status = info['buy_let_status']
    @value = info['value'].to_i()
  end

  def save()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "INSERT INTO property_tracker
    (address, build_type, year_built, bedrooms, square_footage, buy_let_status, value)
    VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;"
    #does this work?
    values = [@address, @build_type, @year_built, @bedrooms, @square_footage, @buy_let_status, @value]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    @id = result[0]['id'].to_i()
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "UPDATE property_tracker SET
    (address, build_type, year_built, bedrooms, square_footage, buy_let_status, value)
    = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8;
    "
    values = [@address, @build_type, @year_built, @bedrooms, @square_footage, @buy_let_status, @value, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "DELETE FROM property_tracker WHERE id = $1;"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def Property.delete_all()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "DELETE FROM property_tracker;"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all", [])
    db.close()
  end

  def Property.find(id)
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT * FROM property_tracker WHERE id = $1;"
    values = [id]
    db.prepare("find", sql)
    result = db.exec_prepared("find", values)
    db.close()
    return result.map{|property| Property.new(property)}
  end

  def Property.find_by_address(address)
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "SELECT * FROM property_tracker WHERE address = $1;"
    values = [address]
    db.prepare("find", sql)
    properties = db.exec_prepared("find_by_address", values)
    db.close()
    result = properties.map{|property| Property.new(property)}
      if result == []
        return nil
      else
        return  result
      end
  end

end
