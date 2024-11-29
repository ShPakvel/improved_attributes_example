defmodule ImprovedAttributesExample.LiveBlogTest do
  use ImprovedAttributesExample.DataCase

  alias ImprovedAttributesExample.LiveBlog

  describe "live_blog_posts" do
    alias ImprovedAttributesExample.LiveBlog.LivePost

    import ImprovedAttributesExample.LiveBlogFixtures

    @invalid_attrs %{content: nil, public: nil, reviewed: nil, tags: nil, title: nil, topics: nil}

    test "list_live_blog_posts/0 returns all live_blog_posts" do
      live_post = live_post_fixture()

      assert LiveBlog.list_live_blog_posts() == [live_post]
    end

    test "get_live_post!/1 returns the live_post with given id" do
      live_post = live_post_fixture()

      assert LiveBlog.get_live_post!(live_post.id) == live_post
    end

    test "create_live_post/1 with valid data creates a live_post" do
      create_attrs = %{
        content: "content value",
        public: true,
        reviewed: ~N[2024-11-28 00:00:00],
        tags: ["tags value"],
        title: "title value",
        topics: 142
      }

      assert {:ok, %LivePost{} = live_post} = LiveBlog.create_live_post(create_attrs)
      assert live_post.content == "content value"
      assert live_post.public == true
      assert live_post.reviewed == ~N[2024-11-28 00:00:00]
      assert live_post.tags == ["tags value"]
      assert live_post.title == "title value"
      assert live_post.topics == 142
    end

    test "create_live_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LiveBlog.create_live_post(@invalid_attrs)
    end

    test "update_live_post/2 with valid data updates the live_post" do
      live_post = live_post_fixture()

      update_attrs = %{
        content: "updated content value",
        public: false,
        reviewed: ~N[2024-11-29 00:00:00],
        tags: ["updated tags value"],
        title: "updated title value",
        topics: 303
      }

      assert {:ok, %LivePost{} = live_post} = LiveBlog.update_live_post(live_post, update_attrs)
      assert live_post.content == "updated content value"
      assert live_post.public == false
      assert live_post.reviewed == ~N[2024-11-29 00:00:00]
      assert live_post.tags == ["updated tags value"]
      assert live_post.title == "updated title value"
      assert live_post.topics == 303
    end

    test "update_live_post/2 with invalid data returns error changeset" do
      live_post = live_post_fixture()
      assert {:error, %Ecto.Changeset{}} = LiveBlog.update_live_post(live_post, @invalid_attrs)

      assert live_post == LiveBlog.get_live_post!(live_post.id)
    end

    test "delete_live_post/1 deletes the live_post" do
      live_post = live_post_fixture()
      assert {:ok, %LivePost{}} = LiveBlog.delete_live_post(live_post)
      assert_raise Ecto.NoResultsError, fn -> LiveBlog.get_live_post!(live_post.id) end
    end

    test "change_live_post/1 returns a live_post changeset" do
      live_post = live_post_fixture()
      assert %Ecto.Changeset{} = LiveBlog.change_live_post(live_post)
    end
  end
end
