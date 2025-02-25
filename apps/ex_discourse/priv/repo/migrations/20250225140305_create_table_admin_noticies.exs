defmodule ExDiscourse.Repo.Migrations.CreateTableAdminNoticies do
  use Ecto.Migration

  @doc """
  DDL
     CREATE TABLE public.admin_notices (
   	id bigserial NOT NULL,
   	subject int4 NOT NULL,
   	priority int4 NOT NULL,
   	identifier varchar NOT NULL,
   	details json DEFAULT '{}'::json NOT NULL,
   	created_at timestamp(6) NOT NULL,
   	updated_at timestamp(6) NOT NULL,
   	CONSTRAINT admin_notices_pkey PRIMARY KEY (id)
   );
   CREATE INDEX index_admin_notices_on_identifier ON public.admin_notices USING btree (identifier);
   CREATE INDEX index_admin_notices_on_subject ON public.admin_notices USING btree (subject);
  """
  def change do
    create table(:admin_notices, primary_key: false) do
      add :id, :bigserial, primary_key: true
      add :subject, :integer, null: false
      add :priority, :integer, null: false
      add :identifier, :string, null: false
      add :details, :map, null: false, default: %{}

      timestamps(type: :naive_datetime_usec)
    end

    create index(:admin_notices, [:identifier])
    create index(:admin_notices, [:subject])
  end
end
