Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736C82836A6;
	Sun, 10 May 2026 06:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778395817; cv=none; b=Iol4Fq6ZQTH1G9JTyB5A5xucCZhWxoWbxVJAXoDVRFkrK7Ko9ciiGJpeiPSsw/gBj7mlpAcFmOB+SbWYmSVNAFoDKoIRDjsmRrH20rE9v18LB8RPgStgyUGDMzcDih9jrQsBixh/6cnBUE9aEF7LkrYqAEcqQvslFnS2Ijo7wJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778395817; c=relaxed/simple;
	bh=1wVM6O4iaxOocV75UC7CwioI1IQmJ7JPU4solqCsk4M=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=QvA9TgVBRxATkN0KNqOReHJM7RZsDMih/8N/ZS5FC7ee6ydbXR3JUdUbwgJIK0inNkJr5UpE2eyIRjls6HgFPUs+YgIYPNR92jMuJB0lhqh/P2QK0PhnhCPIzJgBM85kbyCfsQqfptRhYsA985aruROi68hWrXOV7CYZK/JY+dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=zer2oMtR; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zer2oMtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1778395810; bh=8yPMzbFBUo1UqzmlatiOuaiwWcKajDHhCcDV14ANfjY=;
	h=From:To:Cc:Subject:Date;
	b=zer2oMtR63KJWgaDMZUrCv/pOWiOmJksJwzA/4Qx0Dd3IF5EhAQ2bEnke6tQKpK6E
	 7GvI/YNNUJ7dLxc96di3gb0md57ujyF9AZwRKG0Wh5MyBNbHh4tO1YzkJJ+6Rg2xGX
	 4P4G14IVUJoawz7rTSiNZPON7j4e1BGqsDB7DP2U=
Received: from 172-1-1-128.lightspeed.hstntx.sbcglobal.net.localdomain ([163.125.219.25])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C878CAD6; Sun, 10 May 2026 14:50:07 +0800
X-QQ-mid: xmsmtpt1778395807tymu2r9vn
Message-ID: <tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JupLwDnYE/eysfPdpGSqizbEPeItdKLRm+38rT02VCSmaR6Qpmwm
	 kVEIdeuVtCpApb8ogzDm/67H1T2Q92OcA+fr/Lil8BLJvocJJerspqbZFDYJk+b41rXMYEne9w8P
	 N1yeAiN9AkxKOl9us07pzJhkYd4+5q3vEs6fksFZD7WR6roBiHsQVR+JU5pYkTBKgLAFfxhlfhay
	 JoRLbWgH1rtlzKPNTSZidmjW6u/82dyiYbRdX2Q7fGRhrW6T45MDU2thzoC+yeZeFDhlFYqSVhxo
	 qyrvoysIg4nFJTYAXw684g4UPwozk2lxsbmy3NqVsI/NwIID0nmLF8+0/E+mH904VyMRK3NXFo+K
	 JLA93hqzl82dxV7IAK2f8xtGUAJj78+oMRl2gTHqXgAUxhPBy9mv4hKAXoqjvNZzS/xzgpns6CcC
	 TcbQlOz4N4auM/7zB1vMe35AEDFQaF/2SGQHODnteyQ2YD8BdWu29cVKqP0GMc1zMl0Vtp3+kwH+
	 gQOuDc+iZC/4wFC6yuzB8KPv8Zwb3BiH7C+nwU4RtKT1S1Upcupf5R2hdwyAOlfVU3Jt+jy4uNnd
	 tlCLBqCgLDHMu/VPc0DNcWq11OTsDdPp1ef0EoUE+Dt6/DjpDOUYv/TRk64n/6GuuYQyCv8xWh+k
	 lRbRbeyMTogplvkkEO9+pU4HH4K/LoEUXJ4ExhaHcQDGNM3UPFb9H7GM3Gq+uRtbG0O7MVNgkuGN
	 V8AowAcwJpdR1rc2i9i/3EwpXilOvIf7pGX5s+jSei7EMLDlWGnDT2PRQoBcsJIwVOy0Mfr0J2tD
	 rN81VJwccCyhcOLl5vb/88DhQFxnloEwMgmGo7dsCvaxuKqMZJMrID5JAKk1prXQvfkJ3yA6DG9R
	 7f8sABGOG/4TvXNZWE77dv5eFjyVVTUDPquxMtlU/i/zYUav0KKW9BKBI6t1stU6sqjzU1UBs34Z
	 INuxND5+cLdgcaROn5gR8YloUIGNnHYW0Ia08zEE8CRuRR46+wYIdpaKTAVWF+/CkRjt9sjNDjiP
	 0eGm4ene997FdwAeDU6Tv/apcpHRL86D1wA9kRyOjT/7849uUnK0qydXwIbedOhDj4asId+fdkh6
	 pfTvG4
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
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
Subject: [PATCH] docs/zh_CN: update admin-guide/index.rst translation
Date: Sun, 10 May 2026 14:48:28 +0800
X-OQ-MSGID: <20260510064828.45488-1-zhuyan2015@qq.com>
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
 .../translations/zh_CN/admin-guide/index.rst  | 209 +++++++++++++-----
 1 file changed, 159 insertions(+), 50 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index 15d9ab5993a7..575449b91916 100644
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
@@ -20,17 +30,55 @@ Linux 内核用户和管理员指南
 
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
+
+Todolist:
+*   sysfs-rules
 *   sysctl/index
+*   abi
+
+安全相关文档：
+
+.. toctree::
+   :maxdepth: 1
 
-本节介绍CPU漏洞及其缓解措施。
 
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
+
+追踪和识别问题
+--------------
 
-下面的一组文档，针对的是试图跟踪问题和bug的用户。
+以下是一组面向试图追踪特定问题和 bug 的用户的文档。
 
 .. toctree::
    :maxdepth: 1
@@ -39,94 +87,155 @@ Todolist:
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
+
+   cpu-load
+   mm/index
+   module-signing
+   numastat
 
-这是应用程序开发人员感兴趣的章节的开始。可以在这里找到涵盖内核ABI各个
-方面的文档。
 
 Todolist:
 
-*   sysfs-rules
+*   cgroup-v2
+*   cgroup-v1/index
+*   namespaces/index
+*   pm/index
+*   syscall-user-dispatch
 
-本手册的其余部分包括各种指南，介绍如何根据您的喜好配置内核的特定行为。
 
+对非原生二进制格式的支持。请注意，其中一些文档相当古老。
+
+.. toctree::
+   :maxdepth: 1
+
+
+Todolist:
+
+*   binfmt-misc
+*   java
+*   mono
+
+
+块设备和文件系统管理
+--------------------
 
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

