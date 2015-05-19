use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :dummy, Dummy.Endpoint,
  secret_key_base: "RfTau1/X4frq7IGwCkzuNZeRu0/KOstNlLTtV3Up1CPqxnb8CBlFTrd14Qd755YG"

# Configure your database
config :dummy, Dummy.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "dummy_prod",
  size: 20 # The amount of database connections in the pool
