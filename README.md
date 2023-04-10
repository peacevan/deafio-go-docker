# Desafio: Otimização de uma imagem docker com golang com Menos de 2MB

## 🌱 Descrição do projeto 

 

Esse desafio é muito empolgante principalmente se você nunca trabalhou com a linguagem Go!
Você terá que publicar uma imagem no docker hub. Quando executarmos:
    -  docker run <seu-user>/fullcycle
	Temos que ter o seguinte resultado: Full Cycle Rocks!!

## Dockerfile Com multi-stage build para compilar a aplicação e otimizar a imagem

## Dockerfile


```
# Iniciando uma imagem base golang:alpine
FROM golang:alpine AS builder

# criando diretório de trabalho
WORKDIR /app

# Copiando o app
COPY . .

# Compilando o binário removendo informações de debug
RUN go build -ldflags '-s -w' main.go
```

# Iniciando com scratch
FROM scratch

# diretório de trabalho
WORKDIR /

# copiando o binário
COPY --from=builder /app / 

# executando 
CMD ["/main"]
```

## Inserindo alguns parâmetros para o linker via -ldflags

- Parâmetros para o linker que vão ajudar a diminuir o tamanho do executável final  ( -ldflags '-s -w' )

```
O parâmetro -s remove informações de debug do executável e o -w impede a geração do DWARF (Debugging With Attributed Record Formats).
```

## Build 

```
docker build -t peacevan/fullcycle .
```

## Images
```

## Run

```

docker run --name golang-desafio --rm peacevan/fullcycle
```

## Docker login

```
docker login
```
## Push

```
docker push peacevan/fullcycle
```
## Pull

```
docker pull peacevan/fullcycle
```
# Link da imagem no dockerhub
https://hub.docker.com/layers/peacevan/fullcycle/latest/images/sha256:b55651493f8d05b061e14dbe91d2ded2d44027ba27d5116a44683dc043a5a798
```
## Referências
- http://goporexemplo.golangbr.org/hello-world.html


