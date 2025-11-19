Received: from mail-m3285.qiye.163.com (mail-m3285.qiye.163.com [220.197.32.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8640B1F4606
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 02:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763519903; cv=none; b=kXuL0A4il8EqmX8msbvbk+/9CdQE3PqZ5kL5EHXaTGpqNMivVAYu1VmBqut7JBRCAGVvoKRwj5MovDe0/j8edeAG+9VR/uXL/tWvpxZ0f4ejMyap44SZnJ13TIG4eoD7zajHT9utl6V0uhca0atGEZC9WbzaOL2eG5f24hD6MnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763519903; c=relaxed/simple;
	bh=LpbYwxahoiaNX9+2KTEEA8zmeLQC6doJJGaEDchtKNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XFG83A6huXO3H/j0HYha/daOLelgSOF2gTrN+347tLF4fczicdb/Uth2mrHRZIyFVwRtDHaLhDdOeoOiUk0yaX03VL/yE+QyzYGLpeXg2g0kuepi60EuXzc6xz+pTQCGNm30Gbj5W00d+fVivfchyIG9DwfDk7z+yMsYyQ+BTzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=ZJQDKk24; arc=none smtp.client-ip=220.197.32.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="ZJQDKk24"
Received: from localhost.localdomain (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a114d093;
	Wed, 19 Nov 2025 10:38:10 +0800 (GMT+08:00)
From: ke zijie <kezijie@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	wangyuli@aosc.io,
	doubled@leap-io-kernel.com
Subject: [PATCH v4 1/3] docs/zh_CN: Add block/index.rst translation
Date: Wed, 19 Nov 2025 10:38:06 +0800
Message-Id: <3e4c8bab2c3d5f55daea8dca604981d486256d19.1763519072.git.kezijie@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1763519072.git.kezijie@leap-io-kernel.com>
References: <cover.1763519072.git.kezijie@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a99fa02f309d8kunmf48af7c35607c97
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHkpCVh9OHU8aGUsZTEIdTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZJQDKk2481ZSdjzCRPgCk1bhh0p8a84cABggzk1Fgq+ts4Ra5//fvPg0M5Iz+t7pLkWxOu/JzYvH76ppnkJJv4GWIlvq/YL/2bVlOUxf8+3QQtRvE7SX3+HFR5JuWs60xoLtE58jiz/n7p+soUWhzsfUM4HMwKCTn37WlARrRLBb+p4ncoFLDXIqfZ9EUcPCyz0Y19pY82sgtkHEJokx69XBpNmym6HzC8D0GpHd+N79ulXgkAzCpfp61XfJalhZM+/PV+yhKNyJ6ymy8CUd970jbU7oG1C2FOc1keqy47VCfTiJx0UnM+ghWXt3asfByRLuIJJDMOhY9IlQj3PVDA==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=/tJ6hY+5+rhAd5o/FGgRgRPnlwLvnNdDFsY1YrFWklk=;
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
+ 柯子杰 kezijie <kezijie@leap-io-kernel.com>
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

