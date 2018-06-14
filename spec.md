# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
User, Workout, Run
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)
User has_many Workouts
- [s] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
Workout belongs_to User
Run belongs_to Workout
- [x] Include user accounts
- [x] Ensure that users can't modify content created by other users
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
Users can create, view (index and show), update, and destroy their Workouts
- [x] Include user input validations
Username and password are required. Duplicate usernames are not permitted.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
Login and signup forms display validation failure error messages.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
