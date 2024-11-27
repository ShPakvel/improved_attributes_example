defmodule ImprovedAttributesExample.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ImprovedAttributesExample.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "content value",
        public: true,
        reviewed: ~N[2024-11-26 19:25:00],
        tags: ["tags value"],
        title: "title value",
        topics: 1
      })
      |> ImprovedAttributesExample.Blog.create_post()

    post
  end

  @doc """
  Generate a unique note body.
  """
  def unique_note_body, do: "#{System.unique_integer([:positive])}body value"

  @doc """
  Generate a unique note review_day.
  """
  def unique_note_review_day do
    Date.utc_today() |> Date.add(2 * System.unique_integer([:positive]))
  end

  @doc """
  Generate a note.
  """
  def note_fixture(attrs \\ %{}) do
    manual = ImprovedAttributesExample.General.LibraryFixtures.book_fixture()
    post = post_fixture()
    product = ImprovedAttributesExample.CatalogFixtures.product_fixture()

    {:ok, note} =
      attrs
      |> Enum.into(%{
        body: unique_note_body(),
        data: "data value",
        meta: ["meta value"],
        points: [142],
        review_day: unique_note_review_day(),
        status: :draft,
        tags: [:music],
        book_id: manual.isbn,
        post_id: post.id,
        product_id: product.id
      })
      |> ImprovedAttributesExample.Blog.create_note()

    note
  end
end
