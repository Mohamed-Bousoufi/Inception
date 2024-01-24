FROM debian:bullseye

RUN apt update && apt install nginx -y

CMD ["nginx", "-g", "daemon off;"]