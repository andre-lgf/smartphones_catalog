module Api
  module V1
    class AnnouncementsController < ApplicationController
      def index
        render json: Database::Announcements::Announcement.all
      end

      def show
        render json: Database::Announcements::Announcement.find(params[:id])
      end

      def create
        announcement = Database::Announcements::Announcement.new(announcement_params)
        
        if announcement.save
          render json: announcement, status: 201
        else
          render json: { errors: announcement.errors }, status: 422
        end
      end

      private

      def announcement_params
        params.require(:announcement).permit(:id, :device_color_id, :plan_id, :price, :amount)
      end
    end
  end
end
