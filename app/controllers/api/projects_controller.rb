class Api::ProjectsController < ApplicationController
  skip_before_action :authenticate_student!
  before_action :set_default_response_format

  def show

  end

  private
  
  def set_default_response_format
    request.format = :json
  end
end