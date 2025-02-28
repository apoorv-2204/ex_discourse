defmodule ExDiscourse.AdminNotices.AdminNotice do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @castable_attrs [:subject, :priority, :identifier, :details]
  @required_attrs [:subject, :priority, :identifier]
  @derive {Inspect, only: [:id]}

  @type t :: %__MODULE__{}

  schema "admin_notices" do
    field :subject, :integer
    field :priority, :integer
    field :identifier, :string
    field :details, :map, default: %{}

    timestamps(type: :naive_datetime_usec)
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, @castable_attrs)
    |> validate_required(@required_attrs)
  end
end
