require 'rails_helper'

feature 'Blog管理'do
  scenario 'Blogの新規作成時にtitleを入力した場合はデータが保存され新規ブログの詳細ページに遷移すること' do
    visit blogs_path
    click_link 'New Blog'
    fill_in 'Title', with: 'title'
    expect {
      click_button 'Save'
    }.to change(Blog, :count).by(1)
    expect(current_path).to eq blog_path(id: Blog.last)
    # expect(page).to have_content 'Blog was successfully created.'
  end
  # scenario 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること'
end