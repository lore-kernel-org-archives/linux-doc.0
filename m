Received: from mail-m3291.qiye.163.com (mail-m3291.qiye.163.com [220.197.32.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F7C29AB11
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 07:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763883930; cv=none; b=pVbyNdl7WqjV7ubxX6PMotwxX5RqabGYnLvj7YlRsvpgm+n2T23j4lw8SWU2oZn9BYsbfHJCot5l4lA8sj3xJ8FTSR7K9//Rg0T9MMiSXbOWOiw9U+YtTyv9D8t6TCWRyZwwjrF8NlCt+au3xOU90G6afU0ILxVBLNb9kZgMQv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763883930; c=relaxed/simple;
	bh=r70BpNJEJM2hPUBmaJ1OL/Zab+Ou/Up2T96kj+a07DY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NlQOnBXEUQjf1q/cpex0Rc0y2WXYBLQGHjgJuNNF5YY22b450gugenF6yab0DnUI+KouuhNdUPOZCdSmdJFo4ecMH23t6F37o6o+vrI+NhF1GyiHvenXmZ2kR2eYL7dXX5FJ9ApXIzcxqK0Ktpq2bo+aDSL15QheizlrKorYOAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=mAZ+cZ+k; arc=none smtp.client-ip=220.197.32.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="mAZ+cZ+k"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99b6;
	Sun, 23 Nov 2025 15:45:17 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 08/25] docs/zh_CN: Add functionfs-desc.rst translation
Date: Sun, 23 Nov 2025 15:45:23 +0800
Message-ID: <20251123074540.34161-9-baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9aafaca0ea09d5kunm0cca7198286622
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEkYVh4aQk8dGkhOGh9CGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=mAZ+cZ+khqqMEg6rmUysFO5AzjPMns6nbDCKHVNr1/wKsWt+hk1h7yc7LWgARWUlWgUGMLZ4m+d84esR0biRAsynfAc+JVkVzVarNdMWpQyztdvMNyaYThNpLiaBVXX7boNjkVKGfjH3T09I/ZVONEfNw9c9NGUghRY6HrH/duFJR9gN1AGYC/lJ1dFfgHtfKpbJSyZWhP/x78vwkfiqNlCjlHIYyEl+9fAVvinkPcLBVH96AVFqzA3rUa39IEmh8KKAwXy/lD2JUaKRGEy4TnOrU0FgHW1uT08xFnla3UZWhkDrlArWvQXe72REadESDkXfjoXLSTzja/IXvVZ2zA==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=G2s5YaFH5N1dJtZfQnBuzVKoaNPJZqEplMwPwp97/14=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/functionfs-desc.rst into Chinese.

Update the translation through commit c26cee817f8b
("usb: gadget: f_fs: add capability for dfu functional descriptor")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../zh_CN/usb/functionfs-desc.rst             | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/functionfs-desc.rst

diff --git a/Documentation/translations/zh_CN/usb/functionfs-desc.rst b/Documentation/translations/zh_CN/usb/functionfs-desc.rst
new file mode 100644
index 000000000000..cc6d94e5452f
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/functionfs-desc.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/functionfs-desc.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+=====================
+FunctionFS 描述符
+=====================
+
+以下介绍了可以写入FFS gadget的部分描述符。
+设备和配置描述符由复合gadget处理，用户不需要向FFS gadget写入这些描述符。
+
+描述符写入FFS gadget的ep0文件中，紧跟描述符头之后。
+
+.. kernel-doc:: include/uapi/linux/usb/functionfs.h
+   :doc: descriptors
+
+接口描述符
+----------
+
+可以写入标准USB接口描述符。
+最近写入的接口描述符的类/子类决定了可接受哪种类型的类特定描述符。
+
+类特定描述符
+------------
+
+类特定描述符仅接受最近写入的接口描述符所指定的类/子类。
+以下是部分受支持的类特定描述符示例。
+
+DFU功能描述符
+~~~~~~~~~~~~~~
+
+当接口类为USB_CLASS_APP_SPEC且接口子类为USB_SUBCLASS_DFU时，
+可以提供DFU功能描述符。
+DFU功能描述符在USB设备固件升级（DFU）规范中有描述，版本为 1.1。
+
--
2.34.1

