defmodule Live.CarsTest do
  use Live.DataCase

  alias Live.Cars

  describe "cars" do
    alias Live.Cars.Car

    import Live.CarsFixtures

    @invalid_attrs %{brand: nil, description: nil, name: nil}

    test "list_cars/0 returns all cars" do
      car = car_fixture()
      assert Cars.list_cars() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture()
      assert Cars.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      valid_attrs = %{brand: "some brand", description: "some description", name: "some name"}

      assert {:ok, %Car{} = car} = Cars.create_car(valid_attrs)
      assert car.brand == "some brand"
      assert car.description == "some description"
      assert car.name == "some name"
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cars.create_car(@invalid_attrs)
    end

    test "update_car/2 with valid data updates the car" do
      car = car_fixture()
      update_attrs = %{brand: "some updated brand", description: "some updated description", name: "some updated name"}

      assert {:ok, %Car{} = car} = Cars.update_car(car, update_attrs)
      assert car.brand == "some updated brand"
      assert car.description == "some updated description"
      assert car.name == "some updated name"
    end

    test "update_car/2 with invalid data returns error changeset" do
      car = car_fixture()
      assert {:error, %Ecto.Changeset{}} = Cars.update_car(car, @invalid_attrs)
      assert car == Cars.get_car!(car.id)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = Cars.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> Cars.get_car!(car.id) end
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Cars.change_car(car)
    end
  end
end
