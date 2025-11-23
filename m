Received: from mail-m1973171.qiye.163.com (mail-m1973171.qiye.163.com [220.197.31.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF41BFE00
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763899283; cv=none; b=p2iIPnTiiUHRzkDas2EG7ugntI9IdIdh4r69Qg60NuGn5c0GpmmDPHXC+tjh3O/uiuGMnfmhoZIXNK8bpTLp4h5Cpt+KrhTaEERfS1XGSQSIMT2ZESarK2todkcJFOuOeqDQSK79pv1Jg9BtgNkVCjmiTkOIqp6/8NB4L4YGhpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763899283; c=relaxed/simple;
	bh=oh4l+mSqj6RALEALbYG40cMSuTp/Bpcoe+epMHq9PjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/LqN8RcmstJ/TTkbQOuiuwnZGb4+4eN3rI1HHZJFWc2VrMt0JYs34CpfnHOS7fhxNPJouyRt3IHXqb9A8SmbguOcEXjfu6+ii5E1h7SPAsMqTxMJAI2wyQqLNM6E7cSIJi5jaHU5H/7x3t4h+YWQTzbc/twElId458Ut5GSYzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=ZoFqtk2T; arc=none smtp.client-ip=220.197.31.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="ZoFqtk2T"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a9029107;
	Sun, 23 Nov 2025 19:56:10 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 19/25] docs/zh_CN: Add mtouchusb.rst translation
Date: Sun, 23 Nov 2025 19:56:17 +0800
Message-ID: <35302db68b21031c1ef322e2c9abffedfa8928f6.1763897036.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9ab09250e509d5kunm2b5c8c0429add0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSU0ZVk4YQk1DSk1CGkhLSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZoFqtk2Ts9nV5W+XRBTichxxL0/Qy/ouwEq8izZ3HXvogLv5ZIGUjjRl97ynw4Tbprp4Mve3uRWvIB+WbB7/ybQHtp2BxJay5W0XSX4gYrH61p/tbGPUHeFijI4EWTCfmve9STM7g9U1fR2gqTPhStjriZ0TBZrNxEKMVPXPhvbi4ClUIwcbknHEAHuaMusHFIjRL1waUTi7YfiedtwNklgXhrnF6dlVjh1NAj/Gvp51FDA41PaTF63jYFuSJ6HK2GONCnMVX1231oSZ5Yt+/2pQluHvn7cUe5HI5qAE8AHSXfo/M9C6CQ7LIH/kBESSFkONDsSjCQqXvVUrOvJfBg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=7Nu0+73f1CkTZLKmRIvZp8yiyT4m1Ope/LLrufocV2k=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/mtouchusb.rst into Chinese.

Update the translation through commit 9e255e2b9afe
("Documentation: drop optional BOMs")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/mtouchusb.rst      | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/mtouchusb.rst

diff --git a/Documentation/translations/zh_CN/usb/mtouchusb.rst b/Documentation/translations/zh_CN/usb/mtouchusb.rst
new file mode 100644
index 000000000000..11f847a6b428
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/mtouchusb.rst
@@ -0,0 +1,89 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/mtouchusb.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+=================
+mtouchusb驱动
+=================
+
+变更记录
+=============
+
+- 0.3 - 基于原始触摸屏驱动的scanner和INSTALL创建
+  （来源：freecode http://freecode.com/projects/3mtouchscreendriver）
+
+- 针对 linux-2.4.18 进行了修改，然后是 2.4.19
+
+- 使用 Linux Input 在 2.6.3 下完全重写
+  不幸的是，目前不支持校准功能
+
+- 1.4 - 为支持 EXII 5000UC 进行了多项修改并进行清理工作
+  将复位方式从标准 USB 设备复位改为厂商复位
+  将发送到主机的数据从补偿坐标改为原始坐标
+  删除了 vendor/product 模块参数
+  使用 EXII-5010UC 进行了多次成功测试
+
+所支持的硬件
+==============
+
+::
+
+        所有VendorID是0x0596，ProductID是0x0001的控制器
+
+
+        控制器描述                       零件编号
+        ------------------------------------------------------
+
+        USB Capacitive - 珍珠外壳        14-205  (已停产)
+        USB Capacitive - 黑色外壳        14-124  (已停产)
+        USB Capacitive - 无外壳          14-206  (已停产)
+
+        USB Capacitive - 珍珠外壳        EXII-5010UC
+        USB Capacitive - 黑色外壳        EXII-5030UC
+        USB Capacitive - 无外壳          EXII-5050UC
+
+驱动说明
+========
+
+安装很简单，只需将Linux Input、Linux USB和驱动添加到内核即可。
+该驱动也可以选择构建为模块。
+
+该驱动似乎是可能存在的两个Linux USB Input触摸屏驱动之一。
+虽然3M提供了一个仅二进制可下载的驱动，但我坚持更新此驱动，
+因为我希望在嵌入式应用中使用触摸屏，例如使用QTEmbedded、DirectFB等。
+因此，我认为逻辑选择是使用Linux Input。
+
+目前无法通过此驱动校准设备。即使设备可以校准，驱动也会从控制器获取原始坐标数据。
+这意味着校准必须在用户态完成。
+
+控制器的屏幕分辨率现在为X和Y均为0到16384，用于报告原始触摸数据。
+对于旧的和新的电容式USB控制器均相同。
+
+也许将来会在evdev中放置一个抽象函数，
+以便可以从用户态请求通用功能，如校准、复位和厂商信息（驱动程序将处理厂商特定任务）。
+
+待办事项
+========
+
+一旦可用，再次实现control urb以处理与设备的请求，例如校准等。
+
+免责声明
+========
+
+我不是MicroTouch/3M员工，也从未是。
+3M不支持此驱动！如果只想使用X中支持的触摸驱动，请访问：
+
+http://www.3m.com/3MTouchSystems/
+
+感谢
+====
+
+非常感谢3M Touch Systems提供的EXII-5010UC控制器进行测试！
-- 
2.52.0

