Received: from mail-m3269.qiye.163.com (mail-m3269.qiye.163.com [220.197.32.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81177E1
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 03:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737344590; cv=none; b=jcO8R1MNxy0u6opNtk0abF8AdCU7o/h2B+pRtlmX/xZPazV1I1T3PZr/2iH6mBLTp+mQSqYnarR08GShbfZ3Q8l5sKe59PXc0fhU+L4bwPkpZ9rI0d5KU88raOWkKDIn8WdESNmiArjDAhat9O/xEBNwCUc48ImfLD33rfUT5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737344590; c=relaxed/simple;
	bh=hTIVRY98gtNNt8H68t1v87dzCQrwiqV6q9/iuv1CHos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=liRzndPj2RPySQD2xTuQHR0S5Um50lVGBeJfr0tnAs4OieY55eYFPTJjCbA4Mpr9adSzVpojVRww7WtTteVeBaQWTkeg+HlmNRaZqSyYJIwesfxuW4n8NiWiq0nLxBncKngIj2QoXGEKwp5ScUesruOXJXpF7g/AhlHMB3aYuY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=Qn1Trwlu; arc=none smtp.client-ip=220.197.32.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="Qn1Trwlu"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 924e2b30;
	Mon, 20 Jan 2025 11:42:57 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/7] docs/zh_CN: Add tpm index Chinese translation
Date: Mon, 20 Jan 2025 11:42:46 +0800
Message-ID: <bf33696a6c41a2e3cd23a7cb5d6efdae16f71571.1737344074.git.zhaoshuo@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1737344074.git.zhaoshuo@cqsoftware.com.cn>
References: <cover.1737344074.git.zhaoshuo@cqsoftware.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGExPVh8eTU8YH09JQh1CGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a9481ce70b909d0kunm924e2b30
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDo6Ghw*SzIPHjAXAQ0VIyM2
	KSFPCxxVSlVKTEhMSE9PTkxDTkJOVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUpKSEw3Bg++
DKIM-Signature:a=rsa-sha256;
	b=Qn1TrwluYyx3hOPOy83IumKZAy9uqVTKJK9mC9TmXPzm5rN7bdhjLH8GvjlBIQSsLB+4Y911eHU45xFE+iVBOG29KIPFBimAtLI6aULgt54MWFFEIFQ5okm5Q/jeaDU/LVDiDI+DVx4ZOEFmN52zooeXVhSiCCWX/NDv+QHwpHY=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=bidWdRmnqgPanquxhbJoguWUg5VZkIPcrUBxnI5848Y=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/tpm/index.rst into Chinese

Update the translation through commit 1d479e3cd652
("Documentation: tpm: Add TPM security docs toctree entry")

Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/tpm/index.rst | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/security/tpm/index.rst

diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
new file mode 100644
index 000000000000..edcc850606ce
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
+   :maxdepth: 1
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

