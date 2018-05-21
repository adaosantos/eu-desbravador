defmodule EuDesbravador.Types.User do
  use Absinthe.Schema.Notation

  @desc "A user (administrative) of the Eu Desbravador"
  object :user do
    field(:id, :id)
    field(:active, :boolean)
    field(:email, :string)
    field(:name, :string)
    field(:token, :string)
  end

  object :session do
    field(:token, :string)
  end
end