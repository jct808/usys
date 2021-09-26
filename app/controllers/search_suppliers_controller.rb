class SearchSuppliersController < ApplicationController
  def index
    @suppliers = Supplier.order(:name).where("name like ?", "%#{params[:term]}")
    render json: @suppliers.pluck(:id, :name)
  end
end
