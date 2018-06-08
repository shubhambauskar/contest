class ContestsController < ApplicationController
    def index
        @contests = Contest.all    
    end
    
    def new
        @contest = Contest.new
    end
    
    def edit
       @contest = Contest.find(params[:id]) 
    end    
    
    def create
        debbuger
        @contest = Contest.new(contest_params)
        @contest.user = User.first
        if @contest.save
            flash[:notice] = "Contest successfully created"
           redirect_to contest_path(@contest) 
        else
            render 'new' 
        end 
    end
    
    def update
        @contest = Contest.find(params[:id])
        if @contest.update(contest_params)
            flash[:notice] = "Contest succesfully updated"
            redirect_to contest_path(@contest)
        else
            render 'edit'
        end    
    end    
        def contest_params
            params.require(:contest).permit(:title, :categories, :start, :end, :description, :locations, :terms_and_conditions)
        end
    
    def show
      @contest = Contest.find(params[:id])  
    end  
    
    def destroy
        @contest = Contest.find(params[:id]).destroy
        @contest.destroy
        flash[:notice] = "Contest successfully deleted"
        redirect_to contests_path
    end    
    
    private
        def contest_params
            params.require(:contest).permit(:title, :categories, :start, :end, :description, :locations, :terms_and_conditions)
        end
end
