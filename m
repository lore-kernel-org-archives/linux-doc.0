Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5612564
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 02:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725502253; cv=none; b=tyd3N2nai9/99jvWshAVpX/dJyhQbqDgoyR8zqtqpLZ8v6O/c2+6hLKf/bneKzKG4UHRl6m95tRc41ADY/GeycGn+puvAr5rDCTbtORC0klkK24iVbbkhV/LuVSDOStBF2MSDqIGrK4hHi2NhCadOwmrZtVTLB13WVltKiSwNVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725502253; c=relaxed/simple;
	bh=TEOWXSpekyOqsSAfhuruJDh1sLEptwjasU0Fs4Xg2M8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VuoBjYOojYNPPxonpSE/ZS3w73X4n7+YoelqhoV0MF6h2D4m9UzAtkmQahjYR/+5F26Qq1tyfqpgWaM8/6L8iM8s/QQ81h1oUk7MFQ7ZGqstqHgR9hUXFb+WBEZUwohSWJSjqqhIWd0E98tL/z3YL0p//AsWtakOXFdPlEq7s/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GF9KzYel; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GF9KzYel"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725502247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XweUOU/P4liLvTIx1yfAxH9eNNsX1y/ozTnoPAgZ6zc=;
	b=GF9KzYelmY+jjlOqPJc4WIbfXjRlThrkyt6ob/dlTwT72/hyNk67MnPnsDbkVVzsq4jFzk
	7rn2dkPHgbYSqXIJwQlQKsocJEsRQAOIuMd1Q/TTBwMu7C9R8NmP2gcDpiQmGJjKEt/iw6
	yFH0PEkYNwihZGNbB2oILFGZL4BF9Oo=
From: Yanteng Si <si.yanteng@linux.dev>
To: corbet@lwn.net,
	seakeel@gmail.com
Cc: Yanteng Si <si.yanteng@linux.dev>,
	dzm91@hust.edu.cn,
	hust-os-kernel-patches@googlegroups.com,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] Docs/zh_CN: Update Yanteng's email address
Date: Thu,  5 Sep 2024 10:10:12 +0800
Message-Id: <20240905021012.2571820-1-si.yanteng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

I've permanently lost access to my loongson email
account, and luckily I got a developer email,
let's use it.

Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
---
v2:
Modify mailmap.

 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index d2870c28c0b0..1ceac0fc231c 100644
--- a/.mailmap
+++ b/.mailmap
@@ -710,6 +710,7 @@ Will Deacon <will@kernel.org> <will.deacon@arm.com>
 Wolfram Sang <wsa@kernel.org> <w.sang@pengutronix.de>
 Wolfram Sang <wsa@kernel.org> <wsa@the-dreams.de>
 Yakir Yang <kuankuan.y@gmail.com> <ykk@rock-chips.com>
+Yanteng Si <si.yanteng@linux.dev> <siyanteng@loongson.cn>
 Yusuke Goda <goda.yusuke@renesas.com>
 Zack Rusin <zack.rusin@broadcom.com> <zackr@vmware.com>
 Zhu Yanjun <zyjzyj2000@gmail.com> <yanjunz@nvidia.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 800c9528614f..1d8635323076 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5282,7 +5282,7 @@ F:	Documentation/dev-tools/checkpatch.rst
 
 CHINESE DOCUMENTATION
 M:	Alex Shi <alexs@kernel.org>
-M:	Yanteng Si <siyanteng@loongson.cn>
+M:	Yanteng Si <si.yanteng@linux.dev>
 S:	Maintained
 F:	Documentation/translations/zh_CN/
 
-- 
2.31.4

