class RecordController < ApplicationController
  def new
    @record = Record.new
    @exercise = Exercise.all
  end

  def create
    #@record.save
    #render '/'
  end

end
