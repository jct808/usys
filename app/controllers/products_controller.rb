class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  autocomplete :supplier, :name
  # GET /products
  # GET /products.json
  def index
    # This is for scope 
    @locations = Location.all

    if params.has_key?(:location)
      @products =  Product.location(params[:location])
    elsif params.has_key?(:search) && params[:search] != ""
      @products =  Product.joins(:supplier).search(params[:search]) 
    else 
      @products = Product.order(created_at: :desc)
    end 
    
    @products = Kaminari.paginate_array(@products).page(params[:page]) if @products.class == Array
    @products = @products.page(params[:page])
  
  end

  def index_table 
    @products = Product.joins(:supplier).search(params[:search]).order(created_at: :desc)
    render 'index_table'
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: t('flash.created') }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: t('flash.updated') }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: t('flash.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :quantity, :status, :image, :category_id, :location_id, :supplier_id, :location, :comment)
    end
end
