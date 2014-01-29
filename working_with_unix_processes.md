## [ Working with Unix Processes ](http://www.jstorimer.com/products/working-with-unix-processes)
### By Jesse Storimer

The book uses ruby to explore UNIX processes. Jesse also gives the corresponding man page the command maps to.

#### PID
* On any UNIX system. Just type *man <command_name>*
* Each process has a **PID**:

        puts Process.pid
    - maps to getpid(2)
* A global (albeit implicit) way to retreive the current pid is using *$$*
#### PPID
* Each process has a Parent process **PPID**:

        puts Process.ppid
    - maps to getppid(2)

#### File Descriptor
* In UNIX everything is treated as a file(resource). Any time a resource is opened within a process it is assigned a **file descriptor** number.
* File descriptor are *NOT* shared between unrelated processes. They live and die with the process they are bound to:

        passwd = File.open('/etc/passwd')
        puts passwd.fileno                  => 3
* In ruby, open resources are represented by IO class
* The fileno is the way kernel keeps track of the resource:

        passwd = File.open('/etc/passwd')
        puts passwd.fileno                  => 3

        hosts = File.open('/etc/hosts')
        puts hosts.fileno                   => 4

        passwd.close

        null = File.open('/dev/null')
        puts null.fileno                    => 3
* Key points from the above example:
    - File descriptors take the lowest unused value.
    - Once a descriptor is closed, the number becomes available again.
* *What* happened to 0,1 and 2 file descriptors?:

        puts STDIN.fileno       => 0
        puts STDOUT.fileno      => 1
        puts STDERR.fileno      => 2

* Ruby IO maps to open(2), close(2), read(2), write(2), pipe(2), fsync(2), stat(2) etc