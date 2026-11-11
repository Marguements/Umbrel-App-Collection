# Per-install secrets derived from this Umbrel's seed: stable across restarts
# and updates, never stored in this repo.
export APP_FINLYNQ_JWT_SECRET=$(derive_entropy "env-${app_entropy_identifier}-PF_JWT_SECRET")
export APP_FINLYNQ_PEPPER=$(derive_entropy "env-${app_entropy_identifier}-PF_PEPPER")
export APP_FINLYNQ_STAGING_KEY=$(derive_entropy "env-${app_entropy_identifier}-PF_STAGING_KEY")
export APP_FINLYNQ_DB_PASSWORD=$(derive_entropy "env-${app_entropy_identifier}-POSTGRES_PASSWORD")
