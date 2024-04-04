defmodule FoodTruck.DataParser do
  def parse_food_truck_data do
    "data/Mobile_Food_Facility_Permit.csv"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode!(headers: true)
  end
end
