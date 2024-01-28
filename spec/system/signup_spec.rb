require 'rails_helper'

RSpec.describe "User Authentication" do

  describe "signup" do
    let(:user) { build(:user) }

    it 'allow a user to sign up' do
      visit root_path
      click_on 'アカウント登録'
      expect(page).to have_css('h2', text:"アカウントを登録する")
      fill_in 'user_name', with: user.name
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_on 'アカウント登録'

      expect(page).to have_content("アカウント登録が完了しました。")
    end
  end

  describe "login" do
    let(:user) { create(:user) }

    it 'allow a user to log in' do
      visit root_path
      click_on 'ログイン'
      expect(page).to have_css('h2', text:"ログイン")
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'password'
      click_on 'ログイン'

      expect(page).to have_content("ログインしました")
    end
  end
end