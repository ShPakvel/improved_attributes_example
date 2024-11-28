defmodule ImprovedAttributesExampleWeb.LiveProductLive.Index do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveCatalog

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Listing Live products
      <:actions>
        <.button phx-click={JS.dispatch("click", to: {:inner, "a"})}>
          <.link navigate={~p"/live_products/new"}>
            New Live product
          </.link>
        </.button>
      </:actions>
    </.header>

    <.table
      id="live_products"
      rows={@streams.live_products}
      row_click={fn {_id, live_product} -> JS.navigate(~p"/live_products/#{live_product}") end}
    >
      <:col :let={{_id, live_product}} label="Name"><%= live_product.name %></:col>
      <:col :let={{_id, live_product}} label="Description"><%= live_product.description %></:col>
      <:col :let={{_id, live_product}} label="Price"><%= live_product.price %></:col>
      <:col :let={{_id, live_product}} label="Rate"><%= live_product.rate %></:col>
      <:col :let={{_id, live_product}} label="Code"><%= live_product.code %></:col>
      <:action :let={{_id, live_product}}>
        <div class="sr-only">
          <.link navigate={~p"/live_products/#{live_product}"}>Show</.link>
        </div>
        <.link navigate={~p"/live_products/#{live_product}/edit"}>Edit</.link>
      </:action>
      <:action :let={{id, live_product}}>
        <.link
          phx-click={JS.push("delete", value: %{id: live_product.id}) |> hide("##{id}")}
          data-confirm="Are you sure?"
        >
          Delete
        </.link>
      </:action>
    </.table>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Listing Live products")
     |> stream(:live_products, LiveCatalog.list_live_products())}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    live_product = LiveCatalog.get_live_product!(id)
    {:ok, _} = LiveCatalog.delete_live_product(live_product)

    {:noreply, stream_delete(socket, :live_products, live_product)}
  end
end
