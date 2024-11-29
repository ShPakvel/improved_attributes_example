defmodule ImprovedAttributesExample.ApiGeneral.ApiLibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ImprovedAttributesExample.ApiGeneral.ApiLibrary` context.
  """

  @doc """
  Generate a unique api_book isbn.
  """
  def unique_api_book_isbn, do: "#{System.unique_integer([:positive])}isbn value"

  @doc """
  Generate a api_book.
  """
  def api_book_fixture(attrs \\ %{}) do
    {:ok, api_book} =
      attrs
      |> Enum.into(%{
        author_real_name: "author_real_name value",
        free: false,
        index_page: 1,
        isbn: unique_api_book_isbn(),
        name: "name value",
        print_size: "13.45",
        rate: 5.0
      })
      |> ImprovedAttributesExample.ApiGeneral.ApiLibrary.create_api_book()

    api_book
  end
end
