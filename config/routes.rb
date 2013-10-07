Bbapi::Application.routes.draw do  
  resources :bookkeepings, except: [:new, :edit]
  resources :account_titles, except: [:new, :edit]
  resources :account_categories, except: [:new, :edit]
  resources :comments, except: [:index, :new, :edit]
  resources :income_items, except: [:new, :edit]
  resources :outlay_items, except: [:new, :edit]
  resources :income_categories,  except: [:new, :edit]
  resources :outlay_categories,  except: [:new, :edit]
  resources :groups, except: [:new, :edit]
  get 'groups/:id/users/:user_id/add' => 'groups#add'
  get 'groups/:id/users/:user_id/remove' => 'groups#remove'
  get 'groups/:id/members' => 'groups#list_members'
  devise_for(:users, :controllers => { :sessions => "users/sessions", :registrations => "users/registrations" })
  # defaults: { :format => 'json' }
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
