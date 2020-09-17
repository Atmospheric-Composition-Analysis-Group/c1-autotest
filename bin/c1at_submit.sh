#!/bin/bash

function submit() {
   submission_output=$(c1at_subst.sh $@ | bsub)
   job=$(echo $submission_output | sed 's/.*Job <\([0-9][0-9]*\)> is submitted.*/\1/')
   echo $job
}

function submit_after() {
   prior=$1
   shift
   submission_output=$(c1at_subst.sh $@ | bsub -w "done($prior)")
   job=$(echo $submission_output | sed 's/.*Job <\([0-9][0-9]*\)> is submitted.*/\1/')
   echo $job
}


job1=$(submit templates/job1.bsub sample.txt)

echo "Submitted job1: $job1"

job2=$(submit_after $job1 templates/job2.bsub sample.txt)

echo "Submitted job2: $job2"