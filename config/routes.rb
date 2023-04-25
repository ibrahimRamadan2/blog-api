Rails.application.routes.draw do 
  ##########################   category ###########################
  get "category/index" => "category#list"
  get "category/:id" => "category#show"
  post "category/create" => "category#create"
  put "category/update" => "category#update"  
  delete "category/delete" => "category#delete"
  ##########################   end category  ###########################


  ########################## article ###########################
  
  get "atricle/index" => "atricle#list"
  get "atricle/:id" => "atricle#show"
  post "atricle/create" => "atricle#create"
  put "atricle/update" => "atricle#update"  
  delete "atricle/delete" => "atricle#delete"

  ########################## end article ###########################

  

end
 
