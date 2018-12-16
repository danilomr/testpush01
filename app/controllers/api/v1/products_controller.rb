module Api
  module V1
    class ProductsController < ApplicationController
      def index
        products = Product.order('created_at DESC');
        render json: {status:'SUCCESS', message:'Products loaded', data:products}, status: :ok
      end
    end
  end
end
