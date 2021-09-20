class RecordsController < ApplicationController

  def index
    @exercise = Exercise.find(params[:exercise_id])
    @records = Record.where(name_id: params[:exercise_id])
  end

  def new
    @record = Record.new
  end

  def create
    @exercise = Exercise.find(params[:record][:name_id])
    @record = @exercise.records.build(record_params)
    if @record.save
      flash[:success] = "記録を保存しました"
      redirect_to controller: :exercises, action: :index
    else
      render 'new'
    end
  end
  
  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      flash[:success] = "記録を更新しました"
      redirect_to controller: :exercises, action: :index
    else
      render 'edit'
    end
  end

  def destroy
    if Record.find(params[:id]).destroy
      flash[:success] = "削除しました"
      redirect_to records_path(exercise_id: params[:exercise_id])
    end
  end

private

  def record_params
    params.require(:record).permit(:name_id, :date, :weight, :reps_count, :note, :RM, :exercise_id)
  end

end
