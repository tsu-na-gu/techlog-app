require 'rails_helper'

RSpec.describe "comments", type: :system do

  before do
    user = FactoryBot.create(:user)
    sign_in user

  end

  describe "new adn create comment" do
    it "should create comment action" do
      visit posts_path
      sleep(1)
      expect(page).to have_css("h2", text:"投稿一覧")
      click_on '新規投稿'
      expect(page).to have_css("h2", text:"投稿一覧")
      fill_in "post_title", with: "これはテスト用の投稿のタイトルです。"
      fill_in "post_body", with: "これはテスト用の投稿の本文です。"
      click_on "投稿"
      expect(page).to have_css("h2", text:"投稿一覧")

      click_on "コメントの追加"
      expect(page).to have_css("h2", text:"投稿一覧")
      fill_in "comment_body", with: "これはテスト用のコメントです。"
      click_on "投稿"
      expect(page).to have_css("h2", text:"投稿一覧")
      expect(page).to have_content("これはテスト用のコメントです。")
    end
  end

  describe "edit and update comment" do
    it "should update comment action" do
      visit posts_path
      sleep(1)
      expect(page).to have_css("h2", text:"投稿一覧")
      click_on '新規投稿'
      expect(page).to have_css("h2", text:"投稿一覧")
      fill_in "post_title", with: "これはテスト用の投稿のタイトルです。"
      fill_in "post_body", with: "これはテスト用の投稿の本文です。"
      click_on "投稿"
      expect(page).to have_css("h2", text:"投稿一覧")

      click_on "コメントの追加"
      expect(page).to have_css("h2", text:"投稿一覧")
      fill_in "comment_body", with: "これはテスト用のコメントです。"
      click_on "投稿"
      expect(page).to have_css("h2", text:"投稿一覧")
      expect(page).to have_content("これはテスト用のコメントです。")
      sleep(1)
      within "div#comment" do
        click_on "編集"
      end
      fill_in "comment_body", with: "これは更新されたテスト用のコメントです。"
      click_on "投稿"
      expect(page).to have_css("h2", text:"投稿一覧")
      expect(page).to have_content("これは更新されたテスト用のコメントです。")
    end
  end

  describe "destroy comment" do
    it "should delete comment action" do
      visit posts_path
      sleep(1)
      expect(page).to have_css("h2", text:"投稿一覧")
      click_on '新規投稿'
      expect(page).to have_css("h2", text:"投稿一覧")
      fill_in "post_title", with: "これはテスト用の投稿のタイトルです。"
      fill_in "post_body", with: "これはテスト用の投稿の本文です。"
      click_on "投稿"
      expect(page).to have_css("h2", text:"投稿一覧")

      click_on "コメントの追加"
      expect(page).to have_css("h2", text:"投稿一覧")
      fill_in "comment_body", with: "これはテスト用のコメントです。"
      click_on "投稿"
      expect(page).to have_css("h2", text:"投稿一覧")
      expect(page).to have_content("これはテスト用のコメントです。")
      sleep(1)
      within "div#comment" do
        accept_alert do
          click_on '削除'
        end
      end
      expect(page).to have_css("h2", text:"投稿一覧")
      expect(page).not_to have_content("これはテスト用のコメントです。")
    end
  end
end