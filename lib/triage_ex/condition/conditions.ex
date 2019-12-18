defmodule Triage.Conditions.Conditions do
	import Ecto.Query, warn: false

  alias Triage.Repo
  alias Triage.Conditions.Condition

  def all do
    Repo.all(Condition)
  end

  def find_by_cid(cid) do
    Repo.get_by(Condition, cid: cid)
  end
  
end