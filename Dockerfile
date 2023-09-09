FROM python:3.11-bullseye

WORKDIR /app

COPY ./pyproject.toml /app/pyproject.toml

RUN pip install --upgrade pip && \
    pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000", "--reload"]
