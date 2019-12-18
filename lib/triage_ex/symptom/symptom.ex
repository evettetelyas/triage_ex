defmodule Triage.Symptoms.Symptom do
	use Ecto.Schema
	import Ecto.Changeset
	
	schema "symptoms" do
		field :sid, :string
		field :name, :string
		field :common_name, :string
		field :sex_filter, :string
		field :seriousness, :string
		field :location, :string

		timestamps()
	end
  
	def changeset(struct, params \\ %{}) do
	  struct
	  |> cast(params, [:sid, :name, :common_name, :sex_filter, :seriousness, :location])
	  |> validate_required([:sid])
	end
  end