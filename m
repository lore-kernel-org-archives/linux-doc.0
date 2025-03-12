Received: from mail-m1973177.qiye.163.com (mail-m1973177.qiye.163.com [220.197.31.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272B538FA3
	for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 02:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741748280; cv=none; b=ul8VHFxe2wb4gflhd9O5n8HK8ITsUQyuUMdyLoaVl0kEKJeiG3ePMpaieGSF8CMyU1kb+3FFRuqd0Cb7goXlL+tlacGD8GFluPmvh0u/UnO4q2Gv1OS3KqNyrBTSx2wOwNkzwwV2jWVDHxgzrxSZpLOafWro0KawwnulYsaApoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741748280; c=relaxed/simple;
	bh=VtzLc28JTImiYWBJVQGmKVEFg8I8qOjCvMrth6ZgDIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VNBx7DR+Xu6PWk3Xu6NxT0PlVSWOkZ29NEU1lFDgA23sKmL39cyzs4HgVYrPes+G3t+MWqnrJQaarMwK5Et4qtrDyM84xqnJH+kVj4Jzb+Ny3qYRG6QJ0zxYmTFjUBTbnJmUEUzctW3/S0ziHOd4jLvpHr1Ejw3oopslF7fEN78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=OdQS/rY/; arc=none smtp.client-ip=220.197.31.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="OdQS/rY/"
Received: from fedora.localdomain (unknown [1.193.57.30])
	by smtp.qiye.163.com (Hmail) with ESMTP id df6ae04d;
	Wed, 12 Mar 2025 10:42:28 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs/zh_CN: Add security lsm-development Chinese translation
Date: Wed, 12 Mar 2025 10:42:25 +0800
Message-ID: <20250312024226.14804-1-zhaoshuo@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSBpJVkpJS0ofGE9JQx0dHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVIS1lXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a95883b65ff09d0kunmdf6ae04d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K1E6Ixw5KTJOSR8zGCwvMxgP
	GSowFB9VSlVKTE9KTE9MSE9CQ0lPVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSEtZV1kIAVlBSUpMSDcG
DKIM-Signature:a=rsa-sha256;
	b=OdQS/rY/hjIdY3Ae2zDjZkioolPicbZP/RWD6Jei74j458dDLGvuRS86XcNmXzdqNpIpce+PovjnKNEzO43MqPJXsGhNhGcWCISVkC7mLvMniPDciLvSmrWDY7xBSyUaRQMPMLr1qDtWF7LlVSjx1g+ndqp8UJ9LCq20QjsIGSs=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=1F7VHhps9xq7VQrAkXYGYH3cUDlpgaOFbrfvNOD/L8I=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/lsm-development.rst into Chinese.

Update the translation through commit 6d2ed653185b
("lsm: move hook comments docs to security/security.c")

Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/index.rst     |  2 +-
 .../zh_CN/security/lsm-development.rst        | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/lsm-development.rst

diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
index 78d9d4b36dca..05d24e3acc11 100644
--- a/Documentation/translations/zh_CN/security/index.rst
+++ b/Documentation/translations/zh_CN/security/index.rst
@@ -18,6 +18,7 @@
    credentials
    snp-tdx-threat-model
    lsm
+   lsm-development
    sak
    self-protection
    siphash
@@ -28,7 +29,6 @@
 TODOLIST:
 * IMA-templates
 * keys/index
-* lsm-development
 * SCTP
 * secrets/index
 * ipe
diff --git a/Documentation/translations/zh_CN/security/lsm-development.rst b/Documentation/translations/zh_CN/security/lsm-development.rst
new file mode 100644
index 000000000000..cdd0aa03e089
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/lsm-development.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/lsm-development.rst
+
+:翻译:
+ 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
+
+=================
+Linux安全模块开发
+=================
+
+基于 https://lore.kernel.org/r/20071026073721.618b4778@laptopd505.fenrus.org，
+当一种新的LSM的意图（它试图防范什么，以及在哪些情况下人们会期望使用它）在
+``Documentation/admin-guide/LSM/`` 中适当记录下来后，就会被接受进入内核。
+这使得LSM的代码可以很轻松的与其目标进行对比，从而让最终用户和发行版可以更
+明智地决定那些LSM适合他们的需求。
+
+有关可用的 LSM 钩子接口的详细文档，请参阅 ``security/security.c`` 及相关结构。
-- 
2.47.1

