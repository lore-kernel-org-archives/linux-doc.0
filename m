Received: from mail-m49225.qiye.163.com (mail-m49225.qiye.163.com [45.254.49.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08E41E0DE5
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247574; cv=none; b=TS0umbrtJ/XP3sjicE5GagKknrZ2j9FTSvEXR9234/Ub4mP5vurrsJ8Ix2qqZi7Z6dfDt9zQ7fuXYtivrHd+AXjvfGl6xVIUWPiA65BDe07Wn9e9a27NjQD3ihN/iCNr29AB0lWLVBItrewZWRH/81/kIV0hZ5S647rQ6tRgjoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247574; c=relaxed/simple;
	bh=0a9DJmMTV7rJesITGO76xi+z8Ln+aQ0a6FD2bUv+B2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=doQQCv9Kh1bQQHzG3lfXItfjug+mQG+XopgzyRRaRl9KuShVqRPywFwBafcSOQ4WAuQo2HBAUyocTMRLWpLVm2RWltWtFKvAHjs1PII+6dDFAe64fYhgJH4ETT2zRu467PA2Vwy5vOfs/xR6d+gmSSDLYSTYem67yVdPnWQY8HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=BY/4DKME; arc=none smtp.client-ip=45.254.49.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="BY/4DKME"
Received: from fedora.localdomain (unknown [171.8.192.198])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7ee19620;
	Tue, 7 Jan 2025 13:16:42 +0800 (GMT+08:00)
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
Date: Tue,  7 Jan 2025 13:16:39 +0800
Message-ID: <20250107051640.23347-1-zhaoshuo@cqsoftware.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaT0NOVk1MHkIeHUxNSx9NQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKTEpVQ1VKQklVSkJDWVdZFhoPEhUdFFlBWU9LSFVKS0hKT0hMVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a943f31999409d0kunm7ee19620
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PT46NAw5FjIXMRwSGD84Gh0j
	Ly5PFDZVSlVKTEhNSUlMS0tITkJMVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSkxKVUNVSkJJVUpCQ1lXWQgBWUFJSkxKNwY+
DKIM-Signature:a=rsa-sha256;
	b=BY/4DKMEB5vc2BbuasYB49VHSEKe5CHGlNn2DPwm7B4N/XmgbWu1V3Yuf7okTM1WTfq+6QrugdX7qqvqQdc3o7SFh7itNdyfaQDAVI6eCdksWc07znoBedmUkNwGNNHVhEf82XumSmgT1sz97E6o+lqclN/H0A9b6Nac9sOz5ac=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=tQ27GM3Y6kmVER1Sj7w2dJaIm87FHGQbUwTVfjoSKe0=;
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
index c30d4e0210d1..5842568585a0 100644
--- a/Documentation/translations/zh_CN/security/index.rst
+++ b/Documentation/translations/zh_CN/security/index.rst
@@ -18,6 +18,7 @@
    credentials
    IMA-templates
    lsm
+   lsm-development
    sak
    siphash
    digsig
@@ -26,7 +27,6 @@
 TODOLIST:
 * snp-tdx-threat-model
 * keys/index
-* lsm-development
 * SCTP
 * self-protection
 * tpm/index
diff --git a/Documentation/translations/zh_CN/security/lsm-development.rst b/Documentation/translations/zh_CN/security/lsm-development.rst
new file mode 100644
index 000000000000..7ed3719a9d07
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
+基于https://lore.kernel.org/r/20071026073721.618b4778@laptopd505.fenrus.org，
+当一种新的LSM的意图（它试图防范什么，以及在哪些情况下人们会期望使用它）在
+``Documentation/admin-guide/LSM/`` 中适当记录下来后，就会被接受进入内核。
+这使得LSM的代码可以很轻松的与其目标进行对比，从而让最终用户和发行版可以更
+明智地决定那些LSM适合他们的需求。
+
+有关可用的 LSM 钩子接口的详细文档，请参阅 ``security/security.c`` 及相关结构。
-- 
2.47.1

