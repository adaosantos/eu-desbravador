defmodule EuDesbravador.Types.Class do
  use Absinthe.Schema.Notation

  @desc "A class of the Eu Desbravador"
  object :class do
    field(:id, :id)
    field(:active, :boolean)
    field(:name, :string)
    field(:slug, :string)
    field(:badge, :string)
    field(:advanced, :boolean)
  end
end