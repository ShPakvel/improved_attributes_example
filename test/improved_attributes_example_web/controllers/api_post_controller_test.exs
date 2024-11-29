defmodule ImprovedAttributesExampleWeb.ApiPostControllerTest do
  use ImprovedAttributesExampleWeb.ConnCase

  import ImprovedAttributesExample.ApiBlogFixtures

  alias ImprovedAttributesExample.ApiBlog.ApiPost

  @invalid_attrs %{content: nil, public: nil, reviewed: nil, tags: nil, title: nil, topics: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all api_blog_posts", %{conn: conn} do
      conn = get(conn, ~p"/api/api_blog_posts")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create api_post" do
    test "renders api_post when data is valid", %{conn: conn} do
      create_attrs = %{
        content: "content value",
        public: true,
        reviewed: ~N[2024-11-28 00:21:00],
        tags: ["tags value"],
        title: "title value",
        topics: 142
      }

      conn = post(conn, ~p"/api/api_blog_posts", api_post: create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/api_blog_posts/#{id}")

      assert %{
               "id" => ^id,
               "content" => "content value",
               "public" => true,
               "reviewed" => "2024-11-28T00:21:00",
               "tags" => ["tags value"],
               "title" => "title value",
               "topics" => 142
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/api_blog_posts", api_post: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update api_post" do
    setup [:create_api_post]

    test "renders api_post when data is valid", %{conn: conn, api_post: %ApiPost{id: id} = api_post} do
      update_attrs = %{
        content: "updated content value",
        public: false,
        reviewed: ~N[2024-11-29 00:21:00],
        tags: ["updated tags value"],
        title: "updated title value",
        topics: 303
      }

      conn = put(conn, ~p"/api/api_blog_posts/#{api_post}", api_post: update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/api_blog_posts/#{id}")

      assert %{
               "id" => ^id,
               "content" => "updated content value",
               "public" => false,
               "reviewed" => "2024-11-29T00:21:00",
               "tags" => ["updated tags value"],
               "title" => "updated title value",
               "topics" => 303
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, api_post: api_post} do
      conn = put(conn, ~p"/api/api_blog_posts/#{api_post}", api_post: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete api_post" do
    setup [:create_api_post]

    test "deletes chosen api_post", %{conn: conn, api_post: api_post} do
      conn = delete(conn, ~p"/api/api_blog_posts/#{api_post}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/api_blog_posts/#{api_post}")
      end
    end
  end

  defp create_api_post(_) do
    api_post = api_post_fixture()
    %{api_post: api_post}
  end
end
