RSpec.describe RandomNumbers::Create, type: :feature do
  subject { described_class }

  let(:min) { -1.0 }
  let(:max) { 2.0 }

  describe '.call' do
    context 'when it have all the arguments' do
      context 'when arguments are valid' do
        it 'should return a number that is less than max' do
          expect(subject.call(min: min, max: max) < max).to be_truthy
        end

        it 'should return a number that is greater or equal than min' do
          expect(subject.call(min: min, max: max) >= min).to be_truthy
        end
      end

      context 'when arguments are not valid' do
        let(:error_text) { I18n.t('dry_validation.errors.rules.min.invalid') }
        let(:invalid_min) { '1.0' }
        let(:invalid_max) { '2.0' }

        it 'should raise an exception due to max less than min' do
          expect do
            subject.call(min: max, max: min)
          end.to raise_error(RandomNumbers::Create::RandomNumbersException)
        end

        it 'should raise an exception due invalid min' do
          expect do
            subject.call(min: invalid_min, max: max)
          end.to raise_error(RandomNumbers::Create::RandomNumbersException)
        end

        it 'should raise an exception due invalid max' do
          expect do
            subject.call(min: min, max: invalid_max)
          end.to raise_error(RandomNumbers::Create::RandomNumbersException)
        end
      end
    end

    context 'when it does not have arguments' do
      let(:greater_min) { 2.0 }
      let(:lower_max) { -1.0 }

      it 'should return a number, created by min default max and greater or equal than min' do
        expect(subject.call(min: min) >= min).to be_truthy
      end

      it 'should return a number, created by max default min and less than max' do
        expect(subject.call(max: max) < max).to be_truthy
      end

      it 'should raise an exception due min greater than default max' do
        expect do
          subject.call(min: greater_min)
        end.to raise_error(RandomNumbers::Create::RandomNumbersException)
      end

      it 'should raise an exception due max lass than default min' do
        expect do
          subject.call(max: lower_max)
        end.to raise_error(RandomNumbers::Create::RandomNumbersException)
      end
    end

    context 'when it have 0 arguments' do
      it 'should return a number, created by default values' do
        expect(subject.call).not_to be_nil
      end
    end
  end
end
