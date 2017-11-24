class RecordingsController < ApplicationController
    
    def new
       @recordings = Recording.new
    end
  
end
