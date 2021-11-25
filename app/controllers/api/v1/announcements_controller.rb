module Api
  module V1
    class AnnouncementsController < ApplicationController
      before_action :set_csv, only: [:index]

      def index
        if @csv
          render json: @csv.announcements
        else
          render json: Database::Announcements::Announcement.all
        end
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

      def set_csv
        return unless params[:csv_id].present?

        @csv = Database::Csvs::Csv.find(params[:csv_id])
      end
    end
  end
end
