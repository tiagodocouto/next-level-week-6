defmodule NextLevelWeekWeb.Resolver.User do
  def get(%{id: id}, _context),
    do: NextLevelWeek.User.Get.call(id)

  def get(find, _context),
    do: NextLevelWeek.User.Get.call(find)
end
