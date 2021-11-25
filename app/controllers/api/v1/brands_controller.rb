module Api
  module V1
    class BrandsController < ApplicationController
      before_action :find_brand, only: [:show]

      def index
        render json: Database::Brands::Brand.all
      end

      def show
        render json: @brand
      end

      def create
        brand = Database::Brands::Brand.new(brand_params)
        
        if brand.save
          render json: brand, status: 201
        else
          render json: { errors: brand.errors }, status: 422
        end
      end
     
      private
      
      def brand_params
        params.require(:brand).permit(:name, :id)
      end

      def find_brand
        @brand = Database::Brands::Brand.find(params[:id])
      end
    end
  end
end
