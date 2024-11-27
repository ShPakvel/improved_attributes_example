defmodule ImprovedAttributesExample.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table("notes") do
      add :body, :text, null: false
      add :points, {:array, :integer}
      add :review_day, :date
      add :status, :string
      add :tags, {:array, :integer}
      add :book_id, references("books", column: :isbn, type: :string, on_delete: :nothing)
      add :post_id, references("blog_posts", type: :binary_id, on_delete: :nothing)
      add :product_id, references("products", on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index("notes", [:body], unique: true)
    create index("notes", [:review_day], unique: true)
    create index("notes", [:book_id])
    create index("notes", [:post_id])
    create index("notes", [:product_id], unique: true)
  end
end
