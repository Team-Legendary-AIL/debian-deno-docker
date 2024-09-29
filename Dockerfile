FROM debian:bookworm-slim
COPY --from=denoland/deno:bin-2.0.0-rc.7 /deno /usr/local/bin/deno
RUN apt update
#RUN apt install ssh -y
RUN apt install git -y
RUN useradd -m -s /bin/bash deno
user deno
WORKDIR /app
ENTRYPOINT ["deno"]
CMD ["run", "-A", "main.ts"]