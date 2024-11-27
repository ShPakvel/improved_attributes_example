defmodule ImprovedAttributesExample.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "blog_posts" do
    field :content, :string
    field :public, :boolean, default: true
    field :reviewed, :naive_datetime
    field :tags, {:array, :string}
    field :title, :string
    field :topics, :integer, default: 1

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:content, :public, :reviewed, :tags, :title, :topics])
    |> validate_required([:content, :public])
  end
end
