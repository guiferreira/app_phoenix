defmodule Live.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field :brand, :string
    field :description, :string
    field :name, :string
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:brand, :description, :name, :category_id])
    |> validate_required([:brand, :description, :name, :category_id])
  end
end
