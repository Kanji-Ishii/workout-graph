class ExercisesController < ApplicationController
  def index
    @exercise = Exercise.all
  end
end
