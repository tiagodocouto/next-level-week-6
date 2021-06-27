defmodule NextLevelWeekWeb.Controllers.IMCControllerTest do
  use NextLevelWeekWeb.ConnCase, async: true

  describe "index/2" do
    test "when no params, return data", %{conn: conn} do
      response =
        conn
        |> get(Routes.imc_path(conn, :index, %{}))
        |> json_response(:ok)

      assert [
               %{"imc" => 24.897060231734173, "name" => "USER 1"},
               %{"imc" => 23.04002019946976, "name" => "USER 2"},
               %{"imc" => 23.437499999999996, "name" => "USER 3"},
               %{"imc" => 22.857142857142858, "name" => "USER 4"},
               %{"imc" => 26.234567901234566, "name" => "USER 5"}
             ] == response
    end

    test "when all params are valid, return data", %{conn: conn} do
      response =
        conn
        |> get(Routes.imc_path(conn, :index, %{"file" => "students.csv"}))
        |> json_response(:ok)

      assert [
               %{"imc" => 24.897060231734173, "name" => "USER 1"},
               %{"imc" => 23.04002019946976, "name" => "USER 2"},
               %{"imc" => 23.437499999999996, "name" => "USER 3"},
               %{"imc" => 22.857142857142858, "name" => "USER 4"},
               %{"imc" => 26.234567901234566, "name" => "USER 5"}
             ] == response
    end

    test "when all params are invalid, return error", %{conn: conn} do
      response =
        conn
        |> get(Routes.imc_path(conn, :index, %{"file" => "NO_FILE"}))
        |> json_response(:bad_request)

      assert %{"error" => "file not found!", "reason" => "enoent"} == response
    end
  end
end
