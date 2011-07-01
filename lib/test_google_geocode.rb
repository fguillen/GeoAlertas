#
# para testear la gema google-geocode
#
# http://dev.robotcoop.com/Libraries/google-geocode/
#

require 'rubygems'
require 'google_geocode'

gg = GoogleGeocode.new 'ABQIAAAAlqHVgda1Vyq8JQWd9v1BVRQ_qjPAjoT_JgKhBcWvK4R7KHDklxSaxm8hBwS6VLhr_YORMCUu3nrqjQ'

address = 'nicolas morales 38, madrid'
location = gg.locate address
puts 'address:' + address
puts 'address:' + location.address
puts 'lat:' + location.latitude.to_s
puts 'lng:' + location.longitude.to_s

address = '28019, madrid'
location = gg.locate address
puts 'address:' + address
puts 'address:' + location.address
puts 'lat:' + location.latitude.to_s
puts 'lng:' + location.longitude.to_s
