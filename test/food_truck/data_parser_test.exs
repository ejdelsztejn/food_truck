defmodule FoodTruck.DataParserTest do
  use ExUnit.Case

  alias FoodTruck.DataParser

  test "prepare_data" do
    datum =
      DataParser.parse_food_truck_data()
      |> Enum.map(&DataParser.prepare_data(&1))
      |> Enum.take(2)
      |> IO.inspect()
  end
end
