defmodule ImprovedAttributesExample.ApiGeneral.ApiLibraryTest do
  use ImprovedAttributesExample.DataCase

  alias ImprovedAttributesExample.ApiGeneral.ApiLibrary

  describe "api_books" do
    alias ImprovedAttributesExample.ApiGeneral.ApiLibrary.ApiBook

    import ImprovedAttributesExample.ApiGeneral.ApiLibraryFixtures

    @invalid_attrs %{author_real_name: nil, free: nil, index_page: nil, isbn: nil, name: nil, print_size: nil, rate: nil}

    test "list_api_books/0 returns all api_books" do
      api_book = api_book_fixture()

      assert ApiLibrary.list_api_books() == [api_book]
    end

    test "get_api_book!/1 returns the api_book with given id" do
      api_book = api_book_fixture()

      assert ApiLibrary.get_api_book!(api_book.id) == api_book
    end

    test "create_api_book/1 with valid data creates a api_book" do
      create_attrs = %{
        author_real_name: "author_real_name value",
        free: true,
        index_page: 142,
        isbn: "isbn value",
        name: "name value",
        print_size: "22.5",
        rate: 120.5
      }

      assert {:ok, %ApiBook{} = api_book} = ApiLibrary.create_api_book(create_attrs)
      assert api_book.author_real_name == "author_real_name value"
      assert api_book.free == true
      assert api_book.index_page == 142
      assert api_book.isbn == "isbn value"
      assert api_book.name == "name value"
      assert api_book.print_size == Decimal.new("22.5")
      assert api_book.rate == 120.5
    end

    test "create_api_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ApiLibrary.create_api_book(@invalid_attrs)
    end

    test "update_api_book/2 with valid data updates the api_book" do
      api_book = api_book_fixture()

      update_attrs = %{
        author_real_name: "updated author_real_name value",
        free: false,
        index_page: 303,
        isbn: "updated isbn value",
        name: "updated name value",
        print_size: "18.7",
        rate: 456.7
      }

      assert {:ok, %ApiBook{} = api_book} = ApiLibrary.update_api_book(api_book, update_attrs)
      assert api_book.author_real_name == "updated author_real_name value"
      assert api_book.free == false
      assert api_book.index_page == 303
      assert api_book.isbn == "updated isbn value"
      assert api_book.name == "updated name value"
      assert api_book.print_size == Decimal.new("18.7")
      assert api_book.rate == 456.7
    end

    test "update_api_book/2 with invalid data returns error changeset" do
      api_book = api_book_fixture()
      assert {:error, %Ecto.Changeset{}} = ApiLibrary.update_api_book(api_book, @invalid_attrs)

      assert api_book == ApiLibrary.get_api_book!(api_book.id)
    end

    test "delete_api_book/1 deletes the api_book" do
      api_book = api_book_fixture()
      assert {:ok, %ApiBook{}} = ApiLibrary.delete_api_book(api_book)
      assert_raise Ecto.NoResultsError, fn -> ApiLibrary.get_api_book!(api_book.id) end
    end

    test "change_api_book/1 returns a api_book changeset" do
      api_book = api_book_fixture()
      assert %Ecto.Changeset{} = ApiLibrary.change_api_book(api_book)
    end
  end
end
