# Kattis Speed (vim + python)

1 will generate this for you
* a solver template
* input
* output

All served within a sec.

# installation
 - put this file inside your kattis work dir
 - create symlink in /usr/local/bin or pick one from $PATH
   * cd /usr/local/bin
   * ln -s /home/kattis/1 1
 - put this to your vimrc
 ```
nnoremap <F5> :! cat in \| python %<cr>
 ```
# usage
 - cd /home/kattis
 - 1 problem-id

# example
 - 1 babybites

1 will download and made babybites input and open vim with two tab (input file + solution template)
Press F5 to run your solution against the input.
Enjoy.
