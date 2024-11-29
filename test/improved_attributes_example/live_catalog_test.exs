defmodule ImprovedAttributesExample.LiveCatalogTest do
  use ImprovedAttributesExample.DataCase

  alias ImprovedAttributesExample.LiveCatalog

  describe "live_products" do
    alias ImprovedAttributesExample.LiveCatalog.LiveProduct

    import ImprovedAttributesExample.LiveCatalogFixtures

    @invalid_attrs %{code: nil, description: nil, name: nil, price: nil, rate: nil}

    test "list_live_products/0 returns all live_products" do
      live_product = live_product_fixture()

      assert LiveCatalog.list_live_products() == [live_product]
    end

    test "get_live_product!/1 returns the live_product with given id" do
      live_product = live_product_fixture()

      assert LiveCatalog.get_live_product!(live_product.id) == live_product
    end

    test "create_live_product/1 with valid data creates a live_product" do
      create_attrs = %{
        code: 142,
        description: "description value",
        name: "name value",
        price: "22.50000",
        rate: 120.5
      }

      assert {:ok, %LiveProduct{} = live_product} = LiveCatalog.create_live_product(create_attrs)
      assert live_product.code == 142
      assert live_product.description == "description value"
      assert live_product.name == "name value"
      assert live_product.price == Decimal.new("22.50000")
      assert live_product.rate == 120.5
    end

    test "create_live_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LiveCatalog.create_live_product(@invalid_attrs)
    end

    test "update_live_product/2 with valid data updates the live_product" do
      live_product = live_product_fixture()

      update_attrs = %{
        code: 303,
        description: "updated description value",
        name: "updated name value",
        price: "18.70000",
        rate: 456.7
      }

      assert {:ok, %LiveProduct{} = live_product} = LiveCatalog.update_live_product(live_product, update_attrs)
      assert live_product.code == 303
      assert live_product.description == "updated description value"
      assert live_product.name == "updated name value"
      assert live_product.price == Decimal.new("18.70000")
      assert live_product.rate == 456.7
    end

    test "update_live_product/2 with invalid data returns error changeset" do
      live_product = live_product_fixture()
      assert {:error, %Ecto.Changeset{}} = LiveCatalog.update_live_product(live_product, @invalid_attrs)

      assert live_product == LiveCatalog.get_live_product!(live_product.id)
    end

    test "delete_live_product/1 deletes the live_product" do
      live_product = live_product_fixture()
      assert {:ok, %LiveProduct{}} = LiveCatalog.delete_live_product(live_product)
      assert_raise Ecto.NoResultsError, fn -> LiveCatalog.get_live_product!(live_product.id) end
    end

    test "change_live_product/1 returns a live_product changeset" do
      live_product = live_product_fixture()
      assert %Ecto.Changeset{} = LiveCatalog.change_live_product(live_product)
    end
  end

  describe "live_comments" do
    alias ImprovedAttributesExample.LiveCatalog.LiveComment

    import ImprovedAttributesExample.LiveCatalogFixtures

    @invalid_attrs %{body: nil, live_post_id: nil, live_product_id: nil}

    test "list_live_comments/0 returns all live_comments" do
      live_comment = live_comment_fixture()

      assert LiveCatalog.list_live_comments() == [live_comment]
    end

    test "get_live_comment!/1 returns the live_comment with given id" do
      live_comment = live_comment_fixture()

      assert LiveCatalog.get_live_comment!(live_comment.id) == live_comment
    end

    test "create_live_comment/1 with valid data creates a live_comment" do
      live_post = ImprovedAttributesExample.LiveBlogFixtures.live_post_fixture()
      live_product = live_product_fixture()

      create_attrs = %{
        body: "body value",
        live_post_id: live_post.id,
        live_product_id: live_product.id
      }

      assert {:ok, %LiveComment{} = live_comment} = LiveCatalog.create_live_comment(create_attrs)
      assert live_comment.body == "body value"
      assert live_comment.live_post_id == live_post.id
      assert live_comment.live_product_id == live_product.id
    end

    test "create_live_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LiveCatalog.create_live_comment(@invalid_attrs)
    end

    test "update_live_comment/2 with valid data updates the live_comment" do
      live_comment = live_comment_fixture()

      live_post = ImprovedAttributesExample.LiveBlogFixtures.live_post_fixture()
      live_product = live_product_fixture()

      update_attrs = %{
        body: "updated body value",
        live_post_id: live_post.id,
        live_product_id: live_product.id
      }

      assert {:ok, %LiveComment{} = live_comment} = LiveCatalog.update_live_comment(live_comment, update_attrs)
      assert live_comment.body == "updated body value"
      assert live_comment.live_post_id == live_post.id
      assert live_comment.live_product_id == live_product.id
    end

    test "update_live_comment/2 with invalid data returns error changeset" do
      live_comment = live_comment_fixture()
      assert {:error, %Ecto.Changeset{}} = LiveCatalog.update_live_comment(live_comment, @invalid_attrs)

      assert live_comment == LiveCatalog.get_live_comment!(live_comment.id)
    end

    test "delete_live_comment/1 deletes the live_comment" do
      live_comment = live_comment_fixture()
      assert {:ok, %LiveComment{}} = LiveCatalog.delete_live_comment(live_comment)
      assert_raise Ecto.NoResultsError, fn -> LiveCatalog.get_live_comment!(live_comment.id) end
    end

    test "change_live_comment/1 returns a live_comment changeset" do
      live_comment = live_comment_fixture()
      assert %Ecto.Changeset{} = LiveCatalog.change_live_comment(live_comment)
    end
  end
end
