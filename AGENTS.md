# Repository Guidelines

## Project Structure & Module Organization
The repository centers on `docker-compose.yml`, which provisions a single `jupyter/base-notebook` container. Bind-mounted notebooks live under `work/` and sync to `/home/jovyan/work` in the container; treat this directory as the workspace for notebooks, data exploration, and checkpoints. The named Docker volume `app-data` retains interpreter-level configs across rebuilds, so avoid manual edits inside the container's `/app/configs`—update the compose file instead.

## Build, Test, and Development Commands
- `UID=$(id -u) GID=$(id -g) docker-compose up -d`: launch the notebook server with host user/group ownership, exposing port `8888`.
- `docker-compose logs -f jupyter`: follow container startup to confirm token generation and volume mounting.
- `docker-compose down`: stop services and detach volumes; use `--volumes` only when the configuration cache can be safely reset.
- `docker exec -it jupyter bash`: open an interactive shell for notebook dependency installs (prefer `pip install --user`).

## Coding Style & Naming Conventions
Notebooks in `work/` should keep Python cells formatted with Black defaults (88-character lines, 4-space indents) and use `snake_case` for functions/variables. Name notebooks descriptively using hyphenated dates, e.g., `2024-05-analytics.ipynb`, to keep chronological ordering. Persist environment changes by editing `docker-compose.yml` rather than ad-hoc container tweaks.

## Testing Guidelines
Smoke-test every change by recreating the stack: `docker-compose down && UID=$(id -u) GID=$(id -g) docker-compose up`. Validate that the Jupyter token from the logs authenticates in the browser and that the expected notebooks appear under `/home/jovyan/work`. If adding package installs, document them in a `requirements.txt` stored in `work/` and rerun the container to ensure they persist.

## Commit & Pull Request Guidelines
Follow the existing conventional short prefixes (`feature:`, `docs:`) noted in Git history. Keep the subject under 72 characters and describe the effect in the imperative mood. Pull requests should state the motivation, list manual verification steps (including the smoke test above), and link any relevant tracking issues. Attach screenshots when UI-facing notebooks change to illustrate key outputs.

## Security & Configuration Tips
Keep `.env` secrets out of version control; supply runtime overrides via `docker-compose --env-file`. Rotate the `JUPYTER_TOKEN` when sharing the environment by updating the compose file and redeploying. Audit installed packages periodically from within the container using `pip list --outdated`.
