defmodule NextLevelWeekWeb.Resolver.User do
  def get(%{id: id}, _context),
    do: NextLevelWeek.User.Get.call(id)

  def get(find, _context),
    do: NextLevelWeek.User.Get.call(find)

  def create(%{input: input}, _context),
    do: NextLevelWeek.User.Create.call(input)
end
