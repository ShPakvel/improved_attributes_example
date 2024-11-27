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
end
