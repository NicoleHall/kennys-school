class StudentsController < ApplicationController

  def index
    @students = Student.needs_help
  end

end
