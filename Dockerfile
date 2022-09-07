FROM python:3.10

WORKDIR /identicons

COPY poetry.lock pyproject.toml ./

RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi


COPY app ./app
COPY cmd.sh ./

EXPOSE 9090 9191
USER uwsgi

CMD ["./cmd.sh"]