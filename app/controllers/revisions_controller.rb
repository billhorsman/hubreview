class RevisionsController < ApplicationController
  def index
  end

  def update
    revision = Revision.find(params[:id])
    revision.reviewed = !revision.reviewed
    revision.save!

    PushRevisionChange.push(revision, self)
    render text: "success"
  end
end
