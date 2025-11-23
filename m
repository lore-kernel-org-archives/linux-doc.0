Received: from mail-m49242.qiye.163.com (mail-m49242.qiye.163.com [45.254.49.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F151BFE00
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763899269; cv=none; b=iuiBHcNZOUDQFMdpNhdqiLY9kLUNDh+j/E0Ipa72HhtJRpXyljHGxbEhY/IEdopBKmReiRSG6leM7QrS5SgIkHd0fYimxLfGIWofCO1PYbJb4OMgHR7rJfNoEapu0Y2eWtURk6xqitGM85tOswY0r3kp+B442WmwX2/ciAVWWCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763899269; c=relaxed/simple;
	bh=0tPZ7qfiM8mEPv+eeZIrx8pcjeWQq7jDYsJDfKYQokk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uItv0lBTFsR9569f8k2ZeVlHlXA+W2mVv0nnLOL9+bgBHJASQf8mbao8X3QwlTvapRAZmhirQ7bY0Lg5VTCqswT1lM5jZ5DTVPOJpuCmXYzGeXwL9qVsk+Oe8ay1JBjAhH4nrg422uAU4FXELjeaw4qiP5Zsgs8QiS6c+Jt6Q+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=hAXpQaTv; arc=none smtp.client-ip=45.254.49.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="hAXpQaTv"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a90290ee;
	Sun, 23 Nov 2025 19:55:55 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 01/25] docs/zh_CN: Add index.rst translation
Date: Sun, 23 Nov 2025 19:55:59 +0800
Message-ID: <97d37d75edeaf8b609911702ec4e563cf414e85a.1763897036.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9ab09215aa09d5kunm2b5c8c0429ad7f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGhlLVk9KGRkZH0tCGE0YGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=hAXpQaTvmrmGHrOGoPtJbDgHAuUk6PCo/1peUcETjUa8J3ZpVpIfU27elRxOctFFPh5LC7KsXuFM1CHEEPXLDEqdWg6UKoPaU0WEGC1jR22y/W0Mj0P4ns2+GiUipjSzIAyIzpXlu66N9S1S2VnD2KGbKoajs9W5WPPdDgIvd+KCxVxTF9FQ43Zos5RMXBq0FNhYhY4mW4nxIRKCpjzJ3lHQRqG+R6CsCDE9KcvuUFvzl0odpbZLVNtmI3H4PK4LVytwkAt+Sk99JIh36U2HaPwFXJS+ld0sogiep3oADHFMMMEnaTov6wt1j+TjaGIxJTGYJ5wP4QwqMLD9UP/pNg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=m9ademgkom1EB8kgMxF/tjIEKL/L7Q4ohPN0d12pSUU=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/index.rst into Chinese and update subsystem-apis.rst

Update the translation through commit c26cee817f8b
("usb: gadget: f_fs: add capability for dfu functional descriptor")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/subsystem-apis.rst     |  2 +-
 .../translations/zh_CN/usb/index.rst          | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/index.rst

diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
index 0f121f9b0f70..6649114b818f 100644
--- a/Documentation/translations/zh_CN/subsystem-apis.rst
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -91,6 +91,7 @@ TODOList:
    security/index
    PCI/index
    peci/index
+   usb/index
 
 TODOList:
 
@@ -105,6 +106,5 @@ TODOList:
 * accel/index
 * crypto/index
 * bpf/index
-* usb/index
 * misc-devices/index
 * wmi/index
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
2.52.0

