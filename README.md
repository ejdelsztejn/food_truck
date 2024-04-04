# FoodTruck

This is a CRUD app that allows users to get information about food trucks in San Francisco. The user can see the full list of trucks by name, address, and food items served, and also search for a truck by the food item to find the perfect truck for whatever they are in the mood for!

To run the app:
  * Fork and clone this repo
  * Run `mix setup` to install and setup dependencies
  * Run `mix ecto.reset` to set up the postgres database
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now visit [`localhost:4000/trucks`](http://localhost:4000/trucks) from your browser to see the trucks and add, edit, or delete a truck, and click on "Search Trucks" to search for trucks by food type/item.
