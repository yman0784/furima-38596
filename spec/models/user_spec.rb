require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe '新規登録/ユーザー情報' do
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it 'メールアドレスは、＠を含む必要があること' do
      @user.email = 'testtest.com'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email is invalid")
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = '111111'
      @user.password_confirmation = '222222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '新規登録/本人情報確認' do
    it 'お名前（全角）は、名字と名前がそれぞれ必須であること' do
      @user.family_name_kanji = ''
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji can't be blank", "First name kanji can't be blank")
    end
    it 'お名前（全角）は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.family_name_kanji =  "ｱｲｳｴｵ"
      @user.first_name_kanji =  "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji Input full-width characters", "First name kanji Input full-width characters")
    end
    it 'お名前カナ（全角）は、名字と名前がそれぞれ必須であること' do
      @user.family_name_kana = ''
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "First name kana can't be blank")

    end
    it 'お名前カナ（全角）は、全角（カタカナ）での入力が必須であること' do
      @user.family_name_kana =  "ｱｲｳｴｵ"
      @user.first_name_kana = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana Input full-width katakana characters", "First name kana Input full-width katakana characters")
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end

  describe 'トップページ' do
    it 'ログアウト状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「新規登録」「ログイン」ボタンが表示されること' do
      
    end
    it 'ログイン状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「ユーザーのニックネーム」と「ログアウト」ボタンが表示されること' do
      
    end
    it 'トップページ（商品一覧ページ）ヘッダーの、「新規登録」「ログイン」ボタンをクリックすると、各ページに遷移できること。' do
      
    end
    it 'トップページ（商品一覧ページ）ヘッダーの、「ログアウト」ボタンをクリックすると、ログアウトができること' do
      
    end
  end
end
