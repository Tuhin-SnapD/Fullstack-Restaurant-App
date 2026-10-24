# L’Étoile Restaurant

A full-stack restaurant experience with two independently designed frontends backed by one live Express and MongoDB API. The React app uses an editorial, warm visual language; the Angular app uses a structured, Material-inspired interface. Both read restaurant content and reservation availability from the same backend.

## Applications and local URLs

| Component | Folder | Local URL | Stack |
| --- | --- | --- | --- |
| API | `Server-Restaurant` | http://localhost:8002 | Node.js, Express, MongoDB |
| React frontend | `React-Restaurant-App` | http://localhost:3001 | React 17, Redux, React Router 5 |
| Angular frontend | `Angular-Restaurant-App` | http://localhost:4200 | Angular 6, Angular Material |
| Database | local MongoDB | `mongodb://127.0.0.1:27017/conFusion` | MongoDB |

## Start the complete system (Windows)

Install the three apps' npm dependencies first if this is a fresh checkout. MongoDB and the Angular-compatible Node runtime are prepared by the startup scripts; see [LOCAL_SETUP.md](LOCAL_SETUP.md) for runtime details.

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\start-all.ps1
```

The launcher starts MongoDB, starts the API and both frontends in separate PowerShell windows, and seeds the database only if it has no dishes. Then open either frontend at the URLs above. To launch one part at a time, use `scripts/start-mongodb.ps1`, `scripts/start-backend.ps1`, `scripts/start-react.ps1`, or `scripts/start-angular.ps1`.

## Repository layout

```text
restaurant/
├── Angular-Restaurant-App/  # Angular frontend (Git submodule)
├── React-Restaurant-App/    # React frontend (Git submodule)
├── Server-Restaurant/       # Express API and MongoDB models (Git submodule)
├── scripts/                 # Local Windows startup scripts
└── LOCAL_SETUP.md           # Machine/runtime setup and port details
```

## Backend and live data

The API supplies dishes, categories, reviews/comments, promotions, team profiles, restaurant overview and reservation seating data. Both frontends consume the API; they do not maintain separate copies of restaurant content. The local clients point to `http://localhost:8002/`.

Useful routes include:

- `GET /restaurant/overview` — current service status and seating summary.
- `GET /dishes` and `GET /dishes/:id` — menu data and dish details.
- `GET /leaders`, `GET /promotions`, `GET /comments` — team, offers and reviews.
- `GET /reservations/availability?date=YYYY-MM-DD&partySize=2` — seating availability.
- `POST /reservations` — submit a reservation request. Requests are pending until confirmed by restaurant staff.
- `POST /feedback` — submit guest feedback.

Reservations are capacity-limited by seating time. See [backend API documentation](Server-Restaurant/README.md) for request fields, staff actions and limits.

## Run components manually

Install dependencies from each app directory with `npm install` (use the repository's lockfiles if present). Start MongoDB first, then run:

```powershell
# Server-Restaurant
npm run dev

# React-Restaurant-App (in another terminal)
$env:PORT = '3001'; npm start

# Angular-Restaurant-App (with Node 12.22.12 on PATH)
node node_modules/@angular/cli/bin/ng serve --host 127.0.0.1
```

The backend's default port is 8000; this workspace's `.env` and launch scripts use 8002. React defaults to 3000 but the workspace launcher selects 3001. Angular uses 4200. Angular 6 with `node-sass@4` requires the Node 12 runtime described in [LOCAL_SETUP.md](LOCAL_SETUP.md).

## Database seeding

`Server-Restaurant/db.json` contains starter restaurant data. To initialize an empty local database, run `npm run populate` from `Server-Restaurant`. **This command clears and replaces the seeded dishes, leaders, promotions, feedback and comments collections**; do not run it against data you need to keep.

## Component guides

- [React frontend](React-Restaurant-App/README.md)
- [Angular frontend](Angular-Restaurant-App/README.md)
- [Express API](Server-Restaurant/README.md)
- [Local Windows setup](LOCAL_SETUP.md)
