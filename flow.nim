import streams

type IntStreamObj = object of Stream
    i: int
type IntStream = ref IntStreamObj

type Task = ref object of RootObj
    name: string

type ProcTask[T] = ref object of Task
    pr: T
    input: IntStream
    output: IntStream
 
proc readfrom (t: ProcTask, i: int) =
  t.input.write(i)

proc writeto (t: ProcTask, i: ref int) =
  t.input.write(i)

proc run (t: ProcTask) = discard


proc add1(x: int): int {.procvar.} = x + 1

var t1 = ProcTask[type(add1)](pr: add1)

var a = 1
t1.readfrom(a)
var b = new(int)
b[] = 7
echo b[]
t1.writeto(b)
t1.run()


