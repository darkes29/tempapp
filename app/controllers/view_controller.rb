class ViewController < ApplicationController
	
	
 
  
	def show

	end
  
	def new
	@col = 1
    @article =  Accounts.last(@col)
    respond_to do |format|
      format.html{ render :layout => false }
    end
  end
end
    
   
    
class Accounts < ActiveRecord::Base
	
end
