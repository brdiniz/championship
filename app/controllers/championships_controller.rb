class ChampionshipsController < InheritedResources::Base
  
  def manage_equipe
    @championship = Championship.find_by_id(params[:championship_id]) || Championship.find_by_id(params[:id])
    
    if request.post?
      @championship.attributes = params[:championship]
      if @championship.associate_equipe
        flash[:notice] = "Associação de Equipe para o Campeonato realizada com sucesso!"
        redirect_to(@championship)
      end
    end
    
    if request.delete?
      @championship.equipes.delete(Equipe.find(params[:equipe_id]))
      flash[:notice] = "Desassociação de Equipe realizada com sucesso!"
      redirect_to(@championship)
    end
  end
end