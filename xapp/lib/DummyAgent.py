import random
from collections import deque


class DummyAgent:
    def __init__(self):
        self.memory = deque(maxlen=20)
        self.prb_ratio_values = [1, 5, 10, 20, 50]
        self.batch_size = 20

    def select_action(self, state):
        return random.randint(0, len(self.prb_ratio_values) - 1)

    def store_transition(self, state, action, next_state, reward):
        self.memory.append((state, action, reward, next_state))

    def learn(self):
        if len(self.memory) < self.batch_size:
            print("Dummy training step...")

    def calculate_reward(self, state, action, next_state):
        # Calculate the reward of the action taken
        # i.e. reward for increasing throughput, penalty for exceeding PRB Quotas
        throughput_index = 11
        reward = next_state[throughput_index] - state[throughput_index]
        print(f"Current - Previous DL Throughput: {reward}, action: {action}")

        # Throughput decrease penalty:
        if reward < 0:
            reward -= 0.1

        # Resource usage penalty:
        reward -= 0.01 * self.prb_ratio_values[action]

        return reward

    def evaluate_agent(self):
        pass
