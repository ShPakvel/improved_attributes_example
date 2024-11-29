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

  describe "api_notes" do
    alias ImprovedAttributesExample.ApiBlog.ApiNote

    import ImprovedAttributesExample.ApiBlogFixtures

    @invalid_attrs %{body: nil, data: nil, meta: nil, points: nil, review_day: nil, status: nil, tags: nil, api_book_id: nil, api_post_id: nil, api_product_id: nil}

    test "list_api_notes/0 returns all api_notes" do
      api_note = api_note_fixture()

      # NOTE: Virtual fields updated to defaults or nil before comparison.
      api_note = %{api_note | data: nil, meta: nil}
      assert ApiBlog.list_api_notes() == [api_note]
    end

    test "get_api_note!/1 returns the api_note with given id" do
      api_note = api_note_fixture()

      # NOTE: Virtual fields updated to defaults or nil before comparison.
      api_note = %{api_note | data: nil, meta: nil}
      assert ApiBlog.get_api_note!(api_note.id) == api_note
    end

    test "create_api_note/1 with valid data creates a api_note" do
      manual = ImprovedAttributesExample.ApiGeneral.ApiLibraryFixtures.api_book_fixture()
      api_post = api_post_fixture()
      api_product = ImprovedAttributesExample.ApiCatalogFixtures.api_product_fixture()

      create_attrs = %{
        body: "body value",
        data: "data value",
        meta: ["meta value"],
        points: [142],
        review_day: ~D[2024-11-28],
        status: :draft,
        tags: [:music],
        api_book_id: manual.isbn,
        api_post_id: api_post.id,
        api_product_id: api_product.id
      }

      assert {:ok, %ApiNote{} = api_note} = ApiBlog.create_api_note(create_attrs)
      assert api_note.body == "body value"
      assert api_note.data == "data value"
      assert api_note.meta == ["meta value"]
      assert api_note.points == [142]
      assert api_note.review_day == ~D[2024-11-28]
      assert api_note.status == :draft
      assert api_note.tags == [:music]
      assert api_note.api_book_id == manual.isbn
      assert api_note.api_post_id == api_post.id
      assert api_note.api_product_id == api_product.id
    end

    test "create_api_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ApiBlog.create_api_note(@invalid_attrs)
    end

    test "update_api_note/2 with valid data updates the api_note" do
      api_note = api_note_fixture()

      manual = ImprovedAttributesExample.ApiGeneral.ApiLibraryFixtures.api_book_fixture()
      api_post = api_post_fixture()
      api_product = ImprovedAttributesExample.ApiCatalogFixtures.api_product_fixture()

      update_attrs = %{
        body: "updated body value",
        data: "updated data value",
        meta: ["updated meta value"],
        points: [303],
        review_day: ~D[2024-11-29],
        status: :actual,
        tags: [:dance],
        api_book_id: manual.isbn,
        api_post_id: api_post.id,
        api_product_id: api_product.id
      }

      assert {:ok, %ApiNote{} = api_note} = ApiBlog.update_api_note(api_note, update_attrs)
      assert api_note.body == "updated body value"
      assert api_note.data == "updated data value"
      assert api_note.meta == ["updated meta value"]
      assert api_note.points == [303]
      assert api_note.review_day == ~D[2024-11-29]
      assert api_note.status == :actual
      assert api_note.tags == [:dance]
      assert api_note.api_book_id == manual.isbn
      assert api_note.api_post_id == api_post.id
      assert api_note.api_product_id == api_product.id
    end

    test "update_api_note/2 with invalid data returns error changeset" do
      api_note = api_note_fixture()
      assert {:error, %Ecto.Changeset{}} = ApiBlog.update_api_note(api_note, @invalid_attrs)

      # NOTE: Virtual fields updated to defaults or nil before comparison.
      api_note = %{api_note | data: nil, meta: nil}
      assert api_note == ApiBlog.get_api_note!(api_note.id)
    end

    test "delete_api_note/1 deletes the api_note" do
      api_note = api_note_fixture()
      assert {:ok, %ApiNote{}} = ApiBlog.delete_api_note(api_note)
      assert_raise Ecto.NoResultsError, fn -> ApiBlog.get_api_note!(api_note.id) end
    end

    test "change_api_note/1 returns a api_note changeset" do
      api_note = api_note_fixture()
      assert %Ecto.Changeset{} = ApiBlog.change_api_note(api_note)
    end
  end
end
