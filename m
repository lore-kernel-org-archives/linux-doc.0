Received: from mail-m1973183.qiye.163.com (mail-m1973183.qiye.163.com [220.197.31.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C39B2D59F7
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763898979; cv=none; b=A/fWKnXyEtNiLW9p9hAZwJ4r/57UGZTEfdGaLKZd6ybAUl7YsIw073NZICxlLI8g4c/Fr+3spTR5V5h4wRB81OIAOKu512582GCPVCePG0Rj0Miw7kcUVFJPp7nxPe2eECz9i0HBb9A3sdHM21YEd6LvZ31wU/MIZL1wWCw46oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763898979; c=relaxed/simple;
	bh=AUBJSDe6sVJi71sOE6Q0lFn2hZD6BDHVXqr8KR7bl2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pAKNqAHrZcCVbtaYojhQjmAsBVJLTjXX/Y2PKVW9BWTxmZ7zqG+SjgY8VdCaNJRYxOqaLxVihL/hdkr93YtbOUodGHo70nrmhKyBoQok45EAS+5GWpRaoUftwjAwQpvxQpkV2sNJNi6QcaB2D+Qa/nmv/PYcklo+4L889A11x6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=iea/GIGh; arc=none smtp.client-ip=220.197.31.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="iea/GIGh"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a902910f;
	Sun, 23 Nov 2025 19:56:14 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 24/25] docs/zh_CN: Add usb-help.rst translation
Date: Sun, 23 Nov 2025 19:56:22 +0800
Message-ID: <ffe2fdccfd43bcd3315d1ea6af65c748f6c44281.1763897036.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9ab09260f409d5kunm2b5c8c0429ade9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0IaVkNNHxpPSk4aSR9OSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=iea/GIGhl5eFWXwL1rT2SLIW55g8KcshO8ZPCmfJDmXHuw2oXkE5WupYl0U57dNTKJjoA1gDgvyOXfGtJcRfbx1ERGzZNelxMelBNeYQ+cOtTbquWn2r5oCUxAWPB+6xjmIuHDshQB/Oeyvn/oneTYGn9KOMPlkQYBSF9dk5sAWM0zOUPhOqqRH5/ol+Ny440K9P+pjbBvEdlYyh7DSzk3dB1ILNCPt1eIOWng9tsqfsKPeHE3sP7mOJJUNuOLVAogsb2W39mB4GvsBIpgRyTDI+5wIpHLfz0C+rqyR0bvNYOaXyv6PaSy1gfGjHsFXAN/QWwiq6qHsHO59bSCBEhQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=q6Nsl5JFjLWPQJduwHqTdufciq9HxWsNSkZtD7A7Bmw=;
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
2.52.0

