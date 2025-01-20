Received: from mail-m49207.qiye.163.com (mail-m49207.qiye.163.com [45.254.49.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0B935968
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 07:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737356781; cv=none; b=grzh9KdIOTyfv+rnwe1MrVOlfwr0l7uNcKXlZxhfNUQOCA+Q19RxnZrToKXdE3yPRSiGfVpGuR+EqzeY1rloEibKEDU7irxnX0Zi/dyo8LRcxVWQP8vffE6l8RsEqG/gAn3XtgUuLJM3YbTx/V9nUjMmu/mDVFJlwx+6GTptvMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737356781; c=relaxed/simple;
	bh=q+FVBnpw4XyZ6eqzDSHJSo8ubsGYzUaE/f4kyGN8K70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MQ4lkFPsdaWR8Iq7wv56NOInVP65s00LlsHlL3+xnPmr+CthMs/mhEPWB4DlnRIjxTs85KWOZZbWARwRzgt85CNT6yrgbsFmiBYMzwamUK2Lake1hlxsalcS9bgecRdsZdLwPUS9AXDufyfQLXuzMxCPIgPgrtFgDADmw2UBfkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=FbUiWvKR; arc=none smtp.client-ip=45.254.49.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="FbUiWvKR"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 92a3cc6f;
	Mon, 20 Jan 2025 14:50:58 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/7] docs/zh_CN: Add tpm index Chinese translation
Date: Mon, 20 Jan 2025 14:50:46 +0800
Message-ID: <ff15a31080a2671da3e114fe95f2a19e294367bc.1737354981.git.zhaoshuo@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn>
References: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHRgdVhgfTh5PTx1CGkkZT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a94827a909e09d0kunm92a3cc6f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nwg6SSo4HjIPFjcWHD8PHzdN
	ASMaFENVSlVKTEhMSE5OQ05DQkNJVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUpNQ0k3Bg++
DKIM-Signature:a=rsa-sha256;
	b=FbUiWvKRVfrGISzOMpLLfdLtQU+75AWqWO37T6zRpm7unlI0AFkJTukJ9LkAzH0DVwSbPkdHu/WH6JD6Yd1fXZWgxRXa04Ok+zQJAjidZJwUJhDGK7IrNH9+NYbnLwKZUj/Tphkqh9mmTUACd7WgHg3TGG9bLeHap/ALohh51zM=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=SvNdNnRNNi9vOjLia4weCWPh8BltjDVjdGk66iKx1Eo=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/tpm/index.rst into Chinese

Update the translation through commit 1d479e3cd652
("Documentation: tpm: Add TPM security docs toctree entry")

Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/index.rst     |  2 +-
 .../translations/zh_CN/security/tpm/index.rst | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
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
index 000000000000..a3cfb2d11c86
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/tpm/index.rst
@@ -0,0 +1,21 @@
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
+TODOLIST:
+*   tpm_event_log
+*   tpm-security
+*   tpm_tis
+*   tpm_vtpm_proxy
+*   xen-tpmfront
+*   tpm_ftpm_tee
-- 
2.47.1

