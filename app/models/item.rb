class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, :detail, :price, :condition_id, :shipping_area_id, :shipping_days, :shipping_cost, :category_id, presence: true

  validates :images, presence: true
  validates :price, :numericality => { :greater_than => 299 }
  validates :price, :numericality => { :less_than => 9999999  }
  belongs_to :user, optional: true
  # 下記1行、今後ユーザー登録やカテゴリ機能との結びつきの実装を予想してコメントアウト状態にしています。
  # belongs_to :category
  
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :condition

  belongs_to :category



  enum condition_id:{"新品": 0, "未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6}

  enum shipping_cost:{"送料込み（出品者負担）": 0, "着払い（購入者負担）": 1}
  enum shipping_days:{"1〜2日": 0, "2〜3日": 1, "4〜7日": 2}


  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end
end



