module Web
  class CsvsController < ApplicationController
    
    def index
      render "csvs/index"
    end

    def create
      render "csvs/create"
    end
     
    private

  end
end