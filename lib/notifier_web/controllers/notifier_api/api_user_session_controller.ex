defmodule NotifierWeb.NotifierApi.ApiUserSessionController do
  use NotifierWeb, :controller

  # alias Notifier.Accounts
  # alias NotifierWeb.Notifier.UserAuth
  def index(conn, _) do
    json(conn, %{name: "bhuvakanak777@gmail.com", userToken: "sdsfdsdSDDDDFFDDF8fsdfj"})
  end

  def create(conn, _) do
    json(conn, %{name: "bhuvakanak777@gmail.com", userToken: "sdsfdsdSDDDDFFDDF8fsdfj"})
  end

  def delete(conn, _) do
    json(conn, %{message: "Logout successfully"})
  end
end
