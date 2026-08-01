class Qpress < Formula
  desc "Portable high-speed file archiver"
  homepage "https://github.com/PierreLvx/qpress"
  url "https://github.com/PierreLvx/qpress/archive/refs/tags/20260801.tar.gz"
  sha256 "ef3d969eb1cc9c5a22e5d64c1ccdcd41a076f8e347a669e7d4c5274d522f2ca8"
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
