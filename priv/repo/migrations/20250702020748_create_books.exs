defmodule BookTracker.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :page, :integer
      add :read, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
