defmodule ImprovedAttributesExample.Repo.Migrations.CreateLiveComments do
  use Ecto.Migration

  def change do
    create table("live_comments", primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :string, size: 303, null: false
      add :live_post_id, references("live_blog_posts", type: :binary_id, on_delete: :nothing)
      add :live_product_id, references("live_products", on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create index("live_comments", [:live_post_id])
    create index("live_comments", [:live_product_id])
  end
end
