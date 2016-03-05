class EducationsController < ApplicationController
  before_action :find_education, only: [:edit, :update, :destroy]


  def new
    @education = Education.new
  end

  def create
    
  end

  private

  def find_education
    @education = Education.find params[:id]
  end

end
