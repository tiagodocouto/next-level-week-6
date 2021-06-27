defmodule NextLevelWeekWeb.GraphQL.Resolver.User do
  def get(%{id: id}, _context),
    do: NextLevelWeek.Schema.User.Get.call(id)

  def get(find, _context),
    do: NextLevelWeek.Schema.User.Get.call(find)

  def create(%{input: input}, _context),
    do: NextLevelWeek.Schema.User.Create.call(input)
end
