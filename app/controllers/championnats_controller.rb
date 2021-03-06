class ChampionnatsController < ApplicationController
    layout 'admin'
    
    def index
        @championnats = Championnat.all.includes(:matches)
    end
    
    def show
        @championnat = Championnat.find(params[:id])
    end 

    def new
        @championnat = Championnat.new
    end

    def create
        @championnat = Championnat.new(championnat_params)
        if @championnat.save
            redirect_to championnats_path
        else
            render 'new'
        end
    end

    def edit
        @championnat = Championnat.find(params[:id])
    end
    
    def update
        @championnat = Championnat.find(params[:id])
        if @championnat.update(championnat_params)
            redirect_to @championnat
        else
            render 'edit'
        end
    end 

    def destroy
        @championnat = Championnat.find(params[:id])
        @championnat.destroy
        redirect_to championnats_path
    end

    private
    def championnat_params
        params.require(:championnat).permit(:name)
    end 

end