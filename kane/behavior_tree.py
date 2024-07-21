
# Base class for Behavior Tree nodes
class Node:
    def run(self):
        raise NotImplementedError("This method should be overridden.")

# Composite nodes
class Selector(Node):
    """Runs each child until one succeeds."""
    def __init__(self, children):
        self.children = children

    def run(self):
        for child in self.children:
            if child.run():
                return True
        return False

class Sequence(Node):
    """Runs each child until one fails."""
    def __init__(self, children):
        self.children = children

    def run(self):
        for child in self.children:
            if not child.run():
                return False
        return True

# Leaf nodes
class ActionNode(Node):
    """Executes an action."""
    def __init__(self, action):
        self.action = action

    def run(self):
        return self.action()

class ConditionNode(Node):
    """Checks a condition."""
    def __init__(self, condition):
        self.condition = condition

    def run(self):
        return self.condition()

