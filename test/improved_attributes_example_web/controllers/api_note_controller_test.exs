defmodule ImprovedAttributesExampleWeb.ApiNoteControllerTest do
  use ImprovedAttributesExampleWeb.ConnCase

  import ImprovedAttributesExample.ApiBlogFixtures

  alias ImprovedAttributesExample.ApiBlog.ApiNote

  @invalid_attrs %{body: nil, data: nil, meta: nil, points: nil, review_day: nil, status: nil, tags: nil, api_book_id: nil, api_post_id: nil, api_product_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all api_notes", %{conn: conn} do
      conn = get(conn, ~p"/api/api_notes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create api_note" do
    test "renders api_note when data is valid", %{conn: conn} do
      manual = ImprovedAttributesExample.ApiGeneral.ApiLibraryFixtures.api_book_fixture()
      api_post = api_post_fixture()
      api_product = ImprovedAttributesExample.ApiCatalogFixtures.api_product_fixture()

      create_attrs = %{
        body: "body value",
        data: "data value",
        meta: ["meta value"],
        points: [142],
        review_day: ~D[2024-11-28],
        status: :draft,
        tags: [:music],
        api_book_id: manual.isbn,
        api_post_id: api_post.id,
        api_product_id: api_product.id
      }

      conn = post(conn, ~p"/api/api_notes", api_note: create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/api_notes/#{id}")

      assert %{
               "id" => ^id,
               "body" => "body value",
               "data" => nil,
               "meta" => nil,
               "points" => [142],
               "review_day" => "2024-11-28",
               "status" => "draft",
               "tags" => ["music"],
               "api_book_id" => json_api_book_id,
               "api_post_id" => json_api_post_id,
               "api_product_id" => json_api_product_id
             } = json_response(conn, 200)["data"]

      assert json_api_product_id == api_product.id
      assert json_api_post_id == api_post.id
      assert json_api_book_id == manual.isbn
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/api_notes", api_note: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update api_note" do
    setup [:create_api_note]

    test "renders api_note when data is valid", %{conn: conn, api_note: %ApiNote{id: id} = api_note} do
      manual = ImprovedAttributesExample.ApiGeneral.ApiLibraryFixtures.api_book_fixture()
      api_post = api_post_fixture()
      api_product = ImprovedAttributesExample.ApiCatalogFixtures.api_product_fixture()

      update_attrs = %{
        body: "updated body value",
        data: "updated data value",
        meta: ["updated meta value"],
        points: [303],
        review_day: ~D[2024-11-29],
        status: :actual,
        tags: [:dance],
        api_book_id: manual.isbn,
        api_post_id: api_post.id,
        api_product_id: api_product.id
      }

      conn = put(conn, ~p"/api/api_notes/#{api_note}", api_note: update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/api_notes/#{id}")

      assert %{
               "id" => ^id,
               "body" => "updated body value",
               "data" => nil,
               "meta" => nil,
               "points" => [303],
               "review_day" => "2024-11-29",
               "status" => "actual",
               "tags" => ["dance"],
               "api_book_id" => json_api_book_id,
               "api_post_id" => json_api_post_id,
               "api_product_id" => json_api_product_id
             } = json_response(conn, 200)["data"]

      assert json_api_product_id == api_product.id
      assert json_api_post_id == api_post.id
      assert json_api_book_id == manual.isbn
    end

    test "renders errors when data is invalid", %{conn: conn, api_note: api_note} do
      conn = put(conn, ~p"/api/api_notes/#{api_note}", api_note: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete api_note" do
    setup [:create_api_note]

    test "deletes chosen api_note", %{conn: conn, api_note: api_note} do
      conn = delete(conn, ~p"/api/api_notes/#{api_note}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/api_notes/#{api_note}")
      end
    end
  end

  defp create_api_note(_) do
    api_note = api_note_fixture()
    %{api_note: api_note}
  end
end
