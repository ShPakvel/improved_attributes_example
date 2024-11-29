defmodule ImprovedAttributesExampleWeb.ApiCommentJSON do
  alias ImprovedAttributesExample.ApiCatalog.ApiComment

  @doc """
  Renders a list of api_comments.
  """
  def index(%{api_comments: api_comments}) do
    %{data: for(api_comment <- api_comments, do: data(api_comment))}
  end

  @doc """
  Renders a single api_comment.
  """
  def show(%{api_comment: api_comment}) do
    %{data: data(api_comment)}
  end

  defp data(%ApiComment{} = api_comment) do
    %{
      id: api_comment.id,
      body: api_comment.body,
      api_product_id: api_comment.api_product_id,
      api_post_id: api_comment.api_post_id
    }
  end
end
