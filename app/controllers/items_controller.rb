class ItemsController < ApplicationController
  helper_method :collection, :resource
  respond_to :html, :json

  def index
  end

  def edit
  end

  def new
  end

  def update
    if resource.update_attributes item_attributes
      render json: resource
    else
      render json: resource.errors, status: 422
    end
  end 

  def create
    item = Item.new item_attributes
    if item.save
      render json: item
    else
      render json: item.errors, status: 422
    end
  end

protected
  def collection
    @items ||= Item.all
  end

  def resource
    @item ||= params[:id] ? Item.find(params[:id]) : Item.new
  end

private
  def item_attributes
    params.require(:item).permit(:name, :description, :active, :price)
  end
end
