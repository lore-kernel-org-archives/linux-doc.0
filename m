Received: from mail-m49244.qiye.163.com (mail-m49244.qiye.163.com [45.254.49.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F45B629
	for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 05:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737609517; cv=none; b=EofiL8Q5YCYGvZ7IyronBf0jpa0CsH8ggHdpYwyKdC46acrdk9lYCKsv70t24N+E1CTqv+5rNLI2Uw5kLkSWlhUnZs6YcfeTT7yTPmX5Y1/bM6Zri8GNy6la6TeokmF95OGZmZ7RqB+VO9twCtc4Qg1+gtSk96F44hoqRoJ41s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737609517; c=relaxed/simple;
	bh=XOoeaILymiliBpFVP9FPVfhOfWhT01XBCsHbNcLogqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MLanhKd8gcntcivj/xElOxV1GiAgHFr/+ULfUan8ZbggnQ272NhMNbi6/6vq7W1GJpKPX0z1xX640WPe7K+OtSy5k9KDtsWoIzwresslpFZJ0BzjlPipRonmKEXcGuyt0s3/WvuNC+YeXtUxM1ndfsIojOd43gPHF7xNYbvCePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=UA8ap9t2; arc=none smtp.client-ip=45.254.49.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="UA8ap9t2"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 979244d4;
	Thu, 23 Jan 2025 13:18:24 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 2/7] docs/zh_CN: Add tpm tpm_event_log Chinese translation
Date: Thu, 23 Jan 2025 13:17:40 +0800
Message-ID: <32c35c0504f262668996080b44dfe059a5266256.1737603330.git.zhaoshuo@cqsoftware.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTkgfVkpIQ0xKThkdSh1LSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a949198e85c09d0kunm979244d4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCI6KRw6FjIPEi0DMBg#SzUJ
	Hw0wCzFVSlVKTEhMTUtCTktNS0pDVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUhOS0o3Bg++
DKIM-Signature:a=rsa-sha256;
	b=UA8ap9t2fX2K8I7UMhgoFkgQ3GfoDa9R/F4vy0EwT0m3iTLcJu1P3Jmo/ugCzwqRLorSqIMh19NPgOE1atexgsV3VNB7HZUyoWjA3fDWjZM35mYmOLg5/T9prrQf1cH1OkrSKEgxqzZcxRn/UZ1j0GO5QOKeYIt6s17DRtsQEds=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=5JbbnzHqdyGXHUGI7UvhZu5By6FBzuwsLV082sOWLNg=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/tpm/tpm_event_log.rst into Chinese.

Update the translation through commit 2ef5a7f1482c
("tpm: Document UEFI event log quirks")

Reviewed-by: Alex Shi <alexs@kernel.org>
Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/tpm/index.rst |  2 +-
 .../zh_CN/security/tpm/tpm_event_log.rst      | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst

diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
index a55d0a7bbc0f..f324bd4dd093 100644
--- a/Documentation/translations/zh_CN/security/tpm/index.rst
+++ b/Documentation/translations/zh_CN/security/tpm/index.rst
@@ -12,9 +12,9 @@
 
 .. toctree::
 
+   tpm_event_log
 
 TODOLIST:
-*   tpm_event_log
 *   tpm-security
 *   tpm_tis
 *   tpm_vtpm_proxy
diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst b/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
new file mode 100644
index 000000000000..9c173291ac3e
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/tpm/tpm_event_log.rst
+
+:翻译:
+ 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
+
+===========
+TPM事件日志
+===========
+
+本文档简要介绍了什么是TPM日志，以及它是如何从预启动固件移交到操作系统的。
+
+介绍
+====
+
+预启动固件维护一个事件日志，每当它将某些内容哈希到任何一个PCR寄存器时，该
+日志会添加新条目。这些事件按类型分类，并包含哈希后的PCR寄存器值。通常，预
+启动固件会哈希那些即将移交执行权或与启动过程相关的组件。
+
+其主要应用是远程认证，而它之所以有用的原因在[1]中第一部分很好地阐述了：
+
+认证用于向挑战者提供有关平台状态的信息。然而，PCR的内容难以解读；因此，当
+PCR内容附有测量日志时，认证通常会更有用。尽管测量日志本身并不可信，但它们
+包含比PCR内容更为丰富的信息集。PCR内容用于对测量日志进行验证。
+
+UEFI事件日志
+============
+
+UEFI提供的事件日志有一些比较奇怪的特性。
+
+在调用ExitBootServices()之前，Linux EFI引导加载程序会将事件日志复制到由
+引导加载程序自定义的配置表中。不幸的是，通过ExitBootServices()生成的事件
+并不会出现在这个表里。
+
+固件提供了一个所谓的最终事件配置表排序来解决这个问题。事件会在第一次调用
+EFI_TCG2_PROTOCOL.GetEventLog()后被镜像到这个表中。
+
+这引出了另一个问题：无法保证它不会在 Linux EFI stub 开始运行之前被调用。
+因此，在 stub 运行时，它需要计算并将最终事件表的大小保存到自定义配置表中，
+以便TPM驱动程序可以在稍后连接来自自定义配置表和最终事件表的两个事件日志时
+跳过这些事件。
+
+参考文献
+========
+
+- [1] https://trustedcomputinggroup.org/resource/pc-client-specific-platform-firmware-profile-specification/
+- [2] The final concatenation is done in drivers/char/tpm/eventlog/efi.c
-- 
2.47.1

