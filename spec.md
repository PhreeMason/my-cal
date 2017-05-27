# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) - calendars has_many months
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) - months belongs_to calendars and calendars belongs_to users
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) - users has_many tasks through: :calendars
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) - tasks
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - tasks must be set for a future time.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - Task.upcoming_for_user(user) finds all tasks for a user that has not already expired.
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) - tasks forms writes to the months model using the time date attribute
- [x] Include signup (how e.g. Devise) - Devise user
- [x] Include login (how e.g. Devise) - Devise user
- [x] Include logout (how e.g. Devise) - Devise user
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Devise/OmniAuth signup through facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - tasks is a nested resource for months
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) - /months/:month_id/tasks/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - forms show validation error along with red border.

Confirm:
- [x] The application is pretty DRY - yup
- [x] Limited logic in controllers - true
- [x] Views use helper methods if appropriate - true
- [x] Views use partials if appropriate - true
