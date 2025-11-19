Received: from mail-m15566.qiye.163.com (mail-m15566.qiye.163.com [101.71.155.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4022DBF78
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537108; cv=none; b=XxyctTjtGEMhkrW7RV3N3NSkywjolaJkewwZhdlLtxBCKwvDpLBWq2KBOnLaX1VfdMrwbrp8oLrTaTDxACmxPBhpGg8kqNN8ZbhWyo8SBe7MjteoUkUkp9OrHT2uV1QuBuuPh6UEgzVSHNHV2/zmvPxD1Pk3zC0pvH97G7jqKic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537108; c=relaxed/simple;
	bh=a0TM6zR3otfDYL77pldlORahf2X9cYYY7u5Gl2UwMFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dpc/jp4mRicLeVziLQ3Q6uuy75VkG2tMESl5DRnCfUB16HNgh55qgOnfWcMyg0JszdKktvSNYS61Ei6C80p9rD8p/b0rCVpDW3ZhG6bP1+WdxUZqGm5jveEIXokBv9gPfOTxThD079KSLHjFsdtkiVilU6mbkghM+CcnxG2mwF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=fP5DSgZz; arc=none smtp.client-ip=101.71.155.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="fP5DSgZz"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a1aef7e5;
	Wed, 19 Nov 2025 15:09:39 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	wangyuli@aosc.io,
	doubled@leap-io-kernel.com
Subject: [PATCH v5 1/3] docs/zh_CN: Add block/index.rst translation
Date: Wed, 19 Nov 2025 15:09:35 +0800
Message-Id: <3e4c8bab2c3d5f55daea8dca604981d486256d19.1763535919.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1763535919.git.kezijie@leap-io-kernel.com>
References: <cover.1763535919.git.kezijie@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a9af28fdd09d8kunmdeaeea3a5894478
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGkpCVktLTEJNHk5DTkgaTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=fP5DSgZzdjTUn6ogl6zaDtYbVfdYDHEJ9AdNMrYRUM0Qz4ohWRHiiy/6jBpwMU8mhu6ffrnUpU+I+pxHndVxzbZGfo7/2bjN6XHf3rqx/lCEkHRNSrNojnz7jY4THc9yjTeI3T8pT1d1Tsxj2snwCHU+IOfOTs4p6Z/pdCIC5fYj1fB0UgtAKPIlKsNY0hlUjtpyeW6DtjQUyxbDeKnxvGriVgD2M/MhMabydwTlMVg6r5qG+O5I2grsQqZCIL3mdivE9o8AkhivAcIp68qq3PV8QD4DWeL6duj5t1SFPHI5f7QImOhGyLfgIfKHc2h+EM5lcHwOdS6i1/BPP5in/w==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=46cu+b/whC4Ml+IfrWhdUX5Y9WShOzQE9MWft39E7wY=;
	h=date:mime-version:subject:message-id:from;

Translate .../block/index.rst into Chinese and update subsystem-apis.rst
translation.

Update the translation through commit 56cdea92ed91
("Documentation/block: drop the request.rst file")

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

