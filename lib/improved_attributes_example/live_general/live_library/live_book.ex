defmodule ImprovedAttributesExample.LiveGeneral.LiveLibrary.LiveBook do
  use Ecto.Schema
  import Ecto.Changeset

  schema "live_books" do
    field :author_real_name, :string, redact: true
    field :free, :boolean, default: false
    field :index_page, :integer, default: 1
    field :isbn, :string
    field :name, :string
    field :print_size, :decimal, default: Decimal.new("13.45")
    field :rate, :float, default: 5.0

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(live_book, attrs) do
    live_book
    |> cast(attrs, [:author_real_name, :free, :index_page, :isbn, :name, :print_size, :rate])
    |> validate_required([:free, :index_page, :isbn, :name, :print_size, :rate])
    |> unique_constraint(:isbn)
  end
end
