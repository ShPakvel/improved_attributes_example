defmodule ImprovedAttributesExampleWeb.LiveNoteLive.Show do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveBlog

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Live note <%= @live_note.id %>
      <:subtitle>This is a live_note record from your database.</:subtitle>
      <:actions>
        <.button phx-click={JS.dispatch("click", to: {:inner, "a"})}>
          <.link navigate={~p"/live_notes/#{@live_note}/edit?return_to=show"}>
            Edit live_note
          </.link>
        </.button>
      </:actions>
    </.header>

    <.list>
      <:item title="Body"><%= @live_note.body %></:item>
      <:item title="Review day"><%= @live_note.review_day %></:item>
      <:item title="Live product"><%= @live_note.live_product_id %></:item>
      <:item title="Live post"><%= @live_note.live_post_id %></:item>
      <:item title="Live book"><%= @live_note.live_book_id %></:item>
      <:item title="Data"><%= @live_note.data %></:item>
      <:item title="Meta"><%= array_values(@live_note.meta) %></:item>
      <:item title="Points"><%= array_values(@live_note.points) %></:item>
      <:item title="Status"><%= @live_note.status %></:item>
      <:item title="Tags"><%= array_values(@live_note.tags) %></:item>
    </.list>

    <.back navigate={~p"/live_notes"}>Back to live_notes</.back>
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
     |> assign(:page_title, "Show Live note")
     |> assign(:live_note, LiveBlog.get_live_note!(id))}
  end

  defp array_values(values), do: (values || []) |> List.flatten() |> Enum.join(", ")
end
