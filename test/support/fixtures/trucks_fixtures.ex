defmodule FoodTruck.TrucksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTruck.Trucks` context.
  """

  @doc """
  Generate a truck.
  """
  def truck_fixture(attrs \\ %{}) do
    {:ok, truck} =
      attrs
      |> Enum.into(%{
        address: "some address",
        food_items: "some food_items",
        name: "some name"
      })
      |> FoodTruck.Trucks.create_truck()

    truck
  end
end
