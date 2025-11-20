Received: from mail-m1973186.qiye.163.com (mail-m1973186.qiye.163.com [220.197.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB412D73A1
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 02:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605661; cv=none; b=ZjwCF64tMwEifiCYHDeByPNZWeDQc74/43CFDas/hyG10z56ca/DttIa4kNIBaLpp+FJny/TWnCLXGKyRZOysSBUbMGvru4AJNQBTv+QRBhoTLiHhjrvjvdmkcQ0x4JEUxincF78HfE5casLwoYkAr3nmhkt3jkj5zdbjOx8c9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605661; c=relaxed/simple;
	bh=WjUq/8Ti7vLHiy/DQuRZjwZWjrSq5wBVqif3By/3Nis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=orXiXdck7+WTszdS5QPsoqFk+JptLAkwDZiIVPO01QylY+idvSM3xK/2wnJyUantwzPNNSZW4T+I9XEEqupwvhF45LJigJmuh2xg5iyOio3lOJed8wujiIVJut9F2w9OvDgOLUSv41r4JZ0RkrBTDIRK3udFsvw6LSUywCvs9KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=GaE+Zkyt; arc=none smtp.client-ip=220.197.31.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="GaE+Zkyt"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a36cea87;
	Thu, 20 Nov 2025 10:27:29 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	wangyuli@aosc.io,
	doubled@leap-io-kernel.com
Subject: [PATCH v6 1/3] docs/zh_CN: Add block/index.rst translation
Date: Thu, 20 Nov 2025 10:27:26 +0800
Message-Id: <3e4c8bab2c3d5f55daea8dca604981d486256d19.1763605033.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1763605033.git.kezijie@leap-io-kernel.com>
References: <cover.1763605033.git.kezijie@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a9f1697f809d8kunm7a5293773a3479
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGEoYVhpJHkNCSxgaTExOGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=GaE+ZkytVra0VjZiRQcy3VIOKMOrnem8hczU155MeWvIKqqcfh7MF/435kjJPW5DFa968Um1wLEBe2w22Y3CasTK+/SoqnZR1fSqgHSIlfP2w1+SyymM6ea1jxL+DPpUJ5T6lShYJ8j1b7a0mR/Yp90SpBALhPsCLx3LLKikXd2JCrmuG4WMjvXlE5Fh2kkaue9EXBLdvRam4yMLf+uURl5oGHlV/0mamZdL+B/S2IpnaLjuHVnMvSL6T8l5K+4F0cljaFD0aIZsRyh0qTUaq1ApGo029vQksiUiJoNOWZ1Wu8jYLptzhENcbUxZFkncTXNhrlbpdsniTmNbFuyNjg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=5cVcbIA3Tc2Jwo2vwRO6yxW5ccHNijifgSvwoR/VeRk=;
	h=date:mime-version:subject:message-id:from;

Translate .../block/index.rst into Chinese and update subsystem-apis.rst
translation.

Update the translation through commit 56cdea92ed91
("Documentation/block: drop the request.rst file")

Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
Reviewed-by: WangYuli <wangyl5933@chinaunicom.cn>
Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
---
 .../translations/zh_CN/block/index.rst        | 34 +++++++++++++++++++
 .../translations/zh_CN/subsystem-apis.rst     |  1 -
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/block/index.rst

diff --git a/Documentation/translations/zh_CN/block/index.rst b/Documentation/translations/zh_CN/block/index.rst
new file mode 100644
index 000000000000..1a5b214657dc
--- /dev/null
+++ b/Documentation/translations/zh_CN/block/index.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/block/index.rst
+
+:翻译:
+
+ 柯子杰 ke zijie <kezijie@leap-io-kernel.com>
+
+:校译:
+
+=====
+Block
+=====
+
+.. toctree::
+   :maxdepth: 1
+
+TODOList:
+* bfq-iosched
+* biovecs
+* blk-mq
+* cmdline-partition
+* data-integrity
+* deadline-iosched
+* inline-encryption
+* ioprio
+* kyber-iosched
+* null_blk
+* pr
+* stat
+* switching-sched
+* writeback_cache_control
+* ublk
diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
index 0f121f9b0f70..830217140fb6 100644
--- a/Documentation/translations/zh_CN/subsystem-apis.rst
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -75,7 +75,6 @@ TODOList:

 TODOList:

-* block/index
 * cdrom/index
 * target/index

--
2.25.1

