Received: from mail-m3276.qiye.163.com (mail-m3276.qiye.163.com [220.197.32.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AEA16C850
	for <linux-doc@vger.kernel.org>; Thu,  2 Jan 2025 07:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735802977; cv=none; b=r4tMkggFXYMsCXztQ6yWfLtQPNPsvTffou83mk8qCLPXpkBCtUqwYuzPJYvGpgD2+zRlXnGLWwyqBkMl6eRoyqB4tdH9efRfWsQvjekgM9KNhZH6T6mhQhGOKalvySUC5UkMKiuPCqV0Rsm/sGRUa7TkNMvF6MWWjVrrIs+F2Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735802977; c=relaxed/simple;
	bh=fkyRfjwaZ5cu/xhfMP6RfWfAHk3Yw29wFPelVukE9eA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HvwkyYJmfiLllfDtcekQ7B619iz8wNyNtWtEIJQH31vD1Adw/rSPl8OCpQEsaxHIuwKOkHJWnoNw3RAA30idU08AJy+0dBvgQ95SAbUrCgpxQgykQzyPcLewD+l2lUUrABPAXrn9dstpAtAS+4y+ZigX8S7qX/O3YgkQHKi2DPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=goqjxU3M; arc=none smtp.client-ip=220.197.32.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="goqjxU3M"
Received: from localhost.localdomain (unknown [1.193.59.150])
	by smtp.qiye.163.com (Hmail) with ESMTP id 77a3a992;
	Thu, 2 Jan 2025 15:24:13 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhangwei <zhangwei@cqsoftware.com.cn>,
	zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs/zh_CN: Add sak index Chinese translation
Date: Thu,  2 Jan 2025 15:24:03 +0800
Message-ID: <20250102072404.3196-1-zhangwei@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHR4aVh9PS05DTBlJS0kZTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOQlVKTktZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSExVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a9425e689af03abkunm77a3a992
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBQ6NTo4AzIcHyhNKE5MLC8W
	CzBPCzNVSlVKTEhOQ0tJTU5PSk9LVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkJVSk5LWVdZCAFZQU9OTE43Bg++
DKIM-Signature:a=rsa-sha256;
	b=goqjxU3MAKEXrdUF8sUmPARfJ6mVoMUiEwjXYycKGMznxLBvhDmW6II5PMX/qEhz8WN8POysELrXSKR4CrHLvyfF31md2ViPKsLjCUojZ9OcinZ3X4kueBJ+C45jOBil/8gPUsvvi1lcYDa6PKFzSfJ/UJqEsR++iSacQBWRKRQ=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=nvWJ7Jul+zblQdi7oCiRRuKaIBmsVZ3709aD4VzXvEQ=;
	h=date:mime-version:subject:message-id:from;

Translate lwn/Documentation/security/sak.rst into Chinese

Update the translation through commit a3828074b04

Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
---
 .../translations/zh_CN/security/index.rst     |  2 +-
 .../translations/zh_CN/security/sak.rst       | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/sak.rst

diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
index bf42930c6fac..2e81f33889e5 100644
--- a/Documentation/translations/zh_CN/security/index.rst
+++ b/Documentation/translations/zh_CN/security/index.rst
@@ -17,6 +17,7 @@
 
    IMA-templates
    lsm
+   sak
    siphash
    digsig
    landlock
@@ -26,7 +27,6 @@ TODOLIST:
 * snp-tdx-threat-model
 * keys/index
 * lsm-development
-* sak
 * SCTP
 * self-protection
 * tpm/index
diff --git a/Documentation/translations/zh_CN/security/sak.rst b/Documentation/translations/zh_CN/security/sak.rst
new file mode 100644
index 000000000000..574fe076201b
--- /dev/null
+++ b/Documentation/translations/zh_CN/security/sak.rst
@@ -0,0 +1,86 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/security/sak.rst
+
+:翻译:
+
+ 张巍 zhangwei <zhangwei@cqsoftware.com.cn>
+
+===========================
+Linux 安全注意键（SAK）处理
+===========================
+
+:日期: 2001年3月18日
+:作者: Andrew Morton
+
+操作系统的安全注意键是一种安全工具，用于防止系统上存在特洛伊
+木马密码捕获程序。它提供了一种无法规避的方式，用于终止所有可
+能伪装成登录应用程序的程序。用户需要在登录系统之前输入这个安
+全键。
+
+从键盘输入的方式生成安全注意键，Linux提供了两种相似但不同的
+方式。一种是按下ALT-SYSRQ-K组合键，但你不应该使用这种方式，
+因为它只有在内核启用了SYSRQ支持的情况下才能使用。
+
+正确生成SAK的方式是使用``loadkeys``来定义键序列。无论内核是否
+编译了sysrq支持，这种方式都能够正常工作。
+
+当键盘处于原始模式时，SAK 能够正常工作。这意味着，一旦定义，
+SAK 将终止正在运行的 X 服务器。如果系统处于运行级别 5，X 服
+务器将重新启动，这正是你希望发生的情况。
+
+你应该使用什么键序列？ CTRL-ALT-DEL用于重启机器，CTRL-ALT-
+BACKSPACE对X服务器有特殊作用。我们将选择CTRL-ALT-PAUSE。
+
+在你的rc.sysinit（或rc.local）文件中，添加以下命令::
+
+    echo "Control Alt keycode 101 = SAK" | /bin/loadkeys
+
+就这样！只有超级用户才能重新编程SAK键。
+
+.. note::
+
+  1. Linux SAK据说并不是C2级安全性的系统所要求的"真正的SAK"。
+     该原因作者也不知道
+
+  2. 在键盘输入的模式下，SAK会终止所有打开了/dev/console的应用
+     程序。
+
+     但是不幸的是，这也包括一些你实际上不希望被终止的程序。原因是
+     这些程序错误的保持了/dev/console的打开状态。务必确保向你的
+     Linux发行版提供商投诉这个问题。
+
+     你可以用以下的命令来识别将被SAK终止的程序::
+
+        # ls -l /proc/[0-9]*/fd/* | grep console
+        l-wx------    1 root     root           64 Mar 18 00:46 /proc/579/fd/0 -> /dev/console
+
+     然后::
+
+        # ps aux|grep 579
+        root       579  0.0  0.1  1088  436 ?        S    00:43   0:00 gpm -t ps/2
+
+     所以``gpm``会被SAK杀死。这应该gpm中的bug。它应该正在关闭标准输入，
+     你可以通过查找initscript来启动gpm并更改它：
+
+     老的::
+
+        daemon gpm
+
+     新的::
+
+        daemon gpm < /dev/null
+
+     Vixie cron似乎也有这个问题，并且需要采取相同的处理方式。
+
+     此外，某个著名的Linux发行版在它的rc.sysinit和rc scripts的脚本中
+     包含了以下三行代码::
+
+        exec 3<&0
+        exec 4>&1
+        exec 5>&2
+
+     这些代码会导致所有的守护进程将文件描述符3、4和5关联到/dev/console。
+     所以SAK会将他们所有都终止。一个简单的解决办法就是删掉这些代码，但是
+     这样做会导致系统管理应用程序出现异常 - 要对所有的情况进行充分测试。
-- 
2.47.1

