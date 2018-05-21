# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EuDesbravador.Repo.insert!(%EuDesbravador.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias EuDesbravador.Repo
alias EuDesbravador.Models.User


Repo.insert!(User.changeset(%User{}, %{name: "Administrator", email: "admin@admin.com", password: "1234", active: true }))