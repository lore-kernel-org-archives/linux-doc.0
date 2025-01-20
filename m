Received: from mail-m49202.qiye.163.com (mail-m49202.qiye.163.com [45.254.49.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE4EC2E0
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 03:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737345505; cv=none; b=R90HbYykpRdgLzTb1x6cyeiAebjJCBjJUevciAp43KIexQWezc5DtEYJi3lqS/CABbf+Ze87E4KI2pLPWSUmXuq3kPsnqzGw/+VrxQ1QTM773iw/u8LK6ogDRn2daQBs7f9sR1Hzq5iukrvLOvQMOFPImC487neon5NaLYvpQYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737345505; c=relaxed/simple;
	bh=aboAVwrd/czU3y1EUUInGzPRF/rbUyAUgzzfZf9hiQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r1ZIG37UInewg05e7R8PEqDt9sDU37x3qbgoq8gUkq4bGJnsJ+eTG1raOMeTfHBjQ3PDaZSGlXGWWyiSFEuMSmU7iSkEuPul9ElZxrAl9H4U2M2Z8m++KgncBOns2U6fsvjWUujKC96ENY3cG3pBcvh/c7eqKoqGrgeEIEP/JKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=Fd/vE3hv; arc=none smtp.client-ip=45.254.49.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="Fd/vE3hv"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 924e2b92;
	Mon, 20 Jan 2025 11:43:04 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH 6/7] docs/zh_CN: Add tpm xen-tpmfront Chinese translation
Date: Mon, 20 Jan 2025 11:42:51 +0800
Message-ID: <11d7bfe0efa0294ab82595dbcb50496bcbafd8d7.1737344074.git.zhaoshuo@cqsoftware.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSExLVk5CHklOSUIYTE1KTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a9481ce8c3209d0kunm924e2b92
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MFE6Eyo*OjIITzA3EQ8NS0oN
	MhBPCklVSlVKTEhMSE9PTkNOTkxCVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQU5MQ0M3Bg++
DKIM-Signature:a=rsa-sha256;
	b=Fd/vE3hv6R+aUPKBzduJD08QbOWza60h4m+2zqgIJu4w2qCkG/O01NT0EqhqBSVOD/9/Qfp/UIfA8hdgVBJK5t9Ih6raO/2DmsgQka7UeO0r6cl5Idc10peYTXBtGqhczuhhpuliDKha5W2EdoRLkYJnrrG0/l0RNeGTKT9rQEM=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=s7IdLINMnqoZcwKUnSntgONJEpjbvLM0+5ly4FjIgvo=;
	h=date:mime-version:subject:message-id:from;

Translate .../security/tpm/xen-tpmfront.rst into Chinese.

Update the translation through commit 9e255e2b9afe
("Documentation: drop optional BOMs")

Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/tpm/index.rst |   2 +-
 .../zh_CN/security/tpm/xen-tpmfront.rst       | 114 ++++++++++++++++++
 2 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst

diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
index 3dd3eaeb8a61..cace08aafd16 100644
--- a/Documentation/translations/zh_CN/security/tpm/index.rst
+++ b/Documentation/translations/zh_CN/security/tpm/index.rst
@@ -17,7 +17,7 @@
    tpm-security
    tpm_tis
    tpm_vtpm_proxy
+   xen-tpmfront
 
 TODOLIST:
-*   xen-tpmfront
 *   tpm_ftpm_tee
diff --git a/Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst b/Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst
new file mode 100644
index 000000000000..434e7e957f6b
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst
@@ -0,0 +1,114 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/tpm/xen-tpmfront.rst
+
+:翻译:
+ 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
+
+================
+Xen的虚拟TPM接口
+================
+
+作者：Matthew Fioravante (JHUAPL), Daniel De Graaf (NSA)
+
+本文档描述了用于Xen的虚拟可信平台模块（vTPM）子系统。假定读者熟悉
+Xen和Linux的构建和安装，并对TPM和vTPM概念有基本的理解。
+
+介绍
+----
+
+这项工作的目标是为虚拟客户操作系统（在Xen中称为DomU）提供TPM功能。这使得
+程序能够像与物理系统上的TPM交互一样，与虚拟系统中的TPM进行交互。每个客户
+操作系统都会获得一个唯一的、模拟的软件TPM。然而，vTPM的所有秘密（如密钥、
+NVRAM 等）由vTPM管理域进行管理，该域将这些秘密封存到物理TPM中。如果创建这
+些域（管理域、vTPM域和客户域）的过程是可信的，vTPM子系统就能将根植于硬件
+TPM的信任链扩展到Xen中的虚拟机。vTPM的每个主要组件都作为一个独立的域实现，
+从而通过虚拟机监控程序（hypervisor）提供安全隔离。
+
+这个mini-os vTPM 子系统是建立在IBM和Intel公司之前的vTPM工作基础上的。
+
+
+设计概述
+--------
+
+vTPM的架构描述如下::
+
+  +------------------+
+  |    Linux DomU    | ...
+  |       |  ^       |
+  |       v  |       |
+  |   xen-tpmfront   |
+  +------------------+
+          |  ^
+          v  |
+  +------------------+
+  | mini-os/tpmback  |
+  |       |  ^       |
+  |       v  |       |
+  |  vtpm-stubdom    | ...
+  |       |  ^       |
+  |       v  |       |
+  | mini-os/tpmfront |
+  +------------------+
+          |  ^
+          v  |
+  +------------------+
+  | mini-os/tpmback  |
+  |       |  ^       |
+  |       v  |       |
+  | vtpmmgr-stubdom  |
+  |       |  ^       |
+  |       v  |       |
+  | mini-os/tpm_tis  |
+  +------------------+
+          |  ^
+          v  |
+  +------------------+
+  |   Hardware TPM   |
+  +------------------+
+
+* Linux DomU:
+               希望使用vTPM的基于Linux的客户机。可能有多个这样的实例。
+
+* xen-tpmfront.ko:
+                    Linux内核虚拟TPM前端驱动程序。该驱动程序为基于Linux的DomU提供
+                    vTPM访问。
+
+* mini-os/tpmback:
+                    Mini-os TPM后端驱动程序。Linux前端驱动程序通过该后端驱动程序连
+                    接，以便在Linux DomU和其vTPM之间进行通信。该驱动程序还被
+                    vtpmmgr-stubdom用于与vtpm-stubdom通信。
+
+* vtpm-stubdom:
+                 一个实现vTPM的mini-os存根域。每个正在运行的vtpm-stubdom实例与系统
+                 上的逻辑vTPM之间有一一对应的关系。vTPM平台配置寄存器（PCRs）通常都
+                 初始化为零。
+
+* mini-os/tpmfront:
+                     Mini-os TPM前端驱动程序。vTPM mini-os域vtpm-stubdom使用该驱动程序
+                     与vtpmmgr-stubdom通信。此驱动程序还用于与vTPM域通信的mini-os域，例
+                     如 pv-grub。
+
+* vtpmmgr-stubdom:
+                    一个实现vTPM管理器的mini-os域。系统中只有一个vTPM管理器，并且在整个
+                    机器生命周期内应一直运行。此域调节对系统中物理TPM的访问，并确保每个
+                    vTPM的持久状态。
+
+* mini-os/tpm_tis:
+                    Mini-osTPM1.2版本TPM 接口规范（TIS）驱动程序。该驱动程序由vtpmmgr-stubdom
+                    用于直接与硬件TPM通信。通信通过将硬件内存页映射到vtpmmgr-stubdom来实现。
+
+* 硬件TPM:
+            固定在主板上的物理 TPM。
+
+与Xen的集成
+-----------
+
+vTPM驱动程序的支持已在Xen4.3中通过libxl工具堆栈添加。有关设置vTPM和vTPM
+管理器存根域的详细信息，请参见Xen文档（docs/misc/vtpm.txt）。一旦存根域
+运行，与磁盘或网络设备相同，vTPM设备将在域的配置文件中进行设置
+
+为了使用诸如IMA（内核度量架构）等需要在initrd之前加载TPM的功能，必须将
+xen-tpmfront驱动程序编译到内核中。如果不使用这些功能，驱动程序可以作为
+模块编译，并像往常一样加载。
-- 
2.47.1

