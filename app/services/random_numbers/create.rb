module RandomNumbers
  class Create < ::BaseService
    class RandomNumbersException < RuntimeError; end

    option :min, default: proc { 0.0 }, optional: true
    option :max, default: proc { 1.0 }, optional: true

    def call
      raise(RandomNumbersException, errors) unless valid?

      rand(min..max)
    end

    private

    def valid?
      contract.success?
    end

    def errors
      contract.errors.to_h.map { |key, message| "#{key}: #{message}" }.join(', ')
    end

    def contract
      @contract ||= RandomNumbersContract.new.call(min: min, max: max)
    end
  end
end
