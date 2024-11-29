defmodule ImprovedAttributesExampleWeb.ApiPostJSON do
  alias ImprovedAttributesExample.ApiBlog.ApiPost

  @doc """
  Renders a list of api_blog_posts.
  """
  def index(%{api_blog_posts: api_blog_posts}) do
    %{data: for(api_post <- api_blog_posts, do: data(api_post))}
  end

  @doc """
  Renders a single api_post.
  """
  def show(%{api_post: api_post}) do
    %{data: data(api_post)}
  end

  defp data(%ApiPost{} = api_post) do
    %{
      id: api_post.id,
      title: api_post.title,
      content: api_post.content,
      public: api_post.public,
      topics: api_post.topics,
      reviewed: api_post.reviewed,
      tags: api_post.tags
    }
  end
end
