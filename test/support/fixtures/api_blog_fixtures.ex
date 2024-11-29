defmodule ImprovedAttributesExample.ApiBlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ImprovedAttributesExample.ApiBlog` context.
  """

  @doc """
  Generate a api_post.
  """
  def api_post_fixture(attrs \\ %{}) do
    {:ok, api_post} =
      attrs
      |> Enum.into(%{
        content: "content value",
        public: true,
        reviewed: ~N[2024-11-28 00:21:00],
        tags: ["tags value"],
        title: "title value",
        topics: 1
      })
      |> ImprovedAttributesExample.ApiBlog.create_api_post()

    api_post
  end

  @doc """
  Generate a unique api_note body.
  """
  def unique_api_note_body, do: "#{System.unique_integer([:positive])}body value"

  @doc """
  Generate a unique api_note review_day.
  """
  def unique_api_note_review_day do
    Date.utc_today() |> Date.add(2 * System.unique_integer([:positive]))
  end

  @doc """
  Generate a api_note.
  """
  def api_note_fixture(attrs \\ %{}) do
    manual = ImprovedAttributesExample.ApiGeneral.ApiLibraryFixtures.api_book_fixture()
    api_post = api_post_fixture()
    api_product = ImprovedAttributesExample.ApiCatalogFixtures.api_product_fixture()

    {:ok, api_note} =
      attrs
      |> Enum.into(%{
        body: unique_api_note_body(),
        data: "data value",
        meta: ["meta value"],
        points: [142],
        review_day: unique_api_note_review_day(),
        status: :draft,
        tags: [:music],
        api_book_id: manual.isbn,
        api_post_id: api_post.id,
        api_product_id: api_product.id
      })
      |> ImprovedAttributesExample.ApiBlog.create_api_note()

    api_note
  end
end
