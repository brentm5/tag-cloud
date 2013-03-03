require 'factory_girl'
include FactoryGirl::Syntax::Methods
require 'factories'

puts 'Creating a default admin user for oauth change'
puts 'admin@email.com'
create(:user, email: 'admin@email.com', name: 'Admin')
