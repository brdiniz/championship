class ChampionshipsController < InheritedResources::Base
  
  def manage_equipe
    @championship = Championship.find(params[:id])
    
    if request.post?
      @championship.attributes = params[:championship]
      if @championship.associate_equipe
        flash[:notice] = "Associação de equipe realizada com sucesso!"
        redirect_to(@championship)
      end
    end
    
    if request.delete?
      @championship.equipes.delete(Equipe.find(params[:equipe_id]))
      flash[:notice] = "Desassociação de equipe realizada com sucesso!"
      redirect_to(@championship)
    end
  end
end