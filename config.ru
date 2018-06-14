require './config/environment'

if ActiveRecord::Migration.check_pending!
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use SessionController
use UserController
run ApplicationController