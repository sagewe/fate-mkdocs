FROM squidfunk/mkdocs-material:7.3.4
COPY requirements.txt .
RUN set -e ;\
    pip install -U pip ;\
    pip install -r requirements.txt
