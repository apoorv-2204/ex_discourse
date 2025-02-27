defmodule ExDiscourse.Test.Support.Factories.Factory do
  @moduledoc false
  alias ExDiscourse.Protocols.Factory
  alias ExDiscourse.Repo
  alias ExDiscourse.AdminNotices.AdminNotice
  alias ExDiscourse.AllowedPMUsers.AllowedPMUser

  @type attrs :: map | Keyword.t() | (-> map | Keyword.t())
  @type factorizable() :: :admin_notice | :allowed_pm_users
  @type variant() :: :standard
  @default_variant :standard
  @type internal_struct :: AdminNotice.t() | AllowedPMUser.t()

  @spec create(what :: factorizable(), variant :: variant(), attrs :: map()) :: map
  def create(what, variant \\ @default_variant, attrs \\ %{})

  def create(what, variant, attrs) do
    what
    |> build(variant, attrs)
    |> Repo.insert!()
  end

  @spec factory(name :: factorizable(), variant :: variant(), attrs :: map()) :: internal_struct()
  defp factory(:admin_notice, variant, attrs),
    do: Factory.gen(%AdminNotice{}, variant, attrs)

  defp factory(:allowed_pm_users, variant, attrs),
    do: Factory.gen(%AllowedPMUser{}, variant, attrs)

  @spec build(what :: factorizable(), variant :: variant(), attrs) :: any
  def build(what, variant \\ @default_variant, attrs \\ %{})

  def build(what, variant, attrs) do
    case factory(what, variant, attrs) do
      s when is_struct(s) -> struct(s, attrs)
      built -> Map.merge(built, attrs)
    end
  end
end
