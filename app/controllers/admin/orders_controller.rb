class Admin::OrdersController < ApplicationController
  layout "admin"

    before_action :authenticate_user!
    before_action :admin_required

    def index
      @orders = Order.order("id DESC")
    end

    def show
      @order = Order.find(params[:id])
      @product_lists = @order.product_lists
    end

    private

    def admin_required
      if !current_user.admin?
        redirect_to "/", alert: "Yor are not admin."
      end
    end
end
