class StudentsController < ApplicationController

    def create
        student = Student.create(name: params[:name] , age: params[:age] , major: params[:major] , instructor_id: params[:instructor_id] )
        render json: student, status: :created
    end
    def show
        student = Student.find_by(id: params[:id])
        render json: student, staus: :ok
    end
    def update
        student = Student.find_by(id: params[:id])
        if student.valid?
            student.update(student_params)
            render json: student, status: :accepted
        else
            render json: {error: "student not found"}, status: :not_found
        end
    end
    def destroy
        student = Student.find_by(id: params[:id])
        if student
            student.destroy
            head :no_content
            
        else
            render json: {error: "student not found"}, status: :not_found
        end
    end
    private
    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end

end
