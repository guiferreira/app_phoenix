defmodule Live.CarsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Live.Cars` context.
  """

  @doc """
  Generate a car.
  """
  def car_fixture(attrs \\ %{}) do
    {:ok, car} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        description: "some description",
        name: "some name"
      })
      |> Live.Cars.create_car()

    car
  end
end
