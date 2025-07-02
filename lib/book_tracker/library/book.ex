defmodule BookTracker.Library.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :read, :boolean, default: false
    field :title, :string
    field :author, :string
    field :page, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :page, :read])
    |> validate_required([:title, :author, :page, :read])
  end
end
