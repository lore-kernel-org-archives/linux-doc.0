Received: from mail-m12766.qiye.163.com (mail-m12766.qiye.163.com [115.236.127.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FCD1CDFD4
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 10:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736504381; cv=none; b=ifUQFWZlZ9Z37hmenBumSVo0eeTbDzFuOlwPYq5mGdlA06mOxanJe2jj1ev96Sf2iB6/u5d3y8E81IqFBZeDs8idFKnFC/kRFus7Bof5KYdTUCJes4qFmZ74d5sUjwaTa99I8BjZS82/yAZ6CWird2p4VGqVe6EelWQUWueBlJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736504381; c=relaxed/simple;
	bh=PwK0B82S3Vx9obnn6mMt3+kKVOTI+4S5aPD+XuYp/68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pSmrvoFEAyJnoRKmCMjX+f+mxQ0GIfDFMdfqCh+1wGRnBPbUbMbDg8iDIml1khlyzAIg9am2sXbJm1Msf+4YjGSBamTfC/1toPcc179tTvqnJ2o2/oMc5HcX3hMb5NDEPGugkZCuF3Ta/WdbtXnBWwo6XLPb3ELYN/plRHO4oqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=e8aAF7wv; arc=none smtp.client-ip=115.236.127.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="e8aAF7wv"
Received: from localhost.localdomain (unknown [171.8.192.198])
	by smtp.qiye.163.com (Hmail) with ESMTP id 85635e52;
	Fri, 10 Jan 2025 18:04:11 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH v3] docs/zh_CN: Add sak index Chinese translation
Date: Fri, 10 Jan 2025 18:04:04 +0800
Message-ID: <20250110100405.2225-1-zhangwei@cqsoftware.com.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHhkZVk0eGB1LHhkfTB5DSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKTEpVQ1VKQklVSkJDWVdZFhoPEhUdFFlBWU9LSFVKS0hKT0hMVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a944fabe05f03abkunm85635e52
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBw6Oio*CDIXCw4oPxYONjEO
	GDwKFA9VSlVKTEhNTktIT05JTUJJVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSkxKVUNVSkJJVUpCQ1lXWQgBWUFPQ0pMNwY+
DKIM-Signature:a=rsa-sha256;
	b=e8aAF7wv4ucfRl57fYKZLuTNjG0BAaacop3p9Jv9LPFgHAqfA/GaFHBSeEDZQhJV3UDkuBwhLemU+41FwZISs7eXAObzraIRxIL3VmDCCDcDDmb2DFxguHYAHaq9U7dsc7eIC3zhnZaRpEsAhOUCJ1urV4RmDsDwKKNqk/KPS2U=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=wVr7y6xzG72FZ6TbKMJkyFLw1E7hzFLFcfkI+jh7sX4=;
	h=date:mime-version:subject:message-id:from;

Translate lwn/Documentation/security/sak.rst into Chinese

Update the translation through commit 4d3beaa06d35
("docs: security: move some books to it and update")

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Reviewed-by: Alex Shi <alexs@kernel.org>
Signed-off-by: zhangwei <zhangwei@cqsoftware.com.cn>
---
v2: 

Change the email address of Yanteng Si
Complete the commit tag

v3:

fix security index 

 .../translations/zh_CN/security/index.rst     |  2 +-
 .../translations/zh_CN/security/sak.rst       | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/sak.rst

diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
index 3f68e3145322..d8aacd1930d9 100644
--- a/Documentation/translations/zh_CN/security/index.rst
+++ b/Documentation/translations/zh_CN/security/index.rst
@@ -16,6 +16,7 @@
    :maxdepth: 1
 
    lsm
+   sak
    siphash
    digsig
    landlock
@@ -26,7 +27,6 @@ TODOLIST:
 * IMA-templates
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

