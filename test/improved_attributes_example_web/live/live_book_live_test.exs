defmodule ImprovedAttributesExampleWeb.LiveBookLiveTest do
  use ImprovedAttributesExampleWeb.ConnCase

  import Phoenix.LiveViewTest
  import ImprovedAttributesExample.LiveGeneral.LiveLibraryFixtures

  @invalid_attrs %{
    author_real_name: nil,
    free: false,
    index_page: nil,
    isbn: nil,
    name: nil,
    print_size: nil,
    rate: nil
  }

  defp create_live_book(_) do
    live_book = live_book_fixture()
    %{live_book: live_book}
  end

  describe "Index" do
    setup [:create_live_book]

    test "lists all live_books", %{conn: conn, live_book: live_book} do
      {:ok, _index_live, html} = live(conn, ~p"/live_books")

      assert html =~ "Listing Live books"
      assert html =~ live_book.name
    end

    test "saves new live_book", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/live_books")

      assert {:ok, form_live, _} =
               index_live
               |> element("a", "New Live book")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_books/new")

      assert render(form_live) =~ "New Live book"

      assert form_live
             |> form("#live_book-form", live_book: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      create_attrs = %{
        author_real_name: "author_real_name value",
        free: true,
        index_page: 142,
        isbn: "isbn value",
        name: "name value",
        print_size: "22.5",
        rate: 120.5
      }

      assert {:ok, index_live, _html} =
               form_live
               |> form("#live_book-form", live_book: create_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_books")

      html = render(index_live)
      assert html =~ "Live book created successfully"
      assert html =~ "name value"
    end

    test "updates live_book in listing", %{conn: conn, live_book: live_book} do
      {:ok, index_live, _html} = live(conn, ~p"/live_books")

      assert {:ok, form_live, _html} =
               index_live
               |> element("#live_books-#{live_book.id} a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_books/#{live_book}/edit")

      assert render(form_live) =~ "Edit Live book"

      assert form_live
             |> form("#live_book-form", live_book: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      update_attrs = %{
        author_real_name: "updated author_real_name value",
        free: false,
        index_page: 303,
        isbn: "updated isbn value",
        name: "updated name value",
        print_size: "18.7",
        rate: 456.7
      }

      assert {:ok, index_live, _html} =
               form_live
               |> form("#live_book-form", live_book: update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_books")

      html = render(index_live)
      assert html =~ "Live book updated successfully"
      assert html =~ "updated name value"
    end

    test "deletes live_book in listing", %{conn: conn, live_book: live_book} do
      {:ok, index_live, _html} = live(conn, ~p"/live_books")

      assert index_live |> element("#live_books-#{live_book.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#live_books-#{live_book.id}")
    end
  end

  describe "Show" do
    setup [:create_live_book]

    test "displays live_book", %{conn: conn, live_book: live_book} do
      {:ok, _show_live, html} = live(conn, ~p"/live_books/#{live_book}")

      assert html =~ "Show Live book"
      assert html =~ live_book.name
    end

    test "updates live_book and returns to show", %{conn: conn, live_book: live_book} do
      {:ok, show_live, _html} = live(conn, ~p"/live_books/#{live_book}")

      assert {:ok, form_live, _} =
               show_live
               |> element("a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_books/#{live_book}/edit?return_to=show")

      assert render(form_live) =~ "Edit Live book"

      assert form_live
             |> form("#live_book-form", live_book: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      update_attrs = %{
        author_real_name: "updated author_real_name value",
        free: false,
        index_page: 303,
        isbn: "updated isbn value",
        name: "updated name value",
        print_size: "18.7",
        rate: 456.7
      }

      assert {:ok, show_live, _html} =
               form_live
               |> form("#live_book-form", live_book: update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_books/#{live_book}")

      html = render(show_live)
      assert html =~ "Live book updated successfully"
      assert html =~ "updated name value"
    end
  end
end
