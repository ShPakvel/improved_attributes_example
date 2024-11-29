defmodule ImprovedAttributesExampleWeb.LivePostLiveTest do
  use ImprovedAttributesExampleWeb.ConnCase

  import Phoenix.LiveViewTest
  import ImprovedAttributesExample.LiveBlogFixtures

  @invalid_attrs %{
    content: nil,
    public: false,
    reviewed: nil,
    tags: [],
    title: nil,
    topics: nil
  }

  defp create_live_post(_) do
    live_post = live_post_fixture()
    %{live_post: live_post}
  end

  describe "Index" do
    setup [:create_live_post]

    test "lists all live_blog_posts", %{conn: conn, live_post: live_post} do
      {:ok, _index_live, html} = live(conn, ~p"/live_blog_posts")

      assert html =~ "Listing Live blog posts"
      assert html =~ live_post.title
    end

    test "saves new live_post", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/live_blog_posts")

      assert {:ok, form_live, _} =
               index_live
               |> element("a", "New Live post")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_blog_posts/new")

      assert render(form_live) =~ "New Live post"

      assert form_live
             |> form("#live_post-form", live_post: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      create_attrs = %{
        content: "content value",
        public: true,
        reviewed: "2024-11-28T00:00:00",
        tags: ["tags value"],
        title: "title value",
        topics: 142
      }

      assert {:ok, index_live, _html} =
               form_live
               |> form("#live_post-form", live_post: create_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_blog_posts")

      html = render(index_live)
      assert html =~ "Live post created successfully"
      assert html =~ "title value"
    end

    test "updates live_post in listing", %{conn: conn, live_post: live_post} do
      {:ok, index_live, _html} = live(conn, ~p"/live_blog_posts")

      assert {:ok, form_live, _html} =
               index_live
               |> element("#live_blog_posts-#{live_post.id} a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_blog_posts/#{live_post}/edit")

      assert render(form_live) =~ "Edit Live post"

      assert form_live
             |> form("#live_post-form", live_post: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      update_attrs = %{
        content: "updated content value",
        public: false,
        reviewed: "2024-11-29T00:00:00",
        tags: ["updated tags value"],
        title: "updated title value",
        topics: 303
      }

      assert {:ok, index_live, _html} =
               form_live
               |> form("#live_post-form", live_post: update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_blog_posts")

      html = render(index_live)
      assert html =~ "Live post updated successfully"
      assert html =~ "updated title value"
    end

    test "deletes live_post in listing", %{conn: conn, live_post: live_post} do
      {:ok, index_live, _html} = live(conn, ~p"/live_blog_posts")

      assert index_live |> element("#live_blog_posts-#{live_post.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#live_blog_posts-#{live_post.id}")
    end
  end

  describe "Show" do
    setup [:create_live_post]

    test "displays live_post", %{conn: conn, live_post: live_post} do
      {:ok, _show_live, html} = live(conn, ~p"/live_blog_posts/#{live_post}")

      assert html =~ "Show Live post"
      assert html =~ live_post.title
    end

    test "updates live_post and returns to show", %{conn: conn, live_post: live_post} do
      {:ok, show_live, _html} = live(conn, ~p"/live_blog_posts/#{live_post}")

      assert {:ok, form_live, _} =
               show_live
               |> element("a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_blog_posts/#{live_post}/edit?return_to=show")

      assert render(form_live) =~ "Edit Live post"

      assert form_live
             |> form("#live_post-form", live_post: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      update_attrs = %{
        content: "updated content value",
        public: false,
        reviewed: "2024-11-29T00:00:00",
        tags: ["updated tags value"],
        title: "updated title value",
        topics: 303
      }

      assert {:ok, show_live, _html} =
               form_live
               |> form("#live_post-form", live_post: update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_blog_posts/#{live_post}")

      html = render(show_live)
      assert html =~ "Live post updated successfully"
      assert html =~ "updated title value"
    end
  end
end
