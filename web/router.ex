defmodule ReferenceGraphql.Router do
  use ReferenceGraphql.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ReferenceGraphql do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    if Mix.env == :dev do
      get "/graphiql", Absinthe.Plug.GraphiQL, schema: ReferenceGraphql.Web.Schema
    end

    resources "/references", ReferenceController
  end

  forward "/graphql", Absinthe.Plug,
    schema: ReferenceGraphql.Web.Schema

  # Other scopes may use custom stacks.
  # scope "/api", ReferenceGraphql do
  #   pipe_through :api
  # end
end
