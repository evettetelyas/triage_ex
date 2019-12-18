# Triage: Symptoms and Conditions

To start your Phoenix server locally:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Upload symptoms db with mix task `mix symptoms`
  * Upload conditions db with mix task `mix conditions`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Endpoints

  * `/api/v1/symptoms` -> returns all symptoms
  * `/api/v1/symptoms?location=x` -> returns all symptoms on body location x
  * `/api/v1/symptoms/:id` -> returns single symptom with id
  * `/api/v1/conditions` -> returns all conditions
  * `/api/v1/conditions/:id` -> returns single condition with id
