class TarefasController < ApplicationController
    before_action :set_tarefa, only: %i[ edit update show destroy tarefa_concluida ]
    def index
        @tarefas = Tarefa.order(:desc)
    end

    def new
        @tarefa = Tarefa.new
    end

    def create
        @tarefa = Tarefa.new(tarefa_params)
        if @tarefa.save
            redirect_to tarefas_url
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @tarefa.update(tarefa_params)
            redirect_to tarefas_url
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
    end

    def destroy
        @tarefa.destroy
        redirect_to tarefas_url
    end

    def tarefa_concluida
        @tarefa.update(concluida: true)
        redirect_to tarefas_url
    end

    private 

    def set_tarefa
        @tarefa = Tarefa.find(params[:id])
    end

    def tarefa_params
        params.require(:tarefa).permit(:titulo, :descricao, :concluida)
    end
end
