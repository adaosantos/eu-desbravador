defmodule EuDesbravador.Repo.Migrations.AddUserTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:active, :boolean, default: true, null: false)
      add(:email, :string)
      add(:name, :string)
      add(:password, :string)
      add(:token, :text)

      timestamps()
    end
  end
end
