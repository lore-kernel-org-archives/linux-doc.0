Received: from mail-m3277.qiye.163.com (mail-m3277.qiye.163.com [220.197.32.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A9243AA8
	for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 05:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737609525; cv=none; b=JoiKobHLk+vBV9r/jXI3rMB5ZDabdC/IiDlRvcCWkTGKtG3TMDYsTj07WtmI1Bz7eN8ua38Q020Co8/vbf3SBqR0NECjD9R/Mh3/gaOnocO08A+d6DeuqKvAuW68i0WIc76qsvbWm1OIAIWNxYlzPruwrWhXhcdMQXktKjoMbf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737609525; c=relaxed/simple;
	bh=3JwqNWBhT/yZpKDV5R/cvjWkixF2/9xEgIIIs5TuDdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gml+MXwJvgiXrPFV1e+G/sT7uj+i5wadrU35hmfJXEVIusBV10bd2mTzYLGfNeozwFPDlPGsYVf8il3Jj8K2s2rtivs94kE3xK7P8ywnfNr0h/icKLiCj10MqgkEnq+DxYJYvYo7WN1G61LCSUvxl5ayRlHPgzasyANv791shsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=KIqim7WC; arc=none smtp.client-ip=220.197.32.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="KIqim7WC"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 97924512;
	Thu, 23 Jan 2025 13:18:33 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 7/7] docs/zh_CN: Add tpm tpm_ftpm_tee Chinese translation
Date: Thu, 23 Jan 2025 13:17:45 +0800
Message-ID: <5de6312d2b9d23646eb306e74bae3f80ff28941d.1737603330.git.zhaoshuo@cqsoftware.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTE0ZVh5JGUhJHRlIGEhOT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a9491990bf909d0kunm97924512
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OAg6GQw5TzISGi1CGhgySyJW
	Pz9PCT9VSlVKTEhMTUtCTkpPTEJPVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUlJTE83Bg++
DKIM-Signature:a=rsa-sha256;
	b=KIqim7WCtAoBpEx/y/n1sQdBrvMXqC8s2mzTg8sAek9RAXXcT12cz08v8b8ms7YFoyTRpS1DZ+TcBygaH4BfqzpdnYzB8xR/c+Re+ngA9iWtqBGa8a0lNwDcuph/qnjmKnZdFX2Io/orx8ttxzkMz+JbIlIHOY3rRAUMSHkWPbA=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=svt/KFvdrMl5CSH8MBK3+pc/CFOCXlmHboKWZHfwPOI=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/tpm/tpm_ftpm_tee.rst into Chinese.

Update the translation through commit e8bd417aab0c
("tpm/tpm_ftpm_tee: Document fTPM TEE driver")

Reviewed-by: Alex Shi <alexs@kernel.org>
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

