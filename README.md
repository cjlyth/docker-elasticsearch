# docker-elasticsearch

### Versions

- [`1.4`, `1.4.4`, `latest` (*1.4/Dockerfile*)](1.4/Dockerfile)

### Local build

```
docker build --no-cache -t cjlyth/elasticsearch:1.4 1.4 \
&& docker tag -f cjlyth/elasticsearch:1.4 cjlyth/elasticsearch:1.4.4 \
&& docker tag -f cjlyth/elasticsearch:1.4 cjlyth/elasticsearch:latest
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
docker build --no-cache -t cjlyth/elasticsearch:1.4 1.4 \
	&& docker run -it --rm cjlyth/elasticsearch:1.4 bash
```
