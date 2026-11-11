# Marguements App Store

A personal [Umbrel community app store](https://github.com/getumbrel/umbrel-community-app-store) for apps that aren't in the official Umbrel App Store.

## Install the store on Umbrel

1. Open **App Store**, click the **⋯** menu in the top right, and choose **Community App Stores**.
2. Paste `https://github.com/Marguements/Umbrel-App-Collection` and click **Add**.
3. Apps appear under **Marguements App Store**.

## Apps

| App | Port | Notes |
|---|---|---|
| [Finlynq](marg-finlynq) | 3010 | Personal finance with a built-in MCP server. Register at `/cloud`. |
| [BookOrbit](marg-bookorbit) | 3020 | Ebook, audiobook and comic library and reader. The setup token is the password Umbrel shows. Books go in Home > Books. |

## Adding an app

Each app is a folder named `marg-<app>` (every app ID must start with the store ID `marg`) and contains:

- **`umbrel-app.yml`:** the store listing. Set `id` to the folder name, set `version` to the upstream version, and pick a free host `port` that's unique across all Umbrel apps. Use `path` if the UI doesn't live at `/`.
- **`docker-compose.yml`:** the upstream compose file, adapted:
  - Add an `app_proxy` service with `APP_HOST: marg-<app>_<service>_1` and `APP_PORT: <container port>`. Don't publish `ports:` for the web UI; the proxy handles that.
  - Set `PROXY_AUTH_ADD: "false"` if the app has its own login or needs API/OAuth clients to reach it. Otherwise, use `PROXY_AUTH_WHITELIST` for API paths.
  - Put persistent data under `${APP_DATA_DIR}/data/...`.
  - Refer to other containers by `marg-<app>_<service>_1`.
  - Pin images as `image:tag@sha256:digest`.
- **`exports.sh`** (optional): for secrets. Never commit secrets, because this repo is public. Derive per-install values from the Umbrel seed instead:
  ```sh
  export APP_MYAPP_SECRET=$(derive_entropy "env-${app_entropy_identifier}-SECRET")
  ```
  Then reference `${APP_MYAPP_SECRET}` in the compose file.

Useful variables: `${APP_DATA_DIR}`, `${DEVICE_DOMAIN_NAME}` (for example `umbrel.local`), `${APP_SEED}`.

### Updating an app

Bump `version` and `releaseNotes` in `umbrel-app.yml` and update the image tag and digest in `docker-compose.yml`. Umbrel then shows an update for the app.
