defmodule TriageWeb.SymptomsView do
	use TriageWeb, :view
  
	def render("index.json", %{symptoms: symptoms}) do
    %{data: render_many(symptoms, TriageWeb.SymptomsView, "symptom.json", as: :symptom)}
  end

  def render("show.json", %{symptom: symptom}) do
    %{data: render_one(symptom, TriageWeb.SymptomsView, "symptom.json", as: :symptom)}
  end

  def render("symptom.json", %{symptom: symptom}) do
    %{
      id: symptom.sid,
      name: symptom.name,
      common_name: symptom.common_name,
      location: symptom.location
      }
  end
end