class Binaryen < Formula
  desc "Compiler infrastructure and toolchain library for WebAssembly, in C++"
  homepage "https://github.com/WebAssembly/binaryen"
  url "https://github.com/WebAssembly/binaryen/archive/version_26.tar.gz"
  sha256 "e78ff7ea4dbffa0d53084a0bc1ec8ed43445b674a02c17af798f3c0df13d418d"
  head "https://github.com/WebAssembly/binaryen.git"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    #rm "bin/binaryen.js"
    #rm "bin/wasm.js"
    system "make", "install"
  end

  test do
    (testpath/"hello-world.asm.js").write("function () { 'use asm'; function add(x, y) { x = x | 0; y = y | 0; return x + y | 0; } return { add: add }; }")
    system "#{bin}/asm2wasm", "hello-world.asm.js"
  end
end
