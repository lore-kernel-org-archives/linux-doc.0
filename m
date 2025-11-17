Received: from mail-m3276.qiye.163.com (mail-m3276.qiye.163.com [220.197.32.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEDA30E84F
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 08:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763368069; cv=none; b=PQKRU83FySjN0Q7QbIoVix8Wum/0hr6jxv8nHXqD53E4DutaqaQBpsCM5AZWfeWBwTNN5UipFWfdzOHM8axBkAplOXwa5/5w5Jq9MRWyBvgAEKbtRuVd/vO3l857EeiWBGGA2NbXrNeRkoau7v+nNskS6fkAqQORTfBmgdSaPB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763368069; c=relaxed/simple;
	bh=4iucGB7XHjIel8PtzlpyaRGKuWbFlKX9btbY29n8UpA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRVUfRjDLnEXa/RezGSv3/BsLMaomIYwMk0BaLjzgNR3hCM3AD3y92NhAqlG7NaHbw7GfgecJABlkeVyavM0CoHPCBxXPkYYH3wgI4XTXZKinU2y/qQFmu56EezaZFqxPTVEHfS8UkGhJIbPJ2cLbjw2TOJ7uDc14Rzpe94p+3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=Obkqhet8; arc=none smtp.client-ip=220.197.32.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="Obkqhet8"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29d39b813;
	Mon, 17 Nov 2025 16:27:37 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	wangyuli@aosc.io,
	doubled@leap-io-kernel.com
Subject: [PATCH v3 1/3] docs/zh_CN: Add block/index.rst translation
Date: Mon, 17 Nov 2025 16:27:34 +0800
Message-Id: <dceb4c59bc0d9a02246386cfed31a543d6a943b8.1763366835.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1763366835.git.kezijie@leap-io-kernel.com>
References: <cover.1763366835.git.kezijie@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a90ed3a3b09d8kunma1c7246a3f20aec
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHRpDVkhJTxoeHktJGksYGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Obkqhet8g3Sqh5fCq2TObEXbjx+HKAVNTWzgW+H0A5sTO1aX1GBZKMT3qO7bDgw1LKGhfoEe2Nb4wYnfk6gTFTqsaieVP65lsYDiALxVngU+VHs33X4GC62QIKCPr1b2N2OwwcLQJZSOp5xT2IkO0Jz9NRoa2FuhLPEiBC8O8BpgLCAjTJ85o0Z5LA6PPyH4V2oi5wUC5bl9HqP7H6JsNHPOFwzcOvZnMXwExr6F7Fs6G+W+EIqiRxXo7o1iNOfRLDXS6F6K1hQXqwtqFlw5xjsiR3uyvbSdBS/+EhpNhPK0AzuxqQqA/rrMAVJYmklAsSyfIV6pxE+NcWk6dcej+A==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=SQeUoPVZnCaitNAIaU1gb9cJE7eFxtthrmugay6d1BI=;
	h=date:mime-version:subject:message-id:from;

Translate .../block/index.rst into Chinese and update subsystem-apis.rst
translation.

Update the translation through commit 56cdea92ed91
("Documentation/block: drop the request.rst file")

Reviewed-by: WangYuli <wangyl5933@chinaunicom.cn>
Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
---
 .../translations/zh_CN/block/index.rst        | 36 +++++++++++++++++++
 .../translations/zh_CN/subsystem-apis.rst     |  1 -
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/block/index.rst

diff --git a/Documentation/translations/zh_CN/block/index.rst b/Documentation/translations/zh_CN/block/index.rst
new file mode 100644
index 000000000000..45172f6d2659
--- /dev/null
+++ b/Documentation/translations/zh_CN/block/index.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/block/index.rst
+
+:翻译:
+
+ 柯子杰 kezijie <kezijie@leap-io-kernel.com>
+
+:校译:
+
+
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
\ No newline at end of file
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

