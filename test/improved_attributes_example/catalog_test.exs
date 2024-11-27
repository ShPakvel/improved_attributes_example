defmodule ImprovedAttributesExample.CatalogTest do
  use ImprovedAttributesExample.DataCase

  alias ImprovedAttributesExample.Catalog

  describe "products" do
    alias ImprovedAttributesExample.Catalog.Product

    import ImprovedAttributesExample.CatalogFixtures

    @invalid_attrs %{code: nil, description: nil, name: nil, price: nil, rate: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()

      assert Catalog.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()

      assert Catalog.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      create_attrs = %{
        code: 142,
        description: "description value",
        name: "name value",
        price: "22.50000",
        rate: 120.5
      }

      assert {:ok, %Product{} = product} = Catalog.create_product(create_attrs)
      assert product.code == 142
      assert product.description == "description value"
      assert product.name == "name value"
      assert product.price == Decimal.new("22.50000")
      assert product.rate == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()

      update_attrs = %{
        code: 303,
        description: "updated description value",
        name: "updated name value",
        price: "18.70000",
        rate: 456.7
      }

      assert {:ok, %Product{} = product} = Catalog.update_product(product, update_attrs)
      assert product.code == 303
      assert product.description == "updated description value"
      assert product.name == "updated name value"
      assert product.price == Decimal.new("18.70000")
      assert product.rate == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_product(product, @invalid_attrs)

      assert product == Catalog.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Catalog.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Catalog.change_product(product)
    end
  end

  describe "comments" do
    alias ImprovedAttributesExample.Catalog.Comment

    import ImprovedAttributesExample.CatalogFixtures

    @invalid_attrs %{body: nil, post_id: nil, product_id: nil}

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()

      assert Catalog.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()

      assert Catalog.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      post = ImprovedAttributesExample.BlogFixtures.post_fixture()
      product = product_fixture()

      create_attrs = %{
        body: "body value",
        post_id: post.id,
        product_id: product.id
      }

      assert {:ok, %Comment{} = comment} = Catalog.create_comment(create_attrs)
      assert comment.body == "body value"
      assert comment.post_id == post.id
      assert comment.product_id == product.id
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()

      post = ImprovedAttributesExample.BlogFixtures.post_fixture()
      product = product_fixture()

      update_attrs = %{
        body: "updated body value",
        post_id: post.id,
        product_id: product.id
      }

      assert {:ok, %Comment{} = comment} = Catalog.update_comment(comment, update_attrs)
      assert comment.body == "updated body value"
      assert comment.post_id == post.id
      assert comment.product_id == product.id
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_comment(comment, @invalid_attrs)

      assert comment == Catalog.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Catalog.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Catalog.change_comment(comment)
    end
  end
end
