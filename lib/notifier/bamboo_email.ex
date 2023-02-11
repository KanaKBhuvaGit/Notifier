defmodule Notifier.BambooEmail do
  use Bamboo.Phoenix, view: NotifierWeb.EmailView

  # Set a new email with the default options and layout
  # Returns Bamboo.Email
  # defp base_email do
  #   new_email()
  #   ## |> bcc("sean.crosier@homepie.com")
  #   |> from("Homepie <noreply@#{Application.get_env(:homepie, :access_domain_name)}>")
  #   |> subject("Homepie Notifications")
  #   |> put_html_layout({HomepieWeb.LayoutView, "email.html"})
  # end

  # Adds a category attribute to the email object.
  # defp category(email, category) when is_atom(category) do
  #   email
  #   |> Map.merge(%{category: category})
  # end

  defp base_email() do
    new_email()
    |> from("contact@example.com")
    |> subject("Notifier Notifications")
    |> put_html_layout({NotifierWeb.LayoutView, "email.html"})
  end

  def update_user_email(user, token) do
    base_email()
    |> to(user.email)
    |> subject("Update email instructions")
    |> render("update_user_email.html", user: user.email, token: token)
  end

  def verify_account_email(user, token) do
    base_email()
    |> to(user.email)
    |> subject("Please confirm your email")
    |> render("verify_account_email.html", user: user.email, token: token)
  end

  def reset_password_email(user, token) do
    base_email()
    |> to(user.email)
    |> subject("Reset password instructions")
    |> render("reset_password_email.html", user: user.email, token: token)
  end
end
