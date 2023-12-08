class TarefasController < ApplicationController
    def index
        @tarefas = Tarefa.order(:desc)
    end

    def new
        @tarefa = Tarefa.new
    end
end
