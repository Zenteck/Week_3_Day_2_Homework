require('pry')
require_relative('./models/properties.rb')

Property.delete_all()

  property1 = Property.new ({
    'address' => '17 Thorkell Road',
    'build_type' => 'Semi-Detached',
    'year_built' => 1956,
    'bedrooms' => 3,
    'square_footage' => 1000,
    'buy_let_status' => 'rent',
    'value' => 50000,
    })

  property2 = Property.new ({
    'address' => '17 Thorfinn Terrace',
    'build_type' => 'Semi-Detached',
    'year_built' => 1955,
    'bedrooms' => 3,
    'square_footage' => 1000,
    'buy_let_status' => 'rent',
    'value' => 48000,
    })

  property3 = Property.new ({
    'address' => '4B Annandale Street',
    'build_type' => 'Flat',
    'year_built' => 2002,
    'bedrooms' => 3,
    'square_footage' => 80,
    'buy_let_status' => 'rent',
    'value' => 180000,
    })

  property4 = Property.new({
    'address' => '150 Sloan Street',
    'build_type' => 'Flat',
    'year_built' => 1987,
    'bedrooms' => 2,
    'square_footage' => 90,
    'buy_let_status' => 'buy',
    'value' => 90000
    })

  property1.save()
  property2.save()
  property3.save()
  property4.save()

  binding.pry

nil
