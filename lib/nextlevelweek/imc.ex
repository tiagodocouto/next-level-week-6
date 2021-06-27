defmodule NextLevelWeek.IMC do
  @moduledoc false

  def calculate(%{"file" => path}),
    do: calculate_imc(load(path))

  def calculate(_none),
    do: calculate_imc(load("students.csv"))

  def calculate(),
    do: calculate_imc(load("students.csv"))

  defp load(path),
    do: File.read(path)

  defp parse_person(person) do
    person
    |> List.update_at(0, &String.upcase/1)
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_person_imc
  end

  defp calculate_person_imc([name, height, weight]),
    do: %{:name => name, :imc => weight / (height * height)}

  defp calculate_imc({:ok, people}) do
    data =
      people
      |> String.split("\n")
      |> Enum.map(fn line -> String.split(line, ",") end)
      |> Enum.filter(fn s -> s != [""] end)
      |> Enum.map(&parse_person/1)

    {:ok, data}
  end

  defp calculate_imc({_, reason}),
    do: {:error, %{"reason" => reason, "error" => "file not found!"}}
end
