defmodule ImprovedAttributesExampleWeb.LiveProductLiveTest do
  use ImprovedAttributesExampleWeb.ConnCase

  import Phoenix.LiveViewTest
  import ImprovedAttributesExample.LiveCatalogFixtures

  @invalid_attrs %{
    code: nil,
    description: nil,
    name: nil,
    price: nil,
    rate: nil
  }

  defp create_live_product(_) do
    live_product = live_product_fixture()
    %{live_product: live_product}
  end

  describe "Index" do
    setup [:create_live_product]

    test "lists all live_products", %{conn: conn, live_product: live_product} do
      {:ok, _index_live, html} = live(conn, ~p"/live_products")

      assert html =~ "Listing Live products"
      assert html =~ live_product.name
    end

    test "saves new live_product", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/live_products")

      assert {:ok, form_live, _} =
               index_live
               |> element("a", "New Live product")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_products/new")

      assert render(form_live) =~ "New Live product"

      assert form_live
             |> form("#live_product-form", live_product: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      create_attrs = %{
        code: 142,
        description: "description value",
        name: "name value",
        price: "22.50000",
        rate: 120.5
      }

      assert {:ok, index_live, _html} =
               form_live
               |> form("#live_product-form", live_product: create_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_products")

      html = render(index_live)
      assert html =~ "Live product created successfully"
      assert html =~ "name value"
    end

    test "updates live_product in listing", %{conn: conn, live_product: live_product} do
      {:ok, index_live, _html} = live(conn, ~p"/live_products")

      assert {:ok, form_live, _html} =
               index_live
               |> element("#live_products-#{live_product.id} a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_products/#{live_product}/edit")

      assert render(form_live) =~ "Edit Live product"

      assert form_live
             |> form("#live_product-form", live_product: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      update_attrs = %{
        code: 303,
        description: "updated description value",
        name: "updated name value",
        price: "18.70000",
        rate: 456.7
      }

      assert {:ok, index_live, _html} =
               form_live
               |> form("#live_product-form", live_product: update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_products")

      html = render(index_live)
      assert html =~ "Live product updated successfully"
      assert html =~ "updated name value"
    end

    test "deletes live_product in listing", %{conn: conn, live_product: live_product} do
      {:ok, index_live, _html} = live(conn, ~p"/live_products")

      assert index_live |> element("#live_products-#{live_product.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#live_products-#{live_product.id}")
    end
  end

  describe "Show" do
    setup [:create_live_product]

    test "displays live_product", %{conn: conn, live_product: live_product} do
      {:ok, _show_live, html} = live(conn, ~p"/live_products/#{live_product}")

      assert html =~ "Show Live product"
      assert html =~ live_product.name
    end

    test "updates live_product and returns to show", %{conn: conn, live_product: live_product} do
      {:ok, show_live, _html} = live(conn, ~p"/live_products/#{live_product}")

      assert {:ok, form_live, _} =
               show_live
               |> element("a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/live_products/#{live_product}/edit?return_to=show")

      assert render(form_live) =~ "Edit Live product"

      assert form_live
             |> form("#live_product-form", live_product: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      update_attrs = %{
        code: 303,
        description: "updated description value",
        name: "updated name value",
        price: "18.70000",
        rate: 456.7
      }

      assert {:ok, show_live, _html} =
               form_live
               |> form("#live_product-form", live_product: update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/live_products/#{live_product}")

      html = render(show_live)
      assert html =~ "Live product updated successfully"
      assert html =~ "updated name value"
    end
  end
end
