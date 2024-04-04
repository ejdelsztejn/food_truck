defmodule FoodTruck.DataParser do
  alias FoodTruck.Trucks.Truck
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

  def insert(chunk) do
    FoodTruck.Repo.insert_all(
      Truck,
      chunk
    )
  end

  def do_up do
    parse_food_truck_data()
    |> Stream.map(&prepare_data(&1))
    |> Stream.chunk_every(1000)
    |> Stream.each(&insert(&1))
    |> Stream.run()
  end
end
