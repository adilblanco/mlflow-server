# MLflow Server with Docker Compose

## Project structure

```text
mlflow-server/
├── db/
│   └── init.sql
├── mlflow/
│   └── Dockerfile
├── docker-compose.yaml
└── README.md
```

## How to launch

```bash
docker-compose up --build
# detached mode
docker-compose up -d --build
```

## Services overview

### 1. **PostgreSQL**
- **Image**: `postgres:14.1-alpine`
- **Ports**: `5432:5432` "host:container"
- **Init script**: `db/init.sql` runs on container start.

### 2. **MinIO**
- **Image**: `minio/minio`
- **Ports**: `9000:9000` "S3 API", `9001:9001` "Web UI"

### 3. **MinIO Bucket Creator**
- **Image**: `minio/mc`
- **Init script**: Creates the `mlflow-artifacts` bucket if it doesn't exist.

### 4. **MLflow Server**
- **Build**: From `mlflow/Dockerfile`
- **Ports**: `5000:5000` "MLflow UI"
- **Backend**: PostgreSQL
- **Artifact Store**: MinIO "S3"

## Port mapping summary

| Service     | Host Port | Container Port |
|-------------|-----------|----------------|
| PostgreSQL  | 5432      | 5432           |
| MinIO API   | 9000      | 9000           |
| MinIO UI    | 9001      | 9001           |
| MLflow UI   | 5000      | 5000           |
