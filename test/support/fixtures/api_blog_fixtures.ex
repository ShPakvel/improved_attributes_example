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
end
