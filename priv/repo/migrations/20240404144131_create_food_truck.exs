defmodule FoodTruck.Repo.Migrations.CreateFoodTruck do
  use Ecto.Migration

  def change do
    create table(:food_truck, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :address, :string
      add :food_items, :string

      timestamps(type: :utc_datetime)
    end
  end
end
