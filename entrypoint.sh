#!/bin/bash

echo "Generate static files"
hugo 

echo "Running server"
hugo server --bind 0.0.0.0 --navigateToChanged --templateMetrics --buildDrafts