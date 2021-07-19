# Projects
spotty: a thingy to get around ads that I've worked on for far too long!
current things:
Both spotty and spotty_test now have handlers, which lets them quit normally!
Unfortunately quitting spotify (the app) now doesn't work nicely?

Also there's some times that an ad plays through for a sec because the script stops responding, but the issue is resolved by clicking on the spotty icon. As such, I'm guessing there's a memory leak or mismanagement somewhere that causes spotty to space out.
    To solve this I'm going to try stripping back the test branch
