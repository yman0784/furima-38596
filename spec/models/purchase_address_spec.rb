require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@purchase_address).to be_valid
    end
    it 'building_nameは空でも購入できること' do
      @purchase_address.building_name = ''
      expect(@purchase_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'userが紐付いていないとと購入できないこと' do
      @purchase_address.user_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないとと購入できないこと' do
      @purchase_address.item_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
    it 'tokenが空だと購入できないこと' do
      @purchase_address.token = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと購入できないこと' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
    end
    it 'prefectureを選択していないと購入できないこと' do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'municipalitiesが空だと購入できないこと' do
      @purchase_address.municipalities = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'addressが空だと購入できないこと' do
      @purchase_address.address =''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'telephone_numberが空だと購入できないこと' do
      @purchase_address.telephone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
    end
    it 'telephone_numberに半角数字以外があると購入できないこと' do
      @purchase_address.telephone_number = '０９０-1234-1234'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid. Input only number")
    end
    it 'telephone_numberが9桁以下だと購入できないこと' do
      @purchase_address.telephone_number = '123456789'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number is too short")
    end
    it 'telephone_numberが12桁以上だと購入できないこと' do
      @purchase_address.telephone_number = '090123412341'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone number is too long")
    end
  end

end
