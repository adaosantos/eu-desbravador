defmodule EuDesbravador.Repo.Migrations.AddClassesTable do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add(:active, :boolean, default: true, null: false)
      add(:name, :string)
      add(:slug, :string)
      add(:badge, :string)
      add(:advanced, :boolean, default: false, null: false)

      timestamps()
    end
  end
end
