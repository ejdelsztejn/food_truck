defmodule FoodTruck.DataParserTest do
  use ExUnit.Case

  alias FoodTruck.DataParser

  test "parse_food_truck_data" do
    IO.inspect(DataParser.parse_food_truck_data())
  end
end
