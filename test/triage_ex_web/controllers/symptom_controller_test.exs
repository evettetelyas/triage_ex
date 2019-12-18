defmodule Triage.SymptomsControllerTest do
	use TriageWeb.ConnCase
	import Triage.Factory
  
	test "#index renders all symptoms", %{conn: conn} do
		symptoms = insert_pair(:symptom)
		conn = get(conn, "/api/v1/symptoms")
    
	  assert json_response(conn, 200) == %{
		"data" => [
			%{"common_name" => "Abdominal guarding", 
				"id" => "#{List.first(symptoms).sid}", 
				"location" => "abdomen", 
				"name" => "Abdominal guarding"}, 
				%{"common_name" => "Abdominal guarding", 
				"id" => "#{List.last(symptoms).sid}", 
				"location" => "abdomen", 
				"name" => "Abdominal guarding"}
		]
	}
	end
  
	test "#show renders a single symptom" do
	  symptom = insert(:symptom)
	  conn = get(conn, "/api/v1/symptoms/#{symptom.sid}")
    
	  assert json_response(conn, 200) == %{
		"data" =>
			%{"common_name" => "Abdominal guarding", 
				"id" => "#{symptom.sid}", 
				"location" => "abdomen", 
				"name" => "Abdominal guarding"}
	}
	end
  end