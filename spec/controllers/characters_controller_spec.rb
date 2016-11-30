require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  let(:user)    { create(:user) }
  let(:project) { create(:project, user: user) }

  let(:valid_attributes) {
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      project_id: project.to_param,
      main_character: false,
      position: 2,
    }
  }

  let(:invalid_attributes) {
    {
      project_id: nil,
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
    it "assigns all characters as @characters" do
      character = Character.create! valid_attributes
      get :index, params: {}
      expect(assigns(:characters)).to eq([character])
    end
  end

  describe "GET #show" do
    it "assigns the requested character as @character" do
      character = Character.create! valid_attributes
      get :show, params: {id: character.to_param}
      expect(assigns(:character)).to eq(character)
    end
  end

  describe "GET #new" do
    it "assigns a new character as @character" do
      get :new, params: {}
      expect(assigns(:character)).to be_a_new(Character)
    end
  end

  describe "GET #edit" do
    it "assigns the requested character as @character" do
      character = Character.create! valid_attributes
      get :edit, params: {id: character.to_param}
      expect(assigns(:character)).to eq(character)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Character" do
        expect {
          post :create, params: {character: valid_attributes}
        }.to change(Character, :count).by(1)
      end

      it "assigns a newly created character as @character" do
        post :create, params: {character: valid_attributes}
        expect(assigns(:character)).to be_a(Character)
        expect(assigns(:character)).to be_persisted
      end

      it "redirects to the created character" do
        post :create, params: {character: valid_attributes}
        expect(response).to redirect_to(:back)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved character as @character" do
        post :create, params: {character: invalid_attributes}
        expect(assigns(:character)).to be_a_new(Character)
      end

      it "re-renders the 'new' template" do
        post :create, params: {character: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          project_id: project.to_param,
          main_character: false,
          position: 2,
        }
      }

      it "updates the requested character" do
        character = Character.create! valid_attributes
        put :update, params: {id: character.to_param, character: new_attributes}
        character.reload

        expect(character.first_name).to eq new_attributes[:first_name]
        expect(character.last_name).to eq new_attributes[:last_name]
        expect(character.main_character).to eq new_attributes[:main_character]
        expect(character.position).to eq new_attributes[:position].to_i
      end

      it "assigns the requested character as @character" do
        character = Character.create! valid_attributes
        put :update, params: {id: character.to_param, character: valid_attributes}
        expect(assigns(:character)).to eq(character)
      end

      it "redirects to the character" do
        character = Character.create! valid_attributes
        put :update, params: {id: character.to_param, character: valid_attributes}
        expect(response).to redirect_to(:back)
      end
    end

    context "with invalid params" do
      it "assigns the character as @character" do
        character = Character.create! valid_attributes
        put :update, params: {id: character.to_param, character: invalid_attributes}
        expect(assigns(:character)).to eq(character)
      end

      it "re-renders the 'edit' template" do
        character = Character.create! valid_attributes
        put :update, params: {id: character.to_param, character: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested character" do
      character = Character.create! valid_attributes
      expect {
        delete :destroy, params: {id: character.to_param}
      }.to change(Character, :count).by(-1)
    end

    it "redirects to the characters list" do
      character = Character.create! valid_attributes
      delete :destroy, params: {id: character.to_param}
      expect(response).to redirect_to(characters_url)
    end
  end

end
