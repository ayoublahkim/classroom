# frozen_string_literal: true

require "rails_helper"

RSpec.describe API::AssignmentsController, type: :controller do
  let(:organization) { classroom_org                                   }
  let(:user)         { classroom_teacher                               }
  let(:assignment)   { create(:assignment, organization: organization) }

  before do
    sign_in_as(user)
  end

  describe "GET #index", :vcr do

    context "authenticated user" do
      it "returns success" do
        get :index, params: {organization_id: organization.slug}
        expect(response).to have_http_status(:success)
      end

      it "returns all of user's assignments" do
        get :index, params: {organization_id: organization.slug}
        # binding.pry
        # expect(json)
      end
    end

  end
end