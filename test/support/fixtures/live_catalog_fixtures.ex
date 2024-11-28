defmodule ImprovedAttributesExample.LiveCatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ImprovedAttributesExample.LiveCatalog` context.
  """

  @doc """
  Generate a live_product.
  """
  def live_product_fixture(attrs \\ %{}) do
    {:ok, live_product} =
      attrs
      |> Enum.into(%{
        code: 1234,
        description: "description value",
        name: "name value",
        price: "21.98000",
        rate: 5.0
      })
      |> ImprovedAttributesExample.LiveCatalog.create_live_product()

    live_product
  end
end
