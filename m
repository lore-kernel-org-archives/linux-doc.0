Received: from mail-m3272.qiye.163.com (mail-m3272.qiye.163.com [220.197.32.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593B227BA4
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763899287; cv=none; b=Yt8KOjvwXj2sYgxZg44a7IgkPmT8on3uf07Aqsn8LqJuxHKLIKHbegdWk0l9IxGnTBTAbVCDpNwvNuAcf02BUTpgt0Lfmgoki0MOSjl3sbjmJm7Nelr7KBYBm4GKkm3QLBNx3Y8v4rsQfhWo1Oh7wQF4w+F2HAIQr7Cw7/NCeBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763899287; c=relaxed/simple;
	bh=DO4vxFUXn/wq2tchPxDkgbB8LxE1BLjZOvokdBhgp3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q3aXYVI0MPMHzMKDPAt9u6pB1S3CPNhv2tLE6Qdbw4KkDrRq5c/6uh6VWHKLu8D37VbLowmNYiuqR+IDJpMiVymoF2KLDR7wYaHJfDIRV1daZI76NRlJ7gm+TtSX5fW4IDIyvXiLZnihe1NnO/p+ZiyyhTFMECzfXqBEQxIHktE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=EJtJ2bqK; arc=none smtp.client-ip=220.197.32.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="EJtJ2bqK"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a9029103;
	Sun, 23 Nov 2025 19:56:07 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 15/25] docs/zh_CN: Add gadget-testing.rst translation
Date: Sun, 23 Nov 2025 19:56:13 +0800
Message-ID: <90c0d21cf4db2aaa0c60468affa50d5ab116c6d9.1763897036.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1763897036.git.baikefan@leap-io-kernel.com>
References: <cover.1763897036.git.baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab092444e09d5kunm2b5c8c0429adc4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQh4eVkxMGUIdT0pKH01IGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=EJtJ2bqKqotu0En9bUeE2zpbiGYNI4WsfGiPasfTHxpT0J5fXDFEhQ4/sOVLTM7Di3Lp2ekaZpS/rV95onPrvictvEMPqTdWjPN9H7xJI/HzTf3g8+CeFPHbV3yj+AQD98tCDFYIFAHhDPbijKkYpJzcykWqf7Eb003i9JR2Pcnq/0nQYb+33GU8pgztC8DPQD4TJKjl8BzGzDMfVSVgGPdW8YQzre8wmJLsfYTpFSpFRknzDK3NvrSgUt9mnUYh8FHcaMRd+9wIBBnYdfqR93Fs6HCg2263AixaILL8OAXvo2uFtadMEXuPIT4uGdMPXdmKxJi4Muc5FJQ8/8LOaw==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=38vcdp17Z8zNV9aoupYxM3dvS6xMk4c9Q+C7FZ4jeQg=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/gadget-testing.rst into Chinese.

Update the translation through commit 5194439d70ba
("Documentation: treewide: Replace remaining spinics links with lore")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/gadget-testing.rst | 1068 +++++++++++++++++
 1 file changed, 1068 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/gadget-testing.rst

diff --git a/Documentation/translations/zh_CN/usb/gadget-testing.rst b/Documentation/translations/zh_CN/usb/gadget-testing.rst
new file mode 100644
index 000000000000..a8ee597d0d37
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/gadget-testing.rst
@@ -0,0 +1,1068 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/gadget-testing.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+===========
+Gadget 测试
+===========
+
+本文件总结了关于USB gadget提供的基本功能测试的信息。
+
+.. contents
+
+   1. ACM功能
+   2. ECM功能
+   3. ECM子集功能
+   4. EEM功能
+   5. FFS功能
+   6. HID功能
+   7. LOOPBACK功能
+   8. MASS STORAGE功能
+   9. MIDI功能
+   10. NCM功能
+   11. OBEX功能
+   12. PHONET功能
+   13. RNDIS功能
+   14. SERIAL功能
+   15. SOURCESINK功能
+   16. UAC1功能 (旧版实现)
+   17. UAC2功能
+   18. UVC功能
+   19. PRINTER功能
+   20. UAC1功能 (新API)
+   21. MIDI2功能
+
+
+1. ACM功能
+===============
+
+该功能由usb_f_acm.ko模块提供。
+
+功能专用的configfs接口
+-------------------------
+
+创建功能目录时使用的功能名称为"acm"。
+ACM功能在其功能目录中仅提供一个属性：
+
+	port_num
+
+该属性是只读的。
+系统中最多可以有4个ACM/通用串口/OBEX端口。
+
+
+测试ACM功能
+-----------
+
+在主机上::
+
+	cat > /dev/ttyACM<X>
+
+在设备上::
+
+	cat /dev/ttyGS<Y>
+
+然后反过来
+
+在设备上::
+
+	cat > /dev/ttyGS<Y>
+
+在主机上::
+	cat /dev/ttyACM<X>
+
+2. ECM功能
+===============
+
+该功能由usb_f_ecm.ko模块提供。
+
+功能专用的configfs接口
+------------------------------------
+
+创建功能目录时使用的功能名称为"ecm"。
+ECM功能在其功能目录中提供以下属性：
+=============== ==================================================
+ifname          与此功能实例关联的网络设备接口名称
+qmult           高速和超高速的队列长度乘数
+host_addr       主机端的MAC地址（USB以太网链接）
+dev_addr        设备端的MAC地址（USB以太网链接）
+=============== ==================================================
+
+创建 functions/ecm.<实例名> 后，
+这些属性包含默认值：qmult 为 5，dev_addr 和 host_addr 随机选择。
+如果功能尚未绑定，可以写入 ifname。
+写入必须是接口模式，如 "usb%d"，
+这将使网络核心选择下一个可用的 usbX 接口。默认设置为 "usb%d"。
+
+测试ECM功能
+-----------
+
+配置设备和主机的IP地址。然后：
+
+在设备上::
+
+	ping <host's IP>
+
+在主机上::
+	ping <device's IP>
+
+3. ECM子集功能
+======================
+
+该功能由usb_f_ecm_subset.ko模块提供。
+
+功能专用的configfs接口
+------------------------------------
+
+创建功能目录时使用的功能名称为"geth"。
+ECM子集功能在其功能目录中提供以下属性：
+
+	=============== ==================================================
+	ifname		与此功能实例关联的网络设备接口名称
+	qmult		高速和超高速的队列长度乘数
+	host_addr	主机端的MAC地址（USB以太网链接）
+	dev_addr	设备端的MAC地址（USB以太网链接）
+	=============== ==================================================
+
+创建 functions/ecm.<实例名> 后，
+这些属性包含默认值：qmult 为 5，dev_addr 和 host_addr 随机选择。
+如果功能尚未绑定，可以写入 ifname。
+写入必须是接口模式，如 "usb%d"，
+这将使网络核心选择下一个可用的 usbX 接口。
+默认设置为 "usb%d"。
+
+测试ECM子集功能
+----------------
+
+配置设备和主机的IP地址。然后：
+
+在设备上::
+
+	ping <host's IP>
+
+在主机上::
+	ping <device's IP>
+
+4. EEM功能
+===============
+
+该功能由usb_f_eem.ko模块提供。
+
+功能专用的configfs接口
+------------------------------------
+
+创建功能目录时使用的功能名称为 "eem"。
+EEM 功能在其功能目录中提供以下属性：
+
+	=============== ==================================================
+	ifname		与该功能实例关联的网络设备接口名称
+	qmult		高速和超高速的队列长度乘数
+	host_addr	主机端的MAC地址（USB以太网链接）
+	dev_addr	设备端的MAC地址（USB以太网链接）
+	=============== ==================================================
+
+创建 functions/eem.<实例名> 后，
+这些属性包含默认值：qmult 为 5，dev_addr 和 host_addr 随机选择。
+如果功能尚未绑定，可以写入 ifname。
+写入必须是接口模式，如 "usb%d"，这将使网络核心选择下一个可用的 usbX 接口。
+默认设置为 "usb%d"。
+
+测试EEM功能
+-----------
+
+配置设备和主机的IP地址。然后：
+
+在设备上::
+
+	ping <host's IP>
+
+在主机上::
+	ping <device's IP>
+
+5. FFS功能
+===============
+
+该功能由usb_f_fs.ko模块提供。
+
+功能专用的configfs接口
+------------------------------------
+
+创建功能目录时使用的功能名称为"ffs"。
+功能目录为空且不可修改。
+
+创建目录后，系统中会出现一个新的FunctionFS实例（一个“设备”）。
+一旦可用，用户应遵循FunctionFS的标准使用流程（挂载它，运行实现功能的用户空间进程）。
+通过向usb_gadget/<gadget>/UDC 写入合适的字符串即可启用gadget。
+
+FFS 功能在其功能目录中仅提供一个属性：
+
+	ready
+
+该属性为只读，用于指示功能是否准备好（1）被使用，
+例如用户空间已向 ep0 写入描述符和字符串，从而可以启用 gadget。
+
+测试FFS功能
+-----------
+
+在设备上：启动功能的用户空间守护进程，启用gadget
+
+在主机上：使用设备提供的USB功能
+
+6. HID功能
+===============
+
+该功能由usb_f_hid.ko模块提供。
+
+功能专用的configfs接口
+------------------------------------
+
+创建功能目录时使用的功能名称为"hid"。
+HID功能在其功能目录中提供以下属性：
+=============== ===========================================
+protocol        HID 使用的协议
+report_desc     用于 HID 报告的数据，除了通过 /dev/hidg<X> 传递的数据
+report_length   HID 报告长度
+subclass        HID 使用的子类
+=============== ===========================================
+
+对于键盘，protocol 和 subclass 为 1，report_length 为 8，report_desc 如下::
+
+  $ hd my_report_desc
+  00000000  05 01 09 06 a1 01 05 07  19 e0 29 e7 15 00 25 01  |..........)...%.|
+  00000010  75 01 95 08 81 02 95 01  75 08 81 03 95 05 75 01  |u.......u.....u.|
+  00000020  05 08 19 01 29 05 91 02  95 01 75 03 91 03 95 06  |....).....u.....|
+  00000030  75 08 15 00 25 65 05 07  19 00 29 65 81 00 c0     |u...%e....)e...|
+  0000003f
+
+可以通过 echo 将该字节序列存储到属性中::
+
+  $ echo -ne \\x05\\x01\\x09\\x06\\xa1.....
+
+测试 HID 功能
+--------------
+
+设备端：
+
+- 创建 gadget
+- 将 gadget 连接到主机，最好不是用于控制 gadget 的主机
+- 运行一个向 /dev/hidg<N> 写入数据的程序，例如
+  Documentation/usb/gadget_hid.rst 中的一个用户空间程序::
+
+	$ ./hid_gadget_test /dev/hidg0 keyboard
+
+主机端：
+
+- 观察来自 gadget 的按键
+
+7. LOOPBACK 功能
+====================
+
+该功能由usb_f_ss_lb.ko模块提供。
+
+功能专用的 configfs 接口
+------------------------
+
+创建功能目录时使用的功能名称为 "Loopback"。
+LOOPBACK 功能在其功能目录中提供以下属性：
+
+	=============== =======================
+	qlen		回环队列深度
+	bulk_buflen	缓冲区长度
+	=============== =======================
+
+测试 LOOPBACK 功能
+-------------------
+
+设备端：运行 gadget
+
+主机端：test-usb (tools/usb/testusb.c)
+8. MASS STORAGE 功能
+====================
+
+该功能由usb_f_mass_storage.ko模块提供。
+
+功能专用的configfs接口
+------------------------------------
+
+创建功能目录时使用的功能名称为 "mass_storage"。
+MASS STORAGE 功能在其功能目录中提供以下属性：
+
+	=============== ==============================================
+	stall		设置是否允许功能暂停 bulk 端点。
+		        在某些已知无法正常工作的 USB 设备上被禁用。
+		        建议设置为 true。
+	num_buffers	管道缓冲区的数量。有效数字为 2..4。仅当
+			     CONFIG_USB_GADGET_DEBUG_FILES 被设置时可用。
+	=============== ==============================================
+
+目录中有默认的 lun.0，对应 SCSI LUN #0。
+
+可以通过 mkdir 添加新的 LUN::
+
+	$ mkdir functions/mass_storage.0/partition.5
+
+LUN 编号不必连续，但默认创建的 lun #0 必须存在。
+最多可指定 8 个 LUN，名称必须遵循 <name>.<number> 格式，
+数字可为 0..8。推荐命名约定为 "lun.<number>"，但非强制。
+
+每个 LUN 目录中包含以下属性文件：
+
+	=============== ==============================================
+	file			指向 LUN 的后备文件的路径。
+					如果 LUN 未标记为可移动，则为必需。
+	ro				指定对 LUN 的访问应为只读的标志。
+					如果启用了 CD-ROM 仿真，
+					或者无法以读写模式打开 "filename"，则隐含为只读。
+	removable		指定 LUN 应被标记为可移动的标志。
+	cdrom			指定 LUN 应被报告为 CD-ROM 的标志。
+	nofua			指定 SCSI WRITE(10,12) 中的 FUA 标志。
+	forced_eject	仅在功能激活时有用。
+	                写入非零字节会强制将后端文件从 LUN 分离，不管主机是否允许
+	=============== ==============================================
+
+测试 MASS STORAGE 功能
+----------------------
+
+设备端：连接 gadget 并启用
+主机端：dmesg，查看 USB 驱动器是否出现（如果系统配置为自动挂载）
+
+9. MIDI 功能
+================
+
+该功能由usb_f_midi.ko模块提供。
+
+功能专用的 configfs 接口
+------------------------------------
+
+创建功能目录时使用的功能名称为 "midi"。
+MIDI 功能在其功能目录中提供以下属性：
+
+	=============== ====================================
+	buflen			MIDI 缓冲区长度
+	id				USB MIDI 适配器的 ID 字符串
+	in_ports		MIDI 输入端口数量
+	index			USB MIDI 适配器的索引值
+	out_ports		MIDI 输出端口数量
+	qlen			USB 读取请求队列长度
+	=============== ====================================
+
+测试 MIDI 功能
+--------------
+有两种情况：从 gadget 播放 mid 到主机，以及从主机播放 mid 到 gadget。
+
+1) 从 gadget 播放 mid 到主机：
+
+主机端::
+
+  $ arecordmidi -l
+   Port    Client name                      Port name
+   14:0    Midi Through                     Midi Through Port-0
+   24:0    MIDI Gadget                      MIDI Gadget MIDI 1
+  $ arecordmidi -p 24:0 from_gadget.mid
+
+gadget::
+
+  $ aplaymidi -l
+   Port    Client name                      Port name
+   20:0    f_midi                           f_midi
+
+  $ aplaymidi -p 20:0 to_host.mid
+
+2) 从主机到gadget播放mid
+
+gadget::
+
+  $ arecordmidi -l
+   Port    Client name                      Port name
+   20:0    f_midi                           f_midi
+
+  $ arecordmidi -p 20:0 from_host.mid
+
+主机端::
+
+  $ aplaymidi -l
+   Port    Client name                      Port name
+   14:0    Midi Through                     Midi Through Port-0
+   24:0    MIDI Gadget                      MIDI Gadget MIDI 1
+
+  $ aplaymidi -p24:0 to_gadget.mid
+
+from_gadget.mid 应与 to_host.mid 听起来完全相同。
+from_host.mid 应与 to_gadget.mid 听起来完全相同。
+MIDI 文件可以通过例如安装了 timidity 的方式播放到扬声器或耳机::
+
+  $ aplaymidi -l
+   Port    Client name                      Port name
+   14:0    Midi Through                     Midi Through Port-0
+   24:0    MIDI Gadget                      MIDI Gadget MIDI 1
+  128:0    TiMidity                         TiMidity port 0
+  128:1    TiMidity                         TiMidity port 1
+  128:2    TiMidity                         TiMidity port 2
+  128:3    TiMidity                         TiMidity port 3
+
+  $ aplaymidi -p 128:0 file.mid
+
+MIDI 端口可以使用 aconnect 工具逻辑连接::::
+
+  $ aconnect 24:0 128:0 # 在主机上尝试
+
+连接后，gadget 端播放的内容可在主机扬声器/耳机中听到。
+
+10. NCM 功能
+============
+
+该功能由 usb_f_ncm.ko 模块提供。
+
+功能专用的 configfs 接口
+--------------------------
+
+创建功能目录时使用的功能名称为 "ncm"。
+NCM 功能在其功能目录中提供以下属性：
+
+	======================= ==================================================
+	ifname					与该功能实例关联的网络设备接口名称
+	qmult					高速度和超级速度的队列长度乘数
+	host_addr				主机端的MAC地址（USB以太网链接）
+	dev_addr				设备端的MAC地址（USB以太网链接）
+	max_segment_size		点对点连接所需的分段大小。将MTU设置为14字节
+	======================= ==================================================
+
+创建 functions/ncm.<实例名> 后，
+这些属性包含默认值：qmult 为 5，dev_addr 和 host_addr 随机选择。
+如果功能尚未绑定，可以写入 ifname。
+写入必须是接口模式，如 "usb%d"，
+这将使网络核心选择下一个可用的 usbX 接口。
+默认设置为 "usb%d"。
+
+测试NCM功能
+-----------
+
+配置设备和主机的 IP 地址，然后：
+
+在设备上::
+
+	ping <host's IP>
+
+在主机上::
+	ping <device's IP>
+
+11. OBEX 功能
+=============
+
+该功能由 usb_f_obex.ko 模块提供。
+
+功能专用的 configfs 接口
+--------------------------
+
+创建功能目录时使用的功能名称为 "obex"。
+OBEX 功能在其功能目录中仅提供一个属性：
+
+	port_num
+
+该属性为只读。
+
+系统中最多可以有 4 个 ACM/通用串口/OBEX 端口。
+
+测试 OBEX 功能
+--------------
+
+在设备上::
+
+	seriald -f /dev/ttyGS<Y> -s 1024
+
+在主机上::
+
+	serialc -v <vendorID> -p <productID> -i<interface#> -a1 -s1024 \
+                -t<out endpoint addr> -r<in endpoint addr>
+
+seriald和serialc是Felipe提供的工具，可在此获取：
+
+	https://github.com/felipebalbi/usb-tools.git master
+
+12. PHONET功能
+==============
+
+该功能由 usb_f_phonet.ko 模块提供。
+
+功能专用的 configfs 接口
+--------------------------
+
+创建功能目录时使用的功能名称为 "phonet"。
+PHONET 功能在其功能目录中仅提供一个属性：
+
+	=============== ==================================================
+	ifname		与该功能实例关联的网络设备接口名称
+	=============== ==================================================
+
+测试 PHONET 功能
+--------------------------
+在没有特定硬件的情况下无法测试 SOCK_STREAM 协议，因此仅测试了 SOCK_DGRAM。
+为使其工作，过去必须应用相应补丁。
+
+这些工具是必需的：
+
+git://git.gitorious.org/meego-cellular/phonet-utils.git
+
+在主机上::
+
+	$ ./phonet -a 0x10 -i usbpn0
+	$ ./pnroute add 0x6c usbpn0
+	$./pnroute add 0x10 usbpn0
+	$ ifconfig usbpn0 up
+
+在设备上::
+
+	$ ./phonet -a 0x6c -i upnlink0
+	$ ./pnroute add 0x10 upnlink0
+	$ ifconfig upnlink0 up
+
+
+在设备上::
+	$ ./pnxmit -a 0x6c -r
+
+在主机上::
+
+	$ ./pnxmit -a 0x10 -s 0x6c
+
+作为结果，一些数据应该从主机发送到设备。
+然后反过来：
+
+在主机上::
+
+	$ ./pnxmit -a 0x10 -r
+
+在设备上::
+	$ ./pnxmit -a 0x6c -s 0x10
+
+13. RNDIS功能
+=============
+
+该功能由usb_f_rndis.ko模块提供。
+
+功能特定的configfs接口
+--------------------------
+
+创建功能目录时使用的功能名为"rndis"。
+RNDIS功能在其功能目录中提供以下属性：
+
+	=============== ==================================================
+	ifname			与该功能实例关联的网络设备接口名称
+	qmult			高速和超高速模式的队列长度倍增器
+	host_addr		主机端的MAC地址（USB以太网链接）
+	dev_addr		设备端的MAC地址（USB以太网链接）
+	=============== ==================================================
+
+创建functions/rndis.<实例名>后，
+它们包含默认值：qmult为5，dev_addr和host_addr随机选择。
+如果功能尚未绑定，可以写入ifname。
+写入必须是类似"usb%d"的接口模式，
+这将使网络核心选择下一个空闲的usbX接口。
+默认值为"usb%d"。
+
+测试 RNDIS 功能
+------------------
+
+配置设备和主机的IP地址。然后：
+
+在设备上::
+
+	ping <host's IP>
+
+在主机上::
+	ping <device's IP>
+
+14. SERIAL功能
+===================
+
+该功能由usb_f_gser.ko模块提供。
+
+功能专用的configfs接口
+------------------------
+
+创建功能目录时使用的功能名为"gser"。
+SERIAL功能在其功能目录中仅提供一个属性：
+
+	port_num
+
+该属性为只读。
+
+系统中最多可以有4个ACM/通用串口/OBEX端口。
+
+测试 SERIAL 功能
+--------------------
+
+在主机上::
+
+	insmod usbserial
+	echo VID PID >/sys/bus/usb-serial/drivers/generic/new_id
+
+在主机上::
+
+	cat > /dev/ttyUSB<X>
+
+在设备上::
+	cat /dev/ttyGS<Y>
+
+then the other way round
+
+在目标端::
+
+	cat > /dev/ttyGS<Y>
+
+在主机上::
+	cat /dev/ttyUSB<X>
+
+15. SOURCESINK功能
+=======================
+
+该功能由usb_f_ss_lb.ko模块提供。
+
+功能专用的configfs接口
+------------------------------------
+
+创建功能目录时使用的功能名为"SourceSink"。
+SOURCESINK功能在其功能目录中提供以下属性：
+
+	=============== ==================================
+	pattern			0 (全零), 1 (mod63), 2 (无)
+	isoc_interval	1..16
+	isoc_maxpacket	0 - 1023 (fs), 0 - 1024 (hs/ss)
+	isoc_mult		0..2 (hs/ss only)
+	isoc_maxburst	0..15 (ss only)
+	bulk_buflen		缓冲区长度
+	bulk_qlen		块传输队列深度
+	iso_qlen		等时传输队列深度
+	=============== ==================================
+
+测试SOURCESINK功能
+------------------
+
+设备端：运行gadget
+
+主机端：test-usb (tools/usb/testusb.c)
+
+
+16. UAC1功能 (legacy实现)
+=========================
+
+该功能由usb_f_uac1_legacy.ko模块提供。
+
+功能特定的configfs接口
+------------------------
+
+创建功能目录时使用的功能名为"uac1_legacy"。
+uac1功能在其功能目录中提供以下属性：
+
+	=============== ====================================
+	audio_buf_size	audio缓冲区大小
+	fn_cap			捕获pcm设备文件名
+	fn_cntl			控制设备文件名
+	fn_play			播放pcm设备文件名
+	req_buf_size	ISO OUT端点请求缓冲区大小
+	req_count		ISO OUT端点请求计数
+	=============== ====================================
+
+这些属性具有合理的默认值。
+
+测试UAC1功能
+------------
+
+设备端：运行gadget
+
+主机端::
+
+	aplay -l # should list our USB Audio Gadget
+
+17. UAC2功能
+============
+
+该功能由usb_f_uac2.ko模块提供。
+
+功能特定的configfs接口
+------------------------------------
+
+创建功能目录时使用的功能名为"uac2"。
+uac2功能在其功能目录中提供以下属性：
+================ ====================================================
+c_chmask         捕获通道掩码
+c_srate          捕获采样率列表（逗号分隔）
+c_ssize          捕获样本大小（字节）
+c_sync           捕获同步类型（异步/自适应）
+c_mute_present   捕获静音控制启用
+c_volume_present 捕获音量控制启用
+c_volume_min     捕获音量控制最小值（以1/256 dB为单位）
+c_volume_max     捕获音量控制最大值（以1/256 dB为单位）
+c_volume_res     捕获音量控制分辨率（以1/256 dB为单位）
+c_hs_bint        捕获HS/SS的bInterval（1-4：固定，0：自动）
+fb_max           异步模式下的最大额外带宽
+p_chmask         播放通道掩码
+p_srate          播放采样率列表（逗号分隔）
+p_ssize          播放样本大小（字节）
+p_mute_present   播放静音控制启用
+p_volume_present 播放音量控制启用
+p_volume_min     播放音量控制最小值（以1/256 dB为单位）
+p_volume_max     播放音量控制最大值（以1/256 dB为单位）
+p_volume_res     播放音量控制分辨率（以1/256 dB为单位）
+p_hs_bint        播放HS/SS的bInterval（1-4：固定，0：自动）
+req_number       捕获和播放的预分配请求数
+function_name    接口名称
+if_ctrl_name     拓扑控制名称
+clksrc_in_name   输入时钟名称
+clksrc_out_name  输出时钟名称
+p_it_name        播放输入终端名称
+p_it_ch_name     播放输入第一个通道名称
+p_ot_name        播放输出终端名称
+p_fu_vol_name    播放功能单元名称
+c_it_name        捕获输入终端名称
+c_it_ch_name     捕获输入第一个通道名称
+c_ot_name        捕获输出终端名称
+c_fu_vol_name    捕获功能单元名称
+c_terminal_type  捕获终端类型代码
+p_terminal_type  播放终端类型代码
+================ ====================================================
+
+这些属性具有合理的默认值。
+
+测试UAC2功能
+------------
+
+设备端：运行gadget
+主机端：aplay -l # 应列出我们的USB音频Gadget
+
+此功能不需要真实硬件支持，它仅发送音频流到/从主机。
+若要在设备端实际听到声音，可使用类似如下命令::
+
+	$ arecord -f dat -t wav -D hw:2,0 | aplay -D hw:0,0 &
+
+例如::
+
+	$ arecord -f dat -t wav -D hw:CARD=UAC2Gadget,DEV=0 | \
+	  aplay -D default:CARD=OdroidU3
+
+18. UVC功能
+===========
+
+该功能由usb_f_uvc.ko模块提供。
+
+功能特定的configfs接口
+----------------------
+
+创建功能目录时使用的功能名为"uvc"。
+uvc功能在其功能目录中提供以下属性：
+=================== ================================================
+streaming_interval  数据传输轮询端点的间隔
+streaming_maxburst  超速伴随描述符的bMaxBurst
+streaming_maxpacket 端点可发送或接收的最大包大小（选中此配置时）
+function_name       接口名称
+=================== ================================================
+
+还有"control"和"streaming"子目录，每个子目录包含若干子目录。提供了一些合理的默认值，但用户必须提供：
+
+================== ====================================================
+control header     在control/header创建，并从control/class/fs
+	   				和/或control/class/ss链接
+streaming header   在streaming/header创建，并从streaming/class/fs和/或streaming/class/hs和/或
+		   			streaming/class/ss链接
+format description 在streaming/mjpeg和/或
+		   			streaming/uncompressed创建
+frame description  在streaming/mjpeg/<format>和/或在
+		   			streaming/uncompressed/<format>创建
+================== ====================================================
+
+每个frame description包含帧间隔规范，每个规范由若干行间隔值组成。上述规则示例::
+
+  # mkdir functions/uvc.usb0/control/header/h
+  # cd functions/uvc.usb0/control/
+  # ln -s header/h class/fs
+  # ln -s header/h class/ss
+  # mkdir -p functions/uvc.usb0/streaming/uncompressed/u/360p
+  # cat <<EOF > functions/uvc.usb0/streaming/uncompressed/u/360p/dwFrameInterval
+  666666
+  1000000
+  5000000
+  EOF
+  # cd $GADGET_CONFIGFS_ROOT
+  # mkdir functions/uvc.usb0/streaming/header/h
+  # cd functions/uvc.usb0/streaming/header/h
+  # ln -s ../../uncompressed/u
+  # cd ../../class/fs
+  # ln -s ../../header/h
+  # cd ../../class/hs
+  # ln -s ../../header/h
+  # cd ../../class/ss
+  # ln -s ../../header/h
+
+
+测试UVC功能
+-----------
+
+设备端：运行gadget，modprobe vivid::
+
+  # uvc-gadget -u /dev/video<uvc video node #> -v /dev/video<vivid video node #>
+
+其中uvc-gadget程序位于：
+	http://git.ideasonboard.org/uvc-gadget.git
+
+并应用以下补丁：
+
+	https://lore.kernel.org/r/1386675637-18243-1-git-send-email-r.baldyga@samsung.com/
+
+主机端::
+
+	luvcview -f yuv
+
+19. PRINTER功能
+================
+
+该功能由usb_f_printer.ko模块提供。
+
+功能特定的configfs接口
+-------------------------
+
+创建功能目录时使用的功能名为"printer"。
+printer功能在其功能目录中提供以下属性：
+
+==========	===========================================
+pnp_string	传递给主机的即插即用字符串
+q_len		每个端点的请求数
+==========	===========================================
+
+测试PRINTER功能
+------------------
+
+最基本的测试：
+
+设备端：运行gadget::
+
+	# ls -l /devices/virtual/usb_printer_gadget/
+
+应该显示 g_printer<number>。
+
+如果 udev 处于活动状态，则应自动出现 /dev/g_printer<number>。
+
+主机端：
+如果 udev 处于活动状态，则应自动出现例如 /dev/usb/lp0。
+
+主机->设备传输：
+
+设备端：
+
+	# cat /dev/g_printer<number>
+
+主机端：
+	# cat > /dev/usb/lp0
+
+设备->主机传输::
+
+	# cat > /dev/g_printer<number>
+
+主机端::
+	# cat /dev/usb/lp0
+
+更高级的测试可以使用Documentation/usb/gadget_printer.rst中描述的prn_example进行。
+
+
+20. UAC1功能（虚拟ALSA卡，使用u_audio API）
+=============================================
+
+该功能由usb_f_uac1.ko模块提供。
+它将创建一个虚拟ALSA卡，音频流仅仅是
+发送到和接收自它。
+
+功能特定的configfs接口
+-------------------------
+
+创建功能目录时使用的功能名为"uac1"。
+uac1功能在其功能目录中提供以下属性：
+================ ====================================================
+c_chmask         捕获通道掩码
+c_srate          捕获采样率列表（逗号分隔）
+c_ssize          捕获样本大小（字节）
+c_mute_present   捕获静音控制启用
+c_volume_present 捕获音量控制启用
+c_volume_min     捕获音量控制最小值（以1/256 dB为单位）
+c_volume_max     捕获音量控制最大值（以1/256 dB为单位）
+c_volume_res     捕获音量控制分辨率（以1/256 dB为单位）
+p_chmask         播放通道掩码
+p_srate          播放采样率列表（逗号分隔）
+p_ssize          播放样本大小（字节）
+p_mute_present   播放静音控制启用
+p_volume_present 播放音量控制启用
+p_volume_min     播放音量控制最小值（以1/256 dB为单位）
+p_volume_max     播放音量控制最大值（以1/256 dB为单位）
+p_volume_res     播放音量控制分辨率（以1/256 dB为单位）
+req_number       捕获和播放的预分配请求数
+function_name    接口名称
+p_it_name        播放输入端名称
+p_it_ch_name     播放通道名称
+p_ot_name        播放输出端名称
+p_fu_vol_name    播放静音/音量功能单元名称
+c_it_name        捕获输入端名称
+c_it_ch_name     捕获通道名称
+c_ot_name        捕获输出端名称
+c_fu_vol_name    捕获静音/音量功能单元名称
+================ ====================================================
+
+这些属性具有合理的默认值。
+
+测试UAC1功能
+----------------
+
+设备端：运行gadget
+主机端：aplay -l # 应该列出我们的USB音频设备
+
+该功能不需要真实的硬件支持，它只是
+向主机发送和接收音频数据流。为了
+实际上在设备端听到声音，必须在设备端使用类似的命令：
+
+	$ arecord -f dat -t wav -D hw:2,0 | aplay -D hw:0,0 &
+
+例如::
+
+	$ arecord -f dat -t wav -D hw:CARD=UAC1Gadget,DEV=0 | \
+	  aplay -D default:CARD=OdroidU3
+
+
+21. MIDI2功能
+================
+
+该功能由usb_f_midi2.ko模块提供。
+它将创建一个虚拟ALSA卡，其中包含一个UMP rawmidi设备，
+UMP数据包被回环。
+此外，还会创建一个传统的rawmidi设备。
+UMP rawmidi还绑定了ALSA sequencer客户端。
+
+功能特定的configfs接口
+------------------------
+
+创建功能目录时使用的功能名为"midi2"。
+midi2功能在其功能目录中提供以下属性（作为卡顶层信息）：
+
+=============   =================================================
+process_ump     布尔标志，处理UMP Stream消息（0或1）
+static_block    静态块的布尔标志（0或1）
+iface_name      可选的接口名称字符串
+=============   =================================================
+
+目录包含一个子目录"ep.0"，提供UMP端点（USB MIDI端点对）的属性：
+
+=============   =================================================
+protocol_caps   MIDI协议能力；
+                    1：MIDI 1.0，2：MIDI 2.0，或3：两者
+protocol        默认MIDI协议（1或2）
+ep_name         UMP Endpoint名称字符串
+product_id      Product ID字符串
+manufacturer    制造商ID号（24位）
+family          设备系列ID号（16位）
+model           设备型号ID号（16位）
+sw_revision     软件版本号（32位）
+=============   =================================================
+
+每个端点子目录包含子目录"block.0"，表示功能块0的信息，其属性为：
+
+=================   ===============================================
+name                功能块名称字符串
+direction           该功能块的方向
+                        1：输入，2：输出，或3：双向
+first_group         第一个UMP组号（0-15）
+num_groups          该功能块中的组数（1-16）
+midi1_first_group   第一个UMP组号，用于MIDI 1.0（0-15）
+midi1_num_groups    MIDI 1.0的组数（0-16）
+ui_hint             该功能块的UI提示
+                        0：未知，1：接收器，2：发送器，3：两者
+midi_ci_version     支持的MIDI-CI版本号（8位）
+is_midi1            传统MIDI 1.0设备（0-2）
+                        0：MIDI 2.0设备，
+                        1：无限制的MIDI 1.0，或
+                        2：低速的MIDI 1.0
+sysex8_streams      最大SysEx8流数（8位）
+active              功能块活动的布尔标志（0或1）
+=================   ===============================================
+
+如需多个功能块，可创建"block.<num>"子目录（1,2,…），且编号必须连续。
+功能块子目录也可动态删除。
+
+同样，如需多个UMP端点，可创建"ep.<num>"子目录，编号必须连续。
+
+若模拟不支持UMP v1.1的旧MIDI 2.0设备，可将`process_ump`设置为0，
+忽略所有UMP v1.1请求。
+
+测试MIDI2功能
+--------------
+
+在设备端：运行gadget，并执行::
+
+  $ cat /proc/asound/cards
+
+将显示包含MIDI2设备的新声卡。
+
+在主机端::
+
+  $ cat /proc/asound/cards
+
+将显示包含MIDI1或MIDI2设备的新声卡，具体取决于USB音频驱动程序的配置。
+
+在两者上，当主机启用ALSA sequencer时，可以找到
+UMP MIDI客户端，如"MIDI 2.0 Gadget"。
+
+由于驱动程序只是简单地回环数据，因此不需要真实设备进行测试。
+
+要测试从gadget到主机的MIDI输入（例如模拟MIDI键盘），可以发送如下的MIDI流。
+
+在设备端::
+
+  $ aconnect -o
+  ....
+  client 20: 'MIDI 2.0 Gadget' [type=kernel,card=1]
+      0 'MIDI 2.0        '
+      1 'Group 1 (MIDI 2.0 Gadget I/O)'
+  $ aplaymidi -p 20:1 to_host.mid
+
+在主机端::
+
+  $ aconnect -i
+  ....
+  client 24: 'MIDI 2.0 Gadget' [type=kernel,card=2]
+      0 'MIDI 2.0        '
+      1 'Group 1 (MIDI 2.0 Gadget I/O)'
+  $ arecordmidi -p 24:1 from_gadget.mid
+
+如果你有支持UMP的应用程序，也可以使用UMP端口
+发送/接收原始UMP数据包。例如，支持UMP的aseqdump程序
+可以从UMP端口接收数据。在主机端::
+
+  $ aseqdump -u 2 -p 24:1
+  Waiting for data. Press Ctrl+C to end.
+  Source  Group    Event                  Ch  Data
+   24:1   Group  0, Program change          0, program 0, Bank select 0:0
+   24:1   Group  0, Channel pressure        0, value 0x80000000
+
+要测试从主机到gadget的MIDI输出（例如模拟MIDI合成器），则相反。
+
+在设备端::
+
+  $ arecordmidi -p 20:1 from_host.mid
+
+在主机端::
+  $ aplaymidi -p 24:1 to_gadget.mid
+
+在主机端支持对altset 0上的MIDI 1.0的访问，
+并且它在gadget上被翻译为UMP数据包。该功能仅绑定到功能块0。
+
+当前操作模式可通过ALSA控制元素"SND_CTL_IFACE_RAWMIDI"的“Operation Mode”查看。
+例如::
+
+  $ amixer -c1 contents
+  numid=1,iface=RAWMIDI,name='Operation Mode'
+    ; type=INTEGER,access=r--v----,values=1,min=0,max=2,step=0
+    : values=2
+
+其中0 = 未使用，1 = MIDI 1.0（altset 0），2 = MIDI 2.0（altset 1）。
+上述示例显示当前运行模式为2，即MIDI 2.0。
-- 
2.52.0

