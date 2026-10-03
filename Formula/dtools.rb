class Dtools < Formula
  desc "Private local web utilities"
  homepage "https://github.com/danyaljam/DANTOOLS"
  url "https://github.com/danyaljam/DANTOOLS/releases/download/v1.0.0/dtools-1.0.0.zip"
  sha256 "536d0d7bfd36755589e59487b6cd7b051c2c903d0c8402807661340470e6bcdd"
  version "1.0.0"

  depends_on "node"

  def install
    libexec.install "dtools/out", "dtools/scripts"
    (bin/"dtools").write <<~SH
      #!/bin/sh
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/scripts/serve-local.mjs" "$@"
    SH
  end

  test do
    assert_predicate libexec/"out/index.html", :exist?
  end
end