Received: from mail-m49216.qiye.163.com (mail-m49216.qiye.163.com [45.254.49.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23302D2493
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763898975; cv=none; b=MG7frvqgVqnRrp8f2wuv+XwxXBJXJ/iMOjNmZ2hbaJNkB618+upAFxYypZOIUZ1NM24bJOQpDzJdcYNGlQlkbTevEL2puHqKLS0pDIIAcljU6ZFyCLFf7r7E20OSn6NhnsTACb0E70g4/iG1tytVHNAl1PbiIaD2Y6bc3rFG3So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763898975; c=relaxed/simple;
	bh=mx53HcyHzfPdimmaPyDTGEiElRpCiiGxleO6z06JOz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RwtV/DHfzGfW7XoEuS7q+wQarLqmuU+CGDSdJaIimynzWq/hMNPoS1B888XOH/mipEAbT04U8khU7JoVaH0LOZWNC0ogNGJXAry0yPep7xAPSG10v5yQ6qi+E5iT7aEK8LUhQpk79ssIRBnf5zhxS49tVlOWgslOPixSC0klvpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=A4ewV2Sp; arc=none smtp.client-ip=45.254.49.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="A4ewV2Sp"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a90290f8;
	Sun, 23 Nov 2025 19:56:01 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 08/25] docs/zh_CN: Add functionfs-desc.rst translation
Date: Sun, 23 Nov 2025 19:56:06 +0800
Message-ID: <21a0c15d420bddd6ca24c97a2b2769c840276e44.1763897036.git.baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9ab0922c9009d5kunm2b5c8c0429adab
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSkhOVhoaGUpISR9IT0lJTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=A4ewV2SpB+/uC/7TMDCAxe5wydAfC46jDQLy2oNSLrOv8vjgO5vT8BtpFt2YhnUNhUOWoGARWf2B2q8xJTS5huYFAJQuFpNqFz7F63tjiifEY270YIwxGfcp3XuHsmTxpmcOr0wBbMuf+kUhHVdheHY1xiKWcJqmNfyrqTdnscS8SSnxfO/LtKEmUYjKYU3Wot9kmGJlnCUWirn6ohMHVjp1hED8b3DT7iNF9iPHUuDNTErfOQULFMTzCJt261gMCrGlhhMzM6YU2BJR/H94oki9oaFWReayWokHhtXSgqupXwIv2BwZkWJEtBeRL9WiiRBAJTMQnIAw7WJVN+asDg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=qN9uqZo7iZiG/qgukTZgnM0iWdSULKGBvxgaJP+OZ0s=;
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
2.52.0

