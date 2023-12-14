class BasketCaseController < ApplicationController
  before_action :set_sort_and_order
  before_action :set_fruits
  before_action :set_items

  NAME = "name"
  AMOUNT = "amount"
  ASC = "asc"
  DESC = "desc"

  def index
    @list_items = @list_items.sort_by { |name, amount| eval(@sort) }
    @list_items.reverse! if @order === DESC
    render 'basket_case/index'
  end

  private
    def set_fruits
      @fruits = {
        oranges: 5,
        apples: 9,
        grapes: 3,
        watermelons: 2
      }
    end

    def set_items
      @list_items = @fruits
    end

    def set_sort_and_order
      @sort = params[:sort].in?([NAME, AMOUNT]) ? params[:sort] : NAME
      @order = params[:order].in?([ASC, DESC]) ? params[:order] : ASC
    end
end
