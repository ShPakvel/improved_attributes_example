defmodule ImprovedAttributesExampleWeb.LiveNoteLive.Index do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveBlog

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Listing Live notes
      <:actions>
        <.button phx-click={JS.dispatch("click", to: {:inner, "a"})}>
          <.link navigate={~p"/live_notes/new"}>
            New Live note
          </.link>
        </.button>
      </:actions>
    </.header>

    <.table
      id="live_notes"
      rows={@streams.live_notes}
      row_click={fn {_id, live_note} -> JS.navigate(~p"/live_notes/#{live_note}") end}
    >
      <:col :let={{_id, live_note}} label="Body"><%= live_note.body %></:col>
      <:col :let={{_id, live_note}} label="Review day"><%= live_note.review_day %></:col>
      <:col :let={{_id, live_note}} label="Live product"><%= live_note.live_product_id %></:col>
      <:col :let={{_id, live_note}} label="Live post"><%= live_note.live_post_id %></:col>
      <:col :let={{_id, live_note}} label="Live book"><%= live_note.live_book_id %></:col>
      <:col :let={{_id, live_note}} label="Data"><%= live_note.data %></:col>
      <:col :let={{_id, live_note}} label="Meta"><%= array_values(live_note.meta) %></:col>
      <:col :let={{_id, live_note}} label="Points"><%= array_values(live_note.points) %></:col>
      <:col :let={{_id, live_note}} label="Status"><%= live_note.status %></:col>
      <:col :let={{_id, live_note}} label="Tags"><%= array_values(live_note.tags) %></:col>
      <:action :let={{_id, live_note}}>
        <div class="sr-only">
          <.link navigate={~p"/live_notes/#{live_note}"}>Show</.link>
        </div>
        <.link navigate={~p"/live_notes/#{live_note}/edit"}>Edit</.link>
      </:action>
      <:action :let={{id, live_note}}>
        <.link
          phx-click={JS.push("delete", value: %{id: live_note.id}) |> hide("##{id}")}
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
     |> assign(:page_title, "Listing Live notes")
     |> stream(:live_notes, LiveBlog.list_live_notes())}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    live_note = LiveBlog.get_live_note!(id)
    {:ok, _} = LiveBlog.delete_live_note(live_note)

    {:noreply, stream_delete(socket, :live_notes, live_note)}
  end

  defp array_values(values), do: (values || []) |> List.flatten() |> Enum.join(", ")
end
