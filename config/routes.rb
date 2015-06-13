Rails.application.routes.draw do

  get 'session_exam/index'

  get 'session_exam/show'

  get 'session_exam/edit'

  get 'see_results/show'

  post 'admins/new'

  root            'static_pages#home'
  get    'help'    =>  'static_pages/help'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'test' =>'questions#test'
  resources :users  
  resources :answer_sheets
  
  resources :sessions 
  resources :exams
  resources :questions
  resources :exam_questions
  resources :admins
  resources :session_exams
  resources :exam_users
  
  resources :see_results
  resources :user_session_exams
  resources :time_sessions

  # get '/exams/select_question/:id', to: 'exams#select_question', as: "add_questions_to_exam"
  # post '/exams/add_question', to: 'exams#add_question', as: "add_questions_to_exam"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
