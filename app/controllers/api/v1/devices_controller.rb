module Api
  module V1
    class DevicesController < ApplicationController
      before_action :set_brand, except: [:list]
      before_action :find_device, only: [:show]

      def index
        render json: @brand.devices
      end

      def list
        render json: Database::Brands::Device.all
      end

      def show
        render json: @device
      end

      def create
        device = @brand.devices.create(device_params)
        
        if device.save
          render json: device, status: 201
        else
          render json: { errors: device.errors }, status: 422
        end
      end
      
      private
      
      def device_params
        params.require(:device).permit(:name, :id, :brand_id)
      end

      def find_device
        @device = Database::Brands::Device.find(params[:id])
      end

      def set_brand
        @brand = Database::Brands::Brand.find(params[:brand_id])
      end
    end
  end
end
