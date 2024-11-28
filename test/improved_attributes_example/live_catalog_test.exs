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
end
