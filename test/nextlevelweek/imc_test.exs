defmodule NextLevelWeek.IMCTest do
  use ExUnit.Case, async: true

  describe "calculate/0" do
    test "when file exists, return data" do
      response = NextLevelWeek.IMC.calculate()

      assert {:ok,
              [
                %{imc: 24.897060231734173, name: "USER 1"},
                %{imc: 23.04002019946976, name: "USER 2"},
                %{imc: 23.437499999999996, name: "USER 3"},
                %{imc: 22.857142857142858, name: "USER 4"},
                %{imc: 26.234567901234566, name: "USER 5"}
              ]} == response
    end
  end

  describe "calculate/1" do
    test "when file exists, return data" do
      response =
        %{"file" => "students.csv"}
        |> NextLevelWeek.IMC.calculate()

      assert {:ok,
              [
                %{imc: 24.897060231734173, name: "USER 1"},
                %{imc: 23.04002019946976, name: "USER 2"},
                %{imc: 23.437499999999996, name: "USER 3"},
                %{imc: 22.857142857142858, name: "USER 4"},
                %{imc: 26.234567901234566, name: "USER 5"}
              ]} == response
    end

    test "when file not exists, return error" do
      response =
        %{"file" => "NO_FILE"}
        |> NextLevelWeek.IMC.calculate()

      assert {:error, %{"error" => "file not found!", "reason" => :enoent}} == response
    end
  end
end
