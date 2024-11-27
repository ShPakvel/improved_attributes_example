defmodule ImprovedAttributesExample.Blog.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :body, :string
    field :data, :any, virtual: true
    field :meta, {:array, :string}, virtual: true
    field :points, {:array, :integer}
    field :review_day, :date
    field :status, Ecto.Enum, values: [:draft, :actual, :archived]
    field :tags, {:array, Ecto.Enum}, values: [music: 1, dance: 2, movie: 3]
    belongs_to :manual, ImprovedAttributesExample.General.Library.Book, foreign_key: :book_id, references: :isbn, type: :string
    belongs_to :post, ImprovedAttributesExample.Blog.Post, type: :binary_id
    belongs_to :product, ImprovedAttributesExample.Catalog.Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:body, :data, :meta, :points, :review_day, :status, :tags, :book_id, :post_id, :product_id])
    |> validate_required([:body])
    |> assoc_constraint(:manual)
    |> assoc_constraint(:post)
    |> assoc_constraint(:product)
    |> unique_constraint(:body)
    |> unique_constraint(:review_day)
    |> unique_constraint(:product_id)
  end
end
