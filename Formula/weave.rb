# Release template: scripts/release-weave.sh fills metadata from its archives.
class Weave < Formula
  desc "Prepare repository layers and compile agent context"
  homepage "https://github.com/xianxu/ariadne"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/xianxu/ariadne/releases/download/weave-v0.1.0/weave_0.1.0_darwin_arm64.tar.gz"
      sha256 "38c27329937ad83285dd7532ffe936175625371dd8dbc770f3fcd9010bc2b622"
    end
    on_intel do
      url "https://github.com/xianxu/ariadne/releases/download/weave-v0.1.0/weave_0.1.0_darwin_amd64.tar.gz"
      sha256 "c7134832143f776518fce50382592aba65c4875ec99dc986f1b70a55a279a661"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/xianxu/ariadne/releases/download/weave-v0.1.0/weave_0.1.0_linux_arm64.tar.gz"
      sha256 "97f95de565fa760819d0b71e1cbca0194a3a5864149e12f80468478f65f1388c"
    end
    on_intel do
      url "https://github.com/xianxu/ariadne/releases/download/weave-v0.1.0/weave_0.1.0_linux_amd64.tar.gz"
      sha256 "67d567ba75a537f769029b3019f247528543a32987bb468fdb316ce9a4b31b79"
    end
  end

  def install
    bin.install "weave"
  end

  test do
    assert_match "weave version #{version}", shell_output("#{bin}/weave --version")
    (testpath/"base/construct").mkpath
    (testpath/"base/construct/base.manifest").write "export prose AGENTS.base.md\n"
    (testpath/"base/AGENTS.base.md").write "Packaged weave composes local layers.\n"
    (testpath/"leaf").mkpath
    cd testpath/"leaf" do
      system bin/"weave", "link", "../base"
      system bin/"weave", "compile"
      assert_match "Packaged weave composes local layers.", (testpath/"leaf/AGENTS.md").read
    end
  end
end
