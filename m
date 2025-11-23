Received: from mail-m1973175.qiye.163.com (mail-m1973175.qiye.163.com [220.197.31.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4289E186E40
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 07:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763883926; cv=none; b=om+XOSrkac6GkHG7jCi89Qs86G6lOUbGXbTGHri9Xmln8gL7pUQtmY+g+fVFSJyNaq6D9CXO+sffGPlAf5urcI9PZakvd63licMAkVwpVO3EaVOhPlMmo3ZgcrmDFfISM4Utf6VviG/tv0cOfot8xpKkncXoI/OSS8bRiHHZ4eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763883926; c=relaxed/simple;
	bh=+NN/+tmf5tmFenSclDI5RYhHRygbk1jWwllFL7yrUFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aTddYF3hPhYIHbMh8ihuwg2etWNSRbVQPoziSx03l1K/pNHIWRREJxhX4oyptnsRMuSFQOLQia5wB3K+kg7K9gov3d95a5nKm9i7QgxwW45JMl8aUzCBqrouH0ENx6ceT8ghe05eisGv09lddGq70I7s5Cy4/Z2+e9GQ/lVqWzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=JpU9LgT4; arc=none smtp.client-ip=220.197.31.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="JpU9LgT4"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99af;
	Sun, 23 Nov 2025 15:45:14 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 04/25] docs/zh_CN: Add chipidea.rst translation
Date: Sun, 23 Nov 2025 15:45:19 +0800
Message-ID: <20251123074540.34161-5-baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251123074540.34161-1-baikefan@leap-io-kernel.com>
References: <20251123074540.34161-1-baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aafac936609d5kunm0cca7198286612
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTR5NVkxMQklDTxkZT0IeTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=JpU9LgT49Y0pxLELerCsmn/amy/NCTG4wnPxictUBXanqu/8kxZdE6QH8JAU4gNDJA+TF2yTXnXO5wtwtQ7uq9YsyDbK4tjLzBOG/n7Vs6wBKdR/WLXOqDT8Gd+qidEL6CXSE+UfgKcsmDJMnOqhT3YSa7H3lNtZoiDx/ta5oZEaya88qgHPaSKRFhKwriVhQagDCtJeyUZK4+zLA0l6ULiXDtcpEwupRUKbifPR9Chv/3vf882lfr16aUQMgH9BIQkmUN71axyzL4gex9lIjHO/u+W2AW2S8MukyM5n/ovq3k1UAsD8qA5YLqLlfBj5RjaHXgh8Tdzm8vl6XzQJ6w==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=+CdO9X8O71/ADeuKZYmvOQhylR6JZ0gSLc9G6gnqJJQ=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/chipidea.rst into Chinese.

Update the translation through commit e4157519ad46
("Documentation: usb: correct spelling")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/chipidea.rst       | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/chipidea.rst

diff --git a/Documentation/translations/zh_CN/usb/chipidea.rst b/Documentation/translations/zh_CN/usb/chipidea.rst
new file mode 100644
index 000000000000..226f1f90c0d0
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/chipidea.rst
@@ -0,0 +1,143 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/chipidea.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+=============================
+ChipIdea 高速双角色控制器驱动
+=============================
+
+1. 如何测试OTG FSM（HNP 和 SRP）
+-----------------------------------
+
+To show how to demo OTG HNP and SRP functions via sys input files
+with 2 Freescale i.MX6Q sabre SD boards.
+演示如何在两块Freescale i.MX6Q Sabre SD开发板上，通过sys输入文件来测试OTG的HNP和SRP功能。
+
+1.1 如何使能OTG FSM
+-------------------------
+
+1.1.1 在menuconfig中选择CONFIG_USB_OTG_FSM，并重新编译内核
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+重新编译镜像和模块。如果需要查看OTG FSM的内部变量，可以挂载debugfs，
+会有两个文件用于显示OTG FSM变量和部分控制器寄存器值::
+
+	cat /sys/kernel/debug/ci_hdrc.0/otg
+	cat /sys/kernel/debug/ci_hdrc.0/registers
+
+1.1.2 在控制器节点的dts文件中添加以下条目
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+::
+
+	otg-rev = <0x0200>;
+	adp-disable;
+
+1.2 测试步骤
+-------------------
+
+1) 给两块Freescale i.MX6Q Sabre SD开发板上电，
+   并加载gadget类驱动（例如 g_mass_storage）。
+
+2) 用USB线连接两块开发板：一端是micro A插头，另一端是micro B插头。
+
+   插入micro A插头的一端为A-device，应当枚举另一端的B-device。
+
+3) 角色切换
+
+   在B设备上执行::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+   B-device应切换为host并枚举A设备。
+
+4) 把A设备切换为host
+
+   在B设备上执行::
+
+	echo 0 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+   或者通过HNP轮询机制：B主机可以检测到A外设想成为host的意愿，
+   从而由A外设触发角色切换。在 A-device上执行::
+   或者通过HNP轮询机制：B-Host可以检测到A-peripheral想切换为host角色的意愿，
+   并通过A-peripheral对轮询的响应来触发角色切换。
+   这可以通过在A-device上执行::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req
+
+   A-device应切换回host并枚举B-device。
+
+5) 拔掉 B-device（拔掉 micro B 插头），在10秒内重新插入；
+   A-device 应重新枚举 B-device。
+
+6) 拔掉 B-device（拔掉 micro B 插头），在10秒后重新插入；
+   A-device 不应重新枚举 B-device。
+
+   若A-device想使用总线：
+
+   在A-device上::
+
+	echo 0 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req
+
+   若B-device想使用总线：
+
+   在B-device上::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+7) A-device关闭总线供电
+
+   在A-device上::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop
+
+   A-device应断开与B-device的连接并关闭总线供电。
+
+8) B-device 进行SRP数据脉冲唤醒
+
+   在B-device上::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+   A-device应恢复usb总线并枚举B-device。
+
+1.3 参考文档
+----------------------
+《On-The-Go and Embedded Host Supplement to the USB Revision 2.0 Specification
+July 27, 2012 Revision 2.0 version 1.1a》
+
+2. 如何使能USB作为系统唤醒源
+--------------------------------------------
+下面是在imx6平台上使能USB作为系统唤醒源的示例。
+
+2.1 启用核心控制器的唤醒::
+
+	echo enabled > /sys/bus/platform/devices/ci_hdrc.0/power/wakeup
+
+2.2 启用glue层的唤醒::
+	echo enabled > /sys/bus/platform/devices/2184000.usb/power/wakeup
+
+2.3 启用PHY的唤醒（可选）::
+
+	echo enabled > /sys/bus/platform/devices/20c9000.usbphy/power/wakeup
+
+2.4 启用根集线器的唤醒::
+	echo enabled > /sys/bus/usb/devices/usb1/power/wakeup
+
+2.5 启用相关设备的唤醒::
+
+	echo enabled > /sys/bus/usb/devices/1-1/power/wakeup
+
+如果系统只有一个USB端口，并且你希望在这个端口上启用USB唤醒，
+你可以使用下面的脚本来启用USB唤醒::
+
+	for i in $(find /sys -name wakeup | grep usb);do echo enabled > $i;done;
--
2.34.1

