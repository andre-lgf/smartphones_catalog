module Api
  module V1
    class ColorsController < ApplicationController
      before_action :find_color, only: [:show]

      def index
        render json: Database::Announcements::Color.all
      end

      def show
        render json: @color
      end

      def create
        color = Database::Announcements::Color.new(color_params)
        
        if color.save
          render json: color, status: 201
        else
          render json: { errors: color.errors }, status: 422
        end
      end
     
      private
      
      def color_params
        params.require(:color).permit(:name, :id)
      end

      def find_color
        @color = Database::Announcements::Color.find(params[:id])
      end
    end
  end
end
