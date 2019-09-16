class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new(
      follow_id: params[:follow_id],
      user_id: current_user.id
    )
    relationship.save
    redirect_to "#{params[:pass]}"
  end
  def destroy
    relationship = Relationship.find(params[:id])
    relationship.destroy
    redirect_to "#{params[:pass]}"
  end
end
