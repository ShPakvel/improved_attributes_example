defmodule ImprovedAttributesExample.ApiBlog do
  @moduledoc """
  The ApiBlog context.
  """

  import Ecto.Query, warn: false
  alias ImprovedAttributesExample.Repo

  alias ImprovedAttributesExample.ApiBlog.ApiPost

  @doc """
  Returns the list of api_blog_posts.

  ## Examples

      iex> list_api_blog_posts()
      [%ApiPost{}, ...]

  """
  def list_api_blog_posts do
    Repo.all(ApiPost)
  end

  @doc """
  Gets a single api_post.

  Raises `Ecto.NoResultsError` if the Api post does not exist.

  ## Examples

      iex> get_api_post!(123)
      %ApiPost{}

      iex> get_api_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_api_post!(id), do: Repo.get!(ApiPost, id)

  @doc """
  Creates a api_post.

  ## Examples

      iex> create_api_post(%{field: value})
      {:ok, %ApiPost{}}

      iex> create_api_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_api_post(attrs \\ %{}) do
    %ApiPost{}
    |> ApiPost.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a api_post.

  ## Examples

      iex> update_api_post(api_post, %{field: new_value})
      {:ok, %ApiPost{}}

      iex> update_api_post(api_post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_api_post(%ApiPost{} = api_post, attrs) do
    api_post
    |> ApiPost.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a api_post.

  ## Examples

      iex> delete_api_post(api_post)
      {:ok, %ApiPost{}}

      iex> delete_api_post(api_post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_api_post(%ApiPost{} = api_post) do
    Repo.delete(api_post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking api_post changes.

  ## Examples

      iex> change_api_post(api_post)
      %Ecto.Changeset{data: %ApiPost{}}

  """
  def change_api_post(%ApiPost{} = api_post, attrs \\ %{}) do
    ApiPost.changeset(api_post, attrs)
  end
end
