class ProposalsController < ApplicationController
  def new
    @proposal = Proposal.new(flash[:form_data])
  end

  def create
    @proposal = Proposal.create(
      title: params[:proposal][:title],
      description: params[:proposal][:description],
      contact: params[:proposal][:contact]
    )

    if @proposal.valid?
      redirect_to root_path
    else
      flash[:errors] = @proposal.errors.map(&:full_message)
      flash[:form_data] = @proposal.attributes
      redirect_to '/proposals/new'
    end
  end
end
