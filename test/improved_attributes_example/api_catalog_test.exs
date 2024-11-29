defmodule ImprovedAttributesExample.ApiCatalogTest do
  use ImprovedAttributesExample.DataCase

  alias ImprovedAttributesExample.ApiCatalog

  describe "api_products" do
    alias ImprovedAttributesExample.ApiCatalog.ApiProduct

    import ImprovedAttributesExample.ApiCatalogFixtures

    @invalid_attrs %{code: nil, description: nil, name: nil, price: nil, rate: nil}

    test "list_api_products/0 returns all api_products" do
      api_product = api_product_fixture()

      assert ApiCatalog.list_api_products() == [api_product]
    end

    test "get_api_product!/1 returns the api_product with given id" do
      api_product = api_product_fixture()

      assert ApiCatalog.get_api_product!(api_product.id) == api_product
    end

    test "create_api_product/1 with valid data creates a api_product" do
      create_attrs = %{
        code: 142,
        description: "description value",
        name: "name value",
        price: "22.50000",
        rate: 120.5
      }

      assert {:ok, %ApiProduct{} = api_product} = ApiCatalog.create_api_product(create_attrs)
      assert api_product.code == 142
      assert api_product.description == "description value"
      assert api_product.name == "name value"
      assert api_product.price == Decimal.new("22.50000")
      assert api_product.rate == 120.5
    end

    test "create_api_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ApiCatalog.create_api_product(@invalid_attrs)
    end

    test "update_api_product/2 with valid data updates the api_product" do
      api_product = api_product_fixture()

      update_attrs = %{
        code: 303,
        description: "updated description value",
        name: "updated name value",
        price: "18.70000",
        rate: 456.7
      }

      assert {:ok, %ApiProduct{} = api_product} = ApiCatalog.update_api_product(api_product, update_attrs)
      assert api_product.code == 303
      assert api_product.description == "updated description value"
      assert api_product.name == "updated name value"
      assert api_product.price == Decimal.new("18.70000")
      assert api_product.rate == 456.7
    end

    test "update_api_product/2 with invalid data returns error changeset" do
      api_product = api_product_fixture()
      assert {:error, %Ecto.Changeset{}} = ApiCatalog.update_api_product(api_product, @invalid_attrs)

      assert api_product == ApiCatalog.get_api_product!(api_product.id)
    end

    test "delete_api_product/1 deletes the api_product" do
      api_product = api_product_fixture()
      assert {:ok, %ApiProduct{}} = ApiCatalog.delete_api_product(api_product)
      assert_raise Ecto.NoResultsError, fn -> ApiCatalog.get_api_product!(api_product.id) end
    end

    test "change_api_product/1 returns a api_product changeset" do
      api_product = api_product_fixture()
      assert %Ecto.Changeset{} = ApiCatalog.change_api_product(api_product)
    end
  end

  describe "api_comments" do
    alias ImprovedAttributesExample.ApiCatalog.ApiComment

    import ImprovedAttributesExample.ApiCatalogFixtures

    @invalid_attrs %{body: nil, api_post_id: nil, api_product_id: nil}

    test "list_api_comments/0 returns all api_comments" do
      api_comment = api_comment_fixture()

      assert ApiCatalog.list_api_comments() == [api_comment]
    end

    test "get_api_comment!/1 returns the api_comment with given id" do
      api_comment = api_comment_fixture()

      assert ApiCatalog.get_api_comment!(api_comment.id) == api_comment
    end

    test "create_api_comment/1 with valid data creates a api_comment" do
      api_post = ImprovedAttributesExample.ApiBlogFixtures.api_post_fixture()
      api_product = api_product_fixture()

      create_attrs = %{
        body: "body value",
        api_post_id: api_post.id,
        api_product_id: api_product.id
      }

      assert {:ok, %ApiComment{} = api_comment} = ApiCatalog.create_api_comment(create_attrs)
      assert api_comment.body == "body value"
      assert api_comment.api_post_id == api_post.id
      assert api_comment.api_product_id == api_product.id
    end

    test "create_api_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ApiCatalog.create_api_comment(@invalid_attrs)
    end

    test "update_api_comment/2 with valid data updates the api_comment" do
      api_comment = api_comment_fixture()

      api_post = ImprovedAttributesExample.ApiBlogFixtures.api_post_fixture()
      api_product = api_product_fixture()

      update_attrs = %{
        body: "updated body value",
        api_post_id: api_post.id,
        api_product_id: api_product.id
      }

      assert {:ok, %ApiComment{} = api_comment} = ApiCatalog.update_api_comment(api_comment, update_attrs)
      assert api_comment.body == "updated body value"
      assert api_comment.api_post_id == api_post.id
      assert api_comment.api_product_id == api_product.id
    end

    test "update_api_comment/2 with invalid data returns error changeset" do
      api_comment = api_comment_fixture()
      assert {:error, %Ecto.Changeset{}} = ApiCatalog.update_api_comment(api_comment, @invalid_attrs)

      assert api_comment == ApiCatalog.get_api_comment!(api_comment.id)
    end

    test "delete_api_comment/1 deletes the api_comment" do
      api_comment = api_comment_fixture()
      assert {:ok, %ApiComment{}} = ApiCatalog.delete_api_comment(api_comment)
      assert_raise Ecto.NoResultsError, fn -> ApiCatalog.get_api_comment!(api_comment.id) end
    end

    test "change_api_comment/1 returns a api_comment changeset" do
      api_comment = api_comment_fixture()
      assert %Ecto.Changeset{} = ApiCatalog.change_api_comment(api_comment)
    end
  end
end
