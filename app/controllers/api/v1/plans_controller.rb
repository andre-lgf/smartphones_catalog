module Api
  module V1
    class PlansController < ApplicationController
      before_action :find_plan, only: [:show]

      def index
        render json: Database::Announcements::Plan.all
      end

      def show
        render json: @plan
      end

      def create
        plan = Database::Announcements::Plan.new(plan_params)
        
        if plan.save
          render json: plan, status: 201
        else
          render json: { errors: plan.errors }, status: 422
        end
      end
     
      private
      
      def plan_params
        params.require(:plan).permit(:name, :id)
      end

      def find_plan
        @plan = Database::Announcements::Plan.find(params[:id])
      end
    end
  end
end
