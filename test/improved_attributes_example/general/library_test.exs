defmodule ImprovedAttributesExample.General.LibraryTest do
  use ImprovedAttributesExample.DataCase

  alias ImprovedAttributesExample.General.Library

  describe "books" do
    alias ImprovedAttributesExample.General.Library.Book

    import ImprovedAttributesExample.General.LibraryFixtures

    @invalid_attrs %{author_real_name: nil, free: nil, index_page: nil, isbn: nil, name: nil, print_size: nil, rate: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()

      assert Library.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()

      assert Library.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      create_attrs = %{
        author_real_name: "author_real_name value",
        free: true,
        index_page: 142,
        isbn: "isbn value",
        name: "name value",
        print_size: "22.5",
        rate: 120.5
      }

      assert {:ok, %Book{} = book} = Library.create_book(create_attrs)
      assert book.author_real_name == "author_real_name value"
      assert book.free == true
      assert book.index_page == 142
      assert book.isbn == "isbn value"
      assert book.name == "name value"
      assert book.print_size == Decimal.new("22.5")
      assert book.rate == 120.5
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()

      update_attrs = %{
        author_real_name: "updated author_real_name value",
        free: false,
        index_page: 303,
        isbn: "updated isbn value",
        name: "updated name value",
        print_size: "18.7",
        rate: 456.7
      }

      assert {:ok, %Book{} = book} = Library.update_book(book, update_attrs)
      assert book.author_real_name == "updated author_real_name value"
      assert book.free == false
      assert book.index_page == 303
      assert book.isbn == "updated isbn value"
      assert book.name == "updated name value"
      assert book.print_size == Decimal.new("18.7")
      assert book.rate == 456.7
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_book(book, @invalid_attrs)

      assert book == Library.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Library.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Library.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Library.change_book(book)
    end
  end
end
