require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @item = FactoryBot.build(:item)
end
