defmodule ImprovedAttributesExampleWeb.LiveNoteLiveTest do
  use ImprovedAttributesExampleWeb.ConnCase

  import Phoenix.LiveViewTest
  import ImprovedAttributesExample.LiveBlogFixtures

  @invalid_attrs %{
    body: nil,
    data: nil,
    meta: [],
    points: [],
    review_day: nil,
    status: nil,
    tags: [],
    live_book_id: nil,
    live_post_id: nil,
    live_product_id: nil
  }

  defp create_live_note(_) do
    live_note = live_note_fixture()
    %{live_note: live_note}
  end

  describe "Index" do
    setup [:create_live_note]

    test "lists all live_notes", %{conn: conn, live_note: live_note} do
      {:ok, _index_live, html} = live(conn, ~p"/live_notes")

      assert html =~ "Listing Live notes"
      assert html =~ live_note.body
    end

    test "saves new live_note", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/live_notes")

      assert {:ok, form_live, _} =
               index_live
               |> element("a", "New Live note")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_notes/new")

      assert render(form_live) =~ "New Live note"

      assert form_live
             |> form("#live_note-form", live_note: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      manual = ImprovedAttributesExample.LiveGeneral.LiveLibraryFixtures.live_book_fixture()
      live_post = live_post_fixture()
      live_product = ImprovedAttributesExample.LiveCatalogFixtures.live_product_fixture()

      create_attrs = %{
        body: "body value",
        data: "data value",
        meta: ["meta value"],
        points: [142],
        review_day: "2024-11-28",
        status: :draft,
        tags: [:music],
        live_book_id: manual.isbn,
        live_post_id: live_post.id,
        live_product_id: live_product.id
      }

      assert {:ok, index_live, _html} =
               form_live
               |> form("#live_note-form", live_note: create_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_notes")

      html = render(index_live)
      assert html =~ "Live note created successfully"
      assert html =~ "body value"
    end

    test "updates live_note in listing", %{conn: conn, live_note: live_note} do
      {:ok, index_live, _html} = live(conn, ~p"/live_notes")

      assert {:ok, form_live, _html} =
               index_live
               |> element("#live_notes-#{live_note.id} a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_notes/#{live_note}/edit")

      assert render(form_live) =~ "Edit Live note"

      assert form_live
             |> form("#live_note-form", live_note: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      manual = ImprovedAttributesExample.LiveGeneral.LiveLibraryFixtures.live_book_fixture()
      live_post = live_post_fixture()
      live_product = ImprovedAttributesExample.LiveCatalogFixtures.live_product_fixture()

      update_attrs = %{
        body: "updated body value",
        data: "updated data value",
        meta: ["updated meta value"],
        points: [303],
        review_day: "2024-11-29",
        status: :actual,
        tags: [:dance],
        live_book_id: manual.isbn,
        live_post_id: live_post.id,
        live_product_id: live_product.id
      }

      assert {:ok, index_live, _html} =
               form_live
               |> form("#live_note-form", live_note: update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_notes")

      html = render(index_live)
      assert html =~ "Live note updated successfully"
      assert html =~ "updated body value"
    end

    test "deletes live_note in listing", %{conn: conn, live_note: live_note} do
      {:ok, index_live, _html} = live(conn, ~p"/live_notes")

      assert index_live |> element("#live_notes-#{live_note.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#live_notes-#{live_note.id}")
    end
  end

  describe "Show" do
    setup [:create_live_note]

    test "displays live_note", %{conn: conn, live_note: live_note} do
      {:ok, _show_live, html} = live(conn, ~p"/live_notes/#{live_note}")

      assert html =~ "Show Live note"
      assert html =~ live_note.body
    end

    test "updates live_note and returns to show", %{conn: conn, live_note: live_note} do
      {:ok, show_live, _html} = live(conn, ~p"/live_notes/#{live_note}")

      assert {:ok, form_live, _} =
               show_live
               |> element("a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_notes/#{live_note}/edit?return_to=show")

      assert render(form_live) =~ "Edit Live note"

      assert form_live
             |> form("#live_note-form", live_note: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      manual = ImprovedAttributesExample.LiveGeneral.LiveLibraryFixtures.live_book_fixture()
      live_post = live_post_fixture()
      live_product = ImprovedAttributesExample.LiveCatalogFixtures.live_product_fixture()

      update_attrs = %{
        body: "updated body value",
        data: "updated data value",
        meta: ["updated meta value"],
        points: [303],
        review_day: "2024-11-29",
        status: :actual,
        tags: [:dance],
        live_book_id: manual.isbn,
        live_post_id: live_post.id,
        live_product_id: live_product.id
      }

      assert {:ok, show_live, _html} =
               form_live
               |> form("#live_note-form", live_note: update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_notes/#{live_note}")

      html = render(show_live)
      assert html =~ "Live note updated successfully"
      assert html =~ "updated body value"
    end
  end
end
