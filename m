Received: from mail-m49211.qiye.163.com (mail-m49211.qiye.163.com [45.254.49.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64222306B05
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 13:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991248; cv=none; b=aYjHfvdQ/DBT+WJZo8pPDuNjCv5UrmAOmjNMOjoiEXA6SrOSBX2wsWILBGP+XwmUpd3y79//CgN3p5aCW5K4XuMi1GVTDeL/1YIHPVCtdB8hreyUfX6z+nh4R2lQVf8K00U0YvJVxzLN5BpzJgyV/BLM8yAXADA8G+CPuEN19FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991248; c=relaxed/simple;
	bh=psykkCuOClKiCyWYcThSumddVZVwJxFbekYVIRjm3/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hu6TAA6TuMwtstY07WDgpQL2NhSgKxeoT8Ei1xto8TAhue8JpskF1Tgej70u3zXY/vXpmfl9mOUetG8Nhy8asD3VrM3RyXhMmzNmzWQ4QdWCBgkysHqfQBE86vQAw21NacTmtoMKn4qahl74L1EQ09UAhq/JCyNxOxbcStZP3gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=ZuDVNJXv; arc=none smtp.client-ip=45.254.49.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="ZuDVNJXv"
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ab2e0360;
	Mon, 24 Nov 2025 21:33:46 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v3 4/8] docs/zh_CN: Add chipidea.rst translation
Date: Mon, 24 Nov 2025 21:34:08 +0800
Message-ID: <feca0c51628961feed10c9fe6aef523477737e03.1763984424.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1763984424.git.baikefan@leap-io-kernel.com>
References: <cover.1763984424.git.baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab6120a4709d5kunme2b32dc6369cd0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTx8dVh8dSBhKS0xCSR5PTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktJQkNDTFVKS0
	tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=ZuDVNJXv8NM04gw8tOBGs+vYxnWLwrG8eog8i1MWE6fNoIn1AWJPyZMJ2MKzPl4e1c96iLG1i0NqGTCgksRdYUWc0gZ/heh7QNycuQa61iAir8zAh5mticHHzh/ExNXHaqQESJNPqXWbGhB4xU3ta8j1KXGQWb7BMvrQD0GSo7QatEgp6MqHwxg+6Avfcl+qwUq761F0N9Fc8W6TveHSuIM6Ttl6UQSt8s9gC2Zf87BWnFkqhfGSt+MZWVRiK7cbZSyG696X8TwBV59KHkOggUKvC5sfu1qmDkoWPoUTJeDXwDtZtigvPIA0hfzT56Harqea4PweNxCr+9DL6YPFcQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=2vUL5jLMigdoYw+50Uq8MbRO8Ao134AhBZveWOwp3uY=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/chipidea.rst into Chinese

Update the translation through commit e4157519ad46
("Documentation: usb: correct spelling")

Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/chipidea.rst       | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/chipidea.rst

diff --git a/Documentation/translations/zh_CN/usb/chipidea.rst b/Documentation/translations/zh_CN/usb/chipidea.rst
new file mode 100644
index 000000000000..343c71e80a6b
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/chipidea.rst
@@ -0,0 +1,142 @@
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
+ChipIdea高速双角色控制器驱动
+=============================
+
+1. 如何测试OTG FSM（HNP 和 SRP）
+-----------------------------------
+
+接下来我们在两块Freescale i.MX6Q Sabre SD开发板上，演示如何通过sys输入文件
+来测试OTG的HNP和SRP功能。
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
+   插入micro A插头的一端为A设备，它应当枚举另一端的B设备。
+
+3) 角色切换
+
+   在B设备上执行::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+   B设备应切换为host并枚举A设备。
+
+4) 把A设备切换为host
+
+   在B设备上执行::
+
+	echo 0 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+   或者通过HNP轮询机制：B-Host可以检测到A外设想成为host的意愿，
+   从而由A外设触发角色切换。在A设备上执行::
+   或者通过HNP轮询机制：B-Host可以检测到A外设想切换为host角色的意愿，
+   并通过A外设对轮询的响应来触发角色切换。
+   这可以通过在A设备上执行::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req
+
+   A设备应切换回host并枚举B设备。
+
+5) 拔掉 B设备（拔掉 micro B 插头），在10秒内重新插入；
+   A设备 应重新枚举B设备。
+
+6) 拔掉B设备（拔掉 micro B 插头），在10秒后重新插入；
+   A设备不应重新枚举B设备。
+
+   若A设备想使用总线：
+
+   在A设备上::
+
+	echo 0 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_req
+
+   若B设备想使用总线：
+
+   在B设备上::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+7) A设备关闭总线供电
+
+   在A设备上::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/a_bus_drop
+
+   A设备应断开与B设备的连接并关闭总线供电。
+
+8) B设备进行SRP数据脉冲唤醒
+
+   在B设备上::
+
+	echo 1 > /sys/bus/platform/devices/ci_hdrc.0/inputs/b_bus_req
+
+   A设备应恢复usb总线并枚举B设备。
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
2.52.0

