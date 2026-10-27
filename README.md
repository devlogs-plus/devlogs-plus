# Devlogs+
**Devlogs+** is a platform to share projects, devlogs, and time spent publicly.

Looking for the backend repo? Find it [here](https://github.com/devlogs-plus/devlogs-plus-backend)
Looking for the backend api docs? Find it [here](https://github.com/devlogs-plus/backend-api-docs)
Looking for the frontend repo? Find it [here](https://github.com/devlogs-plus/devlogs-plus-frontend)

## **Features**

### Devlogs & Projects

The main part of Devlogs+ is the devlogs.
You can create projects to attach devlogs to.

#### Projects

When creating a project there are 4 things you can set: Name, Description, Repo Url, and Demo Url.

The Description is a short description for the project, think of a simple about the project.

The Repo Url is where your put the git repo, and the Demo Url is where you put a link to the demo


Projects have the ability to add collaborators to a project. Collaborators can create devlogs for that project.

You can also connect time tracking projects from services like wakatime and hackatime

#### Devlogs

Devlogs are the main part of the platform.

You create them by clicking the Create Devlogs link on the top bar.

Once there you are presented with a create a devlogs page, there you can set the title, main body, and project

The main body is where you put the actual content of the devlog, it supports markdown for styling the body.

The project selector lets you select project you own or collaborate on.

When you are ready to post a devlog you can choose 2 options, post immediately or save it to drafts.

When a devlog is a draft you can go into the drafts page and publish or edit it.

#### Community

On the main page there is a feed of devlogs sorted by recency, there is no algorithm that recommends stuff to you.

### **User Accounts**

#### Profile

On your profile page you can view your projects, connect your wakatime and hackatime account, change your password, delete your account, and access user settings

#### User Settings

On the user settings page you can change your username, email, and profile picture.

#### Logging In & Registering

Users can can create and login to their account with 3 ways, email & password, GitHub, or Hack Club Auth.

#### Password Resetting

Users can request a password reset email to their user account if they forgot their password.

### **Integrations**

#### Hackatime & Wakatime

Devlogs+ has support to connection 2 different time tracking apps, Hackatime and Wakatime.

Devlogs+ uses these to add time spent to your devlogs and projects.

## Developing

To help develop Devlogs+ you can edit the backend and frontend codebases. More through developing instructions are there.

### Docker Compose

#### Local Development 

When developing locally you are either on a separate branch of the repo or your own fork.
 Doing this means that you will have to update the git submodules.

Update the backend for a fork with:
```sh
git submodule set-url backend https://github.com/<your-fork>/devlogs-plus-backend.git
git submodule sync
```
Update the backend for a fork with:
```sh
git submodule set-url frontend https://github.com/<your-fork>/devlogs-plus-frontend.git
git submodule sync
```
If developing on a separate branch update the branch with
```sh
git submodule set-branch --branch <branch-name> backend/frontend
git submodule update --remote backend/frontend
```
Once that is done configure `backend/.env` and `POSTGRES_PASSWORD` in `.env`, then run:

```sh
docker compose up --build
```

This uses `docker-compose.yaml` and exposes the frontend at `http://localhost:8080` and the backend at `http://localhost:8000`.

#### Production

The production Compose application is published to GHCR. Create a deployment directory on the server and add the three configuration files below. The Compose file and application images are pulled from GHCR when you start the stack.

```sh
mkdir devlogs-plus
cd devlogs-plus
```

Create `.env` for Compose interpolation:

```dotenv
DOMAIN=yourdomain.com
# Generate a unique password with: openssl rand -hex 32
POSTGRES_PASSWORD=replace-with-a-unique-password
```

Create `backend.env` for backend settings. Set the credentials for the integrations you plan to use; keep unused credentials blank. `SECRET_KEY` should be a long, random value, for example generated with `python -c "import secrets; print(secrets.token_hex(32))"`.

```dotenv
CDN_KEY=
GITHUB_CLIENT_ID=
GITHUB_CLIENT_SECRET=
HACKCLUB_CLIENT_ID=
HACKCLUB_CLIENT_SECRET=
FRONTEND_URL=https://yourdomain.com
SECRET_KEY=replace-with-a-random-secret
RESEND_API_KEY=
HACKATIME_CLIENT_ID=
HACKATIME_CLIENT_SECRET=
WAKATIME_CLIENT_ID=
WAKATIME_CLIENT_SECRET=
```

Create `Caddyfile`, replacing `yourdomain.com` with the domain used in `.env`. Point the DNS records for both hostnames at the server:

```caddyfile
yourdomain.com {
    reverse_proxy frontend:80
}

api.yourdomain.com {
    reverse_proxy backend:8000
}
```

Start the published production application:

```sh
docker compose --project-directory . --env-file .env \
  -f oci://ghcr.io/devlogs-plus/devlogs-plus:latest up -d
```

Keep `.env` and `backend.env` private and do not commit them. For updates, run the same command again after the GHCR Compose artifact has been republished. The deployment uses the published backend and frontend images; no Git submodules or local source build are required.
