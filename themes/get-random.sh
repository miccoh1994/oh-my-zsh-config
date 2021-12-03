getRandom () {
  my_random=RANDOM
}

getRandomFromGetRandom () {
   getRandom
   echo "$my_random"
}