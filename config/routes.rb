Concept::Application.routes.draw do

 # resources :reviews

  devise_for :users
  # resources :topics   commented this out so we can use custom methods in combination of scaffold

  # nest reviews under topics
  resources :topics do
    collection do
      get :list
    end
    resources :reviews
  end

  # add new routes to create contact us page, make sure before resources otherwise show method gets called first
  get "ideas/contact_us"
  post "ideas/contact_us"

  resources :ideas do
    collection do
      get :list
    end
  end



  #resources :ideas, :only => ['index','list']
  #resources :ideas, :except => ['show', 'update', 'destroy','create','edit','new']

  #get "ideas", to: "ideas#index", as: :ideas

  #get "ideas/list", to: "ideas#list", as: :list_ideas
  get "ideas/:id(.:format)", to: "ideas#show", as: :ideas_id
  #get "topics/list(.:format)", to: "topics#list", as: :topics_list

  # legacy stuff just keeping in there reference
  get "pages/home"
  get "pages/ideas"
  get "pages/login"
  get "pages/new_idea"
  get "pages/contact_us"
  post "pages/contact_us"
  post "pages/home"
  
  # get 'topics/whocares', to: 'topics#whocares'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root to: "ideas#index"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
