class EquipesController < InheritedResources::Base
  
  def associate
    @group = Group.find_by_id(params[:group_id]) || Group.find_by_id(params[:id])
    @championship = @group.championship
    
    if request.post?
      @group.attributes = params[:group]
      if @group.associate_equipe
        flash[:notice] = "Associação de Equipe realizada com sucesso!"
        redirect_to([@championship, @group])
      end
    end
    
    if request.delete?
      @group.equipes.delete(Equipe.find(params[:equipe_id]))
      flash[:notice] = "Desassociação de Equipe realizada com sucesso!"
      redirect_to([@championship, @group])
    end
  end
end
