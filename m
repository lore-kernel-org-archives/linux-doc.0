Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64CB19D065;
	Fri, 29 May 2026 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780069083; cv=none; b=dolw0mmkJnH21dnExd8y4dzoShwuCvxWyq48EPy23BKyQfAcqgZTUZnAETS5JGIrNwxgwJHqpQntkh4Uo5e5awWKSS10ooxv94ExY6fkMzzljlAv/iGFOaxBYHz2/MXmszviROo+VYrgD1D11bbpfPc8BG8cW+LoxgJKe7wxvpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780069083; c=relaxed/simple;
	bh=lX9BKFFrlDIKYK3WMk/CcnmhvwO19pDfkWgMjuwoX+k=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=MuOU7AsaXgVQiGBEtRneNnyKjl9YQVWN9OP9DnHzAO3vPb+f88SqAz82jejvyWPX1hqhKJ62p6FEPuw0XFSF4oUhK5l5/ViRZQvlQ8xtR6WPTohs69O+XqOT3rlE352ItZEi1lEmz63DSt/HwBU2633wT/du6pLtdFzrhCvGiUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=DEqlCGLn; arc=none smtp.client-ip=43.163.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="DEqlCGLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1780069076; bh=5j4CPFW/i8FqEvLeSeSxMEX65zUhcd9FhPvPFGcx2eY=;
	h=From:To:Cc:Subject:Date;
	b=DEqlCGLnuvgDs/9r+t6ENKV5rBwCXNyTlILz8FiWwAgYgIX8yWwZBzT3ZVO6zXS68
	 nt6hsh5xpQv5ontEQvqVeqtHhnI/+qtNsRt4SJWf7NpU7hYDwWRV2COVdLhRNpeOJr
	 r8dpyhSvwwPlEQ4MoHFxPJyGtcUCWFSEpsmO5FwE=
Received: from 172-1-1-128.lightspeed.hstntx.sbcglobal.net.localdomain ([27.38.179.62])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 9752AE91; Fri, 29 May 2026 23:37:53 +0800
X-QQ-mid: xmsmtpt1780069073tcm9v2olj
Message-ID: <tencent_FCA3F4312E849777081742CBAF2CD6BBA007@qq.com>
X-QQ-XMAILINFO: OHxUmJMhaUaqBDpH64PWoeDBHa5uvL5JlhjWWRuLl6CLnF+3MPSx4owZE1Me1G
	 3TutDFojw0zdTNsoy2OTfSeoUcSLuCVXrMqGBT3DsfO/H8pLIEl4aXpdfDB5pvUruXFu/2BtZaEq
	 chDVd2RkAewKxB5OEbVh7sKuHOpjz6z2ZU4vQLk6n+K1Et9b5m3FmFTSulT6vY/orguzRKsMhAZp
	 v/G1a6t2NL/ES6cU4CcN+NEi3h1G2ovEcNsHPOCCDnkGj1wYZqR/uwWUohmqJvraqBrDam7wbhSk
	 VXGpzBCdBBQGl/nEpviAX0UzmthdMzQ98aByny/mWKdPHgbsetr/qITuQ/3PA9zEpM4/XoNRyjvx
	 xbwZXAuedRQWqY1El3y8blIWW0StQjxPAmffQFzrUTj+edqIhg55+pbyfXyJkoTblO/TJqH6ANVi
	 Zz3ugbw3S/N/3FtKbYh8nfSOxXEh/RrYc8WGQOuqXJT+NBHXS+v4f0nZ11ijlYDEIe4oQR/tXPVV
	 26MbvUXBf7xPEJcO2xG5idU9v70djgwjaPJJ1w2o4sO+VE1QGIv5DCcuABxlWlOzVPF0Rh7n5m4q
	 XeV0y3CvFW2P6ZSU4AT26k1KV3iPRj9kdtoR6GF7NxjRzXIkkKK4Sz0TkMqL66QkAGVz7+wqrUev
	 uc+XZq5Um4i8XuvEqhNeX0XNI/xucUeqOVbDKUbpuqEbW8XcX2DKT+vOpKxdZ1PklIUKS7t3MrQo
	 /huFwPLG627/U70/VcJMkVddFJKSseOkp/5WribY0OuJTjxN5Y3KBOaCCm0H4wnE0U87rJSHnoPX
	 YQ6irnPhQnqHYRENV/zfcb1v7wHa8ilQ8h8/sm2qK84vuKIbtwANgVbFGGfF3UrqTuWVVFknZXfi
	 CMuctD5UedgTg33yyfdaC57Ypwxu0Tyusqb7toN7sQ48Z7fLFKn19Aagsp0VlQNleROArh3mqSsZ
	 8b7ipeeZMJ2EwWOh5rdQE/CIHHbuI22QZoK15/6u462qI+w8Q+br+lHglT3D4WxPbMdCseiHrg20
	 Qx3UzZdUupkGfweNjEXvaDx/ZIeL117YUrkVaTRcL9CaEvQuCS8rx/AXnaxyvf1alXoLsKRw==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Yan Zhu <zhuyan2015@qq.com>
To: corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	kees@kernel.org
Cc: skhan@linuxfoundation.org,
	dzm91@hust.edu.cn,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	frederic@kernel.org,
	jani.nikula@intel.com,
	longman@redhat.com,
	mchehab+huawei@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yan Zhu <zhuyan2015@qq.com>
Subject: [PATCH v2] docs/zh_CN: update admin-guide/index.rst translation
Date: Fri, 29 May 2026 23:37:12 +0800
X-OQ-MSGID: <20260529153719.3915-1-zhuyan2015@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

update Documentation/admin-guide/index.rst Chinese translation

Update the translation through commit f0efd29aa60c
("doc: Add CPU Isolation documentation")

Signed-off-by: Yan Zhu <zhuyan2015@qq.com>
---
v1->v2:
 - Remove any unnecessary blank lines.
 - Add necessary blank lines.
---
 .../translations/zh_CN/admin-guide/index.rst  | 202 +++++++++++++-----
 1 file changed, 152 insertions(+), 50 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index 15d9ab5993a7..bd01cf6474c8 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -1,7 +1,13 @@
+.. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :doc:`../../../admin-guide/index`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
+:Original: Documentation/admin-guide/index.rst
+
+:翻译:
+
+ 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
+
+ 朱岩 Yan Zhu <zhuyan2015@qq.com>
 
 
 Linux 内核用户和管理员指南
@@ -11,7 +17,11 @@ Linux 内核用户和管理员指南
 整体的顺序或组织 - 这些材料不是一个单一的，连贯的文件！幸运的话，情况会随着
 时间的推移而迅速改善。
 
-这个初始部分包含总体信息，包括描述内核的README， 关于内核参数的文档等。
+
+内核管理通用指南
+----------------
+
+本节包含总体信息，包括描述内核整体的 README 文件、内核参数文档等。
 
 .. toctree::
    :maxdepth: 1
@@ -20,17 +30,54 @@ Linux 内核用户和管理员指南
 
 Todolist:
 
-*   kernel-parameters
 *   devices
+*   features
+
+内核管理接口的重要组成部分是 /proc 和 sysfs 虚拟文件系统；这些文档描述了如何
+与之交互。
+
+.. toctree::
+   :maxdepth: 1
+
+   cputopology
+
+Todolist:
+
+*   sysfs-rules
 *   sysctl/index
+*   abi
 
-本节介绍CPU漏洞及其缓解措施。
+安全相关文档：
+
+.. toctree::
+   :maxdepth: 1
 
 Todolist:
 
 *   hw-vuln/index
+*   LSM/index
+*   perf-security
+
+
+内核启动
+--------
+
+.. toctree::
+   :maxdepth: 1
+
+   bootconfig
+
+Todolist:
+
+*   kernel-parameters
+*   efi-stub
+*   initrd
+
 
-下面的一组文档，针对的是试图跟踪问题和bug的用户。
+追踪和识别问题
+--------------
+
+以下是一组面向试图追踪特定问题和 bug 的用户的文档。
 
 .. toctree::
    :maxdepth: 1
@@ -39,94 +86,149 @@ Todolist:
    reporting-regressions
    bug-hunting
    bug-bisect
-   tainted-kernels
    init
+   clearing-warn-once
+   lockup-watchdogs
+   sysrq
 
 Todolist:
 
+*   quickly-build-trimmed-linux
+*   verify-bugs-and-bisect-regressions
+*   tainted-kernels
 *   ramoops
 *   dynamic-debug-howto
 *   kdump/index
 *   perf/index
+*   pstore-blk
+*   kernel-per-CPU-kthreads
+*   RAS/index
+
+
+核心内核子系统
+--------------
+
+这些文档描述了核心内核管理接口，这些接口几乎在任何系统上都值得关注。
+
+.. toctree::
+   :maxdepth: 1
 
-这是应用程序开发人员感兴趣的章节的开始。可以在这里找到涵盖内核ABI各个
-方面的文档。
+   cpu-load
+   mm/index
+   module-signing
+   numastat
 
 Todolist:
 
-*   sysfs-rules
+*   cgroup-v2
+*   cgroup-v1/index
+*   namespaces/index
+*   pm/index
+*   syscall-user-dispatch
 
-本手册的其余部分包括各种指南，介绍如何根据您的喜好配置内核的特定行为。
 
+对非原生二进制格式的支持。请注意，其中一些文档相当 **古老**。
 
 .. toctree::
    :maxdepth: 1
 
-   bootconfig
-   clearing-warn-once
-   cpu-load
-   cputopology
-   lockup-watchdogs
-   numastat
-   unicode
-   sysrq
-   mm/index
+Todolist:
+
+*   binfmt-misc
+*   java
+*   mono
+
+
+块设备和文件系统管理
+--------------------
+
+.. toctree::
+   :maxdepth: 1
 
 Todolist:
 
-*   acpi/index
-*   aoe/index
-*   auxdisplay/index
 *   bcache
 *   binderfs
-*   binfmt-misc
 *   blockdev/index
-*   braille-console
-*   btmrvl
-*   cgroup-v1/index
-*   cgroup-v2
 *   cifs/index
-*   dell_rbu
 *   device-mapper/index
-*   edid
-*   efi-stub
 *   ext4
+*   filesystem-monitoring
 *   nfs/index
-*   gpio/index
-*   highuid
-*   hw_random
-*   initrd
 *   iostats
-*   java
 *   jfs
-*   kernel-per-CPU-kthreads
+*   md
+*   ufs
+*   xfs
+
+
+专用设备指南
+------------
+
+如何在 Linux 系统中配置硬件。
+
+.. toctree::
+   :maxdepth: 1
+
+Todolist:
+
+*   acpi/index
+*   aoe/index
+*   auxdisplay/index
+*   braille-console
+*   btmrvl
+*   dell_rbu
+*   edid
+*   gpio/index
+*   hw_random
 *   laptops/index
 *   lcd-panel-cgram
-*   ldm
-*   LSM/index
-*   md
 *   media/index
-*   module-signing
-*   mono
-*   namespaces/index
+*   nvme-multipath
 *   parport
-*   perf-security
-*   pm/index
 *   pnp
 *   rapidio
-*   ras
 *   rtc
 *   serial-console
 *   svga
+*   thermal/index
 *   thunderbolt
-*   ufs
 *   vga-softcursor
 *   video-output
-*   xfs
+
+
+工作负载分析
+------------
+
+这是一个章节的开始，其中包含对从事 Linux 内核安全关键性分析的应用程序开发人员
+和系统集成商感兴趣的信息。这里可以找到支持分析内核与应用程序交互以及关键内核
+子系统预期的文档。
+
+.. toctree::
+   :maxdepth: 1
+
+Todolist:
+
+*   workload-tracing
+
+
+其他内容
+--------
+
+一些难以分类且通常已过时的文档。
+
+.. toctree::
+   :maxdepth: 1
+
+Todolist:
+
+*   highuid
+*   ldm
+*   unicode
 
 .. only::  subproject and html
 
-   Indices
-   =======
+   索引
+   ====
 
    * :ref:`genindex`
-- 
2.43.0

