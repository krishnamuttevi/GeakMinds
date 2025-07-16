import streamlit as st
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

from sklearn.datasets import load_iris
from sklearn.model_selection import learning_curve
from sklearn.ensemble import RandomForestClassifier

st.title("Learning Curve Analysis")
st.write("Visualize how your model learns as training data increases!")


iris = load_iris()
X = iris.data
y = iris.target

st.sidebar.header("Model Hyperparameters")
n_estimators = st.sidebar.slider('Number of Trees (n_estimators)', 10, 200, 50, step=10)
max_depth = st.sidebar.slider('Max Depth', 1, 20, 5)


model = RandomForestClassifier(n_estimators=n_estimators, max_depth=max_depth, random_state=42)


train_sizes, train_scores, test_scores = learning_curve(
    model, X, y, cv=5, scoring='accuracy',
    train_sizes=np.linspace(0.1, 1.0, 10),
    shuffle=True,
    random_state=42
)


train_mean = np.mean(train_scores, axis=1)
train_std = np.std(train_scores, axis=1)
test_mean = np.mean(test_scores, axis=1)
test_std = np.std(test_scores, axis=1)

fig, ax = plt.subplots(figsize=(8, 5))
ax.plot(train_sizes, train_mean, 'o-', color="blue", label="Training Score")
ax.plot(train_sizes, test_mean, 'o-', color="green", label="Cross-Validation Score")
ax.fill_between(train_sizes, train_mean - train_std, train_mean + train_std, alpha=0.1, color="blue")
ax.fill_between(train_sizes, test_mean - test_std, test_mean + test_std, alpha=0.1, color="green")

ax.set_title("Learning Curve")
ax.set_xlabel("Training Examples")
ax.set_ylabel("Accuracy")
ax.legend(loc="best")
ax.grid(True)

st.pyplot(fig)


st.subheader("Training Sizes")
st.write(train_sizes)

st.subheader("Mean Training Scores")
st.write(train_mean)

st.subheader("Mean Cross-Validation Scores")
st.write(test_mean)