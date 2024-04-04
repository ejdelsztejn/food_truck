defmodule FoodTruck.DataParser do
  def parse_food_truck_data do
    "Mobile_Food_Facility_Permit.csv"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode!(headers: true)
  end

  def prepare_data(csv_row) do
    name = csv_row["Applicant"]
    address = csv_row["Address"]
    food_items = csv_row["FoodItems"]

    %{
      name: name,
      address: address,
      food_items: food_items
    }
  end
end
