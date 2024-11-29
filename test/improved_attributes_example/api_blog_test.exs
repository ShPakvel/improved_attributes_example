defmodule ImprovedAttributesExample.ApiBlogTest do
  use ImprovedAttributesExample.DataCase

  alias ImprovedAttributesExample.ApiBlog

  describe "api_blog_posts" do
    alias ImprovedAttributesExample.ApiBlog.ApiPost

    import ImprovedAttributesExample.ApiBlogFixtures

    @invalid_attrs %{content: nil, public: nil, reviewed: nil, tags: nil, title: nil, topics: nil}

    test "list_api_blog_posts/0 returns all api_blog_posts" do
      api_post = api_post_fixture()

      assert ApiBlog.list_api_blog_posts() == [api_post]
    end

    test "get_api_post!/1 returns the api_post with given id" do
      api_post = api_post_fixture()

      assert ApiBlog.get_api_post!(api_post.id) == api_post
    end

    test "create_api_post/1 with valid data creates a api_post" do
      create_attrs = %{
        content: "content value",
        public: true,
        reviewed: ~N[2024-11-28 00:21:00],
        tags: ["tags value"],
        title: "title value",
        topics: 142
      }

      assert {:ok, %ApiPost{} = api_post} = ApiBlog.create_api_post(create_attrs)
      assert api_post.content == "content value"
      assert api_post.public == true
      assert api_post.reviewed == ~N[2024-11-28 00:21:00]
      assert api_post.tags == ["tags value"]
      assert api_post.title == "title value"
      assert api_post.topics == 142
    end

    test "create_api_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ApiBlog.create_api_post(@invalid_attrs)
    end

    test "update_api_post/2 with valid data updates the api_post" do
      api_post = api_post_fixture()

      update_attrs = %{
        content: "updated content value",
        public: false,
        reviewed: ~N[2024-11-29 00:21:00],
        tags: ["updated tags value"],
        title: "updated title value",
        topics: 303
      }

      assert {:ok, %ApiPost{} = api_post} = ApiBlog.update_api_post(api_post, update_attrs)
      assert api_post.content == "updated content value"
      assert api_post.public == false
      assert api_post.reviewed == ~N[2024-11-29 00:21:00]
      assert api_post.tags == ["updated tags value"]
      assert api_post.title == "updated title value"
      assert api_post.topics == 303
    end

    test "update_api_post/2 with invalid data returns error changeset" do
      api_post = api_post_fixture()
      assert {:error, %Ecto.Changeset{}} = ApiBlog.update_api_post(api_post, @invalid_attrs)

      assert api_post == ApiBlog.get_api_post!(api_post.id)
    end

    test "delete_api_post/1 deletes the api_post" do
      api_post = api_post_fixture()
      assert {:ok, %ApiPost{}} = ApiBlog.delete_api_post(api_post)
      assert_raise Ecto.NoResultsError, fn -> ApiBlog.get_api_post!(api_post.id) end
    end

    test "change_api_post/1 returns a api_post changeset" do
      api_post = api_post_fixture()
      assert %Ecto.Changeset{} = ApiBlog.change_api_post(api_post)
    end
  end
end
