defmodule NextLevelWeekWeb.GraphQL.Resolver.Training do
  def create(%{input: input}, _context),
    do: NextLevelWeek.Schema.Training.Create.call(input)
end
