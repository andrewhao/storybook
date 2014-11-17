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

describe BookBagsController do

  # This should return the minimal set of attributes required to create a valid
  # BookBag. As you add validations to BookBag, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { global_id: "1", classroom_id: 2 }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BookBagsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all book_bags as @book_bags" do
      book_bag = BookBag.create! valid_attributes
      get :index, {}, valid_session
      assigns(:book_bags).should eq([book_bag])
    end
  end

  describe "GET show" do
    it "assigns the requested book_bag as @book_bag" do
      book_bag = BookBag.create! valid_attributes
      get :show, {:id => book_bag.to_param}, valid_session
      assigns(:book_bag).should eq(book_bag)
    end
  end

  describe "GET new" do
    it "assigns a new book_bag as @book_bag" do
      get :new, {}, valid_session
      assigns(:book_bag).should be_a_new(BookBag)
    end
  end

  describe "GET edit" do
    it "assigns the requested book_bag as @book_bag" do
      book_bag = BookBag.create! valid_attributes
      get :edit, {:id => book_bag.to_param}, valid_session
      assigns(:book_bag).should eq(book_bag)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BookBag" do
        expect {
          post :create, {:book_bag => valid_attributes}, valid_session
        }.to change(BookBag, :count).by(1)
      end

      it "assigns a newly created book_bag as @book_bag" do
        post :create, {:book_bag => valid_attributes}, valid_session
        assigns(:book_bag).should be_a(BookBag)
        assigns(:book_bag).should be_persisted
      end

      it "redirects to the created book_bag" do
        post :create, {:book_bag => valid_attributes}, valid_session
        response.should redirect_to(BookBag.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved book_bag as @book_bag" do
        # Trigger the behavior that occurs when invalid params are submitted
        BookBag.any_instance.stub(:save).and_return(false)
        post :create, {:book_bag => {  }}, valid_session
        assigns(:book_bag).should be_a_new(BookBag)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BookBag.any_instance.stub(:save).and_return(false)
        post :create, {:book_bag => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested book_bag" do
        book_bag = BookBag.create! valid_attributes
        # Assuming there are no other book_bags in the database, this
        # specifies that the BookBag created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        BookBag.any_instance.should_receive(:update).with({ "global_id" => "params" })
        put :update, {:id => book_bag.to_param, :book_bag => { "global_id" => "params" }}, valid_session
      end

      it "assigns the requested book_bag as @book_bag" do
        book_bag = BookBag.create! valid_attributes
        put :update, {:id => book_bag.to_param, :book_bag => valid_attributes}, valid_session
        assigns(:book_bag).should eq(book_bag)
      end

      it "redirects to the book_bag" do
        book_bag = BookBag.create! valid_attributes
        put :update, {:id => book_bag.to_param, :book_bag => valid_attributes}, valid_session
        response.should redirect_to(book_bag)
      end
    end

    describe "with invalid params" do
      it "assigns the book_bag as @book_bag" do
        book_bag = BookBag.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BookBag.any_instance.stub(:save).and_return(false)
        put :update, {:id => book_bag.to_param, :book_bag => {  }}, valid_session
        assigns(:book_bag).should eq(book_bag)
      end

      it "re-renders the 'edit' template" do
        book_bag = BookBag.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BookBag.any_instance.stub(:save).and_return(false)
        put :update, {:id => book_bag.to_param, :book_bag => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested book_bag" do
      book_bag = BookBag.create! valid_attributes
      expect {
        delete :destroy, {:id => book_bag.to_param}, valid_session
      }.to change(BookBag, :count).by(-1)
    end

    it "redirects to the book_bags list" do
      book_bag = BookBag.create! valid_attributes
      delete :destroy, {:id => book_bag.to_param}, valid_session
      response.should redirect_to(book_bags_url)
    end
  end

end
