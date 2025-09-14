Received: from mail-m8172.xmail.ntesmail.com (mail-m8172.xmail.ntesmail.com [156.224.81.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A86E7A13A
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.224.81.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822873; cv=none; b=cr06RpuoFeiYvm+QWoBmzs+eVBudN3qzWMias3YM0eoxez3U3wn8Awi7Biy6pVHt4mjXh4V2FDilWHuovPBZTn8sPKeR7iOQbjqtp30RsPh1myLJkUM+I3ukpKrpEFzSlb/4jw7Zd5srSL2oNM5eseaJWDgUY01oOlZTVmyjzo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822873; c=relaxed/simple;
	bh=Vc4Vl5+AGILnKCOnkNHOniDwbuNSirHXcOP9aKC5ZT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/LTxw5tYXARo4+VFQ+6cVOEH3TXDaTbjiCXiS33RXuXT89yEyxhJ2YktY4BdOEHYcaci4XiuUjHuyftbi3CJWNqkW3Wn/Tffl7aGSWgoFNjizk7l4ZjT0JJujg69dGwVvnCVG4lPh7F/876d3AMS/LN0Eho0z7m/c+2ZVomrgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=f3qHGUHX; arc=none smtp.client-ip=156.224.81.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="f3qHGUHX"
Received: from localhost.localdomain (unknown [120.246.23.60])
	by smtp.qiye.163.com (Hmail) with ESMTP id 22b62fc4f;
	Sun, 14 Sep 2025 10:52:15 +0800 (GMT+08:00)
From: doubled <doubled@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 5/7] docs/zh_CN: Add scsi-parameters.rst translation
Date: Sun, 14 Sep 2025 10:52:06 +0800
Message-Id: <9820908a686528e7795a7bd2ba8a5ef1d70c76e3.1757686158.git.doubled@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1757686158.git.doubled@leap-io-kernel.com>
References: <cover.1757686158.git.doubled@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9946232fed09cckunmff566153890557
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGk5JVktLHk1KHxlLGkMaTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUtVSU9NVUlIVU1LWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=f3qHGUHXSqJu4X15/+4EWgWIpR0WGQoRSUm15fPK9ovD/87FTk06u0Idvt8Po4RPNpo05DCW0pMLPJlazTkmeWlEN0MhKNKteD5Wh5vg7XbIoZBC2kcXnqAnIFDOdTZDXVIzacdrKY5K3A694FMSBGLnOpJM8yCzpI9ricqvII1j2uL6cXSbvS+FJ6PwalLMobMqx+ka4ea7e5YuYt+0Z8Z08TAEK5jYVKUB7Lc67e+tMNs3OoMN/5YPB0Evd/hfqYUWLUkjUUP3NZ0odvhCKxK4PeMPCPW4ilwdgAigdKMO9HfsG0J3oGtInwEX+ZDmgMe/K5l9irqKqnMhcyDwqQ==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=QPY9PDP6riNTRm/JTfiZucG53IPyffQ7UvEGo1LGLy0=;
	h=date:mime-version:subject:message-id:from;

Translate .../scsi/scsi-parameters.rst into Chinese.
Add scsi-parameters into .../scsi/index.rst.

Update the translation through commit bdb39c9509e6
("Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi")

Signed-off-by: doubled <doubled@leap-io-kernel.com>
---
 .../translations/zh_CN/scsi/index.rst         |   3 +-
 .../zh_CN/scsi/scsi-parameters.rst            | 118 ++++++++++++++++++
 2 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi-parameters.rst

diff --git a/Documentation/translations/zh_CN/scsi/index.rst b/Documentation/translations/zh_CN/scsi/index.rst
index c93abe6d31ee..dc56ca279db8 100644
--- a/Documentation/translations/zh_CN/scsi/index.rst
+++ b/Documentation/translations/zh_CN/scsi/index.rst
@@ -41,9 +41,10 @@ SCSI驱动参数
 .. toctree::
    :maxdepth: 1
 
+   scsi-parameters
+
 Todolist:
 
-* scsi-parameters
 * link_power_management_policy
 
 SCSI主机适配器驱动
diff --git a/Documentation/translations/zh_CN/scsi/scsi-parameters.rst b/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
new file mode 100644
index 000000000000..53cdc3094a9a
--- /dev/null
+++ b/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
@@ -0,0 +1,118 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scsi/scsi-parameters.rst
+
+:翻译:
+
+ 郝栋栋 doubled <doubled@leap-io-kernel.com>
+
+:校译:
+
+
+
+============
+SCSI内核参数
+============
+
+请查阅Documentation/admin-guide/kernel-parameters.rst以获取
+指定模块参数相关的通用信息。
+
+当前文档可能不完全是最新和全面的。命令 ``modinfo -p ${modulename}``
+显示了可加载模块的参数列表。可加载模块被加载到内核中后，也会在
+/sys/module/${modulename}/parameters/ 目录下显示其参数。其
+中某些参数可以通过命令
+``echo -n ${value} > /sys/module/${modulename}/parameters/${parm}``
+在运行时修改。
+
+::
+
+	advansys=	[HW,SCSI]
+			请查阅 drivers/scsi/advansys.c 文件头部。
+
+	aha152x=	[HW,SCSI]
+			请查阅 Documentation/translations/zh_CN/scsi/aha152x.rst。
+
+	aha1542=	[HW,SCSI]
+			格式：<portbase>[,<buson>,<busoff>[,<dmaspeed>]]
+
+	aic7xxx=	[HW,SCSI]
+			请查阅 Documentation/translations/zh_CN/scsi/aic7xxx.rst。
+
+	aic79xx=	[HW,SCSI]
+			请查阅 Documentation/translations/zh_CN/scsi/aic79xx.rst。
+
+	atascsi=	[HW,SCSI]
+			请查阅 drivers/scsi/atari_scsi.c。
+
+	BusLogic=	[HW,SCSI]
+			请查阅 drivers/scsi/BusLogic.c 文件中
+			BusLogic_ParseDriverOptions()函数前的注释。
+
+	gvp11=		[HW,SCSI]
+
+	ips=		[HW,SCSI] Adaptec / IBM ServeRAID 控制器
+			请查阅 drivers/scsi/ips.c 文件头部。
+
+	mac5380=	[HW,SCSI]
+			请查阅 drivers/scsi/mac_scsi.c。
+
+	scsi_mod.max_luns=
+			[SCSI] 最大可探测LUN数。
+			取值范围为 1 到 2^32-1。
+
+	scsi_mod.max_report_luns=
+			[SCSI] 接收到的最大LUN数。
+			取值范围为 1 到 16384。
+
+	NCR_D700=	[HW,SCSI]
+			请查阅 drivers/scsi/NCR_D700.c 文件头部。
+
+	ncr5380=	[HW,SCSI]
+			请查阅 Documentation/translations/zh_CN/scsi/g_NCR5380.rst。
+
+	ncr53c400=	[HW,SCSI]
+			请查阅 Documentation/translations/zh_CN/scsi/g_NCR5380.rst。
+
+	ncr53c400a=	[HW,SCSI]
+			请查阅 Documentation/translations/zh_CN/scsi/g_NCR5380.rst。
+
+	ncr53c8xx=	[HW,SCSI]
+
+	osst=		[HW,SCSI] SCSI磁带驱动
+			格式：<buffer_size>,<write_threshold>
+			另请查阅 Documentation/translations/zh_CN/scsi/st.rst。
+
+	scsi_debug_*=	[SCSI]
+			请查阅 drivers/scsi/scsi_debug.c。
+
+	scsi_mod.default_dev_flags=
+			[SCSI] SCSI默认设备标志
+			格式：<integer>
+
+	scsi_mod.dev_flags=
+			[SCSI] 厂商和型号的黑/白名单条目
+			格式：<vendor>:<model>:<flags>
+			（flags 为整数值）
+
+	scsi_mod.scsi_logging_level=
+			[SCSI] 日志级别的位掩码
+			位的定义请查阅 drivers/scsi/scsi_logging.h。
+			此参数也可以通过sysctl对dev.scsi.logging_level
+			进行设置（/proc/sys/dev/scsi/logging_level）。
+			此外，S390-tools软件包提供了一个便捷的
+			‘scsi_logging_level’ 脚本，可以从以下地址下载：
+			https://github.com/ibm-s390-linux/s390-tools/blob/master/scripts/scsi_logging_level
+
+	scsi_mod.scan=	[SCSI] sync（默认）在发现SCSI总线过程中
+			同步扫描。async在内核线程中异步扫描，允许系统继续
+			启动流程。none忽略扫描，预期由用户空间完成扫描。
+
+	sim710=		[SCSI,HW]
+			请查阅 drivers/scsi/sim710.c 文件头部。
+
+	st=		[HW,SCSI] SCSI磁带参数（缓冲区大小等）
+			请查阅 Documentation/translations/zh_CN/scsi/st.rst。
+
+	wd33c93=	[HW,SCSI]
+			请查阅 drivers/scsi/wd33c93.c 文件头部。
-- 
2.25.1

