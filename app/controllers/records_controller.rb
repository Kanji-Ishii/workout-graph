class RecordsController < ApplicationController

  def new
    @record = Record.new
  end

  def create
    @exercise = Exercise.find(params[:record][:name_id])
    @record = @exercise.records.build(record_params)
    if @record.save
      #render 'exercise/index'
      redirect_to  controller: :exercises, action: :index
    else
      #render 'home/index'
      redirect_to  controller: :home, action: :index
      #else確認のため
    end
  end
  

  private

    def record_params
      params.require(:record).permit(:name_id, :date, :weight, :reps_count, :note, :RM, :exercise_id)
    end

end
