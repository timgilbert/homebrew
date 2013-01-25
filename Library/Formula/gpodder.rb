require 'formula'

class Gpodder < Formula
  homepage 'http://gpodder.org/'
  url 'https://github.com/gpodder/gpodder/archive/gpodder-3.4.0.zip'
  version '3.4.0'
  sha1 '5e8909d1edb77c58a5160df65f171107f92b3565'

  depends_on :x11
  depends_on 'pygtk'
  depends_on 'sqlite'
  depends_on 'help2man' => :build
  depends_on 'intltool' => :build
  depends_on 'feedparser' => :python
  depends_on 'mygpoclient' => :python

  # TODO: ige-mac-integration

  def install
    # TODO
    # ENV.j1  # if your formula's build system can't parallelize

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test gpodder`.
    system "false"
  end
end
