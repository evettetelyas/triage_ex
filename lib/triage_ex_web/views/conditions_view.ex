defmodule TriageWeb.ConditionsView do
	use TriageWeb, :view
  
	def render("index.json", %{conditions: conditions}) do
    %{data: render_many(conditions, TriageWeb.ConditionsView, "condition.json", as: :condition)}
  end

  def render("show.json", %{condition: condition}) do
    %{data: render_one(condition, TriageWeb.ConditionsView, "condition.json", as: :condition)}
  end

  def render("condition.json", %{condition: condition}) do
    %{
      id: condition.cid,
      name: condition.name,
      common_name: condition.common_name,
      sex_filter: condition.sex_filter,
      category: condition.category,
      prevalence: condition.prevalence,
      acuteness: condition.acuteness,
      severity: condition.severity,
      icd10_code: condition.icd10_code,
      hint: condition.hint,
      triage_level: condition.icd10_code
      }
  end
end