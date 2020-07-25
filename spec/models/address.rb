require 'rails_helper'

describe Address, type: :model do
  describe '#create' do

    it "項目がない場合は登録できないこと" do
      address = build(:address, family_name: nil, first_name: nil, family_name_kana: nil, first_name_kana: nil, postal_code: nil, city: nil)
      address.valid?
      expect(address.errors.full_messages).to include("Family nameを入力してください")
    end

    it "family_name_kanaがカナで返る事" do
      address = build(:address, family_name_kana: "kana")
      address.valid?
      expect(address.errors.full_messages).to include("Family name kanaは不正な値です")
    end

    it "first_name_kanaがカナで返る事" do
      address = build(:address, first_name_kana: "kana")
      address.valid?
      expect(address.errors.full_messages).to include("First name kanaは不正な値です")
    end

    it "post_codeがハイフン付きの7の数字で返る事" do
      address = build(:address, postal_code: "123-123")
      address.valid?
      expect(address.errors.full_messages).to include("Postal codeは不正な値です")
    end

  end
end