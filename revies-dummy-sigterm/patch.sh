kubectl patch deployment reviews-v1 --patch '{"spec": {"template": {"spec": {"containers": [{"name": "reviews","image": "georgyturevich/misc-istio-reviews-dummy-sigterm:v4"}]}}}}'

kubectl patch svc productpage --patch '{"spec": {"template": {"spec": {"ports": [{"name": "reviews","image": "georgyturevich/misc-istio-reviews-dummy-sigterm:v4"}]}}}}'