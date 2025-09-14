Received: from mail-m93136.xmail.ntesmail.com (mail-m93136.xmail.ntesmail.com [103.126.93.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD692DC775
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 08:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.93.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757838909; cv=none; b=NC1eNhGTnCeq8Q9WSe3A191JLRZOGE4fdvwKwZVzlUanoPvZbsUEy5iuKI55HjQKZDm+BAzddg2VVNE98BttmyyJLN3U5QQ/iy4s9z2QqVm7n8V4k927G3Yg+6ioGqwInxd3dIJuG3YP0KiPwfKRnJgdVIC+r/aD5qRH1QzgU2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757838909; c=relaxed/simple;
	bh=WxaVqqpKO848mytxE41qsGxnXurBftTNwnQHOj1Vo3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uTQW0LzmT0RQGTHL2znsyNbvLxtyEOKUSDKI7bNz4u7MVtb9J9TuiZf/fiPc4rE8+JXZzmTfIxeQzkw0rAbE9LlPgDgVAm2k2Q0vk8p9EeJai5AUK6JvppTA17NYN6KEZRkpj268MqWPzBV7B/GchHZ2/aovIet1xTqzHgwtDow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=UVhlmqJU; arc=none smtp.client-ip=103.126.93.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="UVhlmqJU"
Received: from localhost.localdomain (unknown [120.246.23.60])
	by smtp.qiye.163.com (Hmail) with ESMTP id 22b62fc50;
	Sun, 14 Sep 2025 10:52:16 +0800 (GMT+08:00)
From: doubled <doubled@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 6/7] docs/zh_CN: Add link_power_management_policy.rst translation
Date: Sun, 14 Sep 2025 10:52:07 +0800
Message-Id: <2d9ceae5cdca7330395f90af563def824aa63457.1757686158.git.doubled@leap-io-kernel.com>
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
X-HM-Tid: 0a994623340d09cckunmff56615389055e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQhkaVhhNHUIeTx5KSh1DSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUtVSU9NVUlIVU1LWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=UVhlmqJUZQV0nayuP3VlD/DbWwmzmOxsZLYZlowbjSI1VJ1gHsjF9gtlI4r3ARP9zkwQ0M4J1xS79V14VCHr7A61V0ZiBzSkfXfHEHVDrgBfOt+qQRLiOgfo0U35AwCGXgpoX9CtQUCo7biFAVt9YKfbxjFwJBXAHuPEDpVmb+VvYuuSY7U19y0oxOJ+MZeqkaXV2KeF425TG0FK3/BDJOAkTB1bGVPFne1vKD/mp8+3GJlWIIyeTWDh7WMCahcQGkERgrH8BNvpcEBmR+MnU/m0RUz6yiP5mHmwUghVIX3lOrAPmioijWl6UQPHqL1iPIu/ESxeleTf8Y6eHOJXPw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=JNmFsntdrYqMlkydxPfd5WKfs6YahjTZzDee/hPCoBk=;
	h=date:mime-version:subject:message-id:from;

Translate .../scsi/link_power_management_policy.rst into Chinese.
Add link_power_management_policy into .../scsi/index.rst.

Update the translation through commit cbbc70a8cde7
("scsi: docs: convert link_power_management_policy.txt to ReST")

Signed-off-by: doubled <doubled@leap-io-kernel.com>
---
 .../translations/zh_CN/scsi/index.rst         |  5 +--
 .../scsi/link_power_management_policy.rst     | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/scsi/link_power_management_policy.rst

diff --git a/Documentation/translations/zh_CN/scsi/index.rst b/Documentation/translations/zh_CN/scsi/index.rst
index dc56ca279db8..4d83ab431d2c 100644
--- a/Documentation/translations/zh_CN/scsi/index.rst
+++ b/Documentation/translations/zh_CN/scsi/index.rst
@@ -42,10 +42,7 @@ SCSI驱动参数
    :maxdepth: 1
 
    scsi-parameters
-
-Todolist:
-
-* link_power_management_policy
+   link_power_management_policy
 
 SCSI主机适配器驱动
 ==================
diff --git a/Documentation/translations/zh_CN/scsi/link_power_management_policy.rst b/Documentation/translations/zh_CN/scsi/link_power_management_policy.rst
new file mode 100644
index 000000000000..f2ab8fdf4aa8
--- /dev/null
+++ b/Documentation/translations/zh_CN/scsi/link_power_management_policy.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scsi/link_power_management_policy.rst
+
+:翻译:
+
+ 郝栋栋 doubled <doubled@leap-io-kernel.com>
+
+:校译:
+
+
+
+================
+链路电源管理策略
+================
+
+该参数允许用户设置链路（接口）的电源管理模式。
+共计三类可选项：
+
+=====================   =====================================================
+选项			作用
+=====================   =====================================================
+min_power		指示控制器在可能的情况下尽量使链路处于最低功耗。
+			这可能会牺牲一定的性能，因为从低功耗状态恢复时会增加延迟。
+
+max_performance		通常，这意味着不进行电源管理。指示
+			控制器优先考虑性能而非电源管理。
+
+medium_power		指示控制器在可能的情况下进入较低功耗状态，
+			而非最低功耗状态，从而改善min_power模式下的延迟。
+=====================   =====================================================
-- 
2.25.1

