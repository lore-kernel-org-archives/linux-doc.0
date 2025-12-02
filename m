Received: from mail-m1973185.qiye.163.com (mail-m1973185.qiye.163.com [220.197.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D804923AB95
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764677536; cv=none; b=VB3c9IEMfGOt4xFDZJNcwD+2WcheSzAaAo2mdX7HLKhgt1SSIrt8KF0W2Jrdlm5PvhQ1Zy5crI08QrGFCLfIqlYn4p7hP0mhGDYKNgeN0J0Vjq0AoyxuXsPK/XdbfV6yLgqv1AQuL/7mTv7WMshkPmCBfOmXGDq5JGAc07NmeBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764677536; c=relaxed/simple;
	bh=eKwqgdrqFjvoSxObUSjjGIfnCwjU8ZEPKnGTM1uBW+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l+N6WJoJ4oKfuS+MoN1efMLaf/iH7IcRffCrS/dlHv9tv7cnQ2Xty5i2TgvyJxP852Frw9pSKOHHlH+DS62nlYSnW8LIPzRdyoqNg8n+8Rkz0C642uKbryQusGek1EzB1Yg+xbO87s9au5f5oaLl6tUBGgL7vr6ZiVZJ7KAWYLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=P2vBvL90; arc=none smtp.client-ip=220.197.31.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="P2vBvL90"
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2bb0f2e67;
	Tue, 2 Dec 2025 19:56:46 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v4 1/8] docs/zh_CN: Add index.rst translation
Date: Tue,  2 Dec 2025 19:56:34 +0800
Message-ID: <a0cb5dc4973db59048e4437cc611b22ff8b4f06e.1764674650.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764674650.git.baikefan@leap-io-kernel.com>
References: <cover.1764674650.git.baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9adeec1aeb09d5kunm0f4dae893d3ee1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSh9LVk4YTU4YS04ZGR4fQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlLVUtVS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=P2vBvL90ed0MNUIC1LYgRw9Fn6wrj1L15OVHJG7LvImEcBPY+xjlVTSXBJ7AHbYJ0V1sgtiECBWaQhac4K2dyR6Rz8OcJA1r+P0jz1unFZ6kmEbSDQ/5G6BKPlbeWkIhU6pdk/MSiAJdBXS9VJEi7KD1d37x+07/9VfCiU7PiFBEkJgBoCBWoP4jud1nMhCcugOuPwzSq33bfUNGsPqYaeKX/eg/wnihudO40WkHInxykG/IkI01rchCyFxlAdsRqqvdI3Ja2N6CKwUk4FEAWcHav49+Epa5zFS1slFlarWtPb3Wp8w+IQhiKaZxAw0Sc+nM4atI7RyXexpcznWS/w==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=WjrirfVVSG+55sy284WiWaHVzQzna8tx5EwJcoeOknE=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/index.rst into Chinese and update subsystem-apis.rst

Update the translation through commit c26cee817f8b
("usb: gadget: f_fs: add capability for dfu functional descriptor")

Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/subsystem-apis.rst     |  2 +-
 .../translations/zh_CN/usb/index.rst          | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/index.rst

diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
index 830217140fb6..b52e1feb0167 100644
--- a/Documentation/translations/zh_CN/subsystem-apis.rst
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -90,6 +90,7 @@ TODOList:
    security/index
    PCI/index
    peci/index
+   usb/index

 TODOList:

@@ -104,6 +105,5 @@ TODOList:
 * accel/index
 * crypto/index
 * bpf/index
-* usb/index
 * misc-devices/index
 * wmi/index
diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
new file mode 100644
index 000000000000..71e822e464d4
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -0,0 +1,54 @@
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
+    usbmon
+
+Todolist:
+
+*   functionfs
+*   functionfs-desc
+*   gadget_configfs
+*   gadget_hid
+*   gadget_multi
+*   gadget_printer
+*   gadget_serial
+*   gadget_uvc
+*   gadget-testing
+*   iuu_phoenix
+*   mass-storage
+*   misc_usbsevseg
+*   mtouchusb
+*   ohci
+*   raw-gadget
+*   usbip_protocol
+*   usb-serial
+*   usb-help
+*   text_files
+
+.. only::  subproject and html
+
+   索引
+   =======
+
+   * :ref:`genindex`
--
2.52.0

