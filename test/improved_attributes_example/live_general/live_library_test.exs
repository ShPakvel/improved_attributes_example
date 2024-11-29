defmodule ImprovedAttributesExample.LiveGeneral.LiveLibraryTest do
  use ImprovedAttributesExample.DataCase

  alias ImprovedAttributesExample.LiveGeneral.LiveLibrary

  describe "live_books" do
    alias ImprovedAttributesExample.LiveGeneral.LiveLibrary.LiveBook

    import ImprovedAttributesExample.LiveGeneral.LiveLibraryFixtures

    @invalid_attrs %{author_real_name: nil, free: nil, index_page: nil, isbn: nil, name: nil, print_size: nil, rate: nil}

    test "list_live_books/0 returns all live_books" do
      live_book = live_book_fixture()

      assert LiveLibrary.list_live_books() == [live_book]
    end

    test "get_live_book!/1 returns the live_book with given id" do
      live_book = live_book_fixture()

      assert LiveLibrary.get_live_book!(live_book.id) == live_book
    end

    test "create_live_book/1 with valid data creates a live_book" do
      create_attrs = %{
        author_real_name: "author_real_name value",
        free: true,
        index_page: 142,
        isbn: "isbn value",
        name: "name value",
        print_size: "22.5",
        rate: 120.5
      }

      assert {:ok, %LiveBook{} = live_book} = LiveLibrary.create_live_book(create_attrs)
      assert live_book.author_real_name == "author_real_name value"
      assert live_book.free == true
      assert live_book.index_page == 142
      assert live_book.isbn == "isbn value"
      assert live_book.name == "name value"
      assert live_book.print_size == Decimal.new("22.5")
      assert live_book.rate == 120.5
    end

    test "create_live_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LiveLibrary.create_live_book(@invalid_attrs)
    end

    test "update_live_book/2 with valid data updates the live_book" do
      live_book = live_book_fixture()

      update_attrs = %{
        author_real_name: "updated author_real_name value",
        free: false,
        index_page: 303,
        isbn: "updated isbn value",
        name: "updated name value",
        print_size: "18.7",
        rate: 456.7
      }

      assert {:ok, %LiveBook{} = live_book} = LiveLibrary.update_live_book(live_book, update_attrs)
      assert live_book.author_real_name == "updated author_real_name value"
      assert live_book.free == false
      assert live_book.index_page == 303
      assert live_book.isbn == "updated isbn value"
      assert live_book.name == "updated name value"
      assert live_book.print_size == Decimal.new("18.7")
      assert live_book.rate == 456.7
    end

    test "update_live_book/2 with invalid data returns error changeset" do
      live_book = live_book_fixture()
      assert {:error, %Ecto.Changeset{}} = LiveLibrary.update_live_book(live_book, @invalid_attrs)

      assert live_book == LiveLibrary.get_live_book!(live_book.id)
    end

    test "delete_live_book/1 deletes the live_book" do
      live_book = live_book_fixture()
      assert {:ok, %LiveBook{}} = LiveLibrary.delete_live_book(live_book)
      assert_raise Ecto.NoResultsError, fn -> LiveLibrary.get_live_book!(live_book.id) end
    end

    test "change_live_book/1 returns a live_book changeset" do
      live_book = live_book_fixture()
      assert %Ecto.Changeset{} = LiveLibrary.change_live_book(live_book)
    end
  end
end
