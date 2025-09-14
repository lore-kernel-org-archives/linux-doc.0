Received: from mail-m81134.netease.com (mail-m81134.netease.com [47.88.81.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796001DE8A4
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 06:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.88.81.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757830895; cv=none; b=LEaf+lvKk14jg7xEDqj3NYec9QA84YC91VNjNKE5yFWNz+lzAE17hAMC1wt+7AEzDjgyq5k3wGrwuqqxW/P4LuGAhvQukj2RnHhZHXEdTznqKUWdPiI2ZINWnVQCoYs2SvBUff02EA6HgMi8XuKZJJb1wpF6Ah4wdI0nwiMCqUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757830895; c=relaxed/simple;
	bh=LqS2kwq700VN2LJivhc96mW551oiQZnsw9OjwsvjTVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W777XtLlOytAEzy1g7AlKuAf36b5V229fMIoZod8HN1TzJmaqIr+F2TqLJE28LLf6zmKk8t3z6u9+xLNtX5Rd+y7C1i/p0z4J61DmRTDKq03Ws4+LpIuEcIHYMgqog+uANQJA3k05u5Y30XNgFE1HaC6xasz0PVmuK4qd5Q9fXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=oR8+lkzl; arc=none smtp.client-ip=47.88.81.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="oR8+lkzl"
Received: from localhost.localdomain (unknown [120.246.23.60])
	by smtp.qiye.163.com (Hmail) with ESMTP id 22b65cb12;
	Sun, 14 Sep 2025 10:52:17 +0800 (GMT+08:00)
From: doubled <doubled@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 7/7] docs/zh_CN: Add sd-parameters.rst translation
Date: Sun, 14 Sep 2025 10:52:08 +0800
Message-Id: <616b8c6ed6313647bd02fc4c8cd17b40c2bcfc5a.1757686158.git.doubled@leap-io-kernel.com>
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
X-HM-Tid: 0a994623391209cckunmff566153890573
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSRlNVhlNTRkdS0MYSE8YSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUtVSU9NVUlIVU1LWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=oR8+lkzlb7Zdfer3sJVQzVTXtzJ8SSs7Y+aYcnn/XS8GH2cJic/f0zIWvoeFv5fvIxVpjB66myOdeWwtz50CpGDeTRwy53wrDxuQSXgRfrHY9EUtn+V68cx7ijndiJF31kv0BCXNS3AgdSAtzTGF3vQTKsNSvnwsc88WnhT9F2CkCb56NSSELe2ido2Vu+cGyLv0fG/uZsx9zh5mAejDO9Dbq57d/9s+wW5Dxo8kHUq04PzTdgK38RhtTFoIrGocfw28+D8UDnkbRZZ3jRGj7qnb8TQJJJE09eeznpxSWeY3caXM/myTqUlO6wx18ftnLOFWThHkJDefBOkyuMLQCw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=akNZxDgr79pt3anuIFyU3alPqLRn2nGlUS3Wyk8niMw=;
	h=date:mime-version:subject:message-id:from;

Translate .../scsi/sd-parameters.rst into Chinese.
Add sd-parameters into .../scsi/index.rst.

Update the translation through commit d835971b2b89
("scsi: docs: convert sd-parameters.txt to ReST")

Signed-off-by: doubled <doubled@leap-io-kernel.com>
---
 .../translations/zh_CN/scsi/index.rst         |  3 +-
 .../translations/zh_CN/scsi/sd-parameters.rst | 38 +++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scsi/sd-parameters.rst

diff --git a/Documentation/translations/zh_CN/scsi/index.rst b/Documentation/translations/zh_CN/scsi/index.rst
index 4d83ab431d2c..f13c419b134c 100644
--- a/Documentation/translations/zh_CN/scsi/index.rst
+++ b/Documentation/translations/zh_CN/scsi/index.rst
@@ -50,9 +50,10 @@ SCSI主机适配器驱动
 .. toctree::
    :maxdepth: 1
 
+   sd-parameters
+
 Todolist:
 
-* sd-parameters
 * 53c700
 * aacraid
 * advansys
diff --git a/Documentation/translations/zh_CN/scsi/sd-parameters.rst b/Documentation/translations/zh_CN/scsi/sd-parameters.rst
new file mode 100644
index 000000000000..b3d0445dc9f3
--- /dev/null
+++ b/Documentation/translations/zh_CN/scsi/sd-parameters.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scsi/sd-parameters.rst
+
+:翻译:
+
+ 郝栋栋 doubled <doubled@leap-io-kernel.com>
+
+:校译:
+
+
+
+============================
+Linux SCSI磁盘驱动（sd）参数
+============================
+
+缓存类型（读/写）
+------------------
+启用/禁用驱动器读写缓存。
+
+===========================    =====   =====   =======   =======
+ 缓存类型字符串                 WCE     RCD     写缓存    读缓存
+===========================    =====   =====   =======   =======
+ write through                   0       0       关闭      开启
+ none                            0       1       关闭      关闭
+ write back                      1       0       开启      开启
+ write back, no read (daft)      1       1       开启      关闭
+===========================    =====   =====   =======   =======
+
+将缓存类型设置为“write back”并将该设置保存到驱动器::
+
+  # echo "write back" > cache_type
+
+如果要修改缓存模式但不使更改持久化，可在缓存类型字符串前
+添加“temporary ”。例如::
+
+  # echo "temporary write back" > cache_type
-- 
2.25.1

