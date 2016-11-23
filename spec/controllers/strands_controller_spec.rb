require 'rails_helper'

RSpec.describe StrandsController, type: :controller do
  let(:user)    { create(:user) }
  let(:project) { create(:project, user: user) }

  let(:valid_attributes) {
    {
      name: Faker::App.name,
      description: Faker::Lorem.paragraph,
      project_id: project.to_param,
    }
  }

  let(:invalid_attributes) {
    {
      project_id: nil,
      name: "",
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
    it "assigns all strands as @strands" do
      strand = Strand.create! valid_attributes
      get :index, params: {}
      expect(assigns(:strands)).to eq([strand])
    end
  end

  describe "GET #show" do
    it "assigns the requested strand as @strand" do
      strand = Strand.create! valid_attributes
      get :show, params: {id: strand.to_param}
      expect(assigns(:strand)).to eq(strand)
    end
  end

  describe "GET #new" do
    it "assigns a new strand as @strand" do
      get :new, params: {}
      expect(assigns(:strand)).to be_a_new(Strand)
    end
  end

  describe "GET #edit" do
    it "assigns the requested strand as @strand" do
      strand = Strand.create! valid_attributes
      get :edit, params: {id: strand.to_param}
      expect(assigns(:strand)).to eq(strand)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Strand" do
        expect {
          post :create, params: {strand: valid_attributes}
        }.to change(Strand, :count).by(1)
      end

      it "assigns a newly created strand as @strand" do
        post :create, params: {strand: valid_attributes}
        expect(assigns(:strand)).to be_a(Strand)
        expect(assigns(:strand)).to be_persisted
      end

      it "redirects to the created strand" do
        post :create, params: {strand: valid_attributes}
        expect(response).to redirect_to(:back)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved strand as @strand" do
        post :create, params: {strand: invalid_attributes}
        expect(assigns(:strand)).to be_a_new(Strand)
      end

      it "re-renders the 'new' template" do
        post :create, params: {strand: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: Faker::App.name,
          description: Faker::Lorem.paragraph,
          position: "1",
        }
      }

      it "updates the requested strand" do
        strand = Strand.create! valid_attributes
        put :update, params: {id: strand.to_param, strand: new_attributes}
        strand.reload

        expect(strand.name).to eq new_attributes[:name]
        expect(strand.description).to eq new_attributes[:description]
        expect(strand.position).to eq new_attributes[:position].to_i
      end

      it "assigns the requested strand as @strand" do
        strand = Strand.create! valid_attributes
        put :update, params: {id: strand.to_param, strand: valid_attributes}
        expect(assigns(:strand)).to eq(strand)
      end

      it "redirects to the strand" do
        strand = Strand.create! valid_attributes
        put :update, params: {id: strand.to_param, strand: valid_attributes}
        expect(response).to redirect_to(:back)
      end
    end

    context "with invalid params" do
      it "assigns the strand as @strand" do
        strand = Strand.create! valid_attributes
        put :update, params: {id: strand.to_param, strand: invalid_attributes}
        expect(assigns(:strand)).to eq(strand)
      end

      it "re-renders the 'edit' template" do
        strand = Strand.create! valid_attributes
        put :update, params: {id: strand.to_param, strand: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested strand" do
      strand = Strand.create! valid_attributes
      expect {
        delete :destroy, params: {id: strand.to_param}
      }.to change(Strand, :count).by(-1)
    end

    it "redirects to the strands list" do
      strand = Strand.create! valid_attributes
      delete :destroy, params: {id: strand.to_param}
      expect(response).to redirect_to(:back)
    end
  end

end
