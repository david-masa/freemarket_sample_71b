require 'rails_helper'
describe Item do
  describe '#create' do

      it 'is invalid without category_id' do
        item = build(:item, category_id: nil)
        item.images.build(FactoryBot.attributes_for(:image))
        item.valid?
        expect(item.errors[:category_id]).to include("を入力してください")
      end

      it "brandがなくてもは登録できること" do
        item = build(:item, brand: "")
        item.images.build(FactoryBot.attributes_for(:image))
        # binding.pry
        expect(item).to be_valid
      end
  
      
      it 'is invalid without name' do
        item = build(:item, name: nil)
        item.images.build(FactoryBot.attributes_for(:image))
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end
      
      it 'is invalid without price' do
        item = build(:item, price: nil)
        item.images.build(FactoryBot.attributes_for(:image))
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it 'is invalid without detail' do
        item = build(:item, detail: nil)
        item.images.build(FactoryBot.attributes_for(:image))
        item.valid?
        expect(item.errors[:detail]).to include("を入力してください")
      end

      it 'is invalid without shipping_area_id' do
        item = build(:item, shipping_area_id: nil)
        item.images.build(FactoryBot.attributes_for(:image))
        item.valid?
        expect(item.errors[:shipping_area_id]).to include("を入力してください")
      end

      it 'is invalid without shipping_cost' do
        item = build(:item, shipping_cost: nil)
        item.images.build(FactoryBot.attributes_for(:image))
        item.valid?
        expect(item.errors[:shipping_cost]).to include("を入力してください")
      end

      it 'is invalid without condition_id' do
        item = build(:item, condition_id: nil)
        item.images.build(FactoryBot.attributes_for(:image))
        item.valid?
        expect(item.errors[:condition_id]).to include("を入力してください")
      end

      it 'is invalid without shipping_days' do
        item = build(:item, shipping_days: nil)
        item.images.build(FactoryBot.attributes_for(:image))
        item.valid?
        expect(item.errors[:shipping_days]).to include("を入力してください")
      end
      
    end
  end
# end