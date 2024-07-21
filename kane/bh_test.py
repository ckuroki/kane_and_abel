import unittest
import behavior_tree

# Define some functions to replace the lambdas
def condition_true():
    return True

def condition_false():
    return False

def action_success():
    return True

def action_failure():
    return False

# Test class for the behavior tree nodes
class TestBehaviorTree(unittest.TestCase):
    def test_selector_success(self):
        # Create a selector where the first condition fails and the second succeeds
        condition1 = behavior_tree.ConditionNode(condition_false)
        condition2 = behavior_tree.ConditionNode(condition_true)
        selector = behavior_tree.Selector([condition1, condition2])

        # The selector should return True because condition2 succeeds
        self.assertTrue(selector.run())

    def test_selector_failure(self):
        # Create a selector where both conditions fail
        condition1 = behavior_tree.ConditionNode(condition_false)
        condition2 = behavior_tree.ConditionNode(condition_false)
        selector = behavior_tree.Selector([condition1, condition2])

        # The selector should return False because all children fail
        self.assertFalse(selector.run())

    def test_sequence_success(self):
        # Create a sequence where both conditions succeed
        condition1 = behavior_tree.ConditionNode(condition_true)
        condition2 = behavior_tree.ConditionNode(condition_true)
        sequence = behavior_tree.Sequence([condition1, condition2])

        # The sequence should return True because all children succeed
        self.assertTrue(sequence.run())

    def test_sequence_failure(self):
        # Create a sequence where the first condition succeeds and the second fails
        condition1 = behavior_tree.ConditionNode(condition_true)
        condition2 = behavior_tree.ConditionNode(condition_false)
        sequence = behavior_tree.Sequence([condition1, condition2])

        # The sequence should return False because condition2 fails
        self.assertFalse(sequence.run())

    def test_action_node(self):
        # Create an action node with an action that returns True
        action = behavior_tree.ActionNode(action_success)

        # The action node should return True
        self.assertTrue(action.run())

        # Create an action node with an action that returns False
        action = behavior_tree.ActionNode(action_failure)

        # The action node should return False
        self.assertFalse(action.run())

    def test_complex_behavior_tree(self):
        # Complex tree: Selector with two sequences
        # First sequence fails, second sequence succeeds
        condition1 = behavior_tree.ConditionNode(condition_false)
        action1 = behavior_tree.ActionNode(action_failure)
        sequence1 = behavior_tree.Sequence([condition1, action1])

        condition2 = behavior_tree.ConditionNode(condition_true)
        action2 = behavior_tree.ActionNode(action_success)
        sequence2 = behavior_tree.Sequence([condition2, action2])

        # Root selector
        root = behavior_tree.Selector([sequence1, sequence2])

        # The root should return True because the second sequence succeeds
        self.assertTrue(root.run())

if __name__ == '__main__':
    unittest.main()

