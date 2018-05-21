defmodule EuDesbravadorWeb.Router do
  use EuDesbravadorWeb, :router

  pipeline :graphql do
    plug(:accepts, ["json"])
    plug EuDesbravador.Context
  end

  scope "/" do
    pipe_through(:graphql)

    forward("/graphql", Absinthe.Plug, schema: EuDesbravador.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: EuDesbravador.Schema)
    end
  end
end
