RSpec.describe RandomNumbersContract, type: :feature do
  subject { described_class.new }

  let(:min) { -1.0 }
  let(:max) { 2.0 }

  describe '#call' do
    context 'when it have all the arguments' do
      context 'when arguments are valid' do
        it 'should be successful' do
          expect(subject.call(min: min, max: max).success?).to be_truthy
        end

        it 'should doesnt return a error about missed min value' do
          expect(subject.call(min: min, max: max).errors[:min]).to be_nil
        end

        it 'should doesnt return a error about missed max value' do
          expect(subject.call(min: min, max: max).errors[:max]).to be_nil
        end
      end

      context 'when arguments are not valid' do
        let(:error_text) { I18n.t('dry_validation.errors.rules.min.invalid') }
        let(:invalid_min) { '1.0' }
        let(:invalid_max) { '2.0' }

        it 'should return an error due to max less than min' do
          expect(subject.call(min: max, max: min).errors[:min]).to eq([error_text])
        end

        it 'should return an error due invalid min' do
          expect(subject.call(min: invalid_min, max: max).errors[:min]).not_to be_nil
        end

        it 'should return an error due invalid max' do
          expect(subject.call(min: min, max: invalid_max).errors[:max]).not_to be_nil
        end
      end
    end

    context 'when it does not have a arguments' do
      it 'should not be successful due to a missed max value' do
        expect(subject.call(min: min).success?).to be_falsey
      end

      it 'should return a error about missed max value' do
        expect(subject.call(min: min).errors[:max]).not_to be_nil
      end

      it 'should doesnt return a error about missed min value' do
        expect(subject.call(min: min).errors[:min]).to be_nil
      end

      it 'should not be successful due to a missed min value' do
        expect(subject.call(max: max).success?).to be_falsey
      end

      it 'should return a error about missed min value' do
        expect(subject.call(max: max).errors[:min]).not_to be_nil
      end

      it 'should doesnt return a error about missed max value' do
        expect(subject.call(max: max).errors[:max]).to be_nil
      end
    end

    context 'when it have 0 arguments' do
      it 'should not be successful' do
        expect(subject.call({}).success?).to be_falsey
      end

      it 'should return a error about missed min value' do
        expect(subject.call({}).errors[:min]).not_to be_nil
      end

      it 'should return a error about missed max value' do
        expect(subject.call({}).errors[:max]).not_to be_nil
      end
    end
  end
end
