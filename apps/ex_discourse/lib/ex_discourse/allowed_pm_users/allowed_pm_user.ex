defmodule ExDiscourse.AllowedPMUsers do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @castable_attrs []
  @required_attrs []
  @derive {Inspect, only: [:id]}

  @type t :: %__MODULE__{}
  schema "allowed_pm_users" do
    field :user_id, :integer
  end
end
