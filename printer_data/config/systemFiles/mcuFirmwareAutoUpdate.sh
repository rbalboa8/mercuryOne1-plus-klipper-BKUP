sudo service klipper stop
cd ~/klipper

make clean KCONFIG_CONFIG=octopus_max_ez_klipper.config
make menuconfig KCONFIG_CONFIG=octopus_max_ez_klipper.config
make -j4 KCONFIG_CONFIG=octopus_max_ez_klipper.config
read -p "Octopus Max EZ firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb-Klipper_stm32h723xx_250013000F51313236343430-if00
read -p "Octopus Max EZ firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"


make clean KCONFIG_CONFIG=orbitool_o2s_klipper.config
make menuconfig KCONFIG_CONFIG=orbitool_o2s_klipper.config
make -j4 KCONFIG_CONFIG=orbitool_o2s_klipper.config
read -p "Obitool O2S firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb-Klipper_stm32f072xb_Orbitool_O2S-if00
read -p "Obitool O2S firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"


make clean KCONFIG_CONFIG=rpi_klipper.config
make menuconfig KCONFIG_CONFIG=rpi_klipper.config
make -j4 KCONFIG_CONFIG=rpi_klipper.config
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make -j4 flash KCONFIG_CONFIG=rpi_klipper.config

sudo service klipper start
