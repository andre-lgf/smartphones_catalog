module Api
  module V1
    class BrandsController < ApplicationController
      def index
        render json: Database::Brands::Brand.find(params[:id])
      end      
    end
  end
end
