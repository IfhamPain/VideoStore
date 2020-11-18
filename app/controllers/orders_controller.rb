class OrdersController < ApplicationController
  def show
    user_id = params[:user_id]
    status = params[:status]
    @orders = Order.where(user_id: user_id, status: status)
    respond_to do |format|
      format.js
    end
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = $user_viewed_id
    if @order.save
      flash[:info] = "Order created successfully"
      redirect_to(root_url)
    else
      flash.now[:messages] = @order.errors.full_messages.to_sentence
      render '_new'
    end
  end

  def new
    @order = Order.new
    respond_to do |format|
      format.js
    end
  end

  private

  # Setting up allowed parameters
  def order_params
    params.require(:order).permit(:user_id, :order_date, :expiration_date, movie_copy_ids: [])
  end


end
