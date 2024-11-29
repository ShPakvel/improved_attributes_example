defmodule ImprovedAttributesExample.Repo.Migrations.CreateLiveNotes do
  use Ecto.Migration

  def change do
    create table("live_notes") do
      add :body, :text, null: false
      add :points, {:array, :integer}
      add :review_day, :date
      add :status, :string
      add :tags, {:array, :integer}
      add :live_book_id, references("live_books", column: :isbn, type: :string, on_delete: :nothing)
      add :live_post_id, references("live_blog_posts", type: :binary_id, on_delete: :nothing)
      add :live_product_id, references("live_products", on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index("live_notes", [:body], unique: true)
    create index("live_notes", [:review_day], unique: true)
    create index("live_notes", [:live_book_id])
    create index("live_notes", [:live_post_id])
    create index("live_notes", [:live_product_id], unique: true)
  end
end
