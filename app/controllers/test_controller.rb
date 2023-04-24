class ApplicationController < ApplicationController
    def home 
        render json: { message: "Hello World!" , "age" => "23" }
    end
end
