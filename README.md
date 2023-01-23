# k8s_rasa

Rasa K8S deployment example using the rasa init.

To run you need to setup colima on your machine (check the docs for brew formulae).
You can use kind alternatively

Step are as follows:

1. Create a K8S cluster: `colima start` (or `kind create cluster`) 
2. Create a Namespace: `kubectl create namespace rasa`
3. Apply manifest: `kubectl --namespace rasa apply -f manifest.yaml`
4. We can check if it goes well by running : `kubectl --namespace rasa get pods`
6. Get the services (get IP address): `kubectl --namespace rasa get svc`
7. Now, we can connect this address to our local machine (for example) by port-forwarding it: `kubectl --namespace rasa port-forward svc/rasa-web 8080:8080` (**rasa-web** comes from the name of service defined in manifest.yaml)
8. Finally, you can *post* (I use postman, a curl is ok also) request to your loadbalancer as you need using official rasa api docs (I use rest api posting this url: `http://0.0.0.0:8080/webhooks/rest/webhook`
You can check the logs of the pods to find the rasa logs of the one who handled it by doing this:
`kubectl  --namespace demo logs <name-of-pod-got-from-step-4.>`

