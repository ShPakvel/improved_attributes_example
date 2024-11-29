defmodule ImprovedAttributesExample.Repo.Migrations.CreateApiNotes do
  use Ecto.Migration

  def change do
    create table("api_notes") do
      add :body, :text, null: false
      add :points, {:array, :integer}
      add :review_day, :date
      add :status, :string
      add :tags, {:array, :integer}
      add :api_book_id, references("api_books", column: :isbn, type: :string, on_delete: :nothing)
      add :api_post_id, references("api_blog_posts", type: :binary_id, on_delete: :nothing)
      add :api_product_id, references("api_products", on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index("api_notes", [:body], unique: true)
    create index("api_notes", [:review_day], unique: true)
    create index("api_notes", [:api_book_id])
    create index("api_notes", [:api_post_id])
    create index("api_notes", [:api_product_id], unique: true)
  end
end
