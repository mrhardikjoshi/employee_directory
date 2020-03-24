require 'rails_helper'

RSpec.describe "departments#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/departments/#{department.id}", params: params
  end

  describe 'basic fetch' do
    let!(:department) { create(:department) }

    it 'works' do
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('departments')
      expect(d.id).to eq(department.id)
    end

    context 'with positions' do
      let!(:position) { create(:position, department: department, active: true) }
      let(:params) { {include: 'positions'} }

      it 'includes positions' do
        make_request
        expect(response.status).to eq(200)
        expect(included.count).to be 1
        expect(included.first.attributes).to eq({
          "id" => position.id.to_s,
          "jsonapi_type" => "positions",
          "title" => position.title,
          "active" => true
        })
      end
    end
  end
end
