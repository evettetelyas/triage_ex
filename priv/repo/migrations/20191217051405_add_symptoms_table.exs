defmodule Triage.Repo.Migrations.AddSymptomsTable do
  use Ecto.Migration

  def change do
    create table(:symptoms) do
      add :sid, :string
      add :name, :string
      add :common_name, :string
      add :sex_filter, :string
      add :seriousness, :string
      add :location, :string

      timestamps()
    end
  end
end
