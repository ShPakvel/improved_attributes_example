defmodule ImprovedAttributesExampleWeb.LiveCommentLive.Index do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveCatalog

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Listing Live comments
      <:actions>
        <.button phx-click={JS.dispatch("click", to: {:inner, "a"})}>
          <.link navigate={~p"/live_comments/new"}>
            New Live comment
          </.link>
        </.button>
      </:actions>
    </.header>

    <.table
      id="live_comments"
      rows={@streams.live_comments}
      row_click={fn {_id, live_comment} -> JS.navigate(~p"/live_comments/#{live_comment}") end}
    >
      <:col :let={{_id, live_comment}} label="Body"><%= live_comment.body %></:col>
      <:col :let={{_id, live_comment}} label="Live product"><%= live_comment.live_product_id %></:col>
      <:col :let={{_id, live_comment}} label="Live post"><%= live_comment.live_post_id %></:col>
      <:action :let={{_id, live_comment}}>
        <div class="sr-only">
          <.link navigate={~p"/live_comments/#{live_comment}"}>Show</.link>
        </div>
        <.link navigate={~p"/live_comments/#{live_comment}/edit"}>Edit</.link>
      </:action>
      <:action :let={{id, live_comment}}>
        <.link
          phx-click={JS.push("delete", value: %{id: live_comment.id}) |> hide("##{id}")}
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
     |> assign(:page_title, "Listing Live comments")
     |> stream(:live_comments, LiveCatalog.list_live_comments())}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    live_comment = LiveCatalog.get_live_comment!(id)
    {:ok, _} = LiveCatalog.delete_live_comment(live_comment)

    {:noreply, stream_delete(socket, :live_comments, live_comment)}
  end
end
