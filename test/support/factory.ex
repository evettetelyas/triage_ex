defmodule Triage.Factory do
	use ExMachina.Ecto, repo: Triage.Repo
  
	def symptom_factory do
	  %Triage.Symptoms.Symptom{
		sid: sequence(:sid, &"s_#{&1}"),
        name: "Abdominal guarding",
        common_name: "Abdominal guarding",
        sex_filter: "both",
        seriousness: "emergency",
        location: "abdomen"
	  }
	end
  end