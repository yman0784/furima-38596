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
      expect(@user.errors.full_messages).to include "Email is invalid"
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
    it 'パスワードが半角英字のみでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end
    it 'パスワードが半角数字のみでは登録できないこと' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end
    it 'パスワードが全角では登録できないこと' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = '111aaa'
      @user.password_confirmation = '222bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '新規登録/本人情報確認' do
    it '姓（全角）が空だと登録できない' do
      @user.family_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
    end
    it '姓（全角）に半角文字が含まれていると登録できない' do
      @user.family_name_kanji =  "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji Input full-width characters")
    end
    it '名（全角）が空だと登録できない' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end
    it '名（全角）に半角文字が含まれていると登録できない' do
      @user.first_name_kanji =  "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji Input full-width characters")
    end
    it '姓（カナ）が空だと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.family_name_kana =  "あ亜A@"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana Input full-width katakana characters")
    end
    it '姓（カナ）が空だと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      @user.first_name_kana = "あ亜A@"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Input full-width katakana characters")
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
