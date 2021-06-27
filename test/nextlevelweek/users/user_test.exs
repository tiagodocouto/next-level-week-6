defmodule NextLevelWeek.UserTest do
  use NextLevelWeek.DataCase, async: true

  describe "changeset/1" do
    test "when all params are valid, return valid user changeset" do
      user =
        %{
          name: "Tiago",
          email: "strife.tiago@gmail.com",
          password: "_password_"
        }
        |> NextLevelWeek.Schema.User.changeset()

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "strife.tiago@gmail.com", name: "Tiago", password: "_password_"}
             } = user
    end

    test "when email is invalid, return invalid user changeset" do
      user =
        %{
          name: "Tiago",
          email: "strife.tiago",
          password: "_password_"
        }
        |> NextLevelWeek.Schema.User.changeset()

      assert %Ecto.Changeset{
               valid?: false,
               errors: [email: {"has invalid format", [validation: :format]}]
             } = user
    end

    test "when password and email are invalid, return invalid user changeset" do
      user =
        %{
          name: "Tiago",
          email: "strife.tiago",
          password: "no"
        }
        |> NextLevelWeek.Schema.User.changeset()

      assert %Ecto.Changeset{
               valid?: false,
               errors: [
                 password:
                   {"should be at least %{count} character(s)",
                    [count: 6, validation: :length, kind: :min, type: :string]},
                 email: {"has invalid format", [validation: :format]}
               ]
             } = user
    end

    test "when no fields are valid, return invalid user changeset" do
      user =
        %{}
        |> NextLevelWeek.Schema.User.changeset()

      assert %Ecto.Changeset{
               valid?: false,
               errors: [
                 name: {"can't be blank", [validation: :required]},
                 email: {"can't be blank", [validation: :required]},
                 password: {"can't be blank", [validation: :required]}
               ]
             } = user
    end
  end
end
