defmodule Triage.Conditions.Condition do
	use Ecto.Schema
	import Ecto.Changeset
	
	schema "conditions" do
		field :cid, :string
		field :name, :string
		field :common_name, :string
		field :sex_filter, :string
		field :category, :string
		field :prevalence, :string
		field :acuteness, :string
		field :severity, :string
		field :icd10_code, :string
		field :hint, :string
		field :triage_level, :string

		timestamps()
	end
  
	def changeset(struct, params \\ %{}) do
	  struct
	  |> cast(params, [:cid, :name, :common_name, :sex_filter, :category, :prevalence, :acuteness, :severity, :icd10_code, :hint, :triage_level])
	  |> validate_required([:cid])
	end
  end