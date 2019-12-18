defmodule TriageWeb.Router do
  use TriageWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", TriageWeb do
    pipe_through :api
      get "/symptoms", SymptomsController, :index
      # get "/symptoms/location", SymptomsController, :by_location
      get "/symptoms/:id", SymptomsController, :show
  end
end
