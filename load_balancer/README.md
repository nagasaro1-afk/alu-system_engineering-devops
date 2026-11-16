# Load Balancer

Doubles the web servers and puts them behind an HAProxy load balancer.

## Servers

| Name        | IP            | Role           |
|-------------|---------------|----------------|
| 7234-web-01 | 3.8.119.106   | Nginx web server |
| 7234-web-02 | 18.175.146.19 | Nginx web server |
| 7234-lb-01  | 52.56.209.234 | HAProxy load balancer |

## Files

| File | Description |
|------|-------------|
| `0-custom_http_response_header` | Installs Nginx and adds an `X-Served-By` response header containing the server's hostname. Run on `web-01` and `web-02`. |
| `1-install_load_balancer` | Installs HAProxy, distributes traffic to `web-01` and `web-02` with a roundrobin algorithm, and enables management through the init script. Run on `lb-01`. |

## Usage

Run each script on a fresh Ubuntu machine:

```bash
# on web-01 and web-02
./0-custom_http_response_header

# on lb-01
./1-install_load_balancer
```

Hostnames must be `7234-web-01`, `7234-web-02` and `7234-lb-01`.
Port 80 must be open in each server's security group.

## Verification

Each web server reports its own hostname:

```bash
curl -sI 3.8.119.106 | grep X-Served-By
curl -sI 18.175.146.19 | grep X-Served-By
```

Requests to the load balancer alternate between the two web servers:

```bash
for i in 1 2 3 4; do curl -sI 52.56.209.234 | grep X-Served-By; done
```

Expected output alternates between `X-Served-By: 7234-web-01` and `X-Served-By: 7234-web-02`.

## Managing HAProxy

```bash
sudo service haproxy status
sudo service haproxy restart
sudo haproxy -c -f /etc/haproxy/haproxy.cfg   # validate the config
```
