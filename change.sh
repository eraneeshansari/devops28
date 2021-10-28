#!/bin/bash
sed "s/tag/$1/g" dep.yaml > new-dep.yaml

