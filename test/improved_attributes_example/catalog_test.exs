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
end
