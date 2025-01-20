Received: from mail-m15589.qiye.163.com (mail-m15589.qiye.163.com [101.71.155.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6F835968
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 07:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737356795; cv=none; b=P/8bf4W4ALs74qI5rygv+QdNn0YQwtzCVgvluBfO4O65hmWb0gLf0zLiLDCvVuO7pE8PqsfWgtDNO5cgYyVrLr8OWYORCXlNKREpnE5hir3w8b+lWu3Xdpvo4PZ23wQDe6AMhVOPIC4L13jqG26OBN3HFr+SebR4y+FU8X11AXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737356795; c=relaxed/simple;
	bh=VcaIdX53n65A2gLLTmrQo/IPupafMmytRr68zCX7tXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=THrvLAtnv2k6s1WnqVcs1ioYPxU9iz2ofCeDQ/s3NqwgOjIb38GQZjxp/X7IZHA32jDIeqW16ZqRA+FDzyovtg6SsG/kEt8bmGTrMDxMLsIO9FRJ2r2FGnRZ5uLRVtLTbGYvV+zX3z11aQgyCtGqwKLECT/Rmvlm2zf9CNWEbbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=gSyfDico; arc=none smtp.client-ip=101.71.155.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="gSyfDico"
Received: from fedora.localdomain (unknown [123.53.38.48])
	by smtp.qiye.163.com (Hmail) with ESMTP id 92a3ccac;
	Mon, 20 Jan 2025 14:51:07 +0800 (GMT+08:00)
From: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 6/7] docs/zh_CN: Add tpm xen-tpmfront Chinese translation
Date: Mon, 20 Jan 2025 14:50:51 +0800
Message-ID: <e98c3702e7eaba7296bed5a8ab40cdff3183f607.1737354981.git.zhaoshuo@cqsoftware.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUMYVhpLQh5MTx1DSxhMSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVTkhVSENVT0NZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a94827ab45b09d0kunm92a3ccac
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6Fio6STIKPDciHDkSHyIQ
	EEsKCh1VSlVKTEhMSE5OQ01DSEhKVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSklIVU5IVUhDVU9DWVdZCAFZQU5MQ0M3Bg++
DKIM-Signature:a=rsa-sha256;
	b=gSyfDicopOcUh2GLDQYwABK43jCK0BlyJbAo5huKuO1s2DGPR1HfwULA1r7Ju7LL40GSa4+xnzwPBjfSHfPRCH2xJQoyzdR3DkEPZe+bS/E/aBI/fcYvMc01h2fhiJmxo/LwvvnXKICkjH7IG29JybnHWwb3JSITLCpU7TBS8qA=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=6PRoz67A/BHWh1X0S6uDkWfGnEKIyYmxL4cBtuyc7Cw=;
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
index dd80816f8af8..bf95200ca586 100644
--- a/Documentation/translations/zh_CN/security/tpm/index.rst
+++ b/Documentation/translations/zh_CN/security/tpm/index.rst
@@ -16,7 +16,7 @@
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

