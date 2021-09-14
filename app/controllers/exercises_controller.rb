class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = current_user.exercises.build
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
    if @exercise.save
      redirect_to controller: :records, action: :new
    else
      render 'home/index'
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      redirect_to controller: :exercises, action: :index
    else
      render 'edit'
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end
end
