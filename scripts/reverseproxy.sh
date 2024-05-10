#!/bin/bash
mkfifo reply
ncat -kl 8765 < reply | ncat 127.0.0.1 4567 > reply # listens on port 8765 and redirects to localhost:4567. Runs until C-c.
rm reply # cleanup after end

