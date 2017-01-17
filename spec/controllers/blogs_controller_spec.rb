require 'rails_helper'

describe BlogsController do
  describe 'GET #index' do
    it "@blogに全てのBlogが入っていること" do
      @blog1 = create(:blog, title: "blog1")
      @blog2 = create(:blog, title: "blog2")
      get :index
      expect(assigns(:blogs)).to match_array([@blog1, @blog2])
    end

  end

  describe 'POST #create' do
    it "新規作成後に@blogのshowに遷移すること" do
      @blog = create(:blog)
      get :show, params: { id: @blog.id }
      expect(response).to render_template :show

    end
  end
end