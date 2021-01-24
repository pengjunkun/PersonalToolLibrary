# -*- coding: utf-8 -*-
import matplotlib.pyplot as plt
import numpy as np

x = np.random.uniform(-1, 1, 4)
y = np.random.uniform(-1, 1, 4)

fig,axes=plt.subplots(2,1)
ax=axes[0]
p1, = ax.plot([1, 2, 3])
p2, = ax.plot([3, 2, 1])


p3, = ax.plot([1, 2, 3]*2)
p4, = ax.plot([3, 2, 1]*3)
l1 = ax.legend([p2, p1], ["line 2", "line 1"], loc='upper left')
# This removes l1 from the axes.
# legend2=ax.legend([p3, p4], ['label', 'label1'], loc='lower right')
# Add l1 as a separate artist to the axes
# ax.add_artist(l1)
# plt.gca().add_artist(legend2)
plt.show()