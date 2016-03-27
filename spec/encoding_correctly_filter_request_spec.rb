require 'rails_helper'

Rails.application.routes.draw do
  resources :widgets, only: %i(create)
end

class WidgetsController < ::ActionController::Base
  include EncodingCorrectlyFilter::ControllersConcern

  before_action :check_valid_encoding!, only: %i(create)

  rescue_from EncodingCorrectlyFilter::InvalidEncodingError, with: :handle_400

  def create
    render nothing: true
  end

  def handle_400(e = nil)
    render text: e.message, status: :bad_request
  end
end

RSpec.describe 'Encoding correctly filter', type: :request do
  let(:body) { "{ \"hoge\": \"abc#{0xA5.chr}def\" }" }
  let(:header) { { 'CONTENT_TYPE' => 'application/json' } }

  subject do
    post widgets_path, body, header
    response
  end

  it { is_expected.to have_http_status(:bad_request) }
  context 'response body' do
    subject { super().body }
    it { is_expected.to eq 'EncodingCorrectlyFilter::InvalidEncodingError' }
  end
end
