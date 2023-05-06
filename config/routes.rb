Rails.application.routes.draw do 
  ##########################   category ###########################
  get "category/index" => "category#list"
  get "category/:id" => "category#show"
  post "category/create" => "category#create"
  put "category/update" => "category#update"  
  delete "category/delete" => "category#delete"
  ##########################   end category  ###########################


  ########################## article ###########################
  
  get "article/index" => "article#list"
  get "article/:id" => "article#show"
  post "article/create" => "article#create"
  put "article/update" => "article#update"  
  delete "article/delete" => "article#delete"

  get "article/search" => "article#search_in_article"
  ########################## end article ###########################


  ########################## comment ###########################
  
  get "nested_comment/:article_id" => "nested_comment#list"
  post "nested_comment/create" => "nested_comment#create"
  put "nested_comment/update" => "nested_comment#update"  
  delete "nested_comment/delete" => "nested_comment#delete"

  get "article/search" => "article#search_in_article"
  ########################## end comment ###########################

  



 

end
 
