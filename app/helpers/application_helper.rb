module ApplicationHelper
  def sortable(column)
    title = column.titleize
    @direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => @direction}
  end

  def sort_icon(column)
    icon = sort_direction == "asc" ? material_icon.arrow_upward : material_icon.arrow_downward
    return icon if column == sort_column
  end
end
