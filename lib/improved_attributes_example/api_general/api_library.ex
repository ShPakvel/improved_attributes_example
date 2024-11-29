defmodule ImprovedAttributesExample.ApiGeneral.ApiLibrary do
  @moduledoc """
  The ApiGeneral.ApiLibrary context.
  """

  import Ecto.Query, warn: false
  alias ImprovedAttributesExample.Repo

  alias ImprovedAttributesExample.ApiGeneral.ApiLibrary.ApiBook

  @doc """
  Returns the list of api_books.

  ## Examples

      iex> list_api_books()
      [%ApiBook{}, ...]

  """
  def list_api_books do
    Repo.all(ApiBook)
  end

  @doc """
  Gets a single api_book.

  Raises `Ecto.NoResultsError` if the Api book does not exist.

  ## Examples

      iex> get_api_book!(123)
      %ApiBook{}

      iex> get_api_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_api_book!(id), do: Repo.get!(ApiBook, id)

  @doc """
  Creates a api_book.

  ## Examples

      iex> create_api_book(%{field: value})
      {:ok, %ApiBook{}}

      iex> create_api_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_api_book(attrs \\ %{}) do
    %ApiBook{}
    |> ApiBook.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a api_book.

  ## Examples

      iex> update_api_book(api_book, %{field: new_value})
      {:ok, %ApiBook{}}

      iex> update_api_book(api_book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_api_book(%ApiBook{} = api_book, attrs) do
    api_book
    |> ApiBook.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a api_book.

  ## Examples

      iex> delete_api_book(api_book)
      {:ok, %ApiBook{}}

      iex> delete_api_book(api_book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_api_book(%ApiBook{} = api_book) do
    Repo.delete(api_book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking api_book changes.

  ## Examples

      iex> change_api_book(api_book)
      %Ecto.Changeset{data: %ApiBook{}}

  """
  def change_api_book(%ApiBook{} = api_book, attrs \\ %{}) do
    ApiBook.changeset(api_book, attrs)
  end
end
