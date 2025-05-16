# !/usr/bin/env python3

import numpy as np
import argparse
import pathlib
import sys
import hjson
import os
import subprocess
import itertools

# Add data utility path
sys.path.append(os.path.join(os.path.dirname(__file__), "../../../../../../../../util/sim/"))
from data_utils import variable_attributes, format_scalar_definition, format_vector_definition  # noqa E402

bender_command = subprocess.run(['bender', 'path', 'snitch_cluster'],
                                capture_output=True, text=True)
snax_utils_path = bender_command.stdout.strip()

sys.path.append(snax_utils_path + "/util/sim/")

from snax_utils import max_pooling  # noqa E402
np.random.seed(42)


# Add stdint.h header
def emit_header_file(**kwargs):
    emit_str = "#include <stdint.h>\n\n"
    emit_str += "#include <stdbool.h> \n\n"
    # emit_str += emit_data_xcluster(**kwargs)
    emit_str += emit_random_data_header(**kwargs)
    return emit_str


MIN = -128
MAX = 127


def my_format_vector_definition(type, uid, vector, cols, alignment=None, section=None):
    attributes = variable_attributes(alignment, section)
    s = f'{type} {uid}[{len(vector)}] {attributes} = ' + '{\n'
    
    # Determine the width needed for nice alignment
    max_width = max(len(f'{el}') if type != 'char' else len(f'0x{el:02x}') for el in vector)

    for i in range(0, len(vector), cols):
        row = vector[i:i+cols]
        row_str_list = []
        for el in row:
            if type == 'char':
                el_str = f'0x{el:02x}'
            else:
                el_str = f'{el}'
            # Right-align each element to max_width
            row_str_list.append(el_str.rjust(max_width))
        row_str = ', '.join(row_str_list)
        s += f'\t{row_str},\n'

    s = s.rstrip(',\n') + '\n};'  # Remove last comma
    return s


def pad_to_six(elems, pad_value):
    return elems + [pad_value] * (6 - len(elems))

# def data_reshuffler_golden_model_6D(
#     tempLoop0, tempLoop1, tempLoop2, tempLoop3, tempLoop4, tempLoop5,
#     spatial_len,
#     tempStride0, tempStride1, tempStride2, tempStride3, tempStride4, tempStride5,
#     spatialStride,
#     data,
#     int32=False,
# ):
#     # Loop bounds
#     temporal_loops = [tempLoop0, tempLoop1, tempLoop2, tempLoop3, tempLoop4, tempLoop5]
#     temporal_strides = [tempStride0, tempStride1, tempStride2, tempStride3, tempStride4, tempStride5]

#     # Total elements
#     total_temporal = np.prod(temporal_loops)
#     total_elements = total_temporal * spatial_len

#     # Output array
#     dtype = np.int32 if int32 else np.int8
#     result_array = np.zeros(total_elements, dtype=dtype)

#     # Iterate over temporal coordinates (6D nested loops flattened using itertools.product)
#     for temporal_index, loop_indices in enumerate(itertools.product(*[range(l) for l in temporal_loops])):
#         # Compute base address in the input data for this temporal block
#         base_offset = sum([i * s for i, s in zip(loop_indices, temporal_strides)])

#         # output address calculation with coutinued increment
#         # input address calculation with strided layout 
#         for s in range(spatial_len):
#             result_index = temporal_index * spatial_len + s
#             input_index = base_offset + s * spatialStride
#             result_array[result_index] = data[input_index]

#     return result_array.ravel()

def data_reshuffler_golden_model_6D(
    tempLoop, spatial_len, tempStride, spatialStride, data, 
    int32=False
):
    total_elements = np.prod(tempLoop) * spatial_len
    dtype = np.int32 if int32 else np.int8
    result_array = np.zeros(total_elements, dtype=dtype)

    for temporal_index, loop_indices in enumerate(itertools.product(*[range(l) for l in reversed(tempLoop)])):
        base_offset = sum(i * s for i, s in zip(loop_indices, reversed(tempStride)))
        for s in range(spatial_len):
            result_index = temporal_index * spatial_len + s
            input_index = base_offset + s * spatialStride
            result_array[result_index] = data[input_index]
    return result_array.ravel()

def data_reshuffler_golden_model_6D_packed(
    tempLoop, spatial_len, tempStride, spatialStride, data, 
    int32=False
):
    total_elements = np.prod(tempLoop) * spatial_len * 8
    dtype = np.int32 if int32 else np.int8
    result_array = np.zeros(total_elements, dtype=dtype)

    for temporal_index, loop_indices in enumerate(itertools.product(*[range(l) for l in reversed(tempLoop)])):
        base_offset = sum(i * s for i, s in zip(loop_indices, reversed(tempStride)))
        for s in range(spatial_len):
            result_index = (temporal_index * spatial_len + s) * 8
            input_index = base_offset + s * spatialStride
            result_array[result_index:result_index+8] = data[input_index:input_index+8]
    return result_array.ravel()


# def emit_data_xcluster(**kwargs):
#     data_str = []

#     # Generating loop bounds settings
#     data_str += [
#         format_scalar_definition("int32_t", "tempLoop0_in", kwargs["tempLoop0_in"]),
#         format_scalar_definition("int32_t", "tempLoop1_in", kwargs["tempLoop1_in"]),
#         format_scalar_definition("int32_t", "tempLoop2_in", kwargs["tempLoop2_in"]),
#         format_scalar_definition("int32_t", "tempLoop3_in", kwargs["tempLoop3_in"]),
#         format_scalar_definition("int32_t", "tempLoop4_in", kwargs["tempLoop4_in"]),
#         format_scalar_definition("int32_t", "tempLoop5_in", kwargs["tempLoop5_in"]),

#         format_scalar_definition("int32_t", "tempLoop0_out", kwargs["tempLoop0_out"]),
#         format_scalar_definition("int32_t", "tempLoop1_out", kwargs["tempLoop1_out"]),
#         format_scalar_definition("int32_t", "tempLoop2_out", kwargs["tempLoop2_out"]),
#         format_scalar_definition("int32_t", "tempLoop3_out", kwargs["tempLoop3_out"]),
#         format_scalar_definition("int32_t", "tempLoop4_out", kwargs["tempLoop4_out"]),
#         format_scalar_definition("int32_t", "tempLoop5_out", kwargs["tempLoop5_out"]),
        
#         # format_scalar_definition(
#         #     "int32_t",
#         #     "data_transfer_len",
#         #     kwargs["tempLoop0_in"] * kwargs["tempLoop1_in"] * kwargs["tempLoop2_in"] 
#         #     * kwargs["tempLoop3_in"] * kwargs["tempLoop4_in"] * kwargs["tempLoop5_in"]
#         #     * 8
#         # ),
#     ]

#     data_transfer_len = (
#         kwargs["tempLoop0_in"] * kwargs["tempLoop1_in"] * kwargs["tempLoop2_in"] 
#         * kwargs["tempLoop3_in"] * kwargs["tempLoop4_in"] * kwargs["tempLoop5_in"]
#         * 8
#     )

#     data_str += [
#         format_scalar_definition("int32_t", "data_transfer_len", data_transfer_len),
#     ]


#     # Generating temporal strides settings
#     data_str += [
#         # data reshuffler input strides
#         format_scalar_definition("int32_t", "tempStride0_in", kwargs["tempStride0_in"]),
#         format_scalar_definition("int32_t", "tempStride1_in", kwargs["tempStride1_in"]),
#         format_scalar_definition("int32_t", "tempStride2_in", kwargs["tempStride2_in"]),
#         format_scalar_definition("int32_t", "tempStride3_in", kwargs["tempStride3_in"]),
#         format_scalar_definition("int32_t", "tempStride4_in", kwargs["tempStride4_in"]),
#         format_scalar_definition("int32_t", "tempStride5_in", kwargs["tempStride5_in"]),
#         format_scalar_definition("int32_t", "spatialStride_in", kwargs["spatialStride_in"]),
#         # data reshuffler output strides
#         format_scalar_definition("int32_t", "tempStride0_out", kwargs["tempStride0_out"]),
#         format_scalar_definition("int32_t", "tempStride1_out", kwargs["tempStride1_out"]),
#         format_scalar_definition("int32_t", "tempStride2_out", kwargs["tempStride2_out"]),
#         format_scalar_definition("int32_t", "tempStride3_out", kwargs["tempStride3_out"]),
#         format_scalar_definition("int32_t", "tempStride4_out", kwargs["tempStride4_out"]),
#         format_scalar_definition("int32_t", "tempStride5_out", kwargs["tempStride5_out"]),
#         format_scalar_definition("int32_t", "spatialStride_out", kwargs["spatialStride_out"]),

#         # Generating base address pointers
#         format_scalar_definition("int32_t", "delta_local_in", kwargs["delta_local_in"]),
#         format_scalar_definition("int32_t", "delta_local_out", kwargs["delta_local_out"]),
#     ]

#     # Generating random input data vector
#     data_in = np.random.randint(MIN, MAX, kwargs["test_data_len"], dtype=np.int8)
    
#     # data_str += format_vector_definition("int8_t", "test_data", data_in)

#     c_golden = data_reshuffler_golden_model_6D(
#                     kwargs["tempLoop0_in"],
#                     kwargs["tempLoop1_in"],
#                     kwargs["tempLoop2_in"],
#                     kwargs["tempLoop3_in"],
#                     kwargs["tempLoop4_in"],
#                     kwargs["tempLoop5_in"],
#                     8, # spatial len
#                     kwargs["tempStride0_in"],
#                     kwargs["tempStride1_in"],
#                     kwargs["tempStride2_in"],
#                     kwargs["tempStride3_in"],
#                     kwargs["tempStride4_in"],
#                     kwargs["tempStride5_in"],
#                     kwargs["spatialStride_in"],
#                     data_in,
#                 )

#     #  data_str += [
#     #         format_vector_definition("int8_t", "C_golden", c_golden.reshape(-1))
#     #     ]

#     # Writing testing data and golden data into data.h
#     data_str += [format_vector_definition("int8_t", "Test_Data", data_in)]
#     data_str += [format_vector_definition("int32_t", "Test_Data_Len", kwargs["test_data_len"])]
#     data_str += [format_vector_definition("int8_t", "C_golden", c_golden)]

#     data_str = "\n\n".join(data_str)
    
#     return data_str

def generate_matching_loop_shapes(ndim_in, ndim_out, total_elems):
    def make_loop(ndim, total):
        loops = [8] # 4 only for test idma 2d
        prod = total//8 # 4 only for test idma 2d
        while len(loops) < ndim - 1:
            factors = [f for f in range(1, prod + 1) if prod % f == 0]
            factor = np.random.choice(factors)
            loops.append(factor)
            prod //= factor
        loops.append(prod)  # fill the last dim with whatever's left
        return loops


    input_shape = make_loop(ndim_in, total_elems)
    output_shape = make_loop(ndim_out, total_elems)
    return input_shape, output_shape


def generate_random_strides(ndim, base=1, max_stride=3):  #256
    return [np.random.randint(base, max_stride) * 8 for _ in range(ndim)]


def generate_non_overlapping_strides(loops, spatial_len, spatial_stride=1):
    strides = []
    running = spatial_len * spatial_stride
    for size in reversed(loops[1:]):
        strides.insert(0, running)
        running *= size
    strides.insert(0, running)
    return strides

def compute_max_address(temp_loops, temp_strides, spatial_len, spatial_stride):
    max_addr = 0
    for indices in itertools.product(*[range(l) for l in temp_loops]):
        base = sum(i * s for i, s in zip(indices, temp_strides))
        max_elem = base + (spatial_len - 1) * spatial_stride
        max_addr = max(max_addr, max_elem)
    return max_addr + 1  # +1 to make it inclusive

def compute_max_address_non_overlapping(temp_loops, temp_strides, spatial_len, spatial_stride):
    total_temporal_iterations = np.prod(temp_loops)
    return total_temporal_iterations * spatial_len * spatial_stride

def pad_elements_with_zeros(input_vector, element_size_bits=8, pad_to_bits=64):
    """
    Pads each element in the input vector with zeros to fill pad_to_bits size.
    Each element is treated as element_size_bits, and padded with zeros to reach pad_to_bits.
    :param input_vector: List of int8 elements
    :param element_size_bits: Size of each element in bits (default 8 bits for int8_t)
    :param pad_to_bits: Target size for padding in bits (default 64 bits)
    :return: New list with padded elements
    """
    elements_per_slot = pad_to_bits // element_size_bits
    padded_vector = []
    for el in input_vector:
        padded_vector.append(el)
        padded_vector.extend([0] * (elements_per_slot - 1))
    return padded_vector

def duplicate_left_right(matrix):
    duplicated_matrix = []
    for row in matrix:
        duplicated_row = np.hstack((row, row))  # Duplicate the row left and right
        duplicated_matrix.append(duplicated_row)  
    return duplicated_matrix


def emit_random_data_header(**kwargs):

    matrix_rows = kwargs["matrix_rows"]
    matrix_cols = kwargs["matrix_cols"]

    total_elems = (
            kwargs["matrix_rows"]
            * kwargs["matrix_cols"]
        )
    
    systolic_dim = kwargs["systolic_dim"]


    header_lines = []
    for i in range(6):
        header_lines.append(format_scalar_definition("int32_t", f"tempLoop{i}_in", kwargs[f"tempLoop{i}_in"]))
    for i in range(6):
        header_lines.append(format_scalar_definition("int32_t", f"tempStride{i}_in", kwargs[f"tempStride{i}_in"]))
    for i in range(6):
        header_lines.append(format_scalar_definition("int32_t", f"tempLoop{i}_out", kwargs[f"tempLoop{i}_out"]))
    for i in range(6):
        header_lines.append(format_scalar_definition("int32_t", f"tempStride{i}_out", kwargs[f"tempStride{i}_out"]))
    header_lines += [
        format_scalar_definition("int32_t", "spatialStride_in", kwargs["spatialStride_in"]),
        format_scalar_definition("int32_t", "spatialStride_out", kwargs["spatialStride_out"]),
        format_scalar_definition("int32_t", "data_transfer_len", total_elems),
    ]
    # Generate random data
    data = np.random.randint(MIN, MAX, total_elems, dtype=np.int8)
    matrix = data.reshape((matrix_rows, matrix_cols))

    systolic_rows = (systolic_dim // 8 - 1) + matrix_rows  # 8 bytes per bank
    systolic_cols = matrix_cols

    systolic_matrix = np.zeros((systolic_rows, systolic_cols), dtype=np.int8)
    
    for i in range(systolic_cols//8):
        systolic_matrix[i : matrix_rows + i, i*8 : i*8+8] = matrix[:, i*8 : i*8+8]


    header_lines += [
        my_format_vector_definition("int8_t", "Feature_Matrix", matrix.reshape(-1), cols=matrix_cols),
        my_format_vector_definition("int8_t", "Systolic_Data", systolic_matrix.reshape(-1), cols=systolic_cols)
    ]

    padded_length = ((systolic_rows*systolic_cols + 256 - 1) // 256) * 256
    pad_size = padded_length - systolic_rows*systolic_cols
    padded_matrix = np.pad(systolic_matrix.reshape(-1), (0, pad_size), mode='constant')

    tcdm_matrix = padded_matrix.reshape((-1, 256))

    # if tcdm_matrix.shape[1] < 256:
    #     padding_cols = 256 - tcdm_matrix.shape[1]
    #     tcdm_matrix = np.pad(tcdm_matrix, ((0, 0), (0, padding_cols)), mode='constant', constant_values=0)
        

    header_lines += [
        format_scalar_definition("int32_t", "Test_Data_Rows", tcdm_matrix.shape[0]),
        my_format_vector_definition("int8_t", "Test_Data", tcdm_matrix.reshape(-1), cols=256)
    ]

    input_loops = [kwargs[f"tempLoop{i}_in"] for i in range(6)]
    output_loops = [kwargs[f"tempLoop{i}_out"] for i in range(6)]
    input_strides = [kwargs[f"tempStride{i}_in"] for i in range(6)]
    output_strides = [kwargs[f"tempStride{i}_out"] for i in range(6)]
    spatial_len = 8 # default
    spatial_stride_in = kwargs["spatialStride_in"]
    spatial_stride_out = kwargs["spatialStride_out"]

    c_golden = data_reshuffler_golden_model_6D_packed(
        input_loops,
        spatial_len,
        input_strides,
        spatial_stride_in,
        tcdm_matrix.reshape(-1),
    )

    header_lines += [
        my_format_vector_definition("int8_t", "C_golden", c_golden, cols=matrix_cols)
    ]



    # spatial_len = 8
    # # total_blocks = np.random.randint(512, 2048) // 64  # 4KB to 16KB for outstanding AXI 
    # # total_blocks *= 64  # Make sure total data is divisible by 64 
    # total_blocks = 128 

    # spatial_stride_in = 8
    # spatial_stride_out = 8

    # input_loops, output_loops = generate_matching_loop_shapes(ndim_in, ndim_out, total_blocks)
    # assert np.prod(input_loops) == np.prod(output_loops), f"Loop product mismatch: input={np.prod(input_loops)}, output={np.prod(output_loops)}"

    # output_loops = input_loops # ONLY FOR TEST IDMA 2D TRANSER!!!

    # input_strides = pad_to_six(generate_non_overlapping_strides(input_loops,spatial_len,spatial_stride_in), 0)
    # output_strides = pad_to_six(generate_non_overlapping_strides(output_loops,spatial_len,spatial_stride_out), 0)

    # # input_strides = pad_to_six(generate_random_strides(ndim_in), 0)
    # # output_strides = pad_to_six(generate_random_strides(ndim_out), 0)

    # input_loops = pad_to_six(input_loops, 1)
    # output_loops = pad_to_six(output_loops, 1)




    # transfer_data_len = np.prod(input_loops) * spatial_len
    # min_input_size = compute_max_address_non_overlapping(input_loops, input_strides, spatial_len, spatial_stride_in)
    # test_data_len = min_input_size
    # data_in = np.random.randint(MIN, MAX, test_data_len, dtype=np.int8)

    # min_output_size = compute_max_address_non_overlapping(output_loops, output_strides, spatial_len, spatial_stride_out)
    # output_data_span = min_output_size

    # c_golden = data_reshuffler_golden_model_6D(
    #     input_loops,
    #     spatial_len,
    #     input_strides,
    #     spatial_stride_in,
    #     data_in,
    # )

    # header_lines = []
    
    # for i in range(6):
    #     header_lines.append(format_scalar_definition("int32_t", f"tempLoop{i}_in", input_loops[i]))

    # for i in range(6):
    #     header_lines.append(format_scalar_definition("int32_t", f"tempLoop{i}_out", output_loops[i]))

    # for i in range(6):
    #     header_lines.append(format_scalar_definition("int32_t", f"tempStride{i}_in", input_strides[i]))

    # for i in range(6):
    #     header_lines.append(format_scalar_definition("int32_t", f"tempStride{i}_out", output_strides[i]))

    # header_lines += [
    #     format_scalar_definition("int32_t", "spatialStride_in", spatial_stride_in),
    #     format_scalar_definition("int32_t", "spatialStride_out", spatial_stride_out),
    #     format_scalar_definition("int32_t", "data_transfer_len", transfer_data_len),
    #     format_scalar_definition("int32_t", "Test_Data_Len", test_data_len),
    #     format_scalar_definition("int32_t", "Output_Data_Span", output_data_span),
    #     format_vector_definition("int8_t", "Test_Data", data_in),
    #     format_vector_definition("int8_t", "C_golden", c_golden)
    # ]

    header_lines = "\n\n".join(header_lines)

    return header_lines

    # print(f"✅ Generated random reshuffle test in {filename} (ndim={ndim}, total blocks={total_blocks})")



def main():

    # Parsing cmd args
    parser = argparse.ArgumentParser(description="Generating data for kernels")
    parser.add_argument(
        "-c",
        "--cfg",
        type=pathlib.Path,
        required=True,
        help="Select param config file kernel",
    )
    args = parser.parse_args()

    # Load param config file
    with args.cfg.open() as f:
        param = hjson.loads(f.read())

    # Emit header file
    print(emit_header_file(**param))


if __name__ == "__main__":
    main()

