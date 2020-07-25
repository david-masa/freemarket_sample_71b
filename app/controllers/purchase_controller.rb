class PurchaseController < ApplicationController
  before_action :set_category
  require 'payjp'
  before_action :set_item,       only: [:index, :pay]
  before_action :set_card,       only: [:index, :pay]
  before_action :no_direct_path, only: [:index, :pay]
  before_action :costomer?,      only: [:index, :pay]

  def index
    @card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => @card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
    )
    @item.costomer = 0
    @item.costomer = @item.costomer + current_user.id
    @item.save
    redirect_to action: 'done' #完了画面に移動
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

  def set_category
    @category_parent_array = []
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent
      end
  end

  def no_direct_path
    if  @item.user_id == current_user.id
      redirect_to item_path(@item.id)
    end
  end

  def costomer?
    if @item.costomer.present?
      redirect_to item_path(@item.id)
    end
  end

end

