defmodule Mix.Tasks.Symptoms do
  use Mix.Task
  alias Triage.Repo
  alias Triage.Symptoms.Symptom

	@shortdoc "import symptoms to db"

  def run(_) do
    Mix.Task.run("app.start")
	  {:ok, symptom_data} = File.read("./priv/repo/raw_data/symptoms.json")
    raw = Poison.decode!(symptom_data)
    Enum.each(raw, fn symptom -> 
      Symptom.changeset(%Symptom{}, %{sid: symptom["id"], 
                                  name: symptom["name"], 
                                  common_name: symptom["common_name"],
                                  sex_filter: symptom["sex_filter"],
                                  seriousness: symptom["seriousness"],
                                  location: set_location(symptom["name"])
                                  })
      |> Repo.insert(returning: [:sid])
    end)
  end

  def set_location(name) do
    cond do
      String.contains?(String.downcase(name), ["chest", "breast", "cough", "heart", "heartburn", "breath", "breathing", "lung", "nipple"]) -> "chest"
      String.contains?(String.downcase(name), ["abdomen", "abdominal", "stomach", "bladder", "stools", "flatus", "anus", "bowel", "buttocks", "urine", "diarrhea", "testicles", "urethra", "urination"]) -> "abdomen"
      String.contains?(String.downcase(name), ["back", "kidney", "kidneys"]) -> "back"
      String.contains?(String.downcase(name), ["vaginal", "penis", "genital", "crotch", "scrotum"]) -> "groin"
      String.contains?(String.downcase(name), ["face", "facial", "neck", "jaw", "vision", "headache", "forehead", "head", "gums", "gum", "auditory", "nasal", "eyes", "ear", "earache", "throat", "thorax", "tounge", "mouth", "teeth", "tooth", "tonsil", "hearing", "sight", "visual", "voice", "see", "breath", "dental", "eyelid", "sensory", "lip", "nasal"]) -> "head"
      String.contains?(String.downcase(name), ["arms", "elbow", "wrist"]) -> "arms"
      String.contains?(String.downcase(name), ["hands", "fingers", "finger", "hand", "fingernail", "thumb", "thumbs"]) -> "hands"
      String.contains?(String.downcase(name), ["legs", "knee", "shin", "calf", "thigh", "hips", "hip"]) -> "legs"
      String.contains?(String.downcase(name), ["feet", "toes", "toe", "foot", "ankle", "toenail", "heel"]) -> "feet"
      true -> "undefined"
    end
  end
end