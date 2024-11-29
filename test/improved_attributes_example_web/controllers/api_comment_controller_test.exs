defmodule ImprovedAttributesExampleWeb.ApiCommentControllerTest do
  use ImprovedAttributesExampleWeb.ConnCase

  import ImprovedAttributesExample.ApiCatalogFixtures

  alias ImprovedAttributesExample.ApiCatalog.ApiComment

  @invalid_attrs %{body: nil, api_post_id: nil, api_product_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all api_comments", %{conn: conn} do
      conn = get(conn, ~p"/api/api_comments")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create api_comment" do
    test "renders api_comment when data is valid", %{conn: conn} do
      api_post = ImprovedAttributesExample.ApiBlogFixtures.api_post_fixture()
      api_product = api_product_fixture()

      create_attrs = %{
        body: "body value",
        api_post_id: api_post.id,
        api_product_id: api_product.id
      }

      conn = post(conn, ~p"/api/api_comments", api_comment: create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/api_comments/#{id}")

      assert %{
               "id" => ^id,
               "body" => "body value",
               "api_post_id" => json_api_post_id,
               "api_product_id" => json_api_product_id
             } = json_response(conn, 200)["data"]

      assert json_api_product_id == api_product.id
      assert json_api_post_id == api_post.id
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/api_comments", api_comment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update api_comment" do
    setup [:create_api_comment]

    test "renders api_comment when data is valid", %{conn: conn, api_comment: %ApiComment{id: id} = api_comment} do
      api_post = ImprovedAttributesExample.ApiBlogFixtures.api_post_fixture()
      api_product = api_product_fixture()

      update_attrs = %{
        body: "updated body value",
        api_post_id: api_post.id,
        api_product_id: api_product.id
      }

      conn = put(conn, ~p"/api/api_comments/#{api_comment}", api_comment: update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/api_comments/#{id}")

      assert %{
               "id" => ^id,
               "body" => "updated body value",
               "api_post_id" => json_api_post_id,
               "api_product_id" => json_api_product_id
             } = json_response(conn, 200)["data"]

      assert json_api_product_id == api_product.id
      assert json_api_post_id == api_post.id
    end

    test "renders errors when data is invalid", %{conn: conn, api_comment: api_comment} do
      conn = put(conn, ~p"/api/api_comments/#{api_comment}", api_comment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete api_comment" do
    setup [:create_api_comment]

    test "deletes chosen api_comment", %{conn: conn, api_comment: api_comment} do
      conn = delete(conn, ~p"/api/api_comments/#{api_comment}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/api_comments/#{api_comment}")
      end
    end
  end

  defp create_api_comment(_) do
    api_comment = api_comment_fixture()
    %{api_comment: api_comment}
  end
end
