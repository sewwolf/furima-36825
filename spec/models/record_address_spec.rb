require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    @record_address = FactoryBot.build(:record_address)
  end

  describe '購入履歴・配送先の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@record_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @record_address.building_name = ''
        expect(@record_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeは全角では保存されない' do
        @record_address.postal_code = '１２３－４５６７'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'area_idが1の場合は登録できない' do
        @record_address.area_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalityが空だと保存できない' do
        @record_address.municipality = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'street_numberが空だと保存できない' do
        @record_address.street_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Street number can't be blank")
      end
      it 'telephone_numberが空だと保存できない' do
        @record_address.telephone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが9桁以下だと保存できない' do
        @record_address.telephone_number = '090123456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが12桁以上だと保存できない' do
        @record_address.telephone_number = '090123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが全角だと保存できない' do
        @record_address.telephone_number = '０９００１２３４５６７'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
