# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Log with password admin email admin@suggestions.com
# REMOVE THIS ON PRODUCTION
if Rails.env.development?
  User.create(name: 'Admin', email: 'admin@suggestions.com', password_digest: '$2a$06$r97ZGJV7SOFg8MO6cBm20O8mZexIw86l1oNJ/L/rtT8ln4CUXKxTS')  
end
