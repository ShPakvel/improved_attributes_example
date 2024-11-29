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
end
