get "/surveys/show/:id" do
  @survey = Survey.find(params[:id])
  erb :"surveys/show"
end
