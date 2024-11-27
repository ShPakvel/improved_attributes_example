defmodule ImprovedAttributesExample.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ImprovedAttributesExample.Catalog` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        code: 1234,
        description: "description value",
        name: "name value",
        price: "21.98000",
        rate: 5.0
      })
      |> ImprovedAttributesExample.Catalog.create_product()

    product
  end

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    post = ImprovedAttributesExample.BlogFixtures.post_fixture()
    product = product_fixture()

    {:ok, comment} =
      attrs
      |> Enum.into(%{
        body: "body value",
        post_id: post.id,
        product_id: product.id
      })
      |> ImprovedAttributesExample.Catalog.create_comment()

    comment
  end
end
