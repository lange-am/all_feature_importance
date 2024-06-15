"""
The :mod:`sklearn.tree` module includes decision tree-based models for
classification and regression.
"""

from ._classes import (
    BaseDecisionTree,
    DecisionTreeClassifier,
    DecisionTreeRegressor,
)

__all__ = [
    "BaseDecisionTree",
    "DecisionTreeClassifier",
    "DecisionTreeRegressor",
]
