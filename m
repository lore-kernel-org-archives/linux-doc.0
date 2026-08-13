Received: from mta1.migadu.com (out-16.mta1.migadu.com [95.215.58.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9CA3C063A
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 23:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786662122; cv=none; b=uQlk7QEHGw8S+CsC+xAlzA9UB+w07k3Hr5K+Nzrvis246LIvh91TWQqSEncWl/SYMCUBFOMiaD2mtkR+9+93k5paK1oXK5K4ps3JLl3bWSivDUf3g1fNDvpotJg6HGmzBvBABM6Iewgzhh9M4dGaprz6Nrk7mUVaJReHW7nj/p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786662122; c=relaxed/simple;
	bh=aW4IoisfK+/HMB8ocJHrcS4JosOvB4zVKSMKy4qrqDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdPMQTKaIaxKEDVytcJiQi/JYNvjIcoxYAI2LcM6A9Bx/4h8gQ/Tle7Rg4vAOwuvt6vdX4Rv4ngUUSnNVPblrvbW6aRPJGbSNCUiFhv3vh6M3xRDJOWz0+CQrwpYuUK3BYAjPpu1T6BI96OcEO7guyJD20J8Z7ErqIBKYgLd6CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BeA5tMsy; arc=none smtp.client-ip=95.215.58.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BeA5tMsy"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aW4IoisfK+/HMB8ocJHrcS4JosOvB4zVKSMKy4qrqDE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786662118; v=1; x=1787266918;
 b=BeA5tMsyn27l/tVn09gMhUS28LGQNEF6EIzG0mHJl1AFLJMYc4hlcEqggiDmdzMMZ93O9jKg
 RVDxlxfubgXIrvGTem/AugVgLtrhRoA/xK7Zw1Mx1wbWYNNfUHci9gco1Eiq+z7qldS3YBQhmo/
 HuJLTOQXvTFw2JufzvaArK4U=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from ctao-book.. (111.162.215.50)
	by smtp.migadu.com with ESMTPS id 2196ede5a1ef122e;
	Thu, 13 Aug 2026 23:01:58 +0000
X-Migadu-Flow: FLOW_OUT
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
Subject: [PATCH v2 2/2] sched_ext: fix stale references in doc comments
Date: Fri, 14 Aug 2026 07:01:23 +0800
Message-ID: <20260813230123.2069719-3-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813230123.2069719-1-cui.tao@linux.dev>
References: <20260813230123.2069719-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

- inlines.h: scx_bpf_dispatch() doesn't exist; the comment means
  scx_bpf_sub_dispatch()
- internal.h: name %SCX_DEQ_SCHED_CHANGE instead of the never-defined
  %SCX_DEQ_SAVE
- internal.h: @name shows up in the ops file in the scheduler's sysfs
  directory, not a "kernel.sched_ext_ops" sysctl

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 kernel/sched/ext/inlines.h  | 2 +-
 kernel/sched/ext/internal.h | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/ext/inlines.h b/kernel/sched/ext/inlines.h
index 72d5ccd..8f3be59 100644
--- a/kernel/sched/ext/inlines.h
+++ b/kernel/sched/ext/inlines.h
@@ -22,7 +22,7 @@ enum scx_dsp_verdict {
 };
 
 /*
- * One user of this function is scx_bpf_dispatch() which can be called
+ * One user of this function is scx_bpf_sub_dispatch() which can be called
  * recursively as sub-sched dispatches nest. Always inline to reduce stack usage
  * from the call frame.
  */
diff --git a/kernel/sched/ext/internal.h b/kernel/sched/ext/internal.h
index b699e7c..c91296c 100644
--- a/kernel/sched/ext/internal.h
+++ b/kernel/sched/ext/internal.h
@@ -485,7 +485,7 @@ struct sched_ext_ops {
 	 * - sleeping (%SCX_DEQ_SLEEP)
 	 * - being moved to another CPU
 	 * - being temporarily taken off the queue for an attribute change
-	 *   (%SCX_DEQ_SAVE)
+	 *   (%SCX_DEQ_SCHED_CHANGE)
 	 *
 	 * This and ->dequeue() are related but not coupled. This operation
 	 * notifies @p's state transition and may not be preceded by ->dequeue()
@@ -966,8 +966,9 @@ struct sched_ext_ops {
 	 * @name: BPF scheduler's name
 	 *
 	 * Must be a non-zero valid BPF object name including only isalnum(),
-	 * '_' and '.' chars. Shows up in kernel.sched_ext_ops sysctl while the
-	 * BPF scheduler is enabled.
+	 * '_' and '.' chars. Exposed via the ops file in the scheduler's sysfs
+	 * directory, /sys/kernel/sched_ext/root/ops for the root scheduler,
+	 * while the BPF scheduler is enabled.
 	 */
 	char name[SCX_OPS_NAME_LEN];
 
-- 
2.43.0

