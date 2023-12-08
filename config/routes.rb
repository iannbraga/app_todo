Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tarefas 
  get 'tarefa_concluida/:id', to: 'tarefas#tarefa_concluida', as: :tarefa_concluida
  # Defines the root path route ("/")
  root "tarefas#index"
end
