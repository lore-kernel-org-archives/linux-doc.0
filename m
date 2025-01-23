Received: from mail-m21472.qiye.163.com (mail-m21472.qiye.163.com [117.135.214.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE7343AA8
	for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 05:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737609519; cv=none; b=dz9qak93NHeU8b/364UV30ABZrQKKTqdTnE8Xyl7Nu5+Hjtl3pY6FTw2+wzs0K40BGn8xPmEbh2tGO45K5mFW6RQVh6I5sVt68dPHq3rxZ6uFGZFE4ZMTx24E2iIL1ErUwl1qDEvouyV7Lb9Izj/KLFTza9t7OkZzqTbtwu9uaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737609519; c=relaxed/simple;
	bh=b33tb3U9/MjEvc5K5GPE/uMAWSPqSTFcLKUR1VtBEJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2eBBTqv6GR/kt9iPIlggSxhVbfDfuftSuuJXaSpx76wCdtuMNfVe0A5/1tTfQg5ZwMzcvIqo+8QMcX2/DK6irl+itipkaQX2a05faS8iWFLS2zZnPQm/Tv2T6c8UBCUEpzogY1N01mWsCLzdDcveFC9643jbyZ3Yfs+etYxZdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=TQWyzHvl; arc=none smtp.client-ip=117.135.214.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="TQWyzHvl"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 979244ea;
	Thu, 23 Jan 2025 13:18:28 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 4/7] docs/zh_CN: Add tpm tpm_tis Chinese translation
Date: Thu, 23 Jan 2025 13:17:42 +0800
Message-ID: <ac55092bc3f1b3ec51f3e2dd596616ade1a32076.1737603330.git.zhaoshuo@cqsoftware.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUlPVk9MHk5DHh1PQ0NCT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a949198f70d09d0kunm979244ea
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORQ6ORw6DTISGi0iMBg0Sysd
	TxgaCQpVSlVKTEhMTUtCTktCTkJNVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQUhKQ0s3Bg++
DKIM-Signature:a=rsa-sha256;
	b=TQWyzHvlG1ZjG/49rQ7RqpGJv0no7CT4c7TNe4NeN4yIDYJVT7k4WtrlGuYWzuymo65s90KRifU/V6vcbYthlZ9oylijTgXhbh6dPBryzqTUs6LBwvRYwKR1qRoMnL0d9B4leLXaW5o8RYnKRYiGlc9BJRTE+XicXu0l64O40h0=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=wdh27J0hVrJELFpMFwGEe2mkFGXuVBx5wNTMgr8yPow=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/tpm/tpm_tis.rst into Chinese.

Update the translation through commit 8a55256a8462
("Documentation: tpm_tis")

Reviewed-by: Alex Shi <alexs@kernel.org>
Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/tpm/index.rst |  2 +-
 .../zh_CN/security/tpm/tpm_tis.rst            | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/tpm/tpm_tis.rst

diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
index 46cdf7c1a1c1..4ee8881a41a4 100644
--- a/Documentation/translations/zh_CN/security/tpm/index.rst
+++ b/Documentation/translations/zh_CN/security/tpm/index.rst
@@ -14,9 +14,9 @@
 
    tpm_event_log
    tpm-security
+   tpm_tis
 
 TODOLIST:
-*   tpm_tis
 *   tpm_vtpm_proxy
 *   xen-tpmfront
 *   tpm_ftpm_tee
diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst b/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
new file mode 100644
index 000000000000..0fb009f93e10
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/tpm/tpm_tis.rst
+
+:翻译:
+ 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
+
+TPM FIFO接口驱动
+================
+
+TCG PTP规范定义了两种接口类型：FIFO和CRB。前者基于顺序的读写操作，
+后者基于包含完整命令或响应的缓冲区。
+
+FIFO（先进先出）接口被tpm_tis_core依赖的驱动程序使用。最初，Linux只
+有一个名为tpm_tis的驱动，覆盖了内存映射（即 MMIO）接口，但后来它被
+扩展以支持TCG标准所支持的其他物理接口。
+
+由于历史原因，最初的MMIO驱动被称为tpm_tis，而FIFO驱动的框架被命名为
+tpm_tis_core。在tpm_tis中的“tis”后缀来自TPM接口规范，这是针对TPM1.x
+芯片的硬件接口规范。
+
+通信基于一个由TPM芯片通过硬件总线或内存映射共享的20KiB 缓冲区，具体
+取决于物理接线。该缓冲区进一步分为五个相等大小的4KiB缓冲区，为CPU和
+TPM之间的通信提供等效的寄存器集。这些通信端点在TCG术语中称为localities。
+
+当内核想要向TPM芯片发送命令时，它首先通过在TPM_ACCESS寄存器中设置
+requestUse位来保留locality0。当访问被授予时，该位由芯片清除。一旦完成
+通信，内核会写入TPM_ACCESS.activeLocality位。这告诉芯片该本地性已被
+释放。
+
+待处理的本地性由芯片按优先级降序逐个服务，一次一个：
+
+- Locality0优先级最低。
+- Locality5优先级最高。
+
+关于localities的更多信息和含义，请参阅TCG PC客户端平台TPM 配置文件规范的第3.2节。
+
+参考文献
+========
+
+TCG PC客户端平台TPM配置文件（PTP）规范
+https://trustedcomputinggroup.org/resource/pc-client-platform-tpm-profile-ptp-specification/
-- 
2.47.1

