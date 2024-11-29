defmodule ImprovedAttributesExampleWeb.LivePostLive.Index do
  use ImprovedAttributesExampleWeb, :live_view

  alias ImprovedAttributesExample.LiveBlog

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      Listing Live blog posts
      <:actions>
        <.button phx-click={JS.dispatch("click", to: {:inner, "a"})}>
          <.link navigate={~p"/live_blog_posts/new"}>
            New Live post
          </.link>
        </.button>
      </:actions>
    </.header>

    <.table
      id="live_blog_posts"
      rows={@streams.live_blog_posts}
      row_click={fn {_id, live_post} -> JS.navigate(~p"/live_blog_posts/#{live_post}") end}
    >
      <:col :let={{_id, live_post}} label="Title"><%= live_post.title %></:col>
      <:col :let={{_id, live_post}} label="Content"><%= live_post.content %></:col>
      <:col :let={{_id, live_post}} label="Public"><%= live_post.public %></:col>
      <:col :let={{_id, live_post}} label="Topics"><%= live_post.topics %></:col>
      <:col :let={{_id, live_post}} label="Reviewed"><%= live_post.reviewed %></:col>
      <:col :let={{_id, live_post}} label="Tags"><%= array_values(live_post.tags) %></:col>
      <:action :let={{_id, live_post}}>
        <div class="sr-only">
          <.link navigate={~p"/live_blog_posts/#{live_post}"}>Show</.link>
        </div>
        <.link navigate={~p"/live_blog_posts/#{live_post}/edit"}>Edit</.link>
      </:action>
      <:action :let={{id, live_post}}>
        <.link
          phx-click={JS.push("delete", value: %{id: live_post.id}) |> hide("##{id}")}
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
     |> assign(:page_title, "Listing Live blog posts")
     |> stream(:live_blog_posts, LiveBlog.list_live_blog_posts())}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    live_post = LiveBlog.get_live_post!(id)
    {:ok, _} = LiveBlog.delete_live_post(live_post)

    {:noreply, stream_delete(socket, :live_blog_posts, live_post)}
  end

  defp array_values(values), do: (values || []) |> List.flatten() |> Enum.join(", ")
end
