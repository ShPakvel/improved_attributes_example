defmodule ImprovedAttributesExample.BlogTest do
  use ImprovedAttributesExample.DataCase

  alias ImprovedAttributesExample.Blog

  describe "blog_posts" do
    alias ImprovedAttributesExample.Blog.Post

    import ImprovedAttributesExample.BlogFixtures

    @invalid_attrs %{content: nil, public: nil, reviewed: nil, tags: nil, title: nil, topics: nil}

    test "list_blog_posts/0 returns all blog_posts" do
      post = post_fixture()

      assert Blog.list_blog_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()

      assert Blog.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      create_attrs = %{
        content: "content value",
        public: true,
        reviewed: ~N[2024-11-26 19:25:00],
        tags: ["tags value"],
        title: "title value",
        topics: 142
      }

      assert {:ok, %Post{} = post} = Blog.create_post(create_attrs)
      assert post.content == "content value"
      assert post.public == true
      assert post.reviewed == ~N[2024-11-26 19:25:00]
      assert post.tags == ["tags value"]
      assert post.title == "title value"
      assert post.topics == 142
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()

      update_attrs = %{
        content: "updated content value",
        public: false,
        reviewed: ~N[2024-11-27 19:25:00],
        tags: ["updated tags value"],
        title: "updated title value",
        topics: 303
      }

      assert {:ok, %Post{} = post} = Blog.update_post(post, update_attrs)
      assert post.content == "updated content value"
      assert post.public == false
      assert post.reviewed == ~N[2024-11-27 19:25:00]
      assert post.tags == ["updated tags value"]
      assert post.title == "updated title value"
      assert post.topics == 303
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_post(post, @invalid_attrs)

      assert post == Blog.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Blog.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Blog.change_post(post)
    end
  end
end
