# docker-elasticsearch

This automatically installs the head plugin, a japanese analyzer and the marvel plugin

### Versions

- [`1.4`, `1.4.4` (*1.4/Dockerfile*)](1.4/Dockerfile)
- [`1.5`, `1.5.0`, `latest` (*1.5/Dockerfile*)](1.5/Dockerfile)

### Local build

```
docker build --no-cache -t cjlyth/elasticsearch:1.5 1.5 \
&& docker tag -f cjlyth/elasticsearch:1.5 cjlyth/elasticsearch:1.5.0 \
&& docker tag -f cjlyth/elasticsearch:1.5 cjlyth/elasticsearch:latest
```

or 

```
docker build --no-cache -t cjlyth/elasticsearch:1.4 1.4 \
&& docker tag -f cjlyth/elasticsearch:1.4 cjlyth/elasticsearch:1.4.4
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

```
docker run -it --rm -P -v /tmp/es:/data cjlyth/elasticsearch:1.4
```
