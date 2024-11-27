defmodule ImprovedAttributesExample.General.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ImprovedAttributesExample.General.Library` context.
  """

  @doc """
  Generate a unique book isbn.
  """
  def unique_book_isbn, do: "#{System.unique_integer([:positive])}isbn value"

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author_real_name: "author_real_name value",
        free: false,
        index_page: 1,
        isbn: unique_book_isbn(),
        name: "name value",
        print_size: "13.45",
        rate: 5.0
      })
      |> ImprovedAttributesExample.General.Library.create_book()

    book
  end
end
