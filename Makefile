IMAGE_NAME=tanvirperson/flask-app-experiment-1
KUBE_NAMESPACE=default

all: build push deploy

build: 
	docker build -t $(IMAGE_NAME) .

push: 
	docker push $(IMAGE_NAME)

deploy: 
	kubectl apply -f deployment.yaml --namespace $(KUBE_NAMESPACE) &&
	kubectl apply -f service.yaml --namespace $(KUBE_NAMESPACE)

clean: 
	kubectl delete -f deployment.yaml --namespace $(KUBE_NAMESPACE)
	kubectl delete -f service.yaml --namespace $(KUBE_NAMESPACE)

.PHONY: all build push deploy clean
