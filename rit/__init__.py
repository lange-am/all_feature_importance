"""
RIT for Python
==================================

RIT is a Python module for ...
It aims to provide ...

See http://... for complete documentation.
"""
import logging
import os

logger = logging.getLogger(__name__)


# PEP0440 compatible formatted version, see:
# https://www.python.org/dev/peps/pep-0440/
#
# Generic release markers:
#   X.Y.0   # For first release after an increment in Y
#   X.Y.Z   # For bugfix releases
#
# Admissible pre-release markers:
#   X.Y.ZaN   # Alpha release
#   X.Y.ZbN   # Beta release
#   X.Y.ZrcN  # Release Candidate
#   X.Y.Z     # Final release
#
# Dev branch marker is: 'X.Y.dev' or 'X.Y.devN' where N is an integer.
# 'X.Y.dev0' is the canonical version of 'X.Y.dev'
#
__version__ = "0.1.0"


# On OSX, we can get a runtime error due to multiple OpenMP libraries loaded
# simultaneously. This can happen for instance when calling BLAS inside a
# prange. Setting the following environment variable allows multiple OpenMP
# libraries to be loaded. It should not degrade performances since we manually
# take care of potential over-subcription performance issues, in sections of
# the code where nested OpenMP loops can happen, by dynamically reconfiguring
# the inner OpenMP runtime to temporarily disable it while under the scope of
# the outer OpenMP parallel section.
os.environ.setdefault("KMP_DUPLICATE_LIB_OK", "True")

# Workaround issue discovered in intel-openmp 2019.5:
# https://github.com/ContinuumIO/anaconda-issues/issues/11294
os.environ.setdefault("KMP_INIT_AT_FORK", "FALSE")

from sklearn.base import clone

__all__ = [
    "ensemble",
    "tree",
    "clone",
]