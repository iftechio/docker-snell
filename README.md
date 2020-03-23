# docker-snell

## 使用方法

```bash
docker run -tid --name snell-server \
    -e PSK=keepmesecret \
    -p 8388:8388 \
    jiketeam/snell:latest
```

## 环境变量

| 名称 | 含义                                 | 默认值 |
|------|--------------------------------------|--------|
| PORT |                                      | 8388   |
| OBFS |                                      | http   |
| PSK  |                                      |        |
| ARGS | 除了 `-c` 外传给 snell-server 的参数 |        |

注: 如果 `PSK` 为空的话会在 snell-server 运行前生成。可以在容器运行后查看容器的日志来获得生成的 `PSK`
