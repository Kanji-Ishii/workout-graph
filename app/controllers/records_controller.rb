class RecordsController < ApplicationController
  #before_action :set_RM, only: :create


  def new
    @record = Record.new
  end

  def create
    @exercise = Exercise.find(params[:record][:name_id])
    @record = @exercise.records.build(record_params)
    #@record = Record.new(record_params)
    if @record.save
      #render 'exercise/index'
      redirect_to  controller: :exercises, action: :index
    else
      #render 'home/index'
      logger.debug "デバッガーーーー#{@record.RM}"
      redirect_to  controller: :home, action: :index
      #else確認のため
    end
  end
  

  private

    #def set_RM
    #  @record = params[:record]
    #  @record[:RM] = 
    #  params[:weight].to_i * params[:reps_count].to_i / 40 + params[:weight].to_i
    #  logger.debug "デバッガーーーー#{@record[:RM]}"
    #end

    def record_params
      params.require(:record).permit(:name_id, :date, :weight, :reps_count, :note, :RM, :exercise_id)
    end

end
