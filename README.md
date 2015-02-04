# docker-elasticsearch

### Versions

- [`5.9`, `5.9.1`, `latest` (*5.9/Dockerfile*)](https://raw.githubusercontent.com/cjlyth/docker-elasticsearch/9ab3ce1be30722151024ed5d1a8091e612d25181/5.9/Dockerfile)

### Local build

```
docker build --no-cache -t cjlyth/elasticsearch:5.9 5.9 \
&& docker tag -f cjlyth/elasticsearch:5.9 cjlyth/elasticsearch:5.9.1 \
&& docker tag -f cjlyth/elasticsearch:5.9 cjlyth/elasticsearch:latest
```

### Run

```
docker run -it --rm cjlyth/elasticsearch bash
```

### Use the trusted build from docker

```
docker run -v $(pwd):/data --rm cjlyth/elasticsearch
```


#### Build and run

I use this for development mostly

```
docker build --no-cache -t cjlyth/elasticsearch:5.9 5.9 \
	&& docker run -it --rm cjlyth/elasticsearch:5.9 bash
```
