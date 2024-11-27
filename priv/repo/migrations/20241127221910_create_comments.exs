defmodule ImprovedAttributesExample.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table("comments", primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :string, size: 303, null: false
      add :post_id, references("blog_posts", type: :binary_id, on_delete: :nothing)
      add :product_id, references("products", on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create index("comments", [:post_id])
    create index("comments", [:product_id])
  end
end
