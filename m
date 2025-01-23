Received: from mail-m49232.qiye.163.com (mail-m49232.qiye.163.com [45.254.49.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A7143AA8
	for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 05:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737609516; cv=none; b=g8jeHKqp3kvd2d3X7u7fiDE9cAapI9hJ5TcgCua9uaCl4afKyXP5rnBI+q6IcG9yTs/7EMkq55HaBI6JxUZbrq7Z9z880SbBgffACcxNkmpkABFF7tA0JeO7kzFtpnkTlwxXfOBzAValiJOlbmgNKgbFjjkD/HcWYSBWSJ2f0RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737609516; c=relaxed/simple;
	bh=FNVSmvLE3Sfz+bI3CrxfCZ3Uw3IFuFSTcgLlh1kO5LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gd0XhA0UW3s91+JSwIcQ8GFFItUyjcoVo+HKk7+h3Iiw7rCM1UP84MMi0YAwYWh3DQzqMyCKVlogPIL5vaj3BFc6egDenMxNWMz0YRm14fbt0y9M0IrtEfoUhkPhOpGBFQIQJ6rG0yvtJc/HcqzasSIJMSmXXv3X7AXLc23Xi08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=gG6dvWZC; arc=none smtp.client-ip=45.254.49.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="gG6dvWZC"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 979244c4;
	Thu, 23 Jan 2025 13:18:22 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/7] docs/zh_CN: Add tpm index Chinese translation
Date: Thu, 23 Jan 2025 13:17:39 +0800
Message-ID: <900d91e8a2c7c35259005de5cff99e7bb4e7adf6.1737603330.git.zhaoshuo@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
References: <cover.1737603330.git.zhaoshuo@cqsoftware.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHx1CVkJMSBpNQ0hPTh9IS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a949198de3209d0kunm979244c4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngw6Nyo*UTITFi0XTx0ISzka
	TDoKCQxVSlVKTEhMTUtCTktISUhCVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUpMSUw3Bg++
DKIM-Signature:a=rsa-sha256;
	b=gG6dvWZC1n0SMPIFMnp9NoDZoaaq4GXFq7IZls1rz+SCtk/JR2u/Td2n754jxv/H1nZ/GPidTODoCh/chEZUaZmoNfBs9tZNh0O3xXvGZlFClScokW5FirwjDCUs0JHvoOpFRbSOwCR7pwxB6i0I3PwaK6cACAex3fmKAT43Pks=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=VNxDknarBJ8rM68lXMmRTQ8sVTab8TUklMGMMq6lH7c=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/tpm/index.rst into Chinese

Update the translation through commit 1d479e3cd652
("Documentation: tpm: Add TPM security docs toctree entry")

Reviewed-by: Alex Shi <alexs@kernel.org>
Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/index.rst     |  2 +-
 .../translations/zh_CN/security/tpm/index.rst | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/tpm/index.rst

diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
index 38e9ce7cf471..0aacecabf0c0 100644
--- a/Documentation/translations/zh_CN/security/index.rst
+++ b/Documentation/translations/zh_CN/security/index.rst
@@ -19,6 +19,7 @@
    lsm
    sak
    siphash
+   tpm/index
    digsig
    landlock
 
@@ -29,6 +30,5 @@ TODOLIST:
 * lsm-development
 * SCTP
 * self-protection
-* tpm/index
 * secrets/index
 * ipe
diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
new file mode 100644
index 000000000000..a55d0a7bbc0f
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/tpm/index.rst
@@ -0,0 +1,22 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/tpm/index.rst
+
+:翻译:
+ 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
+
+================
+可信平台模块文档
+================
+
+.. toctree::
+
+
+TODOLIST:
+*   tpm_event_log
+*   tpm-security
+*   tpm_tis
+*   tpm_vtpm_proxy
+*   xen-tpmfront
+*   tpm_ftpm_tee
-- 
2.47.1

