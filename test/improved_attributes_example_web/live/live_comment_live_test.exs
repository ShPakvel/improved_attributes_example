defmodule ImprovedAttributesExampleWeb.LiveCommentLiveTest do
  use ImprovedAttributesExampleWeb.ConnCase

  import Phoenix.LiveViewTest
  import ImprovedAttributesExample.LiveCatalogFixtures

  @invalid_attrs %{
    body: nil,
    live_post_id: nil,
    live_product_id: nil
  }

  defp create_live_comment(_) do
    live_comment = live_comment_fixture()
    %{live_comment: live_comment}
  end

  describe "Index" do
    setup [:create_live_comment]

    test "lists all live_comments", %{conn: conn, live_comment: live_comment} do
      {:ok, _index_live, html} = live(conn, ~p"/live_comments")

      assert html =~ "Listing Live comments"
      assert html =~ live_comment.body
    end

    test "saves new live_comment", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/live_comments")

      assert {:ok, form_live, _} =
               index_live
               |> element("a", "New Live comment")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_comments/new")

      assert render(form_live) =~ "New Live comment"

      assert form_live
             |> form("#live_comment-form", live_comment: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      live_post = ImprovedAttributesExample.LiveBlogFixtures.live_post_fixture()
      live_product = live_product_fixture()

      create_attrs = %{
        body: "body value",
        live_post_id: live_post.id,
        live_product_id: live_product.id
      }

      assert {:ok, index_live, _html} =
               form_live
               |> form("#live_comment-form", live_comment: create_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_comments")

      html = render(index_live)
      assert html =~ "Live comment created successfully"
      assert html =~ "body value"
    end

    test "updates live_comment in listing", %{conn: conn, live_comment: live_comment} do
      {:ok, index_live, _html} = live(conn, ~p"/live_comments")

      assert {:ok, form_live, _html} =
               index_live
               |> element("#live_comments-#{live_comment.id} a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_comments/#{live_comment}/edit")

      assert render(form_live) =~ "Edit Live comment"

      assert form_live
             |> form("#live_comment-form", live_comment: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      live_post = ImprovedAttributesExample.LiveBlogFixtures.live_post_fixture()
      live_product = live_product_fixture()

      update_attrs = %{
        body: "updated body value",
        live_post_id: live_post.id,
        live_product_id: live_product.id
      }

      assert {:ok, index_live, _html} =
               form_live
               |> form("#live_comment-form", live_comment: update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_comments")

      html = render(index_live)
      assert html =~ "Live comment updated successfully"
      assert html =~ "updated body value"
    end

    test "deletes live_comment in listing", %{conn: conn, live_comment: live_comment} do
      {:ok, index_live, _html} = live(conn, ~p"/live_comments")

      assert index_live |> element("#live_comments-#{live_comment.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#live_comments-#{live_comment.id}")
    end
  end

  describe "Show" do
    setup [:create_live_comment]

    test "displays live_comment", %{conn: conn, live_comment: live_comment} do
      {:ok, _show_live, html} = live(conn, ~p"/live_comments/#{live_comment}")

      assert html =~ "Show Live comment"
      assert html =~ live_comment.body
    end

    test "updates live_comment and returns to show", %{conn: conn, live_comment: live_comment} do
      {:ok, show_live, _html} = live(conn, ~p"/live_comments/#{live_comment}")

      assert {:ok, form_live, _} =
               show_live
               |> element("a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_comments/#{live_comment}/edit?return_to=show")

      assert render(form_live) =~ "Edit Live comment"

      assert form_live
             |> form("#live_comment-form", live_comment: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      live_post = ImprovedAttributesExample.LiveBlogFixtures.live_post_fixture()
      live_product = live_product_fixture()

      update_attrs = %{
        body: "updated body value",
        live_post_id: live_post.id,
        live_product_id: live_product.id
      }

      assert {:ok, show_live, _html} =
               form_live
               |> form("#live_comment-form", live_comment: update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_comments/#{live_comment}")

      html = render(show_live)
      assert html =~ "Live comment updated successfully"
      assert html =~ "updated body value"
    end
  end
end
