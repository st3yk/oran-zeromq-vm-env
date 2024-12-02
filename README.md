# O-RAN NearRT RIC Installation

This repository provides a setup for installing O-RAN NearRT RIC (Near Real-Time RAN Intelligent Controller), based on the [srsran/oran-sc-ric](https://github.com/srsran/oran-sc-ric) and [srsran/srsRAN_Project](https://github.com/srsran/srsRAN_Project) projects. The installation is automated using Vagrant, VirtualBox, and Ansible, along with a virtual environment for Ansible provisioning. \
Provisioning follows the instructions provided in [srsran documentation](https://docs.srsran.com/projects/project/en/latest/tutorials/source/near-rt-ric/source/index.html). \
The main motivation behind this project is to eliminate the issues caused by differences between the environment used by the creators and the one you're working with.

## Requirements

- **Vagrant**: Used for managing virtual machine lifecycle.
- **VirtualBox**: Used as the provider for the Vagrant VM.
- **Python 3**: Required for creating the virtual environment.

### Installation

Follow these steps to get the environment up and running:

1. **Clone the Repository**:
   ```bash
   $ git clone https://github.com/st3yk/oran-zeromq-vm-env
   $ cd oran-zeromq-vm-env
   ```

2. **Setup and activate the Virtual Environment**: \
    Run the setup_venv.sh script to set up the Ansible virtual environment.
    ```bash
    $ ./setup_venv.sh
    $ source ansible_venv/bin/activate
    ```

3. **Vagrant+Ansible provisoning**: \
    The project uses Vagrant for provisioning a VM with bento/ubuntu-22.04 as the base box. To start and provision the virtual machine, run:
    ```bash
    (ansible-venv) $ vagrant up
    ```
    If it is needed to run ansible again use:
    ```bash
    (ansible-venv) $ vagrant provision
    ```
4. **Build gnb**: \
    Follow [srsran documentation](https://docs.srsran.com/projects/project/en/latest/tutorials/source/near-rt-ric/source/index.html)
    ```bash
    $ vagrant ssh
    vagrant$ cd /oran/srsRAN_Project
    vagrant$ mkdir build
    vagrant$ cd build
    vagrant$ cmake ../ -DENABLE_EXPORT=ON -DENABLE_ZEROMQ=ON
    vagrant$ make -j`nproc`
    ```
5. **Follow the documentation to run it all!** \
    Follow [srsran documentation](https://docs.srsran.com/projects/project/en/latest/tutorials/source/near-rt-ric/source/index.html) \
    Start: Open5GS, oran-sc-ric, gnb and ue.
    - srsRAN_Project is in path: /oran/srsRAN_Project
    - oran-ric-sc is in path: /oran/oran-ric-sc