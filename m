Received: from mail-m19731119.qiye.163.com (mail-m19731119.qiye.163.com [220.197.31.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3B5306D26
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 13:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991238; cv=none; b=s8Xe+qn02Wt4r0bYRWoTk1vmyrL4bd9iIzE4tM5phT/Csm0o5JELlGf0EZfH0I300gPSKF2htVmCH2M483i1CWmCQL/1yT5HNH2YFilXw9+eMblfXsMBemXE5M+BJGcMvA/kTwliWTtm8FEieIo5rSfeeiFsliXaJ7vBxq3Cb0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991238; c=relaxed/simple;
	bh=WIYHDe/gDcqSbDqPqlvRG7s6BaeKGPmOUnKPR0fEsf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ptmUccGgrZ5CSOMSCnt8mzahn1F0soDLBnXjMdbxLrHBs//0yvuY7Ed+MY1Ss5iM6KGCFTBShS8+L45ZMGBLpg0ces0f7lRtCMgbi3dF98o7do64gFDPDfDK+M4KFkjC9yWnR7uTC3daPgZsw+0djSEFhNnH4tntPxummBcnVGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=gzEirgRC; arc=none smtp.client-ip=220.197.31.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="gzEirgRC"
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ab2e0359;
	Mon, 24 Nov 2025 21:33:41 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v3 1/8] docs/zh_CN: Add index.rst translation
Date: Mon, 24 Nov 2025 21:34:05 +0800
Message-ID: <89505b29e74210348ac9d111139dce13782ee9bf.1763984424.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9ab611f62409d5kunme2b32dc6369cba
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSx9DVk5IQktLSU5MHx4aGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktJQkNDTFVKS0
	tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=gzEirgRCgyC4sNK/cnPANtmNI8bAV4iIFG0QemeKGxr4TjZx7Q7nU1jNTCPBhdum+8jrz7LJFlgKVNzGScmNyYXF1X6+2uQIAg6BjfW0xwpyhCkmmVAL83r8LwZx6O48c8OUMjCCzWanVqAJ9HhBFihSfWjT6e4/+SuOLvyNCWnT19nsml2RZtCgAQqJqET7HKkGm8SBgA0RecQDuFOsXZxi7NvYi4kiACPFhZ6wSt/nzvKA48gelbQLHKfw7n4cwNNLxFGIYNpmKAqlUG2xUgGSM16EtE4L2GwIFrJzuTsOhwIMAILUkj1Rfd/tGSycAlSbd5pzVx7qXuhSbblrdg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=itb3g2N2Q8Ck7Lhz5gia22VMNCRXjGkck/fH/sahsfw=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/index.rst into Chinese and update subsystem-apis.rst

Update the translation through commit c26cee817f8b
("usb: gadget: f_fs: add capability for dfu functional descriptor")

Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/subsystem-apis.rst     |  2 +-
 .../translations/zh_CN/usb/index.rst          | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
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
index 000000000000..48bec2984408
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -0,0 +1,61 @@
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
+    CREDITS
+
+Todolist:
+
+*   acm
+*   authorization
+*   chipidea
+*   dwc3
+*   ehci
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
+*   usbmon
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

