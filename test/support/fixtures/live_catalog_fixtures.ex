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

  @doc """
  Generate a live_comment.
  """
  def live_comment_fixture(attrs \\ %{}) do
    live_post = ImprovedAttributesExample.LiveBlogFixtures.live_post_fixture()
    live_product = live_product_fixture()

    {:ok, live_comment} =
      attrs
      |> Enum.into(%{
        body: "body value",
        live_post_id: live_post.id,
        live_product_id: live_product.id
      })
      |> ImprovedAttributesExample.LiveCatalog.create_live_comment()

    live_comment
  end
end
