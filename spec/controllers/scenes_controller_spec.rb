require 'rails_helper'

RSpec.describe ScenesController, type: :controller do
  let(:user)    { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:chapter) { create(:chapter, project: project) }

  let(:valid_attributes) {
    {
      chapter_id: chapter.to_param,
      title: Faker::App.name,
      description: Faker::Lorem.paragraph,
      position: 1,
    }
  }

  let(:invalid_attributes) {
    {
      chapter_id: nil,
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
    it "assigns all scenes as @scenes" do
      scene = Scene.create! valid_attributes
      get :index, params: {}
      expect(assigns(:scenes)).to eq([scene])
    end
  end

  describe "GET #show" do
    it "assigns the requested scene as @scene" do
      scene = Scene.create! valid_attributes
      get :show, params: {id: scene.to_param}
      expect(assigns(:scene)).to eq(scene)
    end
  end

  describe "GET #new" do
    it "assigns a new scene as @scene" do
      get :new, params: {}
      expect(assigns(:scene)).to be_a_new(Scene)
    end
  end

  describe "GET #edit" do
    it "assigns the requested scene as @scene" do
      scene = Scene.create! valid_attributes
      get :edit, params: {id: scene.to_param}
      expect(assigns(:scene)).to eq(scene)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Scene" do
        expect {
          post :create, params: {scene: valid_attributes}
        }.to change(Scene, :count).by(1)
      end

      it "assigns a newly created scene as @scene" do
        post :create, params: {scene: valid_attributes}
        expect(assigns(:scene)).to be_a(Scene)
        expect(assigns(:scene)).to be_persisted
      end

      it "redirects to the created scene" do
        post :create, params: {scene: valid_attributes}
        expect(response).to redirect_to(:back)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved scene as @scene" do
        post :create, params: {scene: invalid_attributes}
        expect(assigns(:scene)).to be_a_new(Scene)
      end

      it "re-renders the 'new' template" do
        post :create, params: {scene: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #sort" do
    context "with valid params" do
      skip "assigns the requested scene as @scene" do
        scene = Scene.create! valid_attributes
        new_posistion = scene.position + 1

        put :sort, params: {"order": {id: scene.to_param, position: new_posistion}}
        expect(assigns(:scene).position).to eq(new_posistion)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          chapter_id: chapter.to_param,
          title: Faker::App.name,
          description: Faker::Lorem.paragraph,
          position: 1,
        }
      }
      it "updates the requested scene" do
        scene = Scene.create! valid_attributes
        put :update, params: {id: scene.to_param, scene: new_attributes}
        scene.reload

        expect(scene.title).to eq new_attributes[:title]
        expect(scene.description).to eq new_attributes[:description]
        expect(scene.position).to eq new_attributes[:position].to_i
      end

      it "assigns the requested scene as @scene" do
        scene = Scene.create! valid_attributes
        put :update, params: {id: scene.to_param, scene: valid_attributes}
        expect(assigns(:scene)).to eq(scene)
      end

      it "redirects to the scene" do
        scene = Scene.create! valid_attributes
        put :update, params: {id: scene.to_param, scene: valid_attributes}
        expect(response).to redirect_to(:back)
      end
    end

    context "with invalid params" do
      it "assigns the scene as @scene" do
        scene = Scene.create! valid_attributes
        put :update, params: {id: scene.to_param, scene: invalid_attributes}
        expect(assigns(:scene)).to eq(scene)
      end

      it "re-renders the 'edit' template" do
        scene = Scene.create! valid_attributes
        put :update, params: {id: scene.to_param, scene: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested scene" do
      scene = Scene.create! valid_attributes
      expect {
        delete :destroy, params: {id: scene.to_param}
      }.to change(Scene, :count).by(-1)
    end

    it "redirects to the scenes list" do
      scene = Scene.create! valid_attributes
      delete :destroy, params: {id: scene.to_param}
      expect(response).to redirect_to(:back)
    end
  end

end
