defmodule ImprovedAttributesExampleWeb.LiveProductLive.Show do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveCatalog

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Live product <%= @live_product.id %>
      <:subtitle>This is a live_product record from your database.</:subtitle>
      <:actions>
        <.button phx-click={JS.dispatch("click", to: {:inner, "a"})}>
          <.link navigate={~p"/live_products/#{@live_product}/edit?return_to=show"}>
            Edit live_product
          </.link>
        </.button>
      </:actions>
    </.header>

    <.list>
      <:item title="Name"><%= @live_product.name %></:item>
      <:item title="Description"><%= @live_product.description %></:item>
      <:item title="Price"><%= @live_product.price %></:item>
      <:item title="Rate"><%= @live_product.rate %></:item>
      <:item title="Code"><%= @live_product.code %></:item>
    </.list>

    <.back navigate={~p"/live_products"}>Back to live_products</.back>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, "Show Live product")
     |> assign(:live_product, LiveCatalog.get_live_product!(id))}
  end
end
