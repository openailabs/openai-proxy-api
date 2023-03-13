<h1 align="center">Welcome to use proxy-api as your reverse proxy server 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.1.1-blue.svg?cacheSeconds=2592000" />
</p>

> openai ChatGPT api reverse proxy server

### ✨ [Demo]([chat.y1s1.host](https://proxy.y1s1.host/))

## Usage

### Run with docker compose

```bash
curl -o docker-compose.yml https://github.com/openailabs/proxy-api/raw/main/docker-compose.yml

docker compose up -d
```

### Run with docker

```
docker run --rm -it -e "RATELIMIT=1000"  -e "CHATGPT_URL=https://api.openai.com" -p 7002:3000 openailabs/proxy-api:main
```

```bash
Unable to find image 'openailabs/proxy-api:main' locally
main: Pulling from openailabs/proxy-api
7807d201190a: Pull complete 
35d28483ce56: Pull complete 
4ed58c7df644: Pull complete 
Digest: sha256:eb867791a09d8cd0a345c657243a220ca5193db17741a8bbbb85a09e3d0da1d7
Status: Downloaded newer image for openailabs/proxy-api:main
WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
Config: Config { chatgpt_url: "https://api.openai.com", ratelimit: 100 }
Listening on http://0.0.0.0:3000
```

### Invoke API with reverse proxy server

```bash
curl -sss --location 'http://localhost:7002/v1/chat/completions' \
--header 'Authorization: Bearer sk-xxx' \
--header 'Content-Type: application/json' \
--data '{
   "model": "gpt-3.5-turbo",
   "stream": false,
   "messages": [{"role": "user", "content": "Hello!"}]
 }'
```

```json
{
  "id": "chatcmpl-6tTtgpbwkPWsLqPmzt3UEVJKEXPN9",
  "object": "chat.completion",
  "created": 1678680984,
  "model": "gpt-3.5-turbo-0301",
  "usage": {
    "prompt_tokens": 9,
    "completion_tokens": 12,
    "total_tokens": 21
  },
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "\n\nHello there! How may I assist you today?"
      },
      "finish_reason": "stop",
      "index": 0
    }
  ]
}
```

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_

## Thanks

Very special thanks to original author [fuergaosi233](https://github.com/fuergaosi233/chatgpt-proxy-server)
