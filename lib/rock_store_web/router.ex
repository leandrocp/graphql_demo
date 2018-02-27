defmodule RockStoreWeb.Router do
  use RockStoreWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: RockStoreWeb.Schema,
      interface: :simple,
      context: %{pubsub: RockStoreWeb.Endpoint}
  end
end
