GO_MODULE = "github.com/fbriansyah/my-grpc-proto"

.PHONY: clean
clean:
	@rm -rf ./protogen
	@mkdir ./protogen/go

.PHONY: protoc-go
protoc-go:
	@protoc --go_opt=module=${GO_MODULE} --go_out=. \
	--go-grpc_opt=module=${GO_MODULE} --go-grpc_out=. \
	./proto/hello/*.proto ./proto/payment/*.proto ./proto/transaction/*.proto \

.PHONY: build
build: clean protoc-go

.PHONY: pipeline-init
pipeline-init:
	@sudo apt-get install -y protobuf-compiler golang-goprotobuf-dev
	@go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	@go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest