module Api
  module V1
    class RandomNumbersController < ApplicationController
      def show
        render json: { number: RandomNumbers::Create.call(random_numbers_params) }
      rescue RandomNumbers::Create::RandomNumbersException => e
        render json: { message: e.message }, status: :bad_request
      end

      private

      def random_numbers_params
        params.permit(:min, :max).to_h.map { |key, value| [key.to_sym, value.to_f] }.to_h
      end
    end
  end
end
