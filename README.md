# Suggestion Box

A simple suggestion box software to allow users to collaborate with ideas
without throwing them into issue tracking systems

Developing
----
 This project built with Rails, so you will need Ruby and the Rails Gem, the supported
 versions of Rails are `4.2.x` and Ruby `2.x`

 Install Rails gem or use the bundled executable located at `bin\rails`
  - Use `bundle install` to install all gems for the project
  - Run `rake db:migrate db:seed` to start the sqlite3 database used on development, migrating it and seeding the user account
  - Start Rails with `rails s`

  Be sure to have no `RAILS_ENV` environment set or set to *development*

Testing
----
 Setup the test suite if needed, info can be found [here](http://buildingrails.com/a/rails_automated_testing_setup_for_beginners)
 First you will need to migrate the database running `bin\rake db:migrate RAKE_ENV=test`

 Then start Guard to watch your tests `bin\bundle exec guard`

 To run the suite, open a new terminal and run the command: `bin\bundle exec rake test`

Deployment
----

 Docker: TBD

 Database: TBD

-----------
Licensed under [The MIT License](./LICENSE)
