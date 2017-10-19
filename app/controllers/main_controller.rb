class MainController < ApplicationController
  before_action :force_json
  def search
    @articles = Article.ransack(title_cont: params[:q]).result(distinct: true).limit(5)
    #@users    = User.ransack(email_cont: params[:q]).result(distinct: true).limit(5)
    # render json: {articles: [], users: []}
    render '/main/search.json.jbuilder'
  end

private

def force_json
  request.format = :json
end

end
