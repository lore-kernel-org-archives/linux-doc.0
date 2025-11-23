Received: from mail-m15574.qiye.163.com (mail-m15574.qiye.163.com [101.71.155.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C213C3F2
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763892465; cv=none; b=QaBxGXjsuJNxLx0dM9VVj3lFMKxb2jOPn/aHsHSZFV2fREiTvP/ieLbT0C6SIDzYNX8b9cw8kjqu17Rg9nCAqvuVL9Wmz8DcCM5APpNjiEmjd294J8Lh38xzQQxLexqBToQrCdQHVxgV/2Mb20gNbtYhCR979UlIx/3Gp4F8pyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763892465; c=relaxed/simple;
	bh=tL8V3cbaBOMPvrq2pwN4ZJcvAdW1y+k3GEmMGm0jCOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ggczmKbT4f6H5LdS5bOdUd4u2wzbZrMWOiy4i0FtV3DgxWXuarN0Pc/KWUR2py6+NuZtg27e/tBQ866iREc/ZWQMESBs6tye843CJGS2WCfuZ3nqLrIahgTzdzv2OYRqe9r+Gz+S1Nr2OsmmUpiYCksmIpGD7T/CTmivQbSPiuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=YmbUqZ6o; arc=none smtp.client-ip=101.71.155.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="YmbUqZ6o"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99aa;
	Sun, 23 Nov 2025 15:45:11 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 01/25] docs/zh_CN: Add index.rst translation
Date: Sun, 23 Nov 2025 15:45:16 +0800
Message-ID: <20251123074540.34161-2-baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9aafac8a5409d5kunm0cca7198286607
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTkNKVk1OQkxJQkgfH05PQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=YmbUqZ6oUJv6wEpkqnuaXMz4fyV9AWNML8/YYtrBfAH8chMZfIIZ/M6wK6QbA7jvPJ4t/5PkuEGFeezfsyfoFZa98Ire69vyJFhgCeMW1/T/DdepTeCxM/2NaK78eX0CxTsM1QL2Jyw6srvHjlMmFM3yaOUafa6yHsjHNW5HiAK5d0tt5JdFgPzy5eeXiUgSppjViPt08vrygJzLjIIV9po/n8z1seo+0apw8wu0ti+n6oxwOeQ+nLt84FzaQbe0RR6ymJo4bshaWrahA65vhRGb1JWAABIpsVAHChuy2FdRdaT9Z5pI/f8dUtTX48IaK+SxY9AtSUxQRwlprzeKMw==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=sVkchC7t3IiYZQ38dcfn2709pZAu8nM20QTw5NLDK5s=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/index.rst into Chinese.

Update the translation through commit c26cee817f8b
("usb: gadget: f_fs: add capability for dfu functional descriptor")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/index.rst          | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/index.rst

diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
new file mode 100644
index 000000000000..2ef1311a7043
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -0,0 +1,50 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/index.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+===========
+USB 支持
+===========
+
+.. toctree::
+    :maxdepth: 1
+
+    acm
+    authorization
+    chipidea
+    dwc3
+    ehci
+    functionfs
+    functionfs-desc
+    gadget_configfs
+    gadget_hid
+    gadget_multi
+    gadget_printer
+    gadget_serial
+    gadget_uvc
+    gadget-testing
+    iuu_phoenix
+    mass-storage
+    misc_usbsevseg
+    mtouchusb
+    ohci
+    raw-gadget
+    usbmon
+    usb-serial
+    usb-help
+
+
+.. only::  subproject and html
+
+   索引
+   =======
+
+   * :ref:`genindex`
--
2.34.1

