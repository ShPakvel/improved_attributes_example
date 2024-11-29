defmodule ImprovedAttributesExample.ApiCatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ImprovedAttributesExample.ApiCatalog` context.
  """

  @doc """
  Generate a api_product.
  """
  def api_product_fixture(attrs \\ %{}) do
    {:ok, api_product} =
      attrs
      |> Enum.into(%{
        code: 1234,
        description: "description value",
        name: "name value",
        price: "21.98000",
        rate: 5.0
      })
      |> ImprovedAttributesExample.ApiCatalog.create_api_product()

    api_product
  end
end
