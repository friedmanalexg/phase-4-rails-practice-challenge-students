class InstructorsController < ApplicationController
    def create
        instructor = Instructor.create(name: params[:name])
        render json: instructor, status: :created
    end
    def show
        instructor = Instructor.find_by(id: params[:id])
        render json: instructor, staus: :ok
    end
    def update
        instructor = Instructor.find_by(id: params[:id])
        if instructor.valid?
            instructor.update(instructor_params)
            render json: instructor, status: :accepted
        else
            render json: {error: "instructor not found"}, status: :not_found
        end
    end
    def destroy
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.destroy
            head :no_content
            
        else
            render json: {error: "instructor not found"}, status: :not_found
        end
    end
    private
    def instructor_params
        params.permit(:name)
    end
end
