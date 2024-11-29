defmodule ImprovedAttributesExampleWeb.LiveBookLive.Index do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveGeneral.LiveLibrary

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Listing Live books
      <:actions>
        <.button phx-click={JS.dispatch("click", to: {:inner, "a"})}>
          <.link navigate={~p"/live_books/new"}>
            New Live book
          </.link>
        </.button>
      </:actions>
    </.header>

    <.table
      id="live_books"
      rows={@streams.live_books}
      row_click={fn {_id, live_book} -> JS.navigate(~p"/live_books/#{live_book}") end}
    >
      <:col :let={{_id, live_book}} label="Name"><%= live_book.name %></:col>
      <:col :let={{_id, live_book}} label="Isbn"><%= live_book.isbn %></:col>
      <:col :let={{_id, live_book}} label="Index page"><%= live_book.index_page %></:col>
      <:col :let={{_id, live_book}} label="Print size"><%= live_book.print_size %></:col>
      <:col :let={{_id, live_book}} label="Rate"><%= live_book.rate %></:col>
      <:col :let={{_id, live_book}} label="Free"><%= live_book.free %></:col>
      <:col :let={{_id, live_book}} label="Author real name"><%= live_book.author_real_name %></:col>
      <:action :let={{_id, live_book}}>
        <div class="sr-only">
          <.link navigate={~p"/live_books/#{live_book}"}>Show</.link>
        </div>
        <.link navigate={~p"/live_books/#{live_book}/edit"}>Edit</.link>
      </:action>
      <:action :let={{id, live_book}}>
        <.link
          phx-click={JS.push("delete", value: %{id: live_book.id}) |> hide("##{id}")}
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
     |> assign(:page_title, "Listing Live books")
     |> stream(:live_books, LiveLibrary.list_live_books())}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    live_book = LiveLibrary.get_live_book!(id)
    {:ok, _} = LiveLibrary.delete_live_book(live_book)

    {:noreply, stream_delete(socket, :live_books, live_book)}
  end
end
