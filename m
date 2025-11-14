Received: from mail-m19731102.qiye.163.com (mail-m19731102.qiye.163.com [220.197.31.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65DD224B14
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 07:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105857; cv=none; b=ISCZZlMEeIHpA7U2Iz7OznFfX52UmwLFJQbe3E1U4/kp5ny/Ik4rlqoPhmPYNyia1kZ/KJ/9Xq9q7F767aUh9jeyT+nl0uEaQ1CwhtoSm6DydOMH3JlAbxY0BcOOU/UvCNvM0mngtBU2U71VfHRBzMyHXPc98afZwHLzfma0JY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105857; c=relaxed/simple;
	bh=EaNxeVWgRQwIt/OAsoOCZKSHjUMzCjABhtZ189vRkyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j9DdMUro15/wluGrREm+U226iBDW59NPgQdmpOfmV2AyezUQv6rU2GiClrHN3pnwqOF7vZaw7D2UwUCzas8b1KWydwA1bDqKVdzzE/w1hJUMyaWxc4jVYdVMRSwVayaFGpceKSz4WCBMC3ddqkr5qmEYoYt+tkomwxQY2DuXQhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=BT7qhtqE; arc=none smtp.client-ip=220.197.31.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="BT7qhtqE"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2994ff82f;
	Fri, 14 Nov 2025 15:37:23 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH 1/3] docs/zh_CN: Add block/index.rst translation
Date: Fri, 14 Nov 2025 15:37:19 +0800
Message-Id: <2d67aafd9626ce9ba85037b79fc425123a455acd.1763105050.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1763105050.git.kezijie@leap-io-kernel.com>
References: <cover.1763105050.git.kezijie@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a814c28a209d8kunme5a62dc31846330
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUsaVh4dSUtLSkpIHhgdTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=BT7qhtqEFgePv0sH+h19TLQP8jBMtsO+R6j+uSueoBJHl+Zvf69yS7X76eU89xX7n86hwsKwW64/dMjBcQfIYyGh+MC0coNdneamYQAOjpgHcQ2qDFmW++/HbFyPH0lZyTVmzfW2wIpMNnc4NSJUbdUXNi79SexX2U5JuGBrRLj3xvNfh2VRmDCtd/hG6PxZiGBR8GY2E6Xr0ajbpNR/rDlGrebFCf3NNT0XcLicvonVbrTLfcop/4y76ZII0/jnm3+R3g+S+cfj83KMT/8OQiIdy/8pXK94VumJRk/EwqobqoUuHm8/sGn1nAywpl2p0kAKNUL2fw2+bypDIcN/kg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=r3t2+sDKsOuCSrzwyDlFLNX+l9rXXatPmI7WVgx/fFc=;
	h=date:mime-version:subject:message-id:from;

Translate .../block/index.rst into Chinese and update subsystem-apis.rst
translation.

Update the translation through commit 56cdea92ed91
("Documentation/block: drop the request.rst file")

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

