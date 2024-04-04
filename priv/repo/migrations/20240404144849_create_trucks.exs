defmodule FoodTruck.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :address, :string
      add :food_items, :string

      timestamps(type: :utc_datetime)
    end
  end
end
