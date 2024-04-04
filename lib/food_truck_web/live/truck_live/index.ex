defmodule FoodTruckWeb.TruckLive.Index do
  use FoodTruckWeb, :live_view

  alias FoodTruck.Trucks
  alias FoodTruck.Trucks.Truck

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :trucks, Trucks.list_trucks())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Truck")
    |> assign(:truck, Trucks.get_truck!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Truck")
    |> assign(:truck, %Truck{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Trucks")
    |> assign(:truck, nil)
  end

  @impl true
  def handle_info({FoodTruckWeb.TruckLive.FormComponent, {:saved, truck}}, socket) do
    {:noreply, stream_insert(socket, :trucks, truck)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    truck = Trucks.get_truck!(id)
    {:ok, _} = Trucks.delete_truck(truck)

    {:noreply, stream_delete(socket, :trucks, truck)}
  end

  def handle_event("change", %{"search" => %{"query" => ""}}, socket) do
    socket = assign(socket, :search_trucks, [])
    {:noreply, socket}
  end

  def handle_event("change", %{"search" => %{"query" => search_query}}, socket) do
    trucks = Trucks.search(search_query)
    socket = assign(socket, :search_trucks, trucks)

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
