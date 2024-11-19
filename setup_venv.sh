#!/bin/env bash

VENV_DIR="ansible_venv"

echo "Creating virtual environment in '${VENV_DIR}'..."
python3 -m venv "${VENV_DIR}"

echo "Activating virtual environment..."
source "${VENV_DIR}/bin/activate"

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing Ansible..."
# pip install -r requirements.txt

echo "Virtual environment has been set up."
echo "To activate it, run: source ${VENV_DIR}/bin/activate"
echo "To deactivate, run: deactivate"
