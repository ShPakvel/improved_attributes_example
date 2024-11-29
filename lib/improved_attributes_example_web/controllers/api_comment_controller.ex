defmodule ImprovedAttributesExampleWeb.ApiCommentController do
  use ImprovedAttributesExampleWeb, :controller

  alias ImprovedAttributesExample.ApiCatalog
  alias ImprovedAttributesExample.ApiCatalog.ApiComment

  action_fallback ImprovedAttributesExampleWeb.FallbackController

  def index(conn, _params) do
    api_comments = ApiCatalog.list_api_comments()
    render(conn, :index, api_comments: api_comments)
  end

  def create(conn, %{"api_comment" => api_comment_params}) do
    with {:ok, %ApiComment{} = api_comment} <- ApiCatalog.create_api_comment(api_comment_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/api_comments/#{api_comment}")
      |> render(:show, api_comment: api_comment)
    end
  end

  def show(conn, %{"id" => id}) do
    api_comment = ApiCatalog.get_api_comment!(id)
    render(conn, :show, api_comment: api_comment)
  end

  def update(conn, %{"id" => id, "api_comment" => api_comment_params}) do
    api_comment = ApiCatalog.get_api_comment!(id)

    with {:ok, %ApiComment{} = api_comment} <- ApiCatalog.update_api_comment(api_comment, api_comment_params) do
      render(conn, :show, api_comment: api_comment)
    end
  end

  def delete(conn, %{"id" => id}) do
    api_comment = ApiCatalog.get_api_comment!(id)

    with {:ok, %ApiComment{}} <- ApiCatalog.delete_api_comment(api_comment) do
      send_resp(conn, :no_content, "")
    end
  end
end
