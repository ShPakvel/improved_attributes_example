defmodule ImprovedAttributesExampleWeb.PostControllerTest do
  use ImprovedAttributesExampleWeb.ConnCase

  import ImprovedAttributesExample.BlogFixtures

  @invalid_attrs %{content: nil, public: nil, reviewed: nil, tags: nil, title: nil, topics: nil}

  describe "index" do
    test "lists all blog_posts", %{conn: conn} do
      conn = get(conn, ~p"/blog_posts")
      assert html_response(conn, 200) =~ "Listing Blog posts"
    end
  end

  describe "new post" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/blog_posts/new")
      assert html_response(conn, 200) =~ "New Post"
    end
  end

  describe "create post" do
    test "redirects to show when data is valid", %{conn: conn} do
      create_attrs = %{
        content: "content value",
        public: true,
        reviewed: ~N[2024-11-26 19:25:00],
        tags: ["tags value"],
        title: "title value",
        topics: 142
      }

      conn = post(conn, ~p"/blog_posts", post: create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/blog_posts/#{id}"

      conn = get(conn, ~p"/blog_posts/#{id}")
      assert html_response(conn, 200) =~ "Post #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/blog_posts", post: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Post"
    end
  end

  describe "edit post" do
    setup [:create_post]

    test "renders form for editing chosen post", %{conn: conn, post: post} do
      conn = get(conn, ~p"/blog_posts/#{post}/edit")
      assert html_response(conn, 200) =~ "Edit Post"
    end
  end

  describe "update post" do
    setup [:create_post]

    test "redirects when data is valid", %{conn: conn, post: post} do
      update_attrs = %{
        content: "updated content value",
        public: false,
        reviewed: ~N[2024-11-27 19:25:00],
        tags: ["updated tags value"],
        title: "updated title value",
        topics: 303
      }

      conn = put(conn, ~p"/blog_posts/#{post}", post: update_attrs)
      assert redirected_to(conn) == ~p"/blog_posts/#{post}"

      conn = get(conn, ~p"/blog_posts/#{post}")
      assert html_response(conn, 200) =~ "updated title value"
    end

    test "renders errors when data is invalid", %{conn: conn, post: post} do
      conn = put(conn, ~p"/blog_posts/#{post}", post: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Post"
    end
  end

  describe "delete post" do
    setup [:create_post]

    test "deletes chosen post", %{conn: conn, post: post} do
      conn = delete(conn, ~p"/blog_posts/#{post}")
      assert redirected_to(conn) == ~p"/blog_posts"

      assert_error_sent 404, fn ->
        get(conn, ~p"/blog_posts/#{post}")
      end
    end
  end

  defp create_post(_) do
    post = post_fixture()
    %{post: post}
  end
end
