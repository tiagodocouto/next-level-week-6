defmodule NextLevelWeekWeb.GraphQL.Schema.UserTest do
  use NextLevelWeekWeb.ConnCase, async: true

  describe "user queries" do
    test "when valid id, return user", %{conn: conn} do
      {:ok, %NextLevelWeek.Schema.User{id: user_id}} =
        %{
          name: "Tiago",
          email: "strife.tiago@gmail.com",
          password: "_password_"
        }
        |> NextLevelWeek.Schema.User.Create.call()

      query = """
      {
        getUser(id: "#{user_id}") {
          email
          name
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "getUser" => %{
                   "email" => "strife.tiago@gmail.com",
                   "name" => "Tiago"
                 }
               }
             } == response
    end
  end

  describe "user mutations" do
    test "when all params are valid, return user", %{conn: conn} do
      query = """
      mutation {
        createUser (input: {
          email: "strife.tiago@gmail.com"
          name: "Tiago"
          password: "_PASSWORD_"
        }) {
          name
          email
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "createUser" => %{
                   "email" => "strife.tiago@gmail.com",
                   "name" => "Tiago"
                 }
               }
             } == response
    end

    test "when params are invalid, return error", %{conn: conn} do
      query = """
      mutation {
        createUser (input: {
          name: "Tiago"
        }) {
          name
          email
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      assert %{
               "errors" => [
                 %{
                   "locations" => [%{"column" => 15, "line" => 2}],
                   "message" =>
                     "Argument \"input\" has invalid value {name: \"Tiago\"}.\nIn field \"password\": Expected type \"String!\", found null.\nIn field \"email\": Expected type \"String!\", found null."
                 }
               ]
             } == response
    end
  end
end
