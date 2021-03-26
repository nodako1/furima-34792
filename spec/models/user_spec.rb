require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nick_nameが空だと登録できない" do
      user = User.new(nick_name: "",
        email: "kkk@gmail.com",
        password: "00000000",
        password_confirmation: "00000000",
        first_name: "太郎",
        last_name: "山田",
        first_name_kana: "タロウ",
        last_name_kana: "ヤマダ",
        birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nick name can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nick_name: "furima太郎",
        email: "",
        password: "00000000",
        password_confirmation: "00000000",
        first_name: "太郎",
        last_name: "山田",
        first_name_kana: "タロウ",
        last_name_kana: "ヤマダ",
        birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nick_name: "furima太郎",
        email: "kkk@gmail.com",
        password: "",
        password_confirmation: "00000000",
        first_name: "太郎",
        last_name: "山田",
        first_name_kana: "タロウ",
        last_name_kana: "ヤマダ",
        birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "password_confirmationが空では登録できない" do
      user = User.new(nick_name: "furima太郎",
        email: "kkk@gmail.com",
        password: "00000000",
        password_confirmation: "",
        first_name: "太郎",
        last_name: "山田",
        first_name_kana: "タロウ",
        last_name_kana: "ヤマダ",
        birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nick_name: "furima太郎",
        email: "kkk@gmail.com",
        password: "00000000",
        password_confirmation: "00000000",
        first_name: "",
        last_name: "山田",
        first_name_kana: "タロウ",
        last_name_kana: "ヤマダ",
        birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空では登録できない" do
      user = User.new(nick_name: "furima太郎",
        email: "kkk@gmail.com",
        password: "00000000",
        password_confirmation: "00000000",
        first_name: "太郎",
        last_name: "",
        first_name_kana: "タロウ",
        last_name_kana: "ヤマダ",
        birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      user = User.new(nick_name: "furima太郎",
        email: "kkk@gmail.com",
        password: "00000000",
        password_confirmation: "00000000",
        first_name: "太郎",
        last_name: "山田",
        first_name_kana: "",
        last_name_kana: "ヤマダ",
        birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "last_name_kanaが空では登録できない" do
      user = User.new(nick_name: "furima太郎",
        email: "kkk@gmail.com",
        password: "00000000",
        password_confirmation: "00000000",
        first_name: "太郎",
        last_name: "山田",
        first_name_kana: "タロウ",
        last_name_kana: "",
        birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "birthdayが空では登録できない" do
      user = User.new(nick_name: "furima太郎",
        email: "kkk@gmail.com",
        password: "00000000",
        password_confirmation: "00000000",
        first_name: "太郎",
        last_name: "山田",
        first_name_kana: "タロウ",
        last_name_kana: "ヤマダ",
        birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end