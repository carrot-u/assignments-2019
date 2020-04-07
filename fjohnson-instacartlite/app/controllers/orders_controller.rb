class OrdersController < ApplicationController

    before_action :set_user

    def index
        @orders = @user.orders.all
    end

    def show
        @order = @user.orders.find(params[:id])
    end

    def new
        @order = @user.orders.new
    end

    def create
        @user = User.find(params[:user_id])
        @order = @user.orders.create(order_params)
        redirect_to '/users/:user_id/orders/:id'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:date, :time, :address, :delivery_instructions)
    end

end
