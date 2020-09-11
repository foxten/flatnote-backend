class NotesController < ApplicationController
    def index
        notes = Note.all
        render json: notes
    end

    def show
        note = Note.find(params[:id])
        render json: note, include: [:category => {:only => :name}]
    end

    def create
        note = Note.create(note_params)
        render json: note, include: :user
    end

    def edit
        user = Note.find(params[:id])
    end

    def update
        note = Note.find(params[:id])
        note.update(note_params)
        render json: note, include: :user
    end

    def destroy
        note = Note.find(params[:id])
        note.destroy
        render json: note
    end

private
    def note_params
        params.require(:note).permit(:subject, :content, :user_id, :category_id, :shareable)
    end
end
