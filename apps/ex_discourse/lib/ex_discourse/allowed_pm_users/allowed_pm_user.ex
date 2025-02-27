defmodule ExDiscourse.AllowedPMUsers do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @castable_attrs [:user_id, :allowed_pm_user_id]
  @required_attrs @castable_attrs
  # @derive {Inspect, only: [:id]}

  @type t :: %__MODULE__{}
  schema "allowed_pm_users" do
    field :user_id, :integer
    field :allowed_pm_user_id, :integer

    timestamps(type: :naive_datetime_usec)
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, @castable_attrs)
    |> validate_required(@required_attrs)
  end
end
