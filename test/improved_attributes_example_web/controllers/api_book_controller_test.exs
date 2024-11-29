defmodule ImprovedAttributesExampleWeb.ApiBookControllerTest do
  use ImprovedAttributesExampleWeb.ConnCase

  import ImprovedAttributesExample.ApiGeneral.ApiLibraryFixtures

  alias ImprovedAttributesExample.ApiGeneral.ApiLibrary.ApiBook

  @invalid_attrs %{author_real_name: nil, free: nil, index_page: nil, isbn: nil, name: nil, print_size: nil, rate: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all api_books", %{conn: conn} do
      conn = get(conn, ~p"/api/api_books")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create api_book" do
    test "renders api_book when data is valid", %{conn: conn} do
      create_attrs = %{
        author_real_name: "author_real_name value",
        free: true,
        index_page: 142,
        isbn: "isbn value",
        name: "name value",
        print_size: "22.5",
        rate: 120.5
      }

      conn = post(conn, ~p"/api/api_books", api_book: create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/api_books/#{id}")

      assert %{
               "id" => ^id,
               "author_real_name" => "author_real_name value",
               "free" => true,
               "index_page" => 142,
               "isbn" => "isbn value",
               "name" => "name value",
               "print_size" => "22.5",
               "rate" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/api_books", api_book: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update api_book" do
    setup [:create_api_book]

    test "renders api_book when data is valid", %{conn: conn, api_book: %ApiBook{id: id} = api_book} do
      update_attrs = %{
        author_real_name: "updated author_real_name value",
        free: false,
        index_page: 303,
        isbn: "updated isbn value",
        name: "updated name value",
        print_size: "18.7",
        rate: 456.7
      }

      conn = put(conn, ~p"/api/api_books/#{api_book}", api_book: update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/api_books/#{id}")

      assert %{
               "id" => ^id,
               "author_real_name" => "updated author_real_name value",
               "free" => false,
               "index_page" => 303,
               "isbn" => "updated isbn value",
               "name" => "updated name value",
               "print_size" => "18.7",
               "rate" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, api_book: api_book} do
      conn = put(conn, ~p"/api/api_books/#{api_book}", api_book: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete api_book" do
    setup [:create_api_book]

    test "deletes chosen api_book", %{conn: conn, api_book: api_book} do
      conn = delete(conn, ~p"/api/api_books/#{api_book}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/api_books/#{api_book}")
      end
    end
  end

  defp create_api_book(_) do
    api_book = api_book_fixture()
    %{api_book: api_book}
  end
end
