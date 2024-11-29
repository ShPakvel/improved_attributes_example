defmodule ImprovedAttributesExampleWeb.ApiPostController do
  use ImprovedAttributesExampleWeb, :controller

  alias ImprovedAttributesExample.ApiBlog
  alias ImprovedAttributesExample.ApiBlog.ApiPost

  action_fallback ImprovedAttributesExampleWeb.FallbackController

  def index(conn, _params) do
    api_blog_posts = ApiBlog.list_api_blog_posts()
    render(conn, :index, api_blog_posts: api_blog_posts)
  end

  def create(conn, %{"api_post" => api_post_params}) do
    with {:ok, %ApiPost{} = api_post} <- ApiBlog.create_api_post(api_post_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/api_blog_posts/#{api_post}")
      |> render(:show, api_post: api_post)
    end
  end

  def show(conn, %{"id" => id}) do
    api_post = ApiBlog.get_api_post!(id)
    render(conn, :show, api_post: api_post)
  end

  def update(conn, %{"id" => id, "api_post" => api_post_params}) do
    api_post = ApiBlog.get_api_post!(id)

    with {:ok, %ApiPost{} = api_post} <- ApiBlog.update_api_post(api_post, api_post_params) do
      render(conn, :show, api_post: api_post)
    end
  end

  def delete(conn, %{"id" => id}) do
    api_post = ApiBlog.get_api_post!(id)

    with {:ok, %ApiPost{}} <- ApiBlog.delete_api_post(api_post) do
      send_resp(conn, :no_content, "")
    end
  end
end
