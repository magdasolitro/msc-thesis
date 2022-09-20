#!/bin/bash

set -euo pipefail

sudo docker compose build kleespectre_mag
sudo docker compose run kleespectre_mag bash
