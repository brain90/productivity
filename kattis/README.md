# Kattis Speed (vim + python)

1 will generate this for you
* a solution template
* input

All served within a sec. 

# Installation
- copy 0 and 1 file into your kattis work dir
- create symlink in /usr/local/bin or pick one from $PATH
   * cd /usr/local/bin
   * ln -s /home/kattis/1 1
- put this to your vimrc
 ```
nnoremap <F5> :! cat in \| python %<cr>
 ```
# Usage 
 - cd /your/kattis/directories
 - 1 {problem-id}

# Example

```tree@earth:~/kattis% 1 babybites```

1 will create babybites input and open vim with two tab (input file + solution template)

Press F5 to run your solution against the input.

Enjoy.
