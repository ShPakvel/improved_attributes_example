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

  describe "live_notes" do
    alias ImprovedAttributesExample.LiveBlog.LiveNote

    import ImprovedAttributesExample.LiveBlogFixtures

    @invalid_attrs %{body: nil, data: nil, meta: nil, points: nil, review_day: nil, status: nil, tags: nil, live_book_id: nil, live_post_id: nil, live_product_id: nil}

    test "list_live_notes/0 returns all live_notes" do
      live_note = live_note_fixture()

      # NOTE: Virtual fields updated to defaults or nil before comparison.
      live_note = %{live_note | data: nil, meta: nil}
      assert LiveBlog.list_live_notes() == [live_note]
    end

    test "get_live_note!/1 returns the live_note with given id" do
      live_note = live_note_fixture()

      # NOTE: Virtual fields updated to defaults or nil before comparison.
      live_note = %{live_note | data: nil, meta: nil}
      assert LiveBlog.get_live_note!(live_note.id) == live_note
    end

    test "create_live_note/1 with valid data creates a live_note" do
      manual = ImprovedAttributesExample.LiveGeneral.LiveLibraryFixtures.live_book_fixture()
      live_post = live_post_fixture()
      live_product = ImprovedAttributesExample.LiveCatalogFixtures.live_product_fixture()

      create_attrs = %{
        body: "body value",
        data: "data value",
        meta: ["meta value"],
        points: [142],
        review_day: ~D[2024-11-28],
        status: :draft,
        tags: [:music],
        live_book_id: manual.isbn,
        live_post_id: live_post.id,
        live_product_id: live_product.id
      }

      assert {:ok, %LiveNote{} = live_note} = LiveBlog.create_live_note(create_attrs)
      assert live_note.body == "body value"
      assert live_note.data == "data value"
      assert live_note.meta == ["meta value"]
      assert live_note.points == [142]
      assert live_note.review_day == ~D[2024-11-28]
      assert live_note.status == :draft
      assert live_note.tags == [:music]
      assert live_note.live_book_id == manual.isbn
      assert live_note.live_post_id == live_post.id
      assert live_note.live_product_id == live_product.id
    end

    test "create_live_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LiveBlog.create_live_note(@invalid_attrs)
    end

    test "update_live_note/2 with valid data updates the live_note" do
      live_note = live_note_fixture()

      manual = ImprovedAttributesExample.LiveGeneral.LiveLibraryFixtures.live_book_fixture()
      live_post = live_post_fixture()
      live_product = ImprovedAttributesExample.LiveCatalogFixtures.live_product_fixture()

      update_attrs = %{
        body: "updated body value",
        data: "updated data value",
        meta: ["updated meta value"],
        points: [303],
        review_day: ~D[2024-11-29],
        status: :actual,
        tags: [:dance],
        live_book_id: manual.isbn,
        live_post_id: live_post.id,
        live_product_id: live_product.id
      }

      assert {:ok, %LiveNote{} = live_note} = LiveBlog.update_live_note(live_note, update_attrs)
      assert live_note.body == "updated body value"
      assert live_note.data == "updated data value"
      assert live_note.meta == ["updated meta value"]
      assert live_note.points == [303]
      assert live_note.review_day == ~D[2024-11-29]
      assert live_note.status == :actual
      assert live_note.tags == [:dance]
      assert live_note.live_book_id == manual.isbn
      assert live_note.live_post_id == live_post.id
      assert live_note.live_product_id == live_product.id
    end

    test "update_live_note/2 with invalid data returns error changeset" do
      live_note = live_note_fixture()
      assert {:error, %Ecto.Changeset{}} = LiveBlog.update_live_note(live_note, @invalid_attrs)

      # NOTE: Virtual fields updated to defaults or nil before comparison.
      live_note = %{live_note | data: nil, meta: nil}
      assert live_note == LiveBlog.get_live_note!(live_note.id)
    end

    test "delete_live_note/1 deletes the live_note" do
      live_note = live_note_fixture()
      assert {:ok, %LiveNote{}} = LiveBlog.delete_live_note(live_note)
      assert_raise Ecto.NoResultsError, fn -> LiveBlog.get_live_note!(live_note.id) end
    end

    test "change_live_note/1 returns a live_note changeset" do
      live_note = live_note_fixture()
      assert %Ecto.Changeset{} = LiveBlog.change_live_note(live_note)
    end
  end
end
