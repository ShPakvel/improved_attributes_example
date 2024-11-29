defmodule ImprovedAttributesExampleWeb.LivePostLive.Show do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveBlog

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Live post <%= @live_post.id %>
      <:subtitle>This is a live_post record from your database.</:subtitle>
      <:actions>
        <.button phx-click={JS.dispatch("click", to: {:inner, "a"})}>
          <.link navigate={~p"/live_blog_posts/#{@live_post}/edit?return_to=show"}>
            Edit live_post
          </.link>
        </.button>
      </:actions>
    </.header>

    <.list>
      <:item title="Title"><%= @live_post.title %></:item>
      <:item title="Content"><%= @live_post.content %></:item>
      <:item title="Public"><%= @live_post.public %></:item>
      <:item title="Topics"><%= @live_post.topics %></:item>
      <:item title="Reviewed"><%= @live_post.reviewed %></:item>
      <:item title="Tags"><%= array_values(@live_post.tags) %></:item>
    </.list>

    <.back navigate={~p"/live_blog_posts"}>Back to live_blog_posts</.back>
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
     |> assign(:page_title, "Show Live post")
     |> assign(:live_post, LiveBlog.get_live_post!(id))}
  end

  defp array_values(values), do: (values || []) |> List.flatten() |> Enum.join(", ")
end
