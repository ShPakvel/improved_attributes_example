defmodule ImprovedAttributesExample.LiveBlog.LiveNote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "live_notes" do
    field :body, :string
    field :data, :any, virtual: true
    field :meta, {:array, :string}, virtual: true
    field :points, {:array, :integer}
    field :review_day, :date
    field :status, Ecto.Enum, values: [:draft, :actual, :archived]
    field :tags, {:array, Ecto.Enum}, values: [music: 1, dance: 2, movie: 3]
    belongs_to :manual, ImprovedAttributesExample.LiveGeneral.LiveLibrary.LiveBook, foreign_key: :live_book_id, references: :isbn, type: :string
    belongs_to :live_post, ImprovedAttributesExample.LiveBlog.LivePost, type: :binary_id
    belongs_to :live_product, ImprovedAttributesExample.LiveCatalog.LiveProduct

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(live_note, attrs) do
    live_note
    |> cast(attrs, [:body, :data, :meta, :points, :review_day, :status, :tags, :live_book_id, :live_post_id, :live_product_id])
    |> validate_required([:body])
    |> assoc_constraint(:live_post)
    |> assoc_constraint(:live_product)
    |> assoc_constraint(:manual)
    |> unique_constraint(:body)
    |> unique_constraint(:review_day)
    |> unique_constraint(:live_product_id)
  end
end
