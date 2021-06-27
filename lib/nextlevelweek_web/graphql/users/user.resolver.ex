defmodule NextLevelWeekWeb.GraphQL.Resolver.User do
  def get(%{id: id}, _context),
    do: NextLevelWeek.Schema.User.Get.call(id)

  def create(%{input: input}, _context),
    do: NextLevelWeek.Schema.User.Create.call(input)
end
