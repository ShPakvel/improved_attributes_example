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
end
