class Dtools < Formula
  desc "Private local web utilities"
  homepage "https://github.com/danyaljam/DANTOOLS"
  url "https://github.com/danyaljam/DANTOOLS/releases/download/v1.0.0/dtools-1.0.0.zip"
  sha256 "5da53c941b2750a6348c1e972b68617f681bc3536a6417b7629c5110a9be16bf"
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