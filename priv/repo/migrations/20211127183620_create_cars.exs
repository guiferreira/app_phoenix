defmodule Live.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :brand, :string
      add :description, :string
      add :name, :string
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:cars, [:category_id])
  end
end
