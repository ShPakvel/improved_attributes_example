defmodule ImprovedAttributesExampleWeb.NoteControllerTest do
  use ImprovedAttributesExampleWeb.ConnCase

  import ImprovedAttributesExample.BlogFixtures

  @invalid_attrs %{body: nil, data: nil, meta: nil, points: nil, review_day: nil, status: nil, tags: nil, book_id: nil, post_id: nil, product_id: nil}

  describe "index" do
    test "lists all notes", %{conn: conn} do
      conn = get(conn, ~p"/notes")
      assert html_response(conn, 200) =~ "Listing Notes"
    end
  end

  describe "new note" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/notes/new")
      assert html_response(conn, 200) =~ "New Note"
    end
  end

  describe "create note" do
    test "redirects to show when data is valid", %{conn: conn} do
      manual = ImprovedAttributesExample.General.LibraryFixtures.book_fixture()
      post = post_fixture()
      product = ImprovedAttributesExample.CatalogFixtures.product_fixture()

      create_attrs = %{
        body: "body value",
        data: "data value",
        meta: ["meta value"],
        points: [142],
        review_day: ~D[2024-11-26],
        status: :draft,
        tags: [:music],
        book_id: manual.isbn,
        post_id: post.id,
        product_id: product.id
      }

      conn = post(conn, ~p"/notes", note: create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/notes/#{id}"

      conn = get(conn, ~p"/notes/#{id}")
      assert html_response(conn, 200) =~ "Note #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/notes", note: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Note"
    end
  end

  describe "edit note" do
    setup [:create_note]

    test "renders form for editing chosen note", %{conn: conn, note: note} do
      conn = get(conn, ~p"/notes/#{note}/edit")
      assert html_response(conn, 200) =~ "Edit Note"
    end
  end

  describe "update note" do
    setup [:create_note]

    test "redirects when data is valid", %{conn: conn, note: note} do
      manual = ImprovedAttributesExample.General.LibraryFixtures.book_fixture()
      post = post_fixture()
      product = ImprovedAttributesExample.CatalogFixtures.product_fixture()

      update_attrs = %{
        body: "updated body value",
        data: "updated data value",
        meta: ["updated meta value"],
        points: [303],
        review_day: ~D[2024-11-27],
        status: :actual,
        tags: [:dance],
        book_id: manual.isbn,
        post_id: post.id,
        product_id: product.id
      }

      conn = put(conn, ~p"/notes/#{note}", note: update_attrs)
      assert redirected_to(conn) == ~p"/notes/#{note}"

      conn = get(conn, ~p"/notes/#{note}")
      assert html_response(conn, 200) =~ "updated body value"
    end

    test "renders errors when data is invalid", %{conn: conn, note: note} do
      conn = put(conn, ~p"/notes/#{note}", note: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Note"
    end
  end

  describe "delete note" do
    setup [:create_note]

    test "deletes chosen note", %{conn: conn, note: note} do
      conn = delete(conn, ~p"/notes/#{note}")
      assert redirected_to(conn) == ~p"/notes"

      assert_error_sent 404, fn ->
        get(conn, ~p"/notes/#{note}")
      end
    end
  end

  defp create_note(_) do
    note = note_fixture()
    %{note: note}
  end
end
