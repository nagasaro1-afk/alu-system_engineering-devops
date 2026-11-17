# firewall

Project covering firewall basics and configuring `ufw` on a web server.

## Files

| File | Description |
|------|-------------|
| `0-block_all_incoming_traffic_but` | Installs `ufw` and blocks all incoming traffic except TCP ports 22 (SSH), 80 (HTTP) and 443 (HTTPS) |

## Usage

    bash 0-block_all_incoming_traffic_but

Check the result with:

    sudo ufw status verbose

## Servers

| Name | IP |
|------|----|
| 7234-web-01 | 3.8.119.106 |
| 7234-web-02 | 18.175.146.19 |
| 7234-lb-01 | 52.56.209.234 |

## Author

Agasaro Nicia Greta
