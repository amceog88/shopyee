class ProductsController < ApplicationController

  def index
    #byebug
    @products = Product.page(params[:page]).per(16)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_cart_item(@product) #加product的item

    redirect_to root_path
  end

end
