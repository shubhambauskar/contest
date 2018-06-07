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
        @contest = Contest.new(contest_params)
        if @contest.save
            flash[:notice] = "contest was successfully created"
           redirect_to article_path(@article) 
        else
            render 'new' 
        end 
    end
    
    def update
        @contest = Contest.find(params[:id])
        if @contest.update(contest_params)
            flash[:notice] = "contest was succesfully updated"
            redirect_to contest_path(@contest)
        else
            render 'edit'
        end    
    end    
        def contest_params
            params.require(:article).permit(:title, :categories, :start, :end, :description, :locations, :terms_and_conditions)
        end
    
    def show
      @article = Contest.find(params[:id])  
    end  
    
    def destroy
        @contest = Contest.find(params[:id]).destroy
        @contest.destroy
        flash[:notice] = "contest was successfully deleted"
        redirect_to contests_path
    end    
    
    private
        def contest_params
            params.require(:contest).permit(:title, :categories, :start, :end, :description, :locations, :terms_and_conditions)
        end
end
