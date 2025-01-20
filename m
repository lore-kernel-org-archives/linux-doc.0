Received: from mail-m1973186.qiye.163.com (mail-m1973186.qiye.163.com [220.197.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D4D1632FE
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 06:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737356183; cv=none; b=ajVF6n0D4nZxCzQ8HThGJ6rPyVGlENGoJ0t3gCdvWWl59bO7Tgs+mZnGKfIzDRgqSmNOvI2vGMO0chvcssk9w0tTCLlCkdeSwsYs/3rHhT7HWAkEIqQh6Iu1SoSnutVjhAOavpnNiUI+YCVFMTIZuN6yDDZj54edOGyvAIhxa78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737356183; c=relaxed/simple;
	bh=3inCQ5Qs6u/95uRbBdOPcRypXVj6qbLJGdtUyqxe+N0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uZBHZFxXP+fGjGtbSNU+mAsu53gCa//cdDGKE9AIi7+8JSxzaBgvso+/Y9iYelPTTBfyYcL/iUJbAkhOvo5zdqH4+j9ULv1DMnjAxZtzztCUQAbAN4b9McQ1DZbzj8BSZwwV8+esBUc4PECgefMcC9n2f29PydM5CLxkMLbZXO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=DH7DquoL; arc=none smtp.client-ip=220.197.31.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="DH7DquoL"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 92a3ccbb;
	Mon, 20 Jan 2025 14:51:09 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 7/7] docs/zh_CN: Add tpm tpm_ftpm_tee Chinese translation
Date: Mon, 20 Jan 2025 14:50:52 +0800
Message-ID: <b5ab071a6869a52c5ef16fb96d710b80cfef96a4.1737354981.git.zhaoshuo@cqsoftware.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGU1CVkhNHR5JGUtOS05CSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a94827abc7b09d0kunm92a3ccbb
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nkk6ASo6FzINMDcKHDpWHykT
	NUkwCxRVSlVKTEhMSE5OQ0xLSU9CVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUlJSEk3Bg++
DKIM-Signature:a=rsa-sha256;
	b=DH7DquoLJiQgjvfWq3meRa7jmbR0yfYba5xI1YbSdTtHJeEajyvoJ8YgEaluNetLGtaGzZfMSHpTMb9DkT8PcukgqOISU4wwUiGMaj2gFy3dFkAmDShFhPr7upsch3fQbm7AnCRbNEaS1sC6L7K60VuMpnSMxOkZ3vVv/HUZsUc=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=tv34BjXSXkVtE+L37Fp5sTY+fQrjIwBtb6Vred/3Hqk=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/tpm/tpm_ftpm_tee.rst into Chinese.

Update the translation through commit e8bd417aab0c
("tpm/tpm_ftpm_tee: Document fTPM TEE driver")

Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/tpm/index.rst |  4 +--
 .../zh_CN/security/tpm/tpm_ftpm_tee.rst       | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst

diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
index bf95200ca586..707646590647 100644
--- a/Documentation/translations/zh_CN/security/tpm/index.rst
+++ b/Documentation/translations/zh_CN/security/tpm/index.rst
@@ -17,6 +17,4 @@
    tpm_tis
    tpm_vtpm_proxy
    xen-tpmfront
-
-TODOLIST:
-*   tpm_ftpm_tee
+   tpm_ftpm_tee
diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst b/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
new file mode 100644
index 000000000000..5901eee32563
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/tpm/tpm_ftpm_tee.rst
+
+:翻译:
+ 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
+
+===========
+固件TPM驱动
+===========
+
+本文档描述了固件可信平台模块（fTPM）设备驱动。
+
+介绍
+====
+
+该驱动程序是用于ARM的TrustZone环境中实现的固件的适配器。该驱动
+程序允许程序以与硬件TPM相同的方式与TPM进行交互。
+
+设计
+====
+
+该驱动程序充当一个薄层，传递命令到固件实现的TPM并接收其响应。驱动
+程序本身并不包含太多逻辑，更像是固件与内核/用户空间之间的一个管道。
+
+固件本身基于以下论文：
+https://www.microsoft.com/en-us/research/wp-content/uploads/2017/06/ftpm1.pdf
+
+当驱动程序被加载时，它会向用户空间暴露 ``/dev/tpmX`` 字符设备，允许
+用户空间通过该设备与固件TPM进行通信。
-- 
2.47.1

