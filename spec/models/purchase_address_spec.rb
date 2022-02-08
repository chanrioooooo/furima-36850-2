require 'rails_helper'
RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep(1)
      end

    context '商品の購入ができるとき' do
      it '建物名を除く全ての項目の入力が存在すれば商品の購入ができる' do
        expect(@purchase_address).to be_valid
      end

      it 'buildingは空でも購入できる' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '商品の購入ができないとき' do

      it "tokenが空だと購入できない" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end


      it 'post_codeが空だと購入できない' do
        @purchase_address.post_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeはハイフンがないと購入できない' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid')
      end

      it 'area_idが空だと購入できない' do
        @purchase_address.area_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
      end

      it 'area_idが1を選択されていると購入できない' do
        @purchase_address.area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
      end

      it 'municipalitiesが空だと購入できない' do
        @purchase_address.municipalities = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'addressが空だと購入できない' do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephone_numが空だと購入できない' do
        @purchase_address.telephone_num = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone num can't be blank")
      end

      it 'telephone_numが半角数字以外を含んでいると購入できない' do
        @purchase_address.telephone_num = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone num is invalid")
      end

      it 'telephone_numが9文字以下だと購入できない' do
        @purchase_address.telephone_num = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone num is invalid")
      end

      it 'telephone_numが12文字以上だと購入できない' do
        @purchase_address.telephone_num = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone num is invalid")
      end

      it 'user_idがないと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idがないと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
