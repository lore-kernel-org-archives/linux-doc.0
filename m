Received: from mail-m1973170.qiye.163.com (mail-m1973170.qiye.163.com [220.197.31.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E6B1F09AD
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 12:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763899282; cv=none; b=OUw1XFrkPdqOVOcT8cSkFt6JV5ybNHJOjm+hioeTcwEljdyfyvplosKw6J64a5E0N5O1+XsSU8pI2cgPqBZdT1zWYVWbxa/AfHZ2fAP3y1ielseqmoKnksGZUYKLVfRgNTCvVWDFq5xX/dYHBx7RXPmXi9NfHbKXzjLNBnnK7Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763899282; c=relaxed/simple;
	bh=pudtsRZHqFu/50buRjDeubyHs7NWktOHL6IxLq32ZdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MRRfYub6faQXpTeEf+1gHsBv5oRPLxlvdVZQkqlKVDEZjtuduCBDjb1FSa/kH6qgaGHsTkJMmFB9MuYjFg5IOW9d0PozowjIMsHe0mjXB7JcSdbXpeo9gHf6eIT8QMwyZAAzax8h/p5Mp8aCYu3NAWS57qn0W0sTd5SJ1axmgMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=djnZdALG; arc=none smtp.client-ip=220.197.31.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="djnZdALG"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a9029106;
	Sun, 23 Nov 2025 19:56:09 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 18/25] docs/zh_CN: Add misc_usbsevseg.rst translation
Date: Sun, 23 Nov 2025 19:56:16 +0800
Message-ID: <38e09599536e47046d8011c832a8f851637ccf38.1763897036.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9ab0924e1109d5kunm2b5c8c0429adcb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTR1OVk5PSUkYQhlOGklISFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=djnZdALG0m8ovhvur5YYVzZ7akWOwyoQPPuI6aCrWfcBobWyhaCFgLO8Se+NYfXZ83EpEvLX/QC8skQJdnOulfbDbZGOBOG1359cCvPy1twydcVUEWDNIQFNIDvFfEE1AD0KJCCmdf3hIrN6q5pGC+fP+bR3LWQOPD9Uhr2ERnL/+G1WrziippYAjAmjH+cUfDLvNkKHQv7RNWf1vEsYx7SZf/EGd08LxMB9NZJI5vWtv4w0JF+pDVCg4AO9DkadQikNzxwv2RbHJyZGLHal21nQLy0B7G2dZRQh8GWoNPBEFS5qM4l27RXFejegOQfKi/5l6O87+D4mVzoAGJWdYw==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=//YxRXi/1LVqk1WA7JVHDnHNWU0sIkl7Ft6lireu2W8=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/misc_usbsevseg.rst into Chinese.

Update the translation through commit ecefae6db042
("docs: usb: rename files to .rst and add them to drivers-api")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/misc_usbsevseg.rst | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/misc_usbsevseg.rst

diff --git a/Documentation/translations/zh_CN/usb/misc_usbsevseg.rst b/Documentation/translations/zh_CN/usb/misc_usbsevseg.rst
new file mode 100644
index 000000000000..4920e690a6ed
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/misc_usbsevseg.rst
@@ -0,0 +1,61 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/misc_usbsevseg.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+=================
+USB 7段数字显示器
+=================
+
+由Delcom Engineering制造
+
+设备信息
+--------
+USB VENDOR_ID	0x0fc5
+USB PRODUCT_ID	0x1227
+6字符和8字符显示器均有PRODUCT_ID，
+根据Delcom Engineering的说法，无法通过设备查询信息来区分它们。
+
+设备模式
+--------
+默认情况下，驱动假设显示器只有6个字符
+6个字符的模式是：
+
+	MSB 0x06; LSB 0x3f
+
+对于8字符显示器：
+	MSB 0x08; LSB 0xff
+
+该设备可以接受“文本”，无论是原始、十六进制还是ASCII文本模式。
+原始模式手动控制每个段，
+十六进制模式期望每个字符的值在0-15之间，
+ascii模式期望每个字符的值在'0'-'9'和'A'-'F'之间。
+默认是ascii。
+
+设备操作
+--------
+1.	打开设备：
+	echo 1 > /sys/bus/usb/.../powered
+2.	设置设备模式：
+	echo $mode_msb > /sys/bus/usb/.../mode_msb
+	echo $mode_lsb > /sys/bus/usb/.../mode_lsb
+3.	设置文本模式：
+	echo $textmode > /sys/bus/usb/.../textmode
+4.	设置文本（例如）：
+	echo "123ABC" > /sys/bus/usb/.../text (ascii)
+	echo "A1B2" > /sys/bus/usb/.../text (ascii)
+	echo -ne "\x01\x02\x03" > /sys/bus/usb/.../text (hex)
+5.	设置小数点位置。
+	该设备有6个或8个小数点。
+	要设置第n个小数点，请计算10的n次方
+	并将其写入/sys/bus/usb/.../decimals
+	要设置多个小数点，请将每个幂相加。
+	例如，要设置第0和第3个小数点
+	echo 1001 > /sys/bus/usb/.../decimals
-- 
2.52.0

