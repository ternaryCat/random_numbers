RSpec.describe Api::V1::RandomNumbersController, type: :controller do
  subject { response.body }

  let(:min) { -1.0 }
  let(:max) { 2.0 }

  describe '#show' do
    context 'when it have all the arguments' do
      context 'when arguments are valid' do
        it 'should return status 200' do
          get :show, params: { min: min, max: max }
          expect(response).to have_http_status(:ok)
        end

        it 'should return a number that is less than max' do
          get :show, params: { min: min, max: max }
          expect(subject['number'].to_f < max).to be_truthy
        end

        it 'should return a number that is greater or equal than min' do
          get :show, params: { min: min, max: max }
          expect(subject['number'].to_f >= min).to be_truthy
        end
      end

      context 'when arguments are not valid' do
        it 'should return status 400 due to max less than min' do
          get :show, params: { min: max, max: min }
          expect(response).to have_http_status(:bad_request)
        end
      end
    end

    context 'when it does not have arguments' do
      let(:greater_min) { 2.0 }
      let(:lower_max) { -1.0 }

      it 'should return a number, created by min default max and greater or equal than min' do
        get :show, params: { min: min }
        expect(subject['number'].to_f >= min).to be_truthy
      end

      it 'should return a number, created by max default min and less than max' do
        get :show, params: { max: max }
        expect(subject['number'].to_f < max).to be_truthy
      end

      it 'should return code 400 due min greater than default max' do
        get :show, params: { min: greater_min }
        expect(response).to have_http_status(:bad_request)
      end

      it 'should return code 400 due due max lass than default min' do
        get :show, params: { max: lower_max }
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when it have 0 arguments' do
      it 'should return a number, created by default values' do
        get :show
        expect(subject['number']).not_to be_nil
      end
    end
  end
end
