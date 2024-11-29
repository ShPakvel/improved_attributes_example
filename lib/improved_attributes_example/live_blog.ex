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

  alias ImprovedAttributesExample.LiveBlog.LiveNote

  @doc """
  Returns the list of live_notes.

  ## Examples

      iex> list_live_notes()
      [%LiveNote{}, ...]

  """
  def list_live_notes do
    Repo.all(LiveNote)
  end

  @doc """
  Gets a single live_note.

  Raises `Ecto.NoResultsError` if the Live note does not exist.

  ## Examples

      iex> get_live_note!(123)
      %LiveNote{}

      iex> get_live_note!(456)
      ** (Ecto.NoResultsError)

  """
  def get_live_note!(id), do: Repo.get!(LiveNote, id)

  @doc """
  Creates a live_note.

  ## Examples

      iex> create_live_note(%{field: value})
      {:ok, %LiveNote{}}

      iex> create_live_note(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_live_note(attrs \\ %{}) do
    %LiveNote{}
    |> LiveNote.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a live_note.

  ## Examples

      iex> update_live_note(live_note, %{field: new_value})
      {:ok, %LiveNote{}}

      iex> update_live_note(live_note, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_live_note(%LiveNote{} = live_note, attrs) do
    live_note
    |> LiveNote.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a live_note.

  ## Examples

      iex> delete_live_note(live_note)
      {:ok, %LiveNote{}}

      iex> delete_live_note(live_note)
      {:error, %Ecto.Changeset{}}

  """
  def delete_live_note(%LiveNote{} = live_note) do
    Repo.delete(live_note)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking live_note changes.

  ## Examples

      iex> change_live_note(live_note)
      %Ecto.Changeset{data: %LiveNote{}}

  """
  def change_live_note(%LiveNote{} = live_note, attrs \\ %{}) do
    LiveNote.changeset(live_note, attrs)
  end
end
