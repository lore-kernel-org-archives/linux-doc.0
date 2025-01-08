Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B657E14B080;
	Wed,  8 Jan 2025 02:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736301855; cv=none; b=M/vMzCE+91NCXXoLPfN6AolVHHoZhVwJl7i5y3RUM1WaZP4Ntfe1vJtxOYFo2GDRshNv2ieFKZeodAiMY4V46vNbgs8mDSY6FvaqAjUka8ovvPBlcFn+v/5QyKBFc/6jEsYSca00XefYQLCB51OW6Tk8Wgxo/w9odyIPVZeWuAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736301855; c=relaxed/simple;
	bh=kL1oqk2hMD5HIHbEo8gjZHPzUhB4284/QRlU+RprCN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O8evf66XCtNaKo31swnEwJkNTWKtqQomAB4PnAb2q6zD1WAvBFitLqofm7L6iZVyqkPeDcc6URKztq1GKewwwX7u+Ud8Wsp1lW+rRmV7ncJUvURY1w3eo3AmRpVCiKPrlb/Qgtd2q7rHQhIS8AJ7PJsQSokXWkjEVJ867FEyH2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=dfziqjIq; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="dfziqjIq"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1736301843; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=jkbhlsZBTgwdfhhDyY2mVNdz7Ru2qqcr0zjKFyRhbdM=;
	b=dfziqjIqS5cxBiQmYsG2wEmeEz18vr27MhIJ0dKR6itNVWHomSdjBUvJdBxMVbCGYMKSq6/efg5RPVc3txbPGazbiLmFOpvl8DWlrNfyfpfdaWxkBcn5xkOtUs+CAg7/2bTgrCqIaC4I007WZSXR66Gb0bYmMbOv8NoMl1A4eTs=
Received: from localhost.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WNC7t7x_1736301833 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 08 Jan 2025 10:04:02 +0800
From: cp0613@linux.alibaba.com
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] Documentation: riscv: Remove KPROBES_ON_FTRACE
Date: Wed,  8 Jan 2025 10:03:42 +0800
Message-ID: <20250108020342.4172-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Pei <cp0613@linux.alibaba.com>

Since commit 7caa9765465f60 ("ftrace: riscv: move from REGS to ARGS"),
kprobe on ftrace is not supported by riscv.

And commit 3308172276db5d ("trace: riscv: Remove deprecated kprobe on
ftrace support") removed the relevant code, but left out the
documentation, so fix that.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 Documentation/features/debug/kprobes-on-ftrace/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
index 02febc883..d937b7a03 100644
--- a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
+++ b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
@@ -20,7 +20,7 @@
     |    openrisc: | TODO |
     |      parisc: |  ok  |
     |     powerpc: |  ok  |
-    |       riscv: |  ok  |
+    |       riscv: | TODO |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
-- 
2.43.0

