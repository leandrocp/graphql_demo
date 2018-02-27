defmodule RockStoreWeb.Router do
  use RockStoreWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RockStoreWeb do
    pipe_through :api
  end
end
