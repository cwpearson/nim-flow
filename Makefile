TARGETS=flow

all: $(TARGETS)

flow: flow.nim
	nim c $^

clean:
	rm -f flow
