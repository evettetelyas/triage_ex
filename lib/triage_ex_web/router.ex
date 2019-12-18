defmodule TriageWeb.Router do
  use TriageWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", TriageWeb do
    pipe_through :api
      get "/symptoms", SymptomsController, :index
      get "/symptoms/:id", SymptomsController, :show
      get "/conditions", ConditionsController, :index
      get "/conditions/:id", ConditionsController, :show
  end
end
