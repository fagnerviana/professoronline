# professoronline
Criando os micros serviços.

# API Back

* Requisitos: **Docker** + **Docker Compose** instalados.
* Subir Postgres:

  ```bash
  docker compose up -d
  ```
* O **banco** sobe no container `postgres`.
* Ao iniciar a aplicação, o **Flyway** aplica a migração **`V1__init.sql`** (cria o schema inicial).
* Teste rápido do endpoint:

  ```bash
  curl http://localhost:8080/api/hello
  ```

  **Resposta esperada:** `hello world`
