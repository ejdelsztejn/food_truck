defmodule FoodTruckWeb.TruckLive.Search do
  use FoodTruckWeb, :live_view

  alias FoodTruck.Trucks
  alias Phoenix.LiveView.JS

  @spec mount(any(), any(), any()) :: {:ok, any(), [{:layout, false}, ...]}
  def mount(_params, _session, socket) do
    socket = assign(socket, trucks: Trucks.list_trucks)
    {:ok, socket}
  end

  def handle_event("change", %{"search" => %{"query" => ""}}, socket) do
    socket = assign(socket, :trucks, [])
    {:noreply, socket}
  end

  def handle_event("change", %{"search" => %{"query" => search_query}}, socket) do
    trucks = Trucks.search(search_query)
    socket = assign(socket, :trucks, trucks)

    {:noreply, socket}
  end

  def open_modal(js \\ %JS{}) do
    js
    |> JS.show(
      to: "#searchbox_container",
      transition:
        {"transition ease-out duration-200", "opacity-0 scale-95", "opacity-100 scale-100"}
    )
    |> JS.show(
      to: "#searchbar-dialog",
      transition: {"transition ease-in duration-100", "opacity-0", "opacity-100"}
    )
    |> JS.focus(to: "#search-input")
  end

  def hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(
      to: "#searchbar-searchbox_container",
      transition:
        {"transition ease-in duration-100", "opacity-100 scale-100", "opacity-0 scale-95"}
    )
    |> JS.hide(
      to: "#searchbar-dialog",
      transition: {"transition ease-in duration-100", "opacity-100", "opacity-0"}
    )
  end
end
