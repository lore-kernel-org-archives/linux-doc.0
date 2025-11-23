Received: from mail-m49228.qiye.163.com (mail-m49228.qiye.163.com [45.254.49.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20CD2C0262
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763898977; cv=none; b=IsYOG8YW6HS0AThewUZfpfG5rhj0i8Ei7LgQ2w5M8uilUIXdbSufyhKrywXyZmOywt2ugv1jqZM31MohM+UiD3BblC9p9ma5fo/99pUVFI6/80RigyEVjMaPSr44q4ysjRfAN6WYhqxTbsyNcaXlLVngcoDeZfXlw4Oi1/ogv7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763898977; c=relaxed/simple;
	bh=ubDeS5jLc2Jd1AB42Oc2btJFwkhz+UIHbLJhSrRw41M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MP4B9xMvKCt+eFxbpTUNFqtJ9OrR+kgLrBk5T9C2jUySf3haKI4N5w66UTjgN+UVvi/WVVLhStdXk5KVqgskB1wK3FBXySdizYajWI0mCNVHo9MgZZqIoe8jBd0BbJebSk6qqkc9rk6FoCr3/aUAuh/jioo7OPgJ92NLoG6giTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=Bcg3SShy; arc=none smtp.client-ip=45.254.49.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="Bcg3SShy"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a90290fd;
	Sun, 23 Nov 2025 19:56:05 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 13/25] docs/zh_CN: Add gadget_serial.rst translation
Date: Sun, 23 Nov 2025 19:56:11 +0800
Message-ID: <44f421d472e6ed0955dac20ee5eede23fd3e83c3.1763897036.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9ab0923db709d5kunm2b5c8c0429adb7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHksfVh4eSkpIGRlCSE4ZHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Bcg3SShywrzFPXu5JPzhYHsv70e0Wok5PJSbHiafPgMg2Yl3k7LwOEzPmCe2zL9oZrab+WaZKMd1+IOTr1y6377LbrXF2CCuB98TCWXAr9Knz9LZo5d+A8As8325kc8XJUprxcONzyjv5QzoJ6hDnpFIkVg/Nobsezux8b6gviYPUYF4lfdTYULQZ3prJ8P8NDo/U5HaGvyK7vZxuShCdJOdhSV2BXzI8rdDjLUTHdqZLBlolkayswmQDn1Py4mEcXRDtYS9/O8xn1od0iFVDsTFmImKr6xTvrcHEZzMXxkYrjnaAKAqlKIzWA9sF567sLAkhEfb09/kY/Z4P2EShQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=GdvLIvwthFUzvFNihRuis5x0zfHBR7SFxW53vZol+Cc=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/gadget_serial.rst into Chinese.

Update the translation through commit ecefae6db042
("docs: usb: rename files to .rst and add them to drivers-api")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/gadget_serial.rst  | 259 ++++++++++++++++++
 1 file changed, 259 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/gadget_serial.rst

diff --git a/Documentation/translations/zh_CN/usb/gadget_serial.rst b/Documentation/translations/zh_CN/usb/gadget_serial.rst
new file mode 100644
index 000000000000..9d49d535b0b2
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/gadget_serial.rst
@@ -0,0 +1,259 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/gadget_serial.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+==========================
+Linux Gadget 串口驱动 v2.0
+==========================
+
+2004/11/20
+
+(v2.3 更新于 2008/05/08)
+
+
+许可证与免责声明
+-------------------
+本程序是自由软件；您可以依据自由软件基金会发布的GNU通用公共许可证第2版，
+或（由您选择的）任何更高版本的规定，对本程序进行再发布和/或修改。
+
+我们希望本程序有用，但不提供任何担保；甚至不包含对适销性或适用于特定目的的默示性担保。
+更多细节请参阅GNU通用公共许可证。
+
+您应该已经随本程序收到GNU通用公共许可证副本；
+如果没有，请写信至：Free Software Foundation, Inc., 59
+Temple Place, Suite 330, Boston, MA 02111-1307 USA。
+
+本文档及Gadget串口驱动版权所有
+ (C) 2004 Al Borchers (alborchers@steinerpoint.com)。
+
+如有问题或建议，请联系Al Borchers（邮箱 alborchers@steinerpoint.com）。
+
+
+前提条件
+--------
+Gadget 串口驱动可用于 2.4 Linux 内核版本，
+但本文档假定使用 2.6 内核上的 2.3 或更高版本。
+
+本文档假设你熟悉Linux与Windows，
+了解如何配置与编译Linux内核、运行标准工具、
+使用minicom或HyperTerminal，并操作 USB 与串口设备。
+还假设你将Linux gadget和USB驱动配置为模块。
+
+在v2.3版本中，设备节点的主次设备号不再静态定义。
+基于Linux的系统应挂载sysfs到/sys，
+并使用mdev（Busybox）或udev来创建匹配/sys/class/tty的/dev节点。
+
+
+
+概述
+----
+Gadget 串口驱动是 Linux USB gadget 驱动，即 USB 设备端驱动。
+它运行在具有 USB 设备端硬件的 Linux 系统上，
+例如 PDA、嵌入式 Linux 系统或带 USB 开发卡的 PC。
+
+驱动通过 USB 与主机上的 CDC ACM 驱动或通用 USB 串口驱动通信：::
+
+   主机端
+   --------------------------------------
+  | Host-Side   CDC ACM       USB Host   |
+  | Operating |   or        | Controller |   USB
+  | System    | Generic USB | Driver     |--------
+  | (Linux or | Serial      | and        |        |
+  | Windows)    Driver        USB Stack  |        |
+   --------------------------------------         |
+                                                  |
+                                                  |
+                                                  |
+    Gadget 端                                     |
+   --------------------------------------         |
+  | Gadget                   USB Periph. |        |
+  | Device-Side |  Gadget  | Controller  |        |
+  | Linux       |  Serial  | Driver      |--------
+  | Operating   |  Driver  | and         |
+  | System                   USB Stack   |
+   --------------------------------------
+
+在设备端，Gadget 串口驱动表现为一个串口设备。
+在主机端，它表现为 CDC ACM 兼容类设备或
+具有 Bulk 输入/输出端点的厂商特定设备，可像普通串口设备一样使用。
+
+在主机端系统上，Gadget 串口设备看起来像一个
+CDC ACM 兼容类设备或一个简单的厂商特定设备，
+具有 Bulk 输入和输出端点，并且它的处理方式类似
+于其他串口设备。
+
+通过 Gadget 串口驱动和主机端 ACM/通用串口驱动，
+你可以像使用串口线一样在主机与设备端系统间通信。
+
+Gadget 串口驱动只提供简单、不可靠的数据通信，
+目前不支持流控及常规串口的其他高级功能。
+
+
+安装 Gadget 串口驱动
+--------------------
+要使用 Gadget 串口驱动，
+您必须为 Linux gadget 端内核配置“支持 USB Gadgets”，
+为“USB 外设控制器”（例如 net2280）以及“串口 Gadget”驱动程序。
+所有这些都列在配置内核时的“USB Gadget 支持”下。
+然后重新构建并安装内核或模块.
+
+然后，你必须加载 Gadget 串口驱动。
+要将其作为 ACM 设备（推荐以提高兼容性）加载，请执行以下命令::
+
+  modprobe g_serial
+
+要将其作为厂商特定的 Bulk 输入/输出设备加载，请执行以下命令::
+
+  modprobe g_serial use_acm=0
+
+此操作也会自动加载底层的 Gadget 外设控制器驱动。
+每次重启 Gadget 端 Linux 系统时都必须执行此操作。
+如果需要，可以将其添加到启动脚本中。
+
+你的系统应使用 mdev（来自 Busybox）或 udev 来创建设备节点。
+在设置好该 Gadget 驱动后，你应能看到 /dev/ttyGS0 节点::
+
+  # ls -l /dev/ttyGS0 | cat
+  crw-rw----    1 root     root     253,   0 May  8 14:10 /dev/ttyGS0
+  #
+
+注意，上述主设备号（253）依系统而异。
+如果需要手动创建 /dev 节点，
+正确的主/次设备号可在 /sys/class/tty/ttyGS0/dev 文件中找到。
+
+如果你希望较早（甚至静态地）链接此 Gadget 驱动，
+可能需要在 /etc/inittab 中设置一条记录以在该设备上运行 getty。
+/dev/ttyGS0 行应像其他串口端口一样工作。
+
+
+如果 Gadget 串口以 ACM 设备方式加载，
+你需要在主机端使用 Windows 或 Linux 的 ACM 驱动。
+如果 Gadget 串口以 Bulk 输入/输出设备方式加载，
+你需要在主机端使用 Linux 通用串口驱动。
+请按照下面的说明安装主机端驱动。
+
+
+安装 Windows 主机 ACM 驱动
+--------------------------
+要使用 Windows ACM 驱动，你必须拥有 linux-cdc-acm.inf 文件（随本文件提供），
+支持所有近期版本的 Windows。
+
+当加载 Gadget 串口驱动并用 USB 数据线连接设备到 Windows 主机时，
+Windows 应识别该设备并提示安装驱动。
+告诉 Windows 在包含 linux-cdc-acm.inf 文件的文件夹中查找驱动。
+
+例如，在 Windows XP 上，首次插入 Gadget 串口设备时，会启动“新硬件向导”。
+选择“从列表或指定位置安装（高级）”，然后在下一屏选择“包括此位置进行搜索”，
+并输入或浏览到包含 linux-cdc-acm.inf 文件的文件夹。
+Windows 会提示 Gadget Serial 驱动未通过 Windows Logo 测试，
+但选择“继续安装”，完成驱动安装。
+
+在 Windows XP 的“设备管理器”（控制面板 → 系统 → 硬件）
+中展开“端口（COM & LPT）”条目，
+你应看到“Gadget Serial”列为某个 COM 端口的驱动。
+
+要卸载 Windows XP 上的 Gadget Serial 驱动：
+右键单击设备管理器中的“Gadget Serial”条目，选择“卸载”。
+
+
+安装 Linux 主机 ACM 驱动
+------------------------
+要使用 Linux ACM 驱动，必须在 Linux 主机内核中启用：
+“Host-side USB 支持”以及“USB Modem (CDC ACM) 支持”。
+
+当 Gadget 串口驱动加载且设备通过 USB 连接到 Linux 主机后，
+主机系统应能识别 Gadget 串口设备。
+例如，执行命令::
+
+  cat /sys/kernel/debug/usb/devices
+
+输出应类似:::
+
+  T:  Bus=01 Lev=01 Prnt=01 Port=01 Cnt=02 Dev#=  5 Spd=480 MxCh= 0
+  D:  Ver= 2.00 Cls=02(comm.) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
+  P:  Vendor=0525 ProdID=a4a7 Rev= 2.01
+  S:  Manufacturer=Linux 2.6.8.1 with net2280
+  S:  Product=Gadget Serial
+  S:  SerialNumber=0
+  C:* #Ifs= 2 Cfg#= 2 Atr=c0 MxPwr=  2mA
+  I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01 Driver=acm
+  E:  Ad=83(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
+  I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=acm
+  E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
+  E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
+
+如果主机 Linux 系统配置正确，ACM 驱动应自动加载。
+执行 lsmod 命令应显示 acm 模块已加载。
+
+
+安装 Linux 主机通用 USB 串口驱动
+-------------------------------------
+要使用 Linux 通用 USB 串口驱动，必须在 Linux 主机内核中启用：
+“Host-side USB 支持”、“USB 串口转换器支持”以及“USB 通用串口驱动”。
+
+当 Gadget 串口驱动加载且设备通过 USB 连接到 Linux 主机后，
+主机系统应能识别 Gadget 串口设备。
+例如，执行命令::
+
+  cat /sys/kernel/debug/usb/devices
+
+输出应类似:::
+  T:  Bus=01 Lev=01 Prnt=01 Port=01 Cnt=02 Dev#=  6 Spd=480 MxCh= 0
+  D:  Ver= 2.00 Cls=ff(vend.) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
+  P:  Vendor=0525 ProdID=a4a6 Rev= 2.01
+  S:  Manufacturer=Linux 2.6.8.1 with net2280
+  S:  Product=Gadget Serial
+  S:  SerialNumber=0
+  C:* #Ifs= 1 Cfg#= 1 Atr=c0 MxPwr=  2mA
+  I:  If#= 0 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=serial
+  E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
+  E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
+
+你必须加载 usbserial 驱动并显式设置其参数
+以配置其识别 Gadget 串口设备，如下所示::
+
+  echo 0x0525 0xA4A6 >/sys/bus/usb-serial/drivers/generic/new_id
+
+传统方法是使用模块参数::
+
+  modprobe usbserial vendor=0x0525 product=0xA4A6
+
+如果一切正常，usbserial 会在系统日志中打印一条消息，
+类似于 "Gadget Serial converter now attached to ttyUSB0"。
+
+
+使用Minicom或HyperTerminal测试
+------------------------------
+一旦 Gadget 串口驱动和主机驱动都安装完成，
+并且通过 USB 数据线将 Gadget 设备连接到主机，
+你应该能够在 Gadget 和主机系统之间通过 USB 进行通信。
+你可以使用 minicom 或 HyperTerminal 来尝试这一点。
+在 Gadget 端运行 "minicom -s" 来配置一个新的 minicom 会话。
+在“串口设置”中，将“串口设备”设置为 "/dev/ttygserial"。
+设置波特率、数据位、校验位和停止位为 9600、8、无和 1——这些设置大多无关紧要。
+在“调制解调器和拨号”中，清除所有调制解调器和拨号字符串。
+
+在运行 ACM 驱动的 Linux 主机上，类似地配置 minicom，
+但将“串口设备”设置为 "/dev/ttyACM0"。（如果连接了其他
+ACM 设备，请相应地更改设备名称。）
+
+在运行 USB 通用串口驱动的 Linux 主机上，类似地配置 minicom，
+但将“串口设备”设置为 "/dev/ttyUSB0"。（如果连接了其他
+USB 串口设备，请相应地更改设备名称。）
+
+在 Windows 主机上，配置一个新的 HyperTerminal 会话，
+使用分配给 Gadget Serial 的 COM 端口。
+当 HyperTerminal 连接到 Gadget Serial 设备时，
+“端口设置”将自动设置，因此你可以保持默认值不变——这些设置大多无关紧要。
+
+当 Gadget 端的 minicom 和主机端的 minicom 或 HyperTerminal 都配置并运行时，
+你应该能够在 Gadget 端和主机端系统之间通过 USB 发送和接收数据。
+你在 Gadget 端终端窗口中输入的任何内容都应出现在主机端的终端窗口中，反之亦然。
-- 
2.52.0

