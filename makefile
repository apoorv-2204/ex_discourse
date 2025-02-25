run-db:
	docker compose -f db-compose.yml up -d

run:
	iex -S mix phx.server
