module Api
  module V1
    class CSVSController < ApplicationController
      before_action :find_csv, only: [:show]

      def index
        render json: Database::Csvs::Csv.all
      end

      def show
        render json: @csv
      end

      def create
        csv = Database::Csvs::Csv.new(csv_params)
        
        if csv.save
          render json: csv, status: 201
        else
          render json: { errors: csv.errors }, status: 422
        end
      end
     
      private
      
      def csv_params
        params.require(:csv).permit(:name, :id)
      end

      def find_csv
        @csv = Database::Csvs::Csv.find(params[:id])
      end
    end
  end
end