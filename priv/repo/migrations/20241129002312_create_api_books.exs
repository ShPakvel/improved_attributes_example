defmodule ImprovedAttributesExample.Repo.Migrations.CreateApiBooks do
  use Ecto.Migration

  def change do
    create table("api_books") do
      add :author_real_name, :string
      add :free, :boolean, default: false, null: false
      add :index_page, :integer, default: 1, null: false
      add :isbn, :string, null: false
      add :name, :string, null: false
      add :print_size, :decimal, default: 13.45, null: false
      add :rate, :float, default: 5.0, null: false

      timestamps(type: :utc_datetime)
    end

    create index("api_books", [:isbn], unique: true)
    create index("api_books", [:name])
  end
end
