class TarefasController < ApplicationController
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

    def destroy
        @tarefa = Tarefa.find(params[:id])
        @tarefa.destroy
        redirect_to tarefas_url
    end

    def tarefa_concluida
        @tarefa = Tarefa.find(params[:id])
        @tarefa.update(concluida: true)
        redirect_to tarefas_url
    end

    private 

    def tarefa_params
        params.require(:tarefa).permit(:titulo, :descricao, :concluida)
    end
end
