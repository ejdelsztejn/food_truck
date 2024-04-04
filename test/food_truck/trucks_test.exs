defmodule FoodTruck.TrucksTest do
  use FoodTruck.DataCase

  alias FoodTruck.Trucks

  describe "trucks" do
    alias FoodTruck.Trucks.Truck

    import FoodTruck.TrucksFixtures

    @invalid_attrs %{address: nil, food_items: nil, name: nil}

    test "list_trucks/0 returns all trucks" do
      truck = truck_fixture()
      assert Trucks.list_trucks() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = truck_fixture()
      assert Trucks.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      valid_attrs = %{address: "some address", food_items: "some food_items", name: "some name"}

      assert {:ok, %Truck{} = truck} = Trucks.create_truck(valid_attrs)
      assert truck.address == "some address"
      assert truck.food_items == "some food_items"
      assert truck.name == "some name"
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trucks.create_truck(@invalid_attrs)
    end

    test "update_truck/2 with valid data updates the truck" do
      truck = truck_fixture()
      update_attrs = %{address: "some updated address", food_items: "some updated food_items", name: "some updated name"}

      assert {:ok, %Truck{} = truck} = Trucks.update_truck(truck, update_attrs)
      assert truck.address == "some updated address"
      assert truck.food_items == "some updated food_items"
      assert truck.name == "some updated name"
    end

    test "update_truck/2 with invalid data returns error changeset" do
      truck = truck_fixture()
      assert {:error, %Ecto.Changeset{}} = Trucks.update_truck(truck, @invalid_attrs)
      assert truck == Trucks.get_truck!(truck.id)
    end

    test "delete_truck/1 deletes the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{}} = Trucks.delete_truck(truck)
      assert_raise Ecto.NoResultsError, fn -> Trucks.get_truck!(truck.id) end
    end

    test "change_truck/1 returns a truck changeset" do
      truck = truck_fixture()
      assert %Ecto.Changeset{} = Trucks.change_truck(truck)
    end
  end
end
