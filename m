Received: from mail-m15578.qiye.163.com (mail-m15578.qiye.163.com [101.71.155.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC9521ADA7
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 07:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763883941; cv=none; b=NDE/4DLRaVJHTmVea9zS++7monpJ27PorXuG3DMHtzZrQOgHdbblSFlwxyK+bD3x3VUOZCTyLjCgGxXO8NRBJ6otwqD3pekPduL0ar6UXYC7UGFTEbKKAWZmI9RG9wwSOjoG1sQIOhMwuF9jhGL0DFZjUL0wWgaXrX6StDfxDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763883941; c=relaxed/simple;
	bh=0YqqScEXdKOx8hkclWGpYXnDDnLVeoVWTIh8PwTJCYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LL0Wae25u/w9H73MgLqjijg8/EsMukWM3eQYbvlApPz4sGJc24kdGyqrBwIfvTrH3aXVcRVt7uKbMb/+Dfiiz6xklu2ugFAVBadWC/6VlUUUEYaMGQlzxwDHAB5ZLea+fXIGtuV1yOfHGkPkM1BKUbtrWWxA8L5KD1uHjy/2eXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=swFgVldK; arc=none smtp.client-ip=101.71.155.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="swFgVldK"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99d2;
	Sun, 23 Nov 2025 15:45:30 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 24/25] docs/zh_CN: Add usb-help.rst translation
Date: Sun, 23 Nov 2025 15:45:39 +0800
Message-ID: <20251123074540.34161-25-baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9aafacd4b309d5kunm0cca7198286689
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHxkeVhoYSUIYSU4aH0keHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=swFgVldKxXuomPfnQw3JWETqggefbYJBBKkMwFUEa5EqbpLVWp1y9S9fKeiMQxPKi2X30HrRu2MEZSqctjFE1ji0Ny3+FsT5darO5HZdw1JhxIUD5bpi+2EF9r04fmyemXogTQZufjkXdQG5bW+idb5ac5qTVZKmtj0AGNforFHL7UnnLJsoakeoSaTIIsPZKY3uJYAr6WHo89rpEcr9qCS/fEButdJgPYDYOsruYMir8RFubIzj7hZaez7bd62dVOnQ6erSiJEv/3WeAMUxg82WlKF74KPW1rcM+xa5RpGQs4hr/O4fAE4tvp3erzZX4Rx6ij3u9mHtqobmjuXdjA==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=2HjVmQOUyJ6WWZbACiXBzZpE8wrnPuqMcv0L7AOYbH0=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/usb-help.rst into Chinese.

Update the translation through commit ecefae6db042
("docs: usb: rename files to .rst and add them to drivers-api")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/usb-help.rst       | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/usb-help.rst

diff --git a/Documentation/translations/zh_CN/usb/usb-help.rst b/Documentation/translations/zh_CN/usb/usb-help.rst
new file mode 100644
index 000000000000..29ca3fbdc276
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/usb-help.rst
@@ -0,0 +1,28 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/usb-help.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+============
+USB 参考资料
+============
+
+2008年3月7日
+
+除了位于 `Documentation/usb/*` 的说明文件外，如需 USB 相关帮助，请参考以下资源：
+
+- Linux-USB 项目：     http://www.linux-usb.org
+  镜像站点：           http://usb.in.tum.de/linux-usb/
+  以及：               http://it.linux-usb.org
+- Linux USB 指南：     http://linux-usb.sourceforge.net
+- Linux-USB 设备概览（工作设备及驱动）：
+  http://www.qbik.ch/usb/devices/
+
+Linux-USB 邮件列表： linux-usb@vger.kernel.org
--
2.34.1

