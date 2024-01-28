require 'rails_helper'

RSpec.describe "Posts", type: :system do

  before do
    user = FactoryBot.create(:user)
    sign_in user
  end

  describe "new and create" do

    it 'should successfully new and create post in same page' do
      visit posts_path
      sleep(1)
      expect(page).to have_css("h2", text:"投稿一覧")
      click_on '新規投稿'
      expect(page).to have_css("h2", text:"投稿一覧")
      fill_in "post_title", with: "これはテスト用の投稿のタイトルです。"
      fill_in "post_body", with: "これはテスト用の投稿の本文です。"
      click_on "投稿"

      expect(page).to have_css("h2", text:"投稿一覧")
      expect(page).to have_content("これはテスト用の投稿のタイトルです。")
      expect(page).to have_content("これはテスト用の投稿の本文です。")
    end
  end

    describe "edit and update" do

      it 'should successfully edit and update' do
        visit posts_path
        sleep(1)
        expect(page).to have_css("h2", text:"投稿一覧")
        click_on '新規投稿'
        expect(page).to have_css("h2", text:"投稿一覧")
        fill_in "post_title", with: "これはテスト用の投稿のタイトルです。"
        fill_in "post_body", with: "これはテスト用の投稿の本文です。"
        click_on "投稿"

        expect(page).to have_css("h2", text:"投稿一覧")
        expect(page).to have_content("これはテスト用の投稿のタイトルです。")
        expect(page).to have_content("これはテスト用の投稿の本文です。")

        click_on '編集'
        expect(page).to have_css("h2", text:"投稿一覧")
        fill_in 'post_title', with: "これはテスト用の投稿のタイトルを更新したものです。"
        fill_in 'post_body', with: "テスト用の投稿を更新した本文です。"
        click_on "投稿"

        expect(page).to have_css("h2", text:"投稿一覧")
        expect(page).to have_content("これはテスト用の投稿のタイトルを更新したものです。")
        expect(page).to have_content("テスト用の投稿を更新した本文です。")
      end
    end

    describe "destroy" do
      it "should delete post same screen" do
        visit posts_path
        sleep(1)
        expect(page).to have_css("h2", text:"投稿一覧")
        click_on '新規投稿'
        expect(page).to have_css("h2", text:"投稿一覧")
        fill_in "post_title", with: "これはテスト用の投稿のタイトルです。"
        fill_in "post_body", with: "これはテスト用の投稿の本文です。"
        click_on "投稿"

        expect(page).to have_css("h2", text:"投稿一覧")
        expect(page).to have_content("これはテスト用の投稿のタイトルです。")
        expect(page).to have_content("これはテスト用の投稿の本文です。")

        accept_alert do
          click_on '削除'
        end
        expect(page).to have_css("h2", text:"投稿一覧")
        expect(page).not_to have_content("これはテスト用の投稿のタイトルを更新したものです。")
        expect(page).not_to have_content("テスト用の投稿を更新した本文です。")
      end
    end
end