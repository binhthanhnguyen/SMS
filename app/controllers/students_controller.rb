class StudentsController < ApplicationController
  def index
    @q = Student.search(params[:q])
    @students = @q.result(distinct: true)
  end

  def show
    @student = Student.find params[:id]
    @classrooms = @student.classrooms
    @subjects = @student.subjects
    @courses = @student.courses
  end
end
