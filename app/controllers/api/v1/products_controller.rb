class Api::V1::ProductsController < ApiController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    if user_signed_in?
      @products = Product.all.order(created_at: :desc)
      render :index
    else
      render json: { messages: "You are not login yet" }
    end
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :price, :quantity, :status, :image, :category_id, :location_id, :supplier_id, :location, :comment)
  end
end
