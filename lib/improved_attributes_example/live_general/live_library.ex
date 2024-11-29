defmodule ImprovedAttributesExample.LiveGeneral.LiveLibrary do
  @moduledoc """
  The LiveGeneral.LiveLibrary context.
  """

  import Ecto.Query, warn: false
  alias ImprovedAttributesExample.Repo

  alias ImprovedAttributesExample.LiveGeneral.LiveLibrary.LiveBook

  @doc """
  Returns the list of live_books.

  ## Examples

      iex> list_live_books()
      [%LiveBook{}, ...]

  """
  def list_live_books do
    Repo.all(LiveBook)
  end

  @doc """
  Gets a single live_book.

  Raises `Ecto.NoResultsError` if the Live book does not exist.

  ## Examples

      iex> get_live_book!(123)
      %LiveBook{}

      iex> get_live_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_live_book!(id), do: Repo.get!(LiveBook, id)

  @doc """
  Creates a live_book.

  ## Examples

      iex> create_live_book(%{field: value})
      {:ok, %LiveBook{}}

      iex> create_live_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_live_book(attrs \\ %{}) do
    %LiveBook{}
    |> LiveBook.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a live_book.

  ## Examples

      iex> update_live_book(live_book, %{field: new_value})
      {:ok, %LiveBook{}}

      iex> update_live_book(live_book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_live_book(%LiveBook{} = live_book, attrs) do
    live_book
    |> LiveBook.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a live_book.

  ## Examples

      iex> delete_live_book(live_book)
      {:ok, %LiveBook{}}

      iex> delete_live_book(live_book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_live_book(%LiveBook{} = live_book) do
    Repo.delete(live_book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking live_book changes.

  ## Examples

      iex> change_live_book(live_book)
      %Ecto.Changeset{data: %LiveBook{}}

  """
  def change_live_book(%LiveBook{} = live_book, attrs \\ %{}) do
    LiveBook.changeset(live_book, attrs)
  end
end
