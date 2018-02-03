class ViewController < ApplicationController
	def show
	@col = 20
    @article =  Accounts.last(@col)
    end
  
	def new
	
    end
    
class Accounts < ActiveRecord::Base
	#self.table_name = "Accounts"
end
end
