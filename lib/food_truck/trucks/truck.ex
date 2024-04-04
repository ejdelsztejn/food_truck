defmodule FoodTruck.Trucks.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "trucks" do
    field :address, :string
    field :food_items, :string
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [:name, :address, :food_items])
    |> validate_required([:name])
  end
end
