Received: from mail-m1973179.qiye.163.com (mail-m1973179.qiye.163.com [220.197.31.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408742D47E8
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763898981; cv=none; b=jLgzKXqlULEETbydmH8znuqwjwQmGgf4HvbsQWUswM69NQ4gAq6PxRnkxWacQhkqnXVyMvPPa8ZdbgCaR8dIAWatTtptChn1zu1s56pPDtAzzbG+csOASjmhpkKdCGDjK2pfT6K5Bqjn25HWDzM2f/Lsc4WKVEVuXnJBE3z0fEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763898981; c=relaxed/simple;
	bh=o9tEpGCd4osP+/xFklgI7j3IkbRuwbs7qwMuT+z8aIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KcirKhRiFe/1OUTXZ+d29gzujk46YGNInm8xhPtUoAo60BbGPx+Pc+nhYefBYlsacc8OcRtfVkcUux5iwccXxllLujAUW9QoF76yhp/W/LhnetlRa0CkSBobO59u20oVWNBQstRNqlZlrPsjkC0FONKxvkgZsCw2O9cjM33Hu0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=GiadtJpJ; arc=none smtp.client-ip=220.197.31.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="GiadtJpJ"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a902910d;
	Sun, 23 Nov 2025 19:56:13 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 23/25] docs/zh_CN: Add usb-serial.rst translation
Date: Sun, 23 Nov 2025 19:56:21 +0800
Message-ID: <5120e3b510313308cedee4dc696aba69b74433df.1763897036.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9ab0925d6f09d5kunm2b5c8c0429ade5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGElJVh8eHxpOQ0NIHRlISVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=GiadtJpJ6D0eIx56tYO5QBWf+L4zf1tzkoGxWzEMvXVSkqSxFlzfcPOF+1RMhytjgVeM3i8UEHANKMMf9Phox9CAWgk355lJlpL+A9mbGgBA8KQA0nzJRmEoNEPW2LwCpthJ0vmtdenEn/TmCYY4BwNFitPklwSD1T7GilHR64mcoaZcQUSGUAYexBKNQaMjcFDkg/de0qkpdIPhRpJ5Yu16fPfHMugUjBpTDnTTiuhddXSKieMZfGq7sxEAZMeC5yqhGuD16Ee/KF5LF4g0o9cdBS2oe3sUAkftjTLYbNZuMsC+sCw0uetAW+nP4iJ2m7WBNa6LhgRs63XE3XQ9QA==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=j2j1p7dBtLI+ysz22sSVWk6HKuUOeRnFMfWCUMg0R54=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/usb-serial.rst into Chinese.

Update the translation through commit 9e255e2b9afe
("Documentation: drop optional BOMs")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/usb-serial.rst     | 451 ++++++++++++++++++
 1 file changed, 451 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/usb-serial.rst

diff --git a/Documentation/translations/zh_CN/usb/usb-serial.rst b/Documentation/translations/zh_CN/usb/usb-serial.rst
new file mode 100644
index 000000000000..480032530e11
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/usb-serial.rst
@@ -0,0 +1,451 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/usb-serial.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+==========
+USB 串口
+==========
+
+简介
+====
+
+USB 串口驱动目前支持多种 USB 转串口转换器产品，以及一些通过用户空间串口接口与设备通信的设备。
+
+具体设备的信息请参阅下文各产品部分。
+
+
+配置
+====
+
+  当前驱动可以同时处理最多 256 个不同的串口接口。
+
+  驱动使用的主设备号是 188，因此要使用该驱动，需要创建如下设备节点：::
+
+	mknod /dev/ttyUSB0 c 188 0
+	mknod /dev/ttyUSB1 c 188 1
+	mknod /dev/ttyUSB2 c 188 2
+	mknod /dev/ttyUSB3 c 188 3
+		.
+		.
+		.
+	mknod /dev/ttyUSB254 c 188 254
+	mknod /dev/ttyUSB255 c 188 255
+
+  当设备连接并被驱动识别后，驱动会打印到系统日志，显示设备绑定到了哪个节点。
+
+
+支持的具体设备
+===================
+
+
+ConnectTech WhiteHEAT 四口转换器
+-------------------------------------------
+
+  ConnectTech 提供了该设备的详细信息和测试用设备。
+
+  该驱动由 Connect Tech Inc. 官方支持：
+  http://www.connecttech.com
+
+  如有问题，请联系 Connect Tech 技术支持：support@connecttech.com
+
+
+HandSpring Visor, Palm USB, 和 Clié USB驱动
+-------------------------------------------
+
+  该驱动适用于所有 HandSpring USB、Palm USB 及 Sony Clié USB 设备。
+
+  设备尝试连接主机时，才会显示为有效 USB 设备。
+  此时设备会被正确枚举、分配端口，然后通信才可能进行。
+  设备移除或取消连接时，驱动会正确清理。
+
+  注意：
+    要与设备通信，必须在尝试与设备交互前按下同步按钮。
+	这与现有的 pilot-xfer 等文档描述不同，但这是由于硬件原因的唯一方法。
+
+    设备连接后，如果系统中没有其他 USB-串口设备）进行通信，
+	通常通过第二个端口（通常是 /dev/ttyUSB1，。
+	系统日志会显示用于 HotSync 的端口，
+	“Generic”端口可用于其他通信，例如 PPP 链接。
+
+    对于部分 Sony Clié 设备，必须使用 /dev/ttyUSB0，
+	尤其是 OS 版本 3.5 或升级过的设备。
+	系统日志会显示正确端口。
+
+    如果按下同步按钮后系统日志没有输出，尝试先热复位，再冷复位。部分设备必须这样才能正常与 USB 通信。
+
+    未编译进内核的设备可以通过模块参数指定，例如：
+     modprobe visor vendor=0x54c product=0x66
+
+    更多信息及邮件列表请访问：http://sourceforge.net/projects/usbvisor/
+
+    如有问题，请联系 Greg Kroah-Hartman：greg@kroah.com
+
+PocketPC PDA驱动
+----------------
+
+  该驱动通过 USB 数据线或底座，用于连接 Compaq iPAQ、HP Jornada、Casio EM500
+  等运行 Windows CE 3.0 或 PocketPC 2002 的 PDA。
+
+  支持 ActiveSync 的大多数设备开箱即用。
+  对于其他设备，可通过模块参数指定产品和厂商 ID，
+  例如： modprobe ipaq vendor=0x3f0 product=0x1125
+
+  驱动提供串口接口（通常为 /dev/ttyUSB0），可通过 PPP 建立 TCP/IP 链接与 PDA 通信，
+  进行文件传输、备份、邮件下载等。USB 的优势是速度快，可达 73~113 kB/s。
+
+  使用 USB 连接还需要其他组件，详情见：http://synce.sourceforge.net
+
+  连接后，可在 PDA 上使用 ftpView、Pocket Outlook，
+  在 Linux 上使用 xcerdisp、synce 工具。
+
+  使用 Pocket IE 可参考：http://www.tekguru.co.uk/EM500/usbtonet.htm，Linux
+  可直接转发数据包，无需代理。
+  iPAQ 用户需在菜单关闭自动同步，然后启动 usbdial 建立连接。
+
+  若遇问题，可加载 usbserial 和 ipaq 模块并开启调试参数 debug=1，
+  检查系统日志；也可尝试软复位 PDA 后再连接。
+
+  其他功能取决于 PDA。部分设备可进入 bootloader 模式，
+  通过 /dev/ttyUSB0 终端进行 USB Reflash。
+  此方法未测试，风险自负。
+
+  问题请联系 Ganesh Varadarajan：ganesh@veritas.com
+
+
+Keyspan PDA串口适配器
+------------------------------
+
+  单端口 DB-9 串口适配器，多用于 iMac PDA，固件为自制。
+  也适用于 Xircom/Entrega 单口适配器。
+
+  当前状态：
+
+   支持功能：
+     - 基本 I/O（可用 'cu' 测试）
+     - 串口阻塞写
+     - 波特率切换（最高 115200）
+     - 调制解调器控制引脚操作（TIOCM{GET,SET,BIS,BIC}）
+
+发送 break（时长可能不准确）
+
+   不支持功能：
+     - 设备字符串（内核日志中记录）带有尾随的二进制垃圾
+     - 设备 ID 不正确，可能与其他 Keyspan 产品冲突
+     - 切换波特率时应刷新发送/接收缓冲区以避免字符混乱
+
+   重要待办事项：
+     - 奇偶校验，7 位与 8 位字符，1 或 2 个停止位
+     - 硬件流控制
+     - 并非所有标准 USB 描述符都被处理：
+       Get_Status, Set_Feature, O_NONBLOCK, select()
+
+  如有问题，请联系 Brian Warner：warner@lothar.com
+
+
+Keyspan USA-系列串口适配器
+-------------------------------------------
+
+  单、双及四端口适配器，使用 Keyspan 官方固件。
+
+  支持设备：USA-18X、USA-28X、USA-19、USA-19W、USA-49W，测试良好。USA-28 尚未支持。
+
+  更多信息： http://www.carnationsoftware.com/carnation/Keyspan.html
+
+  问题请联系 Hugh Blemings：hugh@misc.nu
+
+
+FTDI 单口串口驱动
+-----------------------------------------
+
+  支持设备：TripNav TN-200 USB GPS、Navis Engineering CH-4711 USB GPS
+
+  问题请联系 Bill Ryder。
+
+
+ZyXEL omni.net lcd plus ISDN TA
+-----------------------------------------------
+
+  请将使用情况和问题报告给 azummo@towertech.it
+
+
+Cypress M8 CY4601 系列串口驱动
+-----------------------------------------
+
+  该驱动在很大程度上由 Neil “koyama” Whelchel 开发。
+  自之前的版本以来，该驱动已得到改进，以支持动态串口设置并改善线路处理。
+  该驱动总体上是稳定的，并已在 SMP 机器（双 P2）上进行测试。
+
+    CY4601 系列支持的芯片组：
+
+		CY7C63723, CY7C63742, CY7C63743, CY7C64013
+
+    支持的设备：
+
+		- DeLorme 的 USB Earthmate GPS（SiRF Star II lp 架构）
+		- Cypress HID->COM RS232 适配器
+
+		注意：
+			Cypress Semiconductor 声明与该 HID 转 COM 设备无任何关联。
+
+     大多数使用 CY4601 系列芯片的设备都应该可以使用该驱动，
+	 只要它们遵循 CY4601 的 USB 串口规范。
+
+    技术说明：
+
+        Earthmate 默认的初始设置是
+		4800 波特率、8 数据位、无校验、1 停止位（4800 8N1）……
+		驱动启动时会以此设置初始化。
+		usbserial 核心负责其余的 termios 配置，
+		并提供一些自定义的 termios 设置，
+		以保证输出格式正确且可解析。
+
+	设备可以通过发送 NMEA 命令进入 sirf 模式::
+
+		$PSRF100,<protocol>,<baud>,<databits>,<stopbits>,<parity>*CHECKSUM
+		$PSRF100,0,9600,8,1,0*0C
+
+		之后只需将串口的termios设置改为与之匹配，即可开始通信。
+
+	据我所知，它几乎支持所有在线文档中列出的 Sirf 命令（适用于固件版本 2.31），
+	但有一些消息 ID 未知。
+
+	hid->com 适配器的最高波特率为 115200 bps。
+	请注意，该设备在提升线路电压方面存在问题，或者无法正确提升线路电压。
+	在使用 null modem 链接时不会有问题，
+	只要不要尝试将两个设备直接连接在一起而不改装适配器以提升线路电压。
+
+    该驱动支持 SMP（对称多处理器）环境。
+	在使用该驱动进行文件传输时，性能相对较低。
+	目前正在改进中，但我也愿意接受补丁。
+	这里使用 URB 队列或数据包缓冲区可能是一个可行的解决方案。
+
+    如果你有任何问题、遇到的故障、补丁或功能请求等，可以通过电子邮件联系我：
+    dignome@gmail.com（你的问题或补丁也可以提交到 usb-devel 邮件列表）。
+
+
+Digi AccelePort驱动
+--------------------------
+
+  该驱动支持 Digi AccelePort USB 2 和 4 端口设备，
+  包括 2 端口（外加一个并口）和 4 端口的 USB 串口转换器。
+  该驱动 尚不支持 Digi AccelePort USB 8。
+
+  该驱动在使用 usb-uhci 驱动的 SMP 系统下可以正常工作，
+  但在使用 uhci 驱动的 SMP 系统下无法工作。
+
+  总体来说，该驱动功能基本可用，
+  但仍有一些 ioctl 需要实现，并且最终测试和调试尚未完成。
+  USB 2 上的并口被支持为串口到并口的转换器；
+  换句话说，它在 Linux 上表现为另一个 USB 串口，
+  虽然实际上它是一个并口。
+  Digi AccelePort USB 8 尚未支持。
+
+  如对该驱动有任何问题或疑问，请联系 Peter Berger（pberger@brimson.com）或
+  Al Borchers（alborchers@steinerpoint.com）。
+
+Belkin USB 串口适配器F5U103
+-------------------------------------------
+
+  这是 Belkin 出品的单端口 DB-9/PS-2 串口适配器，固件由 eTEK Labs 提供。
+  Peracom 的单端口串口适配器以及 GoHubs 适配器也可使用该驱动。
+
+  当前状态：
+
+    经过测试，以下功能可用：
+
+      - 波特率    300-230400
+      - 数据位    5-8
+      - 停止位    1-2
+      - 校验       N,E,O,M,S
+      - 握手       无，软件 (XON/XOFF)，硬件 (CTSRTS,CTSDTR) [1]_
+      - 断开       设置和清除
+      - 行控制 输入/输出查询和控制 [2]_
+
+  .. [1]
+         硬件输入流控仅在固件版本高于 2.06 时启用。
+	     可阅读源码注释了解 Belkin 固件的已知问题。
+		 硬件输出流控在所有固件版本中均可使用。
+
+  .. [2]
+         输入查询（CTS、DSR、CD、RI）显示最后报告的状态。
+		 输出查询（DTR、RTS）显示最后请求的状态，
+		 可能与自动硬件流控设置的当前状态不一致。
+
+  待办事项：
+    - 添加真正的调制解调器控制线查询功能。目前跟踪中断报告的状态和请求的状态。
+    - 添加 UART 错误条件的错误报告回应用程序。
+    - 添加对刷新 ioctl 的支持。
+    - 添加所有其他缺失的功能。
+
+  如对该驱动有任何问题或疑问，请联系 William
+  Greathouse，邮箱：wgreathouse@smva.com
+
+Empeg empeg-car Mark I/II驱动
+------------------------------
+
+  这是一个实验性驱动，用于为 Empeg empeg-car MP3 播放器提供客户端同步工具的连接支持。
+
+  使用提示：
+    * 不要忘记为 ttyUSB{0,1,2,...} 创建设备节点
+    * modprobe empeg (modprobe 是你的朋友)
+    * emptool --usb /dev/ttyUSB0 (或者你为设备节点命名的其他名称)
+
+  如对该驱动有任何问题或疑问，请联系 Gary
+  Brubaker，邮箱：xavyer@ix.netcom.com
+
+
+MCT USB 单端口串口适配器 U232
+-------------------------------------------
+
+  该驱动用于 Magic Control Technology Corp 生产的 MCT USB-RS232 转换器
+  （25 针型号 U232-P25，也有 9 针型号 U232-P9）。
+  更多信息请访问制造商网站：http://www.mct.com.tw。
+
+  该驱动总体上是可用的，尽管仍需进行更多测试。
+  它是从 Belkin USB 串口适配器 F5U103 驱动派生而来，其
+  待办事项列表同样适用于该驱动。
+  该驱动也被发现适用于其他产品，这些产品具有相同的供应商 ID 但产品 ID 不同。
+  Sitecom 的 U232-P25 串口转换器使用产品 ID 0x230 和供应商 ID 0x711，
+  并且可以使用该驱动。
+  D-Link 的 DU-H3SP USB BAY 也可以使用该驱动。
+  如对该驱动有任何问题或疑问，请联系 Wolfgang
+  Grandegger，邮箱：wolfgang@ces.ch
+
+
+Inside Out Networks Edgeport驱动
+-----------------------------------
+
+  该驱动支持 Inside Out Networks 公司生产的所有设备，具体型号如下：
+
+       - Edgeport/4
+       - Rapidport/4
+       - Edgeport/4t
+       - Edgeport/2
+       - Edgeport/4i
+       - Edgeport/2i
+       - Edgeport/421
+       - Edgeport/21
+       - Edgeport/8
+       - Edgeport/8 Dual
+       - Edgeport/2D8
+       - Edgeport/4D8
+       - Edgeport/8i
+       - Edgeport/2 DIN
+       - Edgeport/4 DIN
+       - Edgeport/16 Dual
+
+  如对本驱动有任何问题或疑问，请联系 Greg Kroah-Hartman（greg@kroah.com）。
+
+
+REINER SCT cyberJack pinpad/e-com USB 智能卡读卡器
+--------------------------------------------------
+
+  该设备用于与 ISO 7816 兼容的接触式芯片卡通信，例如 GSM SIM 卡。
+
+  当前状态：
+
+    这是该 USB 智能卡读卡器的内核部分驱动。
+	同时，还提供了用户空间的 CT-API 驱动。
+	下载地址待定，目前可以向维护者（linux-usb@sii.li）请求获取。
+
+    如对本驱动有任何问题或疑问，请联系 linux-usb@sii.li。
+
+
+Prolific PL2303驱动
+----------------------
+
+  该驱动支持任何使用 Prolific PL2303 芯片的设备。
+  这包括多个单口 USB 转串口转换器、2010 年约 70% 的 USB GPS 设备，
+  以及一些 USB UPS。Aten（UC-232）和 IO-Data 的设备也能使用此驱动，
+  DCU-11 手机数据线也支持。
+
+   如对本驱动有任何问题或疑问，
+   请联系 Greg Kroah-Hartman（greg@kroah.com）。
+
+
+KL5KUSB105芯片组 / PalmConnect USB单端口适配器
+--------------------------------------------------------
+
+当前状态：
+
+  该驱动是通过分析 Palm 在 Windows 下的 USB 总线交互而开发的，
+  因此仍有许多功能缺失。
+  特别是串口 ioctl 有时是模拟的，
+  或者尚未实现。
+  不过，对 DSR 和 CTS 线路状态的支持已经实现（虽然不够完美），
+  所以常用的 autopilot 和 pilot-manager 守护程序调用可以正常工作。
+  驱动支持最高 115200 的波特率，
+  但握手（软件或硬件）尚不支持，
+  因此在进行大数据传输时，建议降低波特率以保证稳定性。
+
+  最新的驱动信息请访问：http://www.uuhaus.de/linux/palmconnect.html
+
+Winchiphead CH341 驱动
+------------------------
+
+  该驱动用于 Winchiphead CH341 USB-RS232 转换器。
+  该芯片还支持 IEEE 1284 并口、I2C 和 SPI，但驱动不支持这些功能。
+  协议是通过分析 Windows 驱动的行为得到的，目前没有公开的数据手册。
+
+  厂商官网：http://www.winchiphead.com/
+
+  如对本驱动有任何问题或疑问，请联系 frank@kingswood-consulting.co.uk
+
+Moschip MCS7720, MCS7715 驱动
+-------------------------------
+
+  这些芯片存在于多家厂商销售的设备中，
+  例如 Syba 和 Cables Unlimited，可能还有其他厂商。
+  MCS7720 提供两个串口，MCS7715 提供一个串口和一个标准 PC 并口。
+  对 7715 并口的支持需要通过单独选项启用，
+  该选项只有在设备驱动顶层配置菜单中先启用并口支持时才会出现。
+  目前并口仅支持兼容模式（不支持 ECP/EPP）。
+
+待办事项：
+
+    - 实现并口的 ECP/EPP 模式。
+    - 目前超过 115200 波特率的支持存在问题。
+    - 基于 Moschip MCS7703 的单串口设备可能可以通过在 usb_device_id 表中添加条目来支持该驱动。
+	  但我手头没有这些设备，所以无法确认。
+
+通用串口驱动
+-------------------------------------------
+
+  如果你的设备不属于上面列出的型号，或者不兼容这些型号，
+  可以尝试使用“通用”接口。该接口不会向设备发送任何控制消息，
+  也不支持任何设备流控制。
+  你的设备只需至少有一个 bulk 输入端点或一个 bulk 输出端点即可。
+
+  要让通用驱动识别你的设备，可以执行::
+
+	echo <vid> <pid> >/sys/bus/usb-serial/drivers/generic/new_id
+
+  其中 <vid> 和 <pid> 替换为设备厂商 ID 和产品 ID 的十六进制表示。
+  如果驱动是作为模块编译的，也可以在加载模块时提供一个 ID：::
+
+	insmod usbserial vendor=0x#### product=0x####
+
+  该驱动已成功用于连接 NetChip USB 开发板，
+  提供了一种开发 USB 固件而无需编写自定义驱动的方法。
+
+  如对该驱动有任何问题或疑问，请联系 Greg Kroah-Hartman，邮箱：greg@kroah.com。
+
+
+联系信息
+=====================
+
+  如果在使用上述驱动或任何指定设备时遇到问题，
+  请联系对应驱动的作者（联系方式已在上文列出），
+  或者加入 Linux-USB 邮件列表。
+  邮件列表的加入方式及可搜索的归档链接请见：http://www.linux-usb.org/。
+
+Greg Kroah-Hartman
+greg@kroah.com
-- 
2.52.0

