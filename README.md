# Devlogs+
**Devlogs+** is a platform to share projects, devlogs, and time spent publicly.

Looking for the backend repo? Find it [here](https://github.com/devlogs-plus/devlogs-plus-backend)
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

To help devlop Devlogs+ you can edit the backend and frontend codebases. More through developing instructions are there.

It is recommended to use docker as it containerizes each part. 
