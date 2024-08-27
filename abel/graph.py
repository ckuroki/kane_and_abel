import matplotlib.pyplot as plt

def plot(scores, mean_scores, file_name='graph.png'):
    plt.clf()
    plt.title('Abel training...')
    plt.xlabel('Number of Games')
    plt.ylabel('Score')
    plt.plot(scores, label="Scores")
    plt.plot(mean_scores, label="Mean Scores")
    plt.ylim(ymin=0)
    plt.text(len(scores)-1, scores[-1], str(scores[-1]))
    plt.text(len(mean_scores)-1, mean_scores[-1], str(mean_scores[-1]))
    plt.legend()

    # Save the plot to a file
    plt.savefig(file_name)
    print(f"Graph saved to {file_name}")

def run():
    scores = []
    mean_scores = []
    total = 0

    with open('long_run.log', 'r') as file:
        for line in file:
            fields = line.split()
            game_number = int(fields[1])
            score = int(fields[3])

            scores.append(score)
            total += score
            mean = total / game_number
            mean_scores.append(mean)
    print(scores,mean_scores)
    # Generate and save the plot
    plot(scores, mean_scores, 'training_graph.png')

run()

