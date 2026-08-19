from fastapi import FastAPI

app = FastAPI(
    title="Barbearia API",
    description="Sistema inteligente de gestão e agendamento para barbearia",
    version="0.1.0",
)


@app.get("/health")
async def health_check() -> dict[str, str]:
    """Endpoint simples para confirmar que a API está no ar."""
    return {"status": "ok"}
