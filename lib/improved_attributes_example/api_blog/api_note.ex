defmodule ImprovedAttributesExample.ApiBlog.ApiNote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "api_notes" do
    field :body, :string
    field :data, :any, virtual: true
    field :meta, {:array, :string}, virtual: true
    field :points, {:array, :integer}
    field :review_day, :date
    field :status, Ecto.Enum, values: [:draft, :actual, :archived]
    field :tags, {:array, Ecto.Enum}, values: [music: 1, dance: 2, movie: 3]
    belongs_to :manual, ImprovedAttributesExample.ApiGeneral.ApiLibrary.ApiBook, foreign_key: :api_book_id, references: :isbn, type: :string
    belongs_to :api_post, ImprovedAttributesExample.ApiBlog.ApiPost, type: :binary_id
    belongs_to :api_product, ImprovedAttributesExample.ApiCatalog.ApiProduct

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(api_note, attrs) do
    api_note
    |> cast(attrs, [:body, :data, :meta, :points, :review_day, :status, :tags, :api_book_id, :api_post_id, :api_product_id])
    |> validate_required([:body])
    |> assoc_constraint(:api_post)
    |> assoc_constraint(:api_product)
    |> assoc_constraint(:manual)
    |> unique_constraint(:body)
    |> unique_constraint(:review_day)
    |> unique_constraint(:api_product_id)
  end
end
