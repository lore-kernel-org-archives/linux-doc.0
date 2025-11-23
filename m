Received: from mail-m32110.qiye.163.com (mail-m32110.qiye.163.com [220.197.32.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F718202F65
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763887755; cv=none; b=CtW3/usiqe/wt8y/OZwX7WB0lfr++Vj8WTiIIMzNq8X7kCQRElQL9Wqr7HBAsiciYJEBk5zno9yI9Max7LQ6/nmfEfihsLPns/RN+rVE3vy3A3MaUsLeKa+gqGncL419RWLJGU+BIbSrSxNKhGVq6uIaS2bbSJta0MAJZM4p9CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763887755; c=relaxed/simple;
	bh=aTcRMimUx5uQoyvEBxbIrbTc6DYQ+0stlYW22gMi1FM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmUu7ZFAz+kxz96I458ea6PakQCTpFywF+CGFJWFmoBmoWrksHSpqQ6Rdo7eOiuzT/tBBxu8K8dTV38kVlJIm/4R0gMELkkMiO1drIuHx/MHxwgTm88CaScI0EyJfUTTCo68mr9ScvCoZ+aG99aZpTdyUY/zAbS35NzNP2TB8j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=sWv660BV; arc=none smtp.client-ip=220.197.32.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="sWv660BV"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8ea84f7;
	Sun, 23 Nov 2025 16:49:01 +0800 (GMT+08:00)
From: Yujie Zhang <yjzhang@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com,
	yjzhang@leap-io-kernel.com
Subject: [PATCH v2 2/2] docs/zh_CN: Add wd719x.rst translation
Date: Sun, 23 Nov 2025 16:48:59 +0800
Message-Id: <e31e6304df2b1aad9ed3473626c7e006e10b0612.1763886358.git.yjzhang@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1763886358.git.yjzhang@leap-io-kernel.com>
References: <cover.1763886358.git.yjzhang@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aafe6fabb09d6kunm2b597d342f61ba
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQx5JVh5CTEhPQ09PQxkfQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKT0hMVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=sWv660BVlXhQtQkTpVjmWUhY2CypjdJUV6ahkDNMCBelqBq4P/Z2pfdRFdrhT1vSTPW/3t2GiHa9u2xGL7O/1Fjd5G6U9Ted+O3dfNtRkRatGgKutoZnt62cjllZg6AifuwG1CWrswgTxFFpP5nhN6Q1Mc3tyDC+Otw+JpY9X+OGoZeEUGOzyLXXB3OYsBa8ObX4wNoY7dlBmaKVkWyZK4QQvHDP64kKCLjfcRu309LE5Zf101IpYlNH2qKLPu7sk5efgLjymA4slFlS/e47YCeI+/TzKfZv1G+qyt1IQUU22dTiA/p0dq7cdwvCXlXrpqu5uvPaKAGuW8RGvlk8PA==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=EKYEUoySkk6tJCbJCvs+yTeCt/Jhf09VGqzrdTHSdQ0=;
	h=date:mime-version:subject:message-id:from;

Translate .../scsi/wd719x.rst into Chinese.
Add wd719x into .../scsi/index.rst.

Update the translation through commit 40ee63091a40
("scsi: docs: convert wd719x.txt to ReST")

Signed-off-by: Yujie Zhang <yjzhang@leap-io-kernel.com>
---
 .../translations/zh_CN/scsi/index.rst         |  2 +-
 .../translations/zh_CN/scsi/wd719x.rst        | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scsi/wd719x.rst

diff --git a/Documentation/translations/zh_CN/scsi/index.rst b/Documentation/translations/zh_CN/scsi/index.rst
index 5eecbef4c9c0..5f1803e2706c 100644
--- a/Documentation/translations/zh_CN/scsi/index.rst
+++ b/Documentation/translations/zh_CN/scsi/index.rst
@@ -52,6 +52,7 @@ SCSI主机适配器驱动
 
    libsas
    sd-parameters
+   wd719x
 
 Todolist:
 
@@ -87,6 +88,5 @@ Todolist:
 * sym53c8xx_2
 * tcm_qla2xxx
 * ufs
-* wd719x
 
 * scsi_transport_srp/figures
diff --git a/Documentation/translations/zh_CN/scsi/wd719x.rst b/Documentation/translations/zh_CN/scsi/wd719x.rst
new file mode 100644
index 000000000000..79757c42032b
--- /dev/null
+++ b/Documentation/translations/zh_CN/scsi/wd719x.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scsi/libsas.rst
+
+:翻译:
+
+ 张钰杰 Yujie Zhang <yjzhang@leap-io-kernel.com>
+
+:校译:
+
+====================================================
+Western Digital WD7193, WD7197 和 WD7296 SCSI 卡驱动
+====================================================
+
+这些卡需要加载固件。固件可从 WD 提供下载的 Windows NT 驱动程
+序中提取。地址如下：
+
+http://support.wdc.com/product/download.asp?groupid=801&sid=27&lang=en
+
+该文件或网页上都未包含任何许可声明，因此该固件可能无法被收录到
+linux-firmware 项目中。
+
+提供的脚本可用于下载并提取固件，生成 wd719x-risc.bin 和
+wd719x-wcs.bin 文件。请将它们放置在 /lib/firmware/ 目录下。
+脚本内容如下：
+
+	#!/bin/sh
+	wget http://support.wdc.com/download/archive/pciscsi.exe
+	lha xi pciscsi.exe pci-scsi.exe
+	lha xi pci-scsi.exe nt/wd7296a.sys
+	rm pci-scsi.exe
+	dd if=wd7296a.sys of=wd719x-risc.bin bs=1 skip=5760 count=14336
+	dd if=wd7296a.sys of=wd719x-wcs.bin bs=1 skip=20096 count=514
+	rm wd7296a.sys
-- 
2.25.1

