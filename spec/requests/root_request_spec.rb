require 'rails_helper'

RSpec.describe 'Root', type: :request do
  describe 'GET /' do
    it 'redirects to /retailers' do
      get root_path
      expect(response).to redirect_to('/retailers')
    end
  end
end
