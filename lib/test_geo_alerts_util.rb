require 'geo_alerts_util'

#nicolas morales 38, madrid
#lat: 40.390754
#lng: -3.732509
#
#nicolas morales 40, madrid
#lat: 40.390757
#lng: -3.732715
#plaza de españa, madrid
#lat: 40.423549
#lng: -3.713337

puts( '--------------------------' )
puts( 'distancia entre nicolas morales 38 y 40' )
puts( '--------------------------' )
puts GeoAlertsUtil.distance( 40.390754, -3.732509, 40.390757, -3.732715 )

puts( '--------------------------' )
puts( 'distancia entre nicolas morales 38 y plaza de españa' )
puts( '--------------------------' )
puts GeoAlertsUtil.distance( 40.390754, -3.732509, 40.423549, -3.713337 )


puts( '--------------------------' )
puts( 'colisión de 100metros Entre nicolas Morales 38 y 40' )
puts( '--------------------------' )
puts GeoAlertsUtil.collision( 40.390754, -3.732509, 40.390757, -3.732715, 100 )


puts( '--------------------------' )
puts( 'colisión de 10metros Entre nicolas Morales 38 y 40' )
puts( '--------------------------' )
puts GeoAlertsUtil.collision( 40.390754, -3.732509, 40.390757, -3.732715, 10 )

puts( '--------------------------' )
puts( 'colisión de 100metros Entre nicolas Morales 38 y plaza de españa' )
puts( '--------------------------' )
puts GeoAlertsUtil.collision( 40.390754, -3.732509, 40.423549, -3.713337, 100 )

puts( '--------------------------' )
puts( 'colisión de 10km Entre nicolas Morales 38 y plaza de españa' )
puts( '--------------------------' )
puts GeoAlertsUtil.collision( 40.390754, -3.732509, 40.423549, -3.713337, 10000 )



