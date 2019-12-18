defmodule TriageWeb.ConditionsController do
	use TriageWeb, :controller
	alias Triage.Conditions.Conditions

	action_fallback Triage.FallbackController

	def index(conn, _params) do
		render conn, "index.json", conditions: Conditions.all
	end

	def show(conn, %{"id" => cid}) do
		render conn, "show.json", condition: Conditions.find_by_cid(cid)
	end

end