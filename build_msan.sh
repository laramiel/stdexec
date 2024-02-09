# Run in the container indicated by Docker.msan

export CC=/opt/llvm/clang/bin/clang
export CXX=/opt/llvm/clang/bin/clang++
export CPLUS_INCLUDE_PATH=/opt/llvm/libcxx-msan/include/c++/v1

export BAZEL_CXXOPTS="-nostdinc++"
export BAZEL_LINKOPTS=-L/opt/llvm/libcxx-msan/lib:-lc++:-lc++abi:-lm:-Wl,-rpath=/opt/llvm/libcxx-msan/lib

bazel --bazelrc=bazelrc \
        test ... \
        --config=msan \
        --keep_going \
        --show_timestamps \
        --test_output=errors
