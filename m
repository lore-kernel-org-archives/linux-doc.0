Received: from mail-m6020.netease.com (mail-m6020.netease.com [210.79.60.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B201E49F
	for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 02:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.79.60.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763261736; cv=none; b=GBf414DLi5RLn7dflLmVLkARtWvH0tAioEhLU9KkKebrtOLocFwnWQ7E7Igm/gJ4LGyLkJKYGRG3W/MBMO2BJ732GrM1daRr6ERWBzXKky40KKOmI7c/3ojovvVHMFC05+26vr3vf6EwP3K2/nRfSGdVsRBzwk+vAkDS9WKDBOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763261736; c=relaxed/simple;
	bh=hcA4xw6bObDnbGrur+4nS88MPDaEBifwlD2gUGVbRyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mc4Ixku0EjEIYPwx4oOaKbXAywO+/iNyf4o5EyXhn/t/Go6SGs/k6EESkClE3mtzf6rmn1fPDD34nt43+oVqfoWUhzrShYtfUoDdUsBmEVE0iSdZEO4lD4JtEVcNRfdslz8UhQleac34NJHXYnnS6ed/SsZXrK32C7G5TTNbSi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=klBQAw73; arc=none smtp.client-ip=210.79.60.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="klBQAw73"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29b70742c;
	Sun, 16 Nov 2025 10:40:07 +0800 (GMT+08:00)
From: Yujie Zhang <yjzhang@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com,
	yjzhang@leap-io-kernel.com
Subject: [PATCH 2/2] docs/zh_CN: Add wd719x.rst translation
Date: Sun, 16 Nov 2025 10:40:05 +0800
Message-Id: <f9720c918de47890c536124e7866859c866c67f4.1763112421.git.yjzhang@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1763112421.git.yjzhang@leap-io-kernel.com>
References: <cover.1763112421.git.yjzhang@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8a88b9e409d6kunme87d206954f5d1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSkIZVh1KQhhPHRgYSENIQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=klBQAw73YnqbWRBXee/x4ALAm4HKs5wb+nprKoI05MWUeAZxvBARjN/LEvdavId1dGcudsQPuwuz8wJWD7tzmuOM9IrfasNurD2FEwGxZuMIFQbWkI1eAYmPzao6MsK9Q1c/hMQa+2UU/ZAIqSch4sO61EuvoTG4cZZwbuMO23sx4YpHicYigNGH9PVgbkriqOJV6HkJhfhZYk6qqKAAphy0qTUM5sNKQjmef+pEmmIVqBFGwHcMw4EViynvnf+W0A3V3stwaagJKQYgtSCMHowxIdIsmuM0cmjkcdMFvKY+5YoVErkDwN6s9KG9XuRV1TzSuUpw09FjpYb6xoS1Tw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=KVIGrKkxlLRyntTIEvYNF3EiFNjM0XIk3x7qZ1Tsy0o=;
	h=date:mime-version:subject:message-id:from;

Translate .../scsi/wd719x.rst into Chinese.
Add wd719x into .../scsi/index.rst.

Update the translation through commit 40ee63091a40
("scsi: docs: convert wd719x.txt to ReST")

Signed-off-by: Yujie Zhang <yjzhang@leap-io-kernel.com>
---
 .../translations/zh_CN/scsi/index.rst         |  2 +-
 .../translations/zh_CN/scsi/wd719x.rst        | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
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
index 000000000000..5f82c9220541
--- /dev/null
+++ b/Documentation/translations/zh_CN/scsi/wd719x.rst
@@ -0,0 +1,36 @@
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
+
+
+===============================================================
+Western Digital WD7193, WD7197 and WD7296 SCSI 卡驱动
+===============================================================
+
+该卡需要加载固件。固件可从 Windows NT 驱动中提取，该驱动可在以下
+地址从 WD 官方下载：
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

