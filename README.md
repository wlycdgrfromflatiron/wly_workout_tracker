This is a workout tracker app.

To try it out:
* Clone repo
* 'bundle install' to install dependencies
* 'rake db:migrate' to initialize database
* 'shotgun' or 'rackup' to start server

To make sure sessions work correctly, you'll also want to use SecureRandom to generate a session secret and export it to the SINATRA_SESSION_SECRET environment variable.

Built in Sinatra for a Flatiron School project.

Licensed under GNU AGPLv3.