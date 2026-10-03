class Dtools < Formula
  desc "Private local web utilities"
  homepage "https://github.com/danyaljam/DANTOOLS"
  url "https://github.com/danyaljam/DANTOOLS/releases/download/v1.0.0/dtools-1.0.0.zip"
  sha256 "aabd81f678592c2b53551bcf3783c006b13bf89c9a2b5916f493199e35130d0a"
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