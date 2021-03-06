class Admin::ProductsController < Admin::BaseController

  before_action :set_product, only:[:show, :edit, :update, :destroy]

  def index
    @products = Product.page(params[:page]).per(20)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "product was successfully created"
      redirect_to admin_products_path
    else
      flash.now[:alert] = "product was failed to create"
      render :new
    end
  end


  def update
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
      flash[:notice] = "product was successfully updated"
    else
      render :edit
      flash[:alert] = "product was failed to update"
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
    flash[:alert] = "product was deleted"
  end


private

  def product_params
    params.require(:product).permit(:name, :price, :image, :description)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
