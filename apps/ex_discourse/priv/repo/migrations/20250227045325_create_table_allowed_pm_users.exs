defmodule ExDiscourse.Repo.Migrations.CreateTableAllowedPmUsers do
  use Ecto.Migration

  @doc """
  Existing DDL postgres 13
  CREATE TABLE public.allowed_pm_users (
  	id bigserial NOT NULL,
  	user_id int4 NOT NULL,
  	allowed_pm_user_id int4 NOT NULL,
  	created_at timestamp(6) NOT NULL,
  	updated_at timestamp(6) NOT NULL,
  	CONSTRAINT allowed_pm_users_pkey PRIMARY KEY (id)
  );
  CREATE UNIQUE INDEX index_allowed_pm_users_on_allowed_pm_user_id_and_user_id ON public.allowed_pm_users USING btree (allowed_pm_user_id, user_id);
  CREATE UNIQUE INDEX index_allowed_pm_users_on_user_id_and_allowed_pm_user_id ON public.allowed_pm_users USING btree (user_id, allowed_pm_user_id);

  Resultant DDL postgres 17

    CREATE TABLE public.allowed_pm_users (
    id bigserial NOT NULL,
    user_id int4 NOT NULL,
    allowed_pm_user_id int4 NOT NULL,
    inserted_at timestamp(6) NOT NULL,
    updated_at timestamp(6) NOT NULL,
    CONSTRAINT allowed_pm_users_pkey PRIMARY KEY (id)
    );
    CREATE UNIQUE INDEX index_allowed_pm_users_on_allowed_pm_user_id_and_user_id ON public.allowed_pm_users USING btree (allowed_pm_user_id, user_id);
    CREATE UNIQUE INDEX index_allowed_pm_users_on_user_id_and_allowed_pm_user_id ON public.allowed_pm_users USING btree (user_id, allowed_pm_user_id);

  """
  def change do
    create table(:allowed_pm_users, primary_key: false) do
      add :id, :bigserial, primary_key: true
      add :user_id, :integer, null: false
      add :allowed_pm_user_id, :integer, null: false

      timestamps(type: :naive_datetime_usec, precision: 6, null: false)
    end

    create unique_index(:allowed_pm_users, [:allowed_pm_user_id, :user_id],
             name: :index_allowed_pm_users_on_allowed_pm_user_id_and_user_id,
             using: :btree
           )

    create unique_index(:allowed_pm_users, [:user_id, :allowed_pm_user_id],
             name: :index_allowed_pm_users_on_user_id_and_allowed_pm_user_id,
             using: :btree
           )
  end
end
