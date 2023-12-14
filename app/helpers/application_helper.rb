module ApplicationHelper
  def toggle_order_direction(current_order)
    current_order === BasketCaseController::ASC ? BasketCaseController::DESC : BasketCaseController::ASC;
  end

  def order_indicator(current_order)
    current_order === BasketCaseController::ASC ? "▲" : "▼"
  end
end
