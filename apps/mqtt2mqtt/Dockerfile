ARG  from=golang:alpine
FROM ${from}


# 指定 工作位置為 /app
WORKDIR /app

# 複製程式至 /app
COPY . .

# pre-build
RUN go mod download

# build app
RUN go build -o main .

# expose port to 7999 要對應 程式的 listen port
EXPOSE 7999

# run app
CMD ["./main"]