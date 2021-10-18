# [mkdocs-meterial](https://squidfunk.github.io/mkdocs-material/) for FATE's docs

使用docker版本的mkdocs来编译FATE的文档, 集成了FATE文档需要的mkdocs插件

Usage

Mount the folder where your mkdocs.yml resides as a volume into /docs:

- Start development server on http://localhost:8000

```console
docker run --rm -it -p 8000:8000 -v ${PWD}:/docs sagewei0/mkdocs
```

- Build documentation

```console
docker run --rm -it -v ${PWD}:/docs sagewei/mkdocs build
```

- Deploy documentation to GitHub Pages

```console
docker run --rm -it -v ~/.ssh:/root/.ssh -v ${PWD}:/docs sagewei0/mkdocs gh-deploy 
```

