defmodule ImprovedAttributesExampleWeb.LiveCommentLive.Show do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveCatalog

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Live comment <%= @live_comment.id %>
      <:subtitle>This is a live_comment record from your database.</:subtitle>
      <:actions>
        <.button phx-click={JS.dispatch("click", to: {:inner, "a"})}>
          <.link navigate={~p"/live_comments/#{@live_comment}/edit?return_to=show"}>
            Edit live_comment
          </.link>
        </.button>
      </:actions>
    </.header>

    <.list>
      <:item title="Body"><%= @live_comment.body %></:item>
      <:item title="Live product"><%= @live_comment.live_product_id %></:item>
      <:item title="Live post"><%= @live_comment.live_post_id %></:item>
    </.list>

    <.back navigate={~p"/live_comments"}>Back to live_comments</.back>
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
     |> assign(:page_title, "Show Live comment")
     |> assign(:live_comment, LiveCatalog.get_live_comment!(id))}
  end
end
