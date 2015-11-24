defmodule BabbyPhoenix.Repo.Migrations.CreateBabby do
  use Ecto.Migration

  def change do
    create table(:babbies) do
      add :name, :string
      add :bio, :text

      timestamps
    end

  end
end
