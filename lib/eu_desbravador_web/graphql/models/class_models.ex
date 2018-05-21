defmodule EuDesbravador.Models.Class do
  use Ecto.Schema
  import Ecto.Changeset
  alias EuDesbravador.Models.Class

  schema "classes" do
    field(:active, :boolean, default: true, null: false)
    field(:name, :string)
    field(:slug, :string)
    field(:badge, :string)
    field(:advanced, :boolean, default: false, null: false)

    timestamps()
  end

  @doc false
  def changeset(%Class{} = class, attrs) do
    class
    |> cast(attrs, [
      :name,
      :slug,
      :badge,
      :advanced,
      :active
    ])
    |> validate_required([
      :name,
      :slug,
      :badge,
      :advanced,
      :active
    ])
  end

end