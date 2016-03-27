require 'rails_helper'

RSpec.describe EncodingCorrectlyFilter::ControllersConcern, type: :controller do
  controller(ApplicationController) do
    include EncodingCorrectlyFilter::ControllersConcern

    before_action :check_valid_encoding!, only: %i(create)

    def index
      render nothing: true
    end

    def create
      render nothing: true
    end
  end

  context 'included controller' do
    subject { controller }

    it { is_expected.to_not respond_to :check_valid_encoding! }

    context 'GET index' do
      it do
        is_expected.to_not receive(:check_valid_encoding!).with(any_args)
        get :index
      end
    end

    context 'POST create' do
      let(:body) { '{ "hoge": "abcdef" }' }
      let(:header) { { 'CONTENT_TYPE' => 'application/json' } }

      it do
        is_expected.to receive(:check_valid_encoding!).with(no_args)
        post :create, body, header
      end

      context 'with invalid utf-8 string' do
        let(:body) { "{ \"hoge\": \"abc#{0xA5.chr}def\" }" }

        subject { post :create, body, header }

        it do
          expect { subject }.to raise_error(
            EncodingCorrectlyFilter::InvalidEncodingError)
        end
      end
    end
  end
end
