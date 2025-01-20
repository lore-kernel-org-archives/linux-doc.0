Received: from mail-m49196.qiye.163.com (mail-m49196.qiye.163.com [45.254.49.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661B4C2E0
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 03:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737344905; cv=none; b=E7zmJwXpBtLSZ+t+MoXk3n+0cT4mdPVYsqQcukV3ZFESf/KAbeyzkF1KFgt1L9swldtZEKKhaTKei0S8WnyrzFqGFcpVCzyqxlAKCwGEI7eXqs5WT6benVpgKczBrKK7rlDwQCSofQKY0bBsAgEKyHx0Y6oy4wrF1gTN3KVKFMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737344905; c=relaxed/simple;
	bh=UdL9vG1y68ffJi+RJU1O7jnfvAQtHRcJ/Yty0OA9mfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i74KHK43pDO0gY7HG0TMsHNgSiFguU8MRaGyo9JPNhypwkJfmDc1PWD9Pjf2wBOA+d7hmV9XKJhpVSZS6LaNHc2xWvNpN4yaKAC+GPBGZzVXg5a8WlTEgLjh9SqZr4FEBZxnRCMmj3t8oU9LX/yKtlmAWRup7+YIsCDg7zW1ftk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=DC4r4Z/d; arc=none smtp.client-ip=45.254.49.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="DC4r4Z/d"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 924e2b99;
	Mon, 20 Jan 2025 11:43:05 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH 7/7] docs/zh_CN: Add tpm tpm_ftpm_tee Chinese translation
Date: Mon, 20 Jan 2025 11:42:52 +0800
Message-ID: <fbbb9483969d3c608ea2d0eab94ab8261e2bae12.1737344074.git.zhaoshuo@cqsoftware.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS05DVktMSkIYShhPGENOSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a9481ce8fb409d0kunm924e2b99
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRw6Ojo5PjIUGjAeAQ5WS08B
	LBZPCyJVSlVKTEhMSE9PTkNNTUlPVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUlJSEk3Bg++
DKIM-Signature:a=rsa-sha256;
	b=DC4r4Z/dSqrBSB6XdiM2/rb1LCbQR9f241HL+B1Y9U2bJbYhRik3ANAaEVdgEsFmzCaFv5LdNKtpUZ1kNiMQn1T31Qth8V+KqdrKZDBGPpxw66LTyDdlOAJUt9kAZ1W21lHuh5Y3BZWce8EBxiG+IzBncs6R9APtzVgi2gwilPM=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=gTHlWIdQ5QjnaUHmdUcvmv2EMOUjrRq/eXLrkgZ/eJw=;
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
index cace08aafd16..61da4b73b71c 100644
--- a/Documentation/translations/zh_CN/security/tpm/index.rst
+++ b/Documentation/translations/zh_CN/security/tpm/index.rst
@@ -18,6 +18,4 @@
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

