defmodule ImprovedAttributesExample.LiveBlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ImprovedAttributesExample.LiveBlog` context.
  """

  @doc """
  Generate a live_post.
  """
  def live_post_fixture(attrs \\ %{}) do
    {:ok, live_post} =
      attrs
      |> Enum.into(%{
        content: "content value",
        public: true,
        reviewed: ~N[2024-11-28 00:00:00],
        tags: ["tags value"],
        title: "title value",
        topics: 1
      })
      |> ImprovedAttributesExample.LiveBlog.create_live_post()

    live_post
  end

  @doc """
  Generate a unique live_note body.
  """
  def unique_live_note_body, do: "#{System.unique_integer([:positive])}body value"

  @doc """
  Generate a unique live_note review_day.
  """
  def unique_live_note_review_day do
    Date.utc_today() |> Date.add(2 * System.unique_integer([:positive]))
  end

  @doc """
  Generate a live_note.
  """
  def live_note_fixture(attrs \\ %{}) do
    manual = ImprovedAttributesExample.LiveGeneral.LiveLibraryFixtures.live_book_fixture()
    live_post = live_post_fixture()
    live_product = ImprovedAttributesExample.LiveCatalogFixtures.live_product_fixture()

    {:ok, live_note} =
      attrs
      |> Enum.into(%{
        body: unique_live_note_body(),
        data: "data value",
        meta: ["meta value"],
        points: [142],
        review_day: unique_live_note_review_day(),
        status: :draft,
        tags: [:music],
        live_book_id: manual.isbn,
        live_post_id: live_post.id,
        live_product_id: live_product.id
      })
      |> ImprovedAttributesExample.LiveBlog.create_live_note()

    live_note
  end
end
