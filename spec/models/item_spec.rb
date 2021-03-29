require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @item = FactoryBot.build(:item)
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
    
end
