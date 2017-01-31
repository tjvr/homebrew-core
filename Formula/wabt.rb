# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Wabt < Formula
  desc "The WebAssembly Binary Toolkit"
  homepage "https://github.com/WebAssembly/wabt"
  head "https://github.com/WebAssembly/wabt.git"
  #url "https://github.com/WebAssembly/wabt/archive/binary_0xc.tar.gz"
  sha256 "0ee56305b232d2a07aebd18afd0861ba39941d137ebf2ce2d57395a1bcd82940"

  depends_on "cmake" => :build

  def install
    mkdir "build"
    cd "build"
    system "cmake", "..", *std_cmake_args
    system "make", "install"
  end

  test do
    system "false" # TODO 
  end
end
