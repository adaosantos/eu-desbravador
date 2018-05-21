defmodule EuDesbravador.Models.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias EuDesbravador.Models.User

  schema "users" do
    field(:active, :boolean, default: false)
    field(:email, :string)
    field(:name, :string)
    field(:password, :string)
    field(:token, :string)

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [
      :email,
      :name,
      :password
    ])
    |> validate_required([
      :email,
      :name,
      :password
    ])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_length(:password, min: 4)
    |> put_password_hash()
  end

  def password_changeset(%User{} = user, attrs) do
    user
    |> changeset(attrs)
    |> cast(attrs, ~w(password), [])
    |> validate_length(:password, min: 4)
    |> put_password_hash()
  end

  def token_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:token])
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password,
          Comeonin.Bcrypt.hashpwsalt(pass))

      _ ->
        changeset
    end
  end
end