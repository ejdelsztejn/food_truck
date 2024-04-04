defmodule FoodTruck.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "food_truck" do
    field :address, :string
    field :food_items, :string
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [:name, :address, :food_items])
    |> validate_required([:name, :address, :food_items])
  end
end
