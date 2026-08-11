Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D47E4052BB
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433948; cv=none; b=pA0UpXWfxsFvqKw1xJ1EVCTeBpYKDfio0/b/iWV3hyRh+iRuaw6YBeOSl0E2K0vm4iDB1nWvhyRVdPHHA4fKOOQERVcNfyyxYgjVaO8Iojh+nChsIenfqYr8xvbbFUIqZYAiSjplohN17SvDtYhqrXPCNK3jmS7pc7GFdelp+B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433948; c=relaxed/simple;
	bh=ZM0BN2EdszE81z2O/+szXC/b6uTh+U05pF0gKyd0EDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txobaXswvSL1nJ9vIdkJd0keznHUtAnSIVlyEyE8trqKQgc0gMipQR9/V8L8NzasRBMu9aSm1fdak3ymrvu5hV1HZhfV8zr31zEhaDx7ZDm9OnZGhNjCoCOtbZoMJfnSFDzDV0RkEootPE+2Fae/err3/mzgCqfrrIkZk2Gf1Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GNqGbWsu; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GNqGbWsu"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786433945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PlH49yR610AZ+iVJK9NDmvAhI6oyyYQmSsywmCEwPq8=;
	b=GNqGbWsuAB8CYxGgeWARsB7VFkxua8iZLlYMXM26SNCfSqn+VKXBh+7gZOUvxQhRXTRCQH
	5H+yIyUmf/Rf00XiAETs3FGefOQNvHGgiKzVmcLmd9v19pspRSrc6Zds4zz4ONgSsqDapS
	3Uk3HAIa5uJihK6ZTcbYsRrWnC7vCA0=
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org,
	corbet@lwn.net
Cc: rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	arighi@nvidia.com,
	yphbchou0911@gmail.com,
	jpiecuch@google.com,
	ihor.solodrai@linux.dev,
	suzhidao@xiaomi.com,
	luoliang@kylinos.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 2/2] sched_ext: fix stale references in doc comments
Date: Tue, 11 Aug 2026 15:38:01 +0800
Message-ID: <20260811073801.342165-3-cui.tao@linux.dev>
In-Reply-To: <20260811073801.342165-1-cui.tao@linux.dev>
References: <20260811073801.342165-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Tao Cui <cuitao@kylinos.cn>

- scx_bpf_dispatch() was renamed to scx_bpf_dsq_insert()
- drop reference to undefined %SCX_DEQ_SAVE
- @name is in /sys/kernel/sched_ext/root/ops, not a sysctl

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 kernel/sched/ext/inlines.h  | 2 +-
 kernel/sched/ext/internal.h | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/ext/inlines.h b/kernel/sched/ext/inlines.h
index d2d074cee1cb..812d67d18f54 100644
--- a/kernel/sched/ext/inlines.h
+++ b/kernel/sched/ext/inlines.h
@@ -14,7 +14,7 @@
 #include "cid.h"
 
 /*
- * One user of this function is scx_bpf_dispatch() which can be called
+ * One user of this function is scx_bpf_dsq_insert() which can be called
  * recursively as sub-sched dispatches nest. Always inline to reduce stack usage
  * from the call frame.
  */
diff --git a/kernel/sched/ext/internal.h b/kernel/sched/ext/internal.h
index b699e7c1103f..06aab2f75208 100644
--- a/kernel/sched/ext/internal.h
+++ b/kernel/sched/ext/internal.h
@@ -485,7 +485,6 @@ struct sched_ext_ops {
 	 * - sleeping (%SCX_DEQ_SLEEP)
 	 * - being moved to another CPU
 	 * - being temporarily taken off the queue for an attribute change
-	 *   (%SCX_DEQ_SAVE)
 	 *
 	 * This and ->dequeue() are related but not coupled. This operation
 	 * notifies @p's state transition and may not be preceded by ->dequeue()
@@ -966,8 +965,8 @@ struct sched_ext_ops {
 	 * @name: BPF scheduler's name
 	 *
 	 * Must be a non-zero valid BPF object name including only isalnum(),
-	 * '_' and '.' chars. Shows up in kernel.sched_ext_ops sysctl while the
-	 * BPF scheduler is enabled.
+	 * '_' and '.' chars. Exposed via
+	 * /sys/kernel/sched_ext/root/ops while the BPF scheduler is enabled.
 	 */
 	char name[SCX_OPS_NAME_LEN];
 
-- 
2.43.0

