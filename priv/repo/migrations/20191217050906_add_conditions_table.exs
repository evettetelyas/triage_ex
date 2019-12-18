defmodule Triage.Repo.Migrations.AddConditionsTable do
  use Ecto.Migration

  def change do
    create table(:conditions) do
      add :cid, :string
      add :name, :string
      add :common_name, :string
      add :sex_filter, :string
      add :category, :string
      add :prevalence, :string
      add :acuteness, :string
      add :severity, :string
      add :icd10_code, :string
      add :hint, :text
      add :triage_level, :string

      timestamps()
    end
  end
end
