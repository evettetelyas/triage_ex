defmodule Triage.Symptoms.Symptoms do
	import Ecto.Query, warn: false

  alias Triage.Repo
  alias Triage.Symptoms.Symptom

  def all do
    Repo.all(Symptom)
  end

  def find_by_sid(sid) do
    Repo.get_by(Symptom, sid: sid)
  end

  def get_symptoms_by_location(location) do
    query = from s in "symptoms",
    where: s.location == ^location,
    select: %{sid: s.sid, name: s.name, common_name: s.common_name, location: s.location}

    Repo.all(query)
  end
  
end