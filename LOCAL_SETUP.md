# Local setup notes

This repository was cloned with all three submodules and made to run on this machine.

## URLs

| Service | URL |
| --- | --- |
| Backend API | http://localhost:8002 |
| React app | http://localhost:3001 |
| Angular app | http://localhost:4200 |
| MongoDB | mongodb://127.0.0.1:27017/conFusion |

## Why these ports?

Another local project ("MeetingMind") was already listening on
`127.0.0.1:8000` and `127.0.0.1:3000`, so the backend uses **8002** and React
uses **3001** to avoid conflicts. Port `8001` is also used by an unrelated
Django development server on this machine. The frontends' `baseUrl` files were
updated to point at port 8002.

## Start everything

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\start-all.ps1
```

Or start pieces individually:

```powershell
.\scripts\start-mongodb.ps1
.\scripts\start-backend.ps1
.\scripts\start-react.ps1
.\scripts\start-angular.ps1
```

## Runtime tools (no admin install needed)

Portable copies live in `%LOCALAPPDATA%\mongodb-restaurant`:

- MongoDB Community Server 6.0.19 (`mongodb\...\bin\mongod.exe`), data in `data\`
- Node.js 12.22.12 (`node-v12.22.12-win-x64\`), required only by the
  Angular 6 app because `node-sass@4` has no binaries for Node 24.

MongoDB data is persistent. Re-seed at any time with:

```powershell
cd Server-Restaurant
npm run populate
```

## Configuration

- `Server-Restaurant/.env` was created from `env.example` with local dev
  secrets and `PORT=8002`.
- `React-Restaurant-App/src/shared/baseUrl.js` -> `http://localhost:8002/`
- `Angular-Restaurant-App/src/app/shared/baseurl.ts` -> `http://localhost:8002/`

These three files are modified relative to their upstream submodule commits.
