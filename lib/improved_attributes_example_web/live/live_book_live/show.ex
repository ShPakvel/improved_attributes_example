defmodule ImprovedAttributesExampleWeb.LiveBookLive.Show do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveGeneral.LiveLibrary

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Live book <%= @live_book.id %>
      <:subtitle>This is a live_book record from your database.</:subtitle>
      <:actions>
        <.button phx-click={JS.dispatch("click", to: {:inner, "a"})}>
          <.link navigate={~p"/live_books/#{@live_book}/edit?return_to=show"}>
            Edit live_book
          </.link>
        </.button>
      </:actions>
    </.header>

    <.list>
      <:item title="Name"><%= @live_book.name %></:item>
      <:item title="Isbn"><%= @live_book.isbn %></:item>
      <:item title="Index page"><%= @live_book.index_page %></:item>
      <:item title="Print size"><%= @live_book.print_size %></:item>
      <:item title="Rate"><%= @live_book.rate %></:item>
      <:item title="Free"><%= @live_book.free %></:item>
      <:item title="Author real name"><%= @live_book.author_real_name %></:item>
    </.list>

    <.back navigate={~p"/live_books"}>Back to live_books</.back>
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
     |> assign(:page_title, "Show Live book")
     |> assign(:live_book, LiveLibrary.get_live_book!(id))}
  end
end
