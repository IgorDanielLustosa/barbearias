FROM python:3.12-slim

WORKDIR /app

# Instala o Poetry dentro da imagem
RUN pip install --no-cache-dir poetry==2.4.1

# Copia só os arquivos de dependência primeiro (ver explicação abaixo)
COPY pyproject.toml poetry.lock ./

# Instala as dependências de produção, sem criar venv extra dentro do container
RUN poetry config virtualenvs.create false \
    && poetry install --only main --no-interaction --no-ansi --no-root

# Agora copia o resto do código
COPY app/ ./app/

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
