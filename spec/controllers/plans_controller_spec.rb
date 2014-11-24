require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe PlansController, :type => :controller do
  let(:s1) { FactoryGirl.create(:student) }
  let(:s2) { FactoryGirl.create(:student) }
  let(:bb1) { FactoryGirl.create(:book_bag) }
  let(:bb2) { FactoryGirl.create(:book_bag) }
  let(:classroom) { FactoryGirl.create(:classroom) }

  # This should return the minimal set of attributes required to create a valid
  # Plan. As you add validations to Plan, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      name: "foobar",
      classroom_id: classroom.id,
      assignments_attributes: [
        {
          student_id: s1.id,
          book_bag_id: bb1.id
        }, {
          student_id: s2.id,
          book_bag_id: bb2.id
        }
      ]
    }
  end

  let(:invalid_attributes) do
    skip
    {
      assignmentsz: [
        {}
      ]
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PlansController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:plan) do
    FactoryGirl.create(:plan, classroom: classroom)
  end


  describe "GET index" do
    before do
      FactoryGirl.create(:plan)
    end

    it "assigns all plans as @plans" do
      get :index, {classroom_id: classroom.id}, valid_session
      expect(assigns(:plans)).to eq([plan])
    end

    it "assigns the classroom" do
      get :index, {classroom_id: classroom.id}, valid_session
      expect(assigns(:classroom)).to eq classroom
    end
  end

  describe "GET show" do
    it "assigns the requested plan as @plan" do
      get :show, {:id => plan.to_param}, valid_session
      expect(assigns(:plan)).to eq(plan)
    end
  end

  describe "GET new" do
    let(:classroom) { FactoryGirl.create(:classroom) }

    it "assigns a new plan as @plan" do
      expect_any_instance_of(PlanGenerator).to receive(:generate).and_return([Assignment.new])
      get :new, {:classroom_id => classroom.id}, valid_session
      expect(assigns(:plan)).to be_a_new(Plan)
    end

    it "pre-fills in the new plan name with the Date" do
      get :new, {:classroom_id => classroom.id}, valid_session
      expect(assigns(:plan).name).to eq Time.now.strftime("%Y-%m-%d")
    end

    context "for no plans found" do
      it "redirects back to classroom page with notice" do
        expect(controller).to receive(:new).and_raise(PlanGenerator::NoPlanFound)
        get :new, {:classroom_id => classroom.id}, valid_session
        expect(response).to redirect_to(classroom_path(classroom))
      end
    end
  end

  describe "GET edit" do
    it "assigns the requested plan as @plan" do
      get :edit, {:id => plan.to_param}, valid_session
      expect(assigns(:plan)).to eq(plan)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Plan" do
        expect {
          post :create, {:plan => valid_attributes}, valid_session
        }.to change(Plan, :count).by(1)
      end

      it "assigns a newly created plan as @plan" do
        post :create, {:plan => valid_attributes}, valid_session
        expect(assigns(:plan)).to be_a(Plan)
        expect(assigns(:plan)).to be_persisted
      end

      it "redirects to the classroom view" do
        post :create, {:plan => valid_attributes}, valid_session
        expect(response).to redirect_to(classroom_path(Plan.last.classroom))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved plan as @plan" do
        post :create, {:plan => invalid_attributes}, valid_session
        expect(assigns(:plan)).to be_a_new(Plan)
      end

      it "re-renders the 'new' template" do
        post :create, {:plan => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end

  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { name: "highlander" }
      }

      it "updates the requested plan" do
        put :update, {:id => plan.to_param, :plan => new_attributes}, valid_session
        plan.reload
        expect(plan.name).to eq "highlander"
      end

      it "assigns the requested plan as @plan" do
        put :update, {:id => plan.to_param, :plan => valid_attributes}, valid_session
        expect(assigns(:plan)).to eq(plan)
      end

      it "redirects to the plan" do
        put :update, {:id => plan.to_param, :plan => valid_attributes}, valid_session
        expect(response).to redirect_to(plan_path(plan))
      end
    end

    describe "with invalid params" do
      it "assigns the plan as @plan" do
        put :update, {:id => plan.to_param, :plan => invalid_attributes}, valid_session
        expect(assigns(:plan)).to eq(plan)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => plan.to_param, :plan => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested plan" do
      plan
      expect {
        delete :destroy, {:id => plan.to_param}, valid_session
      }.to change(Plan, :count).by(-1)
    end

    it "redirects to the classroom page" do
      delete :destroy, {:id => plan.to_param}, valid_session
      expect(response).to redirect_to(classroom_url(plan.classroom))
    end
  end

end
