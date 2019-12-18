defmodule TriageWeb.SymptomsController do
	use TriageWeb, :controller
	alias Triage.Symptoms.Symptoms

	action_fallback Triage.FallbackController

	def index(conn, params) do
		cond do
			params["location"] -> render conn, "index.json", symptoms: Symptoms.get_symptoms_by_location(params["location"])
			true -> render conn, "index.json", symptoms: Symptoms.all
		end
	end

	def show(conn, %{"id" => sid}) do
		render conn, "show.json", symptom: Symptoms.find_by_sid(sid)
	end

end