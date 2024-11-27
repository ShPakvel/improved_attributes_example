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

  describe "notes" do
    alias ImprovedAttributesExample.Blog.Note

    import ImprovedAttributesExample.BlogFixtures

    @invalid_attrs %{body: nil, data: nil, meta: nil, points: nil, review_day: nil, status: nil, tags: nil, book_id: nil, post_id: nil, product_id: nil}

    test "list_notes/0 returns all notes" do
      note = note_fixture()

      # NOTE: Virtual fields updated to defaults or nil before comparison.
      note = %{note | data: nil, meta: nil}
      assert Blog.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()

      # NOTE: Virtual fields updated to defaults or nil before comparison.
      note = %{note | data: nil, meta: nil}
      assert Blog.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      manual = ImprovedAttributesExample.General.LibraryFixtures.book_fixture()
      post = post_fixture()
      product = ImprovedAttributesExample.CatalogFixtures.product_fixture()

      create_attrs = %{
        body: "body value",
        data: "data value",
        meta: ["meta value"],
        points: [142],
        review_day: ~D[2024-11-26],
        status: :draft,
        tags: [:music],
        book_id: manual.isbn,
        post_id: post.id,
        product_id: product.id
      }

      assert {:ok, %Note{} = note} = Blog.create_note(create_attrs)
      assert note.body == "body value"
      assert note.data == "data value"
      assert note.meta == ["meta value"]
      assert note.points == [142]
      assert note.review_day == ~D[2024-11-26]
      assert note.status == :draft
      assert note.tags == [:music]
      assert note.book_id == manual.isbn
      assert note.post_id == post.id
      assert note.product_id == product.id
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()

      manual = ImprovedAttributesExample.General.LibraryFixtures.book_fixture()
      post = post_fixture()
      product = ImprovedAttributesExample.CatalogFixtures.product_fixture()

      update_attrs = %{
        body: "updated body value",
        data: "updated data value",
        meta: ["updated meta value"],
        points: [303],
        review_day: ~D[2024-11-27],
        status: :actual,
        tags: [:dance],
        book_id: manual.isbn,
        post_id: post.id,
        product_id: product.id
      }

      assert {:ok, %Note{} = note} = Blog.update_note(note, update_attrs)
      assert note.body == "updated body value"
      assert note.data == "updated data value"
      assert note.meta == ["updated meta value"]
      assert note.points == [303]
      assert note.review_day == ~D[2024-11-27]
      assert note.status == :actual
      assert note.tags == [:dance]
      assert note.book_id == manual.isbn
      assert note.post_id == post.id
      assert note.product_id == product.id
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_note(note, @invalid_attrs)

      # NOTE: Virtual fields updated to defaults or nil before comparison.
      note = %{note | data: nil, meta: nil}
      assert note == Blog.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Blog.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Blog.change_note(note)
    end
  end
end
