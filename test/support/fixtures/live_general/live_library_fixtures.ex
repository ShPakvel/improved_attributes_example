defmodule ImprovedAttributesExample.LiveGeneral.LiveLibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ImprovedAttributesExample.LiveGeneral.LiveLibrary` context.
  """

  @doc """
  Generate a unique live_book isbn.
  """
  def unique_live_book_isbn, do: "#{System.unique_integer([:positive])}isbn value"

  @doc """
  Generate a live_book.
  """
  def live_book_fixture(attrs \\ %{}) do
    {:ok, live_book} =
      attrs
      |> Enum.into(%{
        author_real_name: "author_real_name value",
        free: false,
        index_page: 1,
        isbn: unique_live_book_isbn(),
        name: "name value",
        print_size: "13.45",
        rate: 5.0
      })
      |> ImprovedAttributesExample.LiveGeneral.LiveLibrary.create_live_book()

    live_book
  end
end
