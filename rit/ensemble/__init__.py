"""
The :mod:`rit.ensemble` module includes ensemble-based methods for
classification and regression.
"""
from ._forest import RandomForestClassifier
from ._forest import RandomForestRegressor

__all__ = [
    "RandomForestClassifier",
    "RandomForestRegressor",
]
