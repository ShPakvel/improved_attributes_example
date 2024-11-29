defmodule ImprovedAttributesExample.Repo.Migrations.CreateApiComments do
  use Ecto.Migration

  def change do
    create table("api_comments", primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :string, size: 303, null: false
      add :api_post_id, references("api_blog_posts", type: :binary_id, on_delete: :nothing)
      add :api_product_id, references("api_products", on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create index("api_comments", [:api_post_id])
    create index("api_comments", [:api_product_id])
  end
end
