defmodule ImprovedAttributesExample.LiveBlog do
  @moduledoc """
  The LiveBlog context.
  """

  import Ecto.Query, warn: false
  alias ImprovedAttributesExample.Repo

  alias ImprovedAttributesExample.LiveBlog.LivePost

  @doc """
  Returns the list of live_blog_posts.

  ## Examples

      iex> list_live_blog_posts()
      [%LivePost{}, ...]

  """
  def list_live_blog_posts do
    Repo.all(LivePost)
  end

  @doc """
  Gets a single live_post.

  Raises `Ecto.NoResultsError` if the Live post does not exist.

  ## Examples

      iex> get_live_post!(123)
      %LivePost{}

      iex> get_live_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_live_post!(id), do: Repo.get!(LivePost, id)

  @doc """
  Creates a live_post.

  ## Examples

      iex> create_live_post(%{field: value})
      {:ok, %LivePost{}}

      iex> create_live_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_live_post(attrs \\ %{}) do
    %LivePost{}
    |> LivePost.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a live_post.

  ## Examples

      iex> update_live_post(live_post, %{field: new_value})
      {:ok, %LivePost{}}

      iex> update_live_post(live_post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_live_post(%LivePost{} = live_post, attrs) do
    live_post
    |> LivePost.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a live_post.

  ## Examples

      iex> delete_live_post(live_post)
      {:ok, %LivePost{}}

      iex> delete_live_post(live_post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_live_post(%LivePost{} = live_post) do
    Repo.delete(live_post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking live_post changes.

  ## Examples

      iex> change_live_post(live_post)
      %Ecto.Changeset{data: %LivePost{}}

  """
  def change_live_post(%LivePost{} = live_post, attrs \\ %{}) do
    LivePost.changeset(live_post, attrs)
  end
end
