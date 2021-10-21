FROM python:3.9.2-alpine3.13

# Environment variables
ENV PACKAGES=/usr/local/lib/python3.9/site-packages
ENV PYTHONDONTWRITEBYTECODE=1

# Set build directory
WORKDIR /tmp

RUN set -e ;\
    apk upgrade --update-cache -a ;\
    apk add --no-cache libstdc++ libffi-dev ;\
    apk add --no-cache --virtual .build gcc g++ musl-dev python3-dev cargo openssl-dev git;\
    pip install --no-cache-dir \
        mkdocs-material==7.3.0 \
        mkdocs-jupyter==0.18.0 \
        python-markdown-math==0.8 \
        mkdocs-macros-plugin==0.6.0 \
        git+git://github.com/weiwee/mkdocs-static-i18n@main#egg=mkdocs-static-i18n \
        git+git://github.com/mkdocstrings/mkdocstrings@f6cf570#egg=mkdocstrings\
        pytkdocs[numpy-style]==0.14.0 \
        mkdocs-simple-hooks \
        mkdocs-awesome-pages-plugin

# FATE
RUN pip install --no-cache-dir apsw peewee cachetools ruamel.yaml beautifultable

# clean 
RUN apk del .build ;\
    rm -rf /tmp/* /root/.cache
    
# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]