require 'rails_helper'

RSpec.describe ChaptersController, type: :controller do
  let(:user)    { create(:user) }
  let(:project) { create(:project, user: user) }

  let(:valid_attributes) {
    {
      project_id: project.to_param,
      title: Faker::App.name,
      reason: Faker::Lorem.paragraph,
      note: Faker::Lorem.paragraph,
      position: 1,
    }
  }

  let(:invalid_attributes) {
    {
      project_id: nil,
      title: "",
      position: nil,
    }
  }

  def setup
    allow(controller).to receive(:current_user) { user }
    request.env["HTTP_REFERER"] = 'http://test.host/'
  end

  before(:each) do
    setup
    sign_in user
  end

  describe "GET #index" do
    it "assigns all chapters as @chapters" do
      chapter = Chapter.create! valid_attributes
      get :index, params: {}
      expect(assigns(:chapters)).to eq([chapter])
    end
  end

  describe "GET #show" do
    it "assigns the requested chapter as @chapter" do
      chapter = Chapter.create! valid_attributes
      get :show, params: {id: chapter.to_param}
      expect(assigns(:chapter)).to eq(chapter)
    end
  end

  describe "GET #new" do
    it "assigns a new chapter as @chapter" do
      get :new, params: {}
      expect(assigns(:chapter)).to be_a_new(Chapter)
    end
  end

  describe "GET #edit" do
    it "assigns the requested chapter as @chapter" do
      chapter = Chapter.create! valid_attributes
      get :edit, params: {id: chapter.to_param}
      expect(assigns(:chapter)).to eq(chapter)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Chapter" do
        expect {
          post :create, params: {chapter: valid_attributes}
        }.to change(Chapter, :count).by(1)
      end

      it "assigns a newly created chapter as @chapter" do
        post :create, params: {chapter: valid_attributes}
        expect(assigns(:chapter)).to be_a(Chapter)
        expect(assigns(:chapter)).to be_persisted
      end

      it "redirects to the created chapter" do
        post :create, params: {chapter: valid_attributes}
        expect(response).to redirect_to(:back)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved chapter as @chapter" do
        post :create, params: {chapter: invalid_attributes}
        expect(assigns(:chapter)).to be_a_new(Chapter)
      end

      it "re-renders the 'new' template" do
        post :create, params: {chapter: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          project_id: project.to_param,
          title: Faker::App.name,
          reason: Faker::Lorem.paragraph,
          note: Faker::Lorem.paragraph,
          position: 1,
        }
      }

      it "updates the requested chapter" do
        chapter = Chapter.create! valid_attributes
        put :update, params: {id: chapter.to_param, chapter: new_attributes}
        chapter.reload

        expect(chapter.title).to eq new_attributes[:title]
        expect(chapter.note).to eq new_attributes[:note]
        expect(chapter.reason).to eq new_attributes[:reason]
        expect(chapter.position).to eq new_attributes[:position].to_i
      end

      it "assigns the requested chapter as @chapter" do
        chapter = Chapter.create! valid_attributes
        put :update, params: {id: chapter.to_param, chapter: valid_attributes}
        expect(assigns(:chapter)).to eq(chapter)
      end

      it "redirects to the chapter" do
        chapter = Chapter.create! valid_attributes
        put :update, params: {id: chapter.to_param, chapter: valid_attributes}
        expect(response).to redirect_to(:back)
      end
    end

    context "with invalid params" do
      it "assigns the chapter as @chapter" do
        chapter = Chapter.create! valid_attributes
        put :update, params: {id: chapter.to_param, chapter: invalid_attributes}
        expect(assigns(:chapter)).to eq(chapter)
      end

      it "re-renders the 'edit' template" do
        chapter = Chapter.create! valid_attributes
        put :update, params: {id: chapter.to_param, chapter: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested chapter" do
      chapter = Chapter.create! valid_attributes
      expect {
        delete :destroy, params: {id: chapter.to_param}
      }.to change(Chapter, :count).by(-1)
    end

    it "redirects to the chapters list" do
      chapter = Chapter.create! valid_attributes
      delete :destroy, params: {id: chapter.to_param}
      expect(response).to redirect_to(chapters_url)
    end
  end

end
