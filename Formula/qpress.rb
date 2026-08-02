class Qpress < Formula
  desc "Portable high-speed file archiver"
  homepage "https://github.com/PierreLvx/qpress"
  url "https://github.com/PierreLvx/qpress/archive/refs/tags/20260802.tar.gz"
  sha256 "8c97335e6e5e7cd12d20753f78ca75bbb54699fe34dbac330f98c14114176927"
  license "GPL-3.0-or-later"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    (testpath/"hello.txt").write("hello qpress")
    system bin/"qpress", testpath/"hello.txt", testpath/"hello.qp"
    system bin/"qpress", "-df", testpath/"hello.qp", testpath
    assert_equal "hello qpress", (testpath/"hello.txt").read
  end
end
