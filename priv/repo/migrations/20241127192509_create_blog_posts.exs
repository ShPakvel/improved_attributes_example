defmodule ImprovedAttributesExample.Repo.Migrations.CreateBlogPosts do
  use Ecto.Migration

  def change do
    create table("blog_posts", primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :content, :text, null: false
      add :public, :boolean, default: true, null: false
      add :reviewed, :naive_datetime
      add :tags, {:array, :string}
      add :title, :string
      add :topics, :integer, default: 1

      timestamps(type: :utc_datetime)
    end
  end
end
