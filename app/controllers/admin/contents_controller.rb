class Admin::ContentsController < ApplicationController
  layout 'admin'
  
  before_filter :find_trip, only: [:show, :edit, :update]
  before_filter :authenticate_user!
  
  def create
  end
  
end
