#!/bin/sh

if test ! -f "spigot.jar"; then
  echo "spigot.jar not found. Downloading..."
  wget -O spigot.jar https://yivesmirror.com/files/tacospigot/TacoSpigot-1.8.8.jar
fi

while true; do
  java -Xms1G -Xmx1G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 \
      -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 \
      -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs \
      -jar spigot.jar

  echo "Restarting server in 5 seconds. CTRL-C to cancel."
  sleep 5
  clear
done