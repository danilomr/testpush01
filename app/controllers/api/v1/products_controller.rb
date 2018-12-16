module Api
  module V1
    class ProductsController < ApplicationController
      def index
        products = Product.order('created_at DESC');
        render json: {status:'SUCCESS', message:'Products loaded', data:products}, status: :ok
      end

      def show
        product = Product.find(params[:id]);
        render json: {status:'SUCCESS', message:'Product loaded', data:product}, status: :ok
      end

      def destroy
        product = Product.find(params[:id]);
        product.destroy
        render json: {status:'SUCCESS', message:'Product deleted', data:product}, status: :ok
      end

      def update
        product = Product.find(params[:id]);
        if product.update_attributes(product_params)
          render json: {status:'SUCCESS', message:'Product updated', data:product}, status: :ok
        else
          render json: {status:'ERROR', message:'Product not updated', data:product.errors}, status: :unprocessable_entity
        end
      end

      def create
        product = Product.new(product_params)
        if product.save
          render json: {status:'SUCCESS', message:'Product saved', data:product}, status: :ok
        else
          render json: {status:'ERROR', message:'Product not saved', data:product.errors}, status: :unprocessable_entity
        end
      end

      private
      def product_params
        params.permit(:number, :name, :price, :description)
      end
    end
  end
end
