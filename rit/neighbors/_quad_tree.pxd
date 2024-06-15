# Author: Thomas Moreau <thomas.moreau.2010@gmail.com>
# Author: Olivier Grisel <olivier.grisel@ensta.fr>

# See quad_tree.pyx for details.

cimport numpy as cnp

ctypedef cnp.npy_float32 DTYPE_t          # Type of X
ctypedef cnp.npy_intp SIZE_t              # Type for indices and counters
ctypedef cnp.npy_int32 INT32_t            # Signed 32 bit integer
ctypedef cnp.npy_uint32 UINT32_t          # Unsigned 32 bit integer

# XXX: Careful to not change the order of the arguments. It is important to
# have is_leaf and max_width consecutive as it permits to avoid padding by
# the compiler and keep the size coherent for both C and numpy data structures.
cdef struct Cell:
    # Base storage structure for cells in a QuadTree object

    # Tree structure
    SIZE_t parent              # Parent cell of this cell
    SIZE_t[8] children         # Array pointing to children of this cell

    # Cell description
    SIZE_t cell_id             # Id of the cell in the cells array in the Tree
    SIZE_t point_index         # Index of the point at this cell (only defined
    #                          # in non empty leaf)
    bint is_leaf               # Does this cell have children?
    DTYPE_t squared_max_width  # Squared value of the maximum width w
    SIZE_t depth               # Depth of the cell in the tree
    SIZE_t cumulative_size     # Number of points included in the subtree with
    #                          # this cell as a root.

    # Internal constants
    DTYPE_t[3] center          # Store the center for quick split of cells
    DTYPE_t[3] barycenter      # Keep track of the center of mass of the cell

    # Cell boundaries
    DTYPE_t[3] min_bounds      # Inferior boundaries of this cell (inclusive)
    DTYPE_t[3] max_bounds      # Superior boundaries of this cell (exclusive)