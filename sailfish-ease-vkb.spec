Name: 		sailfish-ease-vkb
Version: 	1.0.3
Release: 	1
Summary: 	The amazing messagease keyboard
License: 	GPLv3+
URL: 		  https://openrepos.net/content/foolsbazar/sailfishease-keyboard-fork
Source0:  https://github.com/foolsbazar/sailfish-ease-vkb
Group:		System/Tools
BuildArch: 	noarch
Requires: 	jolla-keyboard >= 0.7.2 

%description 	
The amazing messagease keyboard ported by Jimmy Huguet on SailfishOS.
This is a very special keyboard that perfectly combines the usual typing
experience with few other swipe gestures that allows you to get rid of
all your classical typos.

%install
rm -rf %{buildroot}

mkdir -p %{buildroot}/usr/share/maliit/plugins/com/jolla/%{name}
cp -r %{name}/* %{buildroot}/usr/share/maliit/plugins/com/jolla/%{name}

mkdir -p %{buildroot}/usr/share/maliit/plugins/com/jolla/layouts
cp -r layouts/* %{buildroot}/usr/share/maliit/plugins/com/jolla/layouts

mkdir -p %{buildroot}/usr/share/icons/hicolor/256x256/apps/
cp %{name}.png %{buildroot}/usr/share/icons/hicolor/256x256/apps/


%post
systemctl-user restart maliit-server.service

%postun
systemctl-user restart maliit-server.service


%files
%defattr(-,root,root,-)
%{_datadir}/maliit/plugins/com/jolla/%{name}
%{_datadir}/maliit/plugins/com/jolla/layouts/ease_by_latin.qml
%{_datadir}/maliit/plugins/com/jolla/layouts/ease_de.qml
%{_datadir}/maliit/plugins/com/jolla/layouts/ease_en.qml
%{_datadir}/maliit/plugins/com/jolla/layouts/ease_es.qml
%{_datadir}/maliit/plugins/com/jolla/layouts/ease_it.qml
%{_datadir}/maliit/plugins/com/jolla/layouts/ease_nl.qml
%{_datadir}/maliit/plugins/com/jolla/layouts/ease_noNN.qml
%{_datadir}/maliit/plugins/com/jolla/layouts/ease_pl.qml
%{_datadir}/maliit/plugins/com/jolla/layouts/ease_zh_cn_pinyin.qml
%{_datadir}/maliit/plugins/com/jolla/layouts/layouts_ease.conf
%{_datadir}/icons/hicolor/256x256/apps/%{name}.png

%changelog
