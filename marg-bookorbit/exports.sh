# Per-install secrets derived from this Umbrel's seed; never stored in this repo.
# The setup token is APP_PASSWORD, which Umbrel shows in the UI (deterministicPassword: true).
export APP_BOOKORBIT_DB_PASSWORD=$(derive_entropy "env-${app_entropy_identifier}-POSTGRES_PASSWORD")
export APP_BOOKORBIT_JWT_SECRET=$(derive_entropy "env-${app_entropy_identifier}-JWT_SECRET")
