class ItemsController < ApplicationController
  before_action :ensure_current_user, only: [:edit, :update]
  before_action :set_item, only:[:edit, :update, :destroy]	

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.new
    @category_parent_array = Category.where(ancestry: nil)

    def get_parent
      @category_parent_array = Category.where(ancestry: nil)
    end
    
    def get_category_children
      respond_to do |format|
        format.html
        format.json do
          @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
        end
      end
    end

    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "出品しました"
    else
      redirect_to new_item_path, notice: "出品できません。入力必須項目を確認してください"
    end
  end



  def edit
    # @item = Item.new
    # @item.images.new
    @category_parent_array = Category.where(ancestry: nil)

    def get_parent
      @category_parent_array = Category.where(ancestry: nil)
    end
    
    def get_category_children
      respond_to do |format|
        format.html
        format.json do
          @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
        end
      end
    end

    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
  end  

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: "商品を削除しました"
    else
      redirect_to item_path, notice: "商品を削除できませんでした"
    end
  end

  def show
    @item = Item.includes(:images)
    @item = Item.find(params[:id])
    @category = Item.where(category_id: [1...200]).includes(:images).order('created_at DESC').limit(5)
    
  end

  def top
    @items = Item.includes(:images).order('created_at DESC').limit(5)
    @category = Item.where(category_id: [1...200]).includes(:images).order('created_at DESC').limit(5)
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :brand, :category_id, :price, :condition_id, :shipping_area_id, :shipping_days, :shipping_cost, :costomer, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)  
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root
    redirect_to root_path unless user_signed_in?
  end
  def correct_user
    if @current_user.id !=  @item.user_id
     redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root
    redirect_to root_path unless user_signed_in?
  end

  def ensure_current_user
    item = Item.find(params[:id])
    if item.user_id != current_user.id
      redirect_to action: :index
    end
  end
end