from gdb.printing import PrettyPrinter, register_pretty_printer
import gdb
import uuid

class UuidListDumpCmd(gdb.Command):
    """Prints the ListNode from our example in a nice format!"""

    def __init__(self):
        super(UuidListDumpCmd, self).__init__(
            "uuid_list_dump", gdb.COMMAND_USER
        )

    def _uuid_list_to_str(self, val):
        """Walk through the UuidListNode list.

        We will simply follow the 'next' pointers until we encounter NULL
        """
        idx = 0
        node_ptr = val
        result = ""
        while node_ptr != 0:
            uuid = node_ptr["uuid"]
            result += "\n%d: Addr: 0x%x, uuid: %s" % (idx, node_ptr, uuid)
            node_ptr = node_ptr["next"]
            idx += 1
        result = ("Found a Linked List with %d nodes:" % idx) + result
        return result

    def complete(self, text, word):
        # We expect the argument passed to be a symbol so fallback to the
        # internal tab-completion handler for symbols
        return gdb.COMPLETE_SYMBOL

    def invoke(self, args, from_tty):
        # We can pass args here and use Python CLI utilities like argparse
        # to do argument parsing
        print("Args Passed: %s" % args)

        node_ptr_val = gdb.parse_and_eval(args)
        if str(node_ptr_val.type) != "UuidListNode *":
            print("Expected pointer argument of type (UuidListNode *)")
            return

        print(self._uuid_list_to_str(node_ptr_val))
