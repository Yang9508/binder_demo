# calculate mean of a matrix
import numpy as np
import matplotlib.pyplot as plt
a = np.array([[1, 2, 3], 
			  [2, 3, 4],
			  [6, 9, 8]])
mean_a = np.mean(a, axis=0)
print(mean_a)

# save the mean as .csv file
#np.savetxt('demo_matrix.csv', mean_a, delimiter=',')

# draw figure
# year=[1990, 2000, 2010]
# plt.plot(year,mean_a)

# # save the figure as .png file
# plt.savefig('demo_plot.png')

# # show figure
# plt.show()