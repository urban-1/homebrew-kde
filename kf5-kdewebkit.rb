class Kf5Kdewebkit < Formula
  desc "KDE Integration for QtWebKit"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.42/kdewebkit-5.42.0.tar.xz"
  sha256 "6ba25842d3cbd99c6816414e85fd7ff2d9dbde9fcde5c2faf3a74693d2254db3"
  revision 1

  head "git://anongit.kde.org/kdewebkit.git"

  depends_on "cmake" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "KDE-mac/kde/kf5-kparts"
  depends_on "KDE-mac/kde/qt-webkit"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"
    args << "-DQt5WebKitWidgets_DIR=#{HOMEBREW_PREFIX}/lib/cmake/Qt5WebKitWidgets"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
