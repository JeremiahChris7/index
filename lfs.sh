#!/bin/bash
MOBO_ECAD_FILES="pnp/pcb/mobo/*.sch
pnp/pcb/mobo/*.pro
pnp/pcb/mobo/*.kicad_pcb
pnp/pcb/mobo/*.lib
pnp/pcb/mobo/fp-info-cache
pnp/pcb/mobo/fp-lib-table
pnp/pcb/mobo/sym-lib-table"

RINGLIGHT_ECAD_FILES="pnp/pcb/ringLight/*.sch
pnp/pcb/ringLight/*.pro
pnp/pcb/ringLight/*.kicad_pcb
pnp/pcb/ringLight/*.lib
pnp/pcb/ringLight/fp-info-cache
pnp/pcb/ringLight/fp-lib-table
pnp/pcb/ringLight/sym-lib-table"

FEEDER_ECAD_FILES="pnp/pcb/mobo/*.sch
feeder/pcb/mobo/*.pro
feeder/pcb/mobo/*.kicad_pcb
feeder/pcb/mobo/*.lib
feeder/pcb/mobo/*.fp-info-cache
feeder/pcb/mobo/*.fp-lib-table
feeder/pcb/mobo/*.sym-lib-table
feeder/pcb/feederFloor/*.sch
feeder/pcb/feederFloor/*.pro
feeder/pcb/feederFloor/*.kicad_pcb
feeder/pcb/feederFloor/*.lib
feeder/pcb/feederFloor/*.fp-info-cache
feeder/pcb/feederFloor/*.fp-lib-table
feeder/pcb/feederFloor/*.sym-lib-table
feeder/pcb/indexingWheel/*.sch
feeder/pcb/indexingWheel/*.pro
feeder/pcb/indexingWheel/*.kicad_pcb
feeder/pcb/indexingWheel/*.lib
feeder/pcb/indexingWheel/fp-info-cache
feeder/pcb/indexingWheel/fp-lib-table
feeder/pcb/indexingWheel/sym-lib-table"

FEEDER_MCAD_FILES="feeder/cad/*.FCStd"

OPENPNP_FILES="openpnp/packages.xml
openpnp/parts.xml
openpnp/machine.xml"

# Check if a valid operation was provided
case $1 in
  lock)
    ;;
  unlock)
    ;;
  *)
    printf "Invalid arguments\nUsage: ./lfs.sh <lock/unlock> <FILE-LIST> <LFS-OPTIONS>\n\nSupported file lists are:\n\tmobo_ecad : Index Motherboard ECAD files\n\tringlight_ecad : Index RingLight ECAD files\n\tfeeder_ecad: Index Feeder ECAD files\n\tfeeder_mcad: Index Feeder MCAD files\n\topenpnp: OpenPnP configuration files\n"
    exit;
    ;;
esac

# Check which file list to lock
case $2 in
  mobo_ecad)
    FILES=$MOBO_ECAD_FILES
    ;;
  feeder_ecad)
    FILES=$FEEDER_ECAD_FILES
    ;;
  feeder_mcad)
    FILES=$FEEDER_MCAD_FILES
    ;;
  ringlight_ecad)
    FILES=$RINGLIGHT_ECAD_FILES
    ;;
  openpnp)
    FILES=$OPENPNP_FILES
    ;;
  *)
    printf "Invalid arguments\nUsage: ./lfs.sh <lock/unlock> <FILE-LIST> <LFS-OPTIONS>\n\nSupported file lists are:\n\tmobo_ecad : Index Motherboard ECAD files\n\tringlight_ecad : Index RingLight ECAD files\n\tfeeder_ecad: Index Feeder ECAD files\n\tfeeder_mcad: Index Feeder MCAD files\n\topenpnp: OpenPnP configuration files\n"
    exit;
    ;;
esac

# Lock a file list
for f in $FILES
do
  git lfs $1 $3 $f &
done
wait
