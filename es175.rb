class ElasticsearchAT17 < Formula
  desc "Distributed search & analytics engine"
  homepage "https://www.elastic.co/products/elasticsearch"
  url "https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.5.tar.gz"
  sha256 "0aa58947d66b487488e86059352deb7c6cab5da4accdff043cce9fed7c3d2fa7"
  revision 1

  bottle :unneeded

  keg_only :versioned_formula

  depends_on :java => "1.7+"

  def cluster_name
    "elasticsearch_#{ENV["USER"]}"
  end

  def install
    # Remove Windows files
    rm_f Dir["bin/*.bat"]
    rm_f Dir["bin/*.exe"]

    # Move libraries to `libexec` directory
    libexec.install Dir["lib/*.jar"]
    (libexec/"sigar").install Dir["lib/sigar/*.{jar,dylib}"]

    # Install everything else into package directory
    prefix.install Dir["*"]
    # Remove unnecessary files
    # rm_f Dir["#{lib}/sigar/*"]
