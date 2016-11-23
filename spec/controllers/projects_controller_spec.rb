require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { create(:user) }

  let(:valid_attributes) {
    {
      title: Faker::App.name,
      premise: Faker::Lorem.paragraph,
      user_id: user.to_param,
    }
  }

  let(:invalid_attributes) {
    {
      user_id: nil,
      title: "",
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
    it "assigns all projects as @projects" do
      project = Project.create! valid_attributes
      get :index, params: {}
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe "GET #show" do
    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :show, params: {id: project.to_param}
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "GET #new" do
    it "assigns a new project as @project" do
      get :new, params: {}
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe "GET #edit" do
    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :edit, params: {id: project.to_param}
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, params: {project: valid_attributes}
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, params: {project: valid_attributes}
        expect(assigns(:project)).to be_a(Project)
        expect(assigns(:project)).to be_persisted
      end

      it "redirects to the created project" do
        post :create, params: {project: valid_attributes}
        expect(response).to redirect_to(Project.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        post :create, params: {project: invalid_attributes}
        expect(assigns(:project)).to be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        post :create, params: {project: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          title: Faker::App.name,
          premise: Faker::Lorem.paragraph,
          fabula: "lalala"
        }
      }

      it "updates the requested project" do
        project = Project.create! valid_attributes
        put :update, params: {id: project.to_param, project: new_attributes}
        project.reload

        expect(project.title).to eq new_attributes[:title]
        expect(project.premise).to eq new_attributes[:premise]
        expect(project.fabula).to eq new_attributes[:fabula]
      end

      it "assigns the requested project as @project" do
        project = Project.create! valid_attributes
        put :update, params: {id: project.to_param, project: valid_attributes}
        expect(assigns(:project)).to eq(project)
      end

      it "redirects to the project" do
        project = Project.create! valid_attributes
        put :update, params: {id: project.to_param, project: valid_attributes}
        expect(response).to redirect_to(project)
      end
    end

    context "with invalid params" do
      it "assigns the project as @project" do
        project = Project.create! valid_attributes
        put :update, params: {id: project.to_param, project: invalid_attributes}
        expect(assigns(:project)).to eq(project)
      end

      it "re-renders the 'edit' template" do
        project = Project.create! valid_attributes
        put :update, params: {id: project.to_param, project: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested project" do
      project = Project.create! valid_attributes
      expect {
        delete :destroy, params: {id: project.to_param}
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      project = Project.create! valid_attributes
      delete :destroy, params: {id: project.to_param}
      expect(response).to redirect_to(projects_url)
    end
  end

end
