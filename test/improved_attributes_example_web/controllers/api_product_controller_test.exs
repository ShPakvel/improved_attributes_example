defmodule ImprovedAttributesExampleWeb.ApiProductControllerTest do
  use ImprovedAttributesExampleWeb.ConnCase

  import ImprovedAttributesExample.ApiCatalogFixtures

  alias ImprovedAttributesExample.ApiCatalog.ApiProduct

  @invalid_attrs %{code: nil, description: nil, name: nil, price: nil, rate: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all api_products", %{conn: conn} do
      conn = get(conn, ~p"/api/api_products")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create api_product" do
    test "renders api_product when data is valid", %{conn: conn} do
      create_attrs = %{
        code: 142,
        description: "description value",
        name: "name value",
        price: "22.50000",
        rate: 120.5
      }

      conn = post(conn, ~p"/api/api_products", api_product: create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/api_products/#{id}")

      assert %{
               "id" => ^id,
               "code" => 142,
               "description" => "description value",
               "name" => "name value",
               "price" => "22.50000",
               "rate" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/api_products", api_product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update api_product" do
    setup [:create_api_product]

    test "renders api_product when data is valid", %{conn: conn, api_product: %ApiProduct{id: id} = api_product} do
      update_attrs = %{
        code: 303,
        description: "updated description value",
        name: "updated name value",
        price: "18.70000",
        rate: 456.7
      }

      conn = put(conn, ~p"/api/api_products/#{api_product}", api_product: update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/api_products/#{id}")

      assert %{
               "id" => ^id,
               "code" => 303,
               "description" => "updated description value",
               "name" => "updated name value",
               "price" => "18.70000",
               "rate" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, api_product: api_product} do
      conn = put(conn, ~p"/api/api_products/#{api_product}", api_product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete api_product" do
    setup [:create_api_product]

    test "deletes chosen api_product", %{conn: conn, api_product: api_product} do
      conn = delete(conn, ~p"/api/api_products/#{api_product}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/api_products/#{api_product}")
      end
    end
  end

  defp create_api_product(_) do
    api_product = api_product_fixture()
    %{api_product: api_product}
  end
end
