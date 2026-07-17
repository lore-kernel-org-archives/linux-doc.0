Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39453FC5AB
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293490; cv=none; b=NwrokvHZM/1Rkm0qrZGedQ5prG7FS2IsBEMWQq9MqspXb0zDdDCxTbFagd+ZLNSx4Qw+kMs75gd8ROuPQC//rByjptFPEn6TDkrRaLWNj487E92T/YDeI7Z00Bo1pc0sqYY1dEqgw9kGu2OxNtP6K4lNHrFL1eze/fa0uKDXoZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293490; c=relaxed/simple;
	bh=EtJoFWpzZWBdawFoDueuFU6iEwMn2zfmcjtMLM64xIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ghhi0C/iHfn+CJP6EzwwX2EslFqLDvPzZQa60Bc4eZbwJZFePpEudIMWdwE4LrtauTBwjm9F5xZG8cahGnv66WSwaDsbtkxb3PL6ht8JTAs0A1Mfe47Im9MdCE2CKIfioi905/dS89IIwTB7uMxaYc2nYZnQUajQqCdBOuXIxhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQBPPhBU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQBPPhBU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cace91f112so77460315ad.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784293487; x=1784898287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DcODrlK3jRROVEKQp+XA+e79BwmfTHaetARzpTbTQI=;
        b=HQBPPhBUqwGuBpyqLiWxUXiGJvihqyWKxg6MunhyX4Bg96StAMvwhCahapEjSE/DKO
         zaN6/yuYruwN23I49T5/cyA89FHiba/mfAJ899negpZZZzwmg8ZR+5ldWa3jH1G23Cvh
         7N5ayIxfHwlZmcq3YRqh2Wi/awuqXZMUPXa+y0+5/YzqGxe/LprpxCM5MuVFazlMBFPm
         5Hz8PWKa1NkaXwsEA7AW/M+g3Jin2+gPx+Om7vswC4kKGOoq1zjqzKQEVtVn5QrOmwXx
         aVTqXi8GuT20G46uYtrqgV9owAENAnDWL3sEU6VBBq5BAhRxMz2Wg+XLx1STNAHUjOVi
         8AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784293487; x=1784898287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DcODrlK3jRROVEKQp+XA+e79BwmfTHaetARzpTbTQI=;
        b=JZgC9RzYYVWAiG6/3wuHnw92QuagQa6EyxXQQ2AST0iq7zR4dYYJ9s+6gI2i0IGbkt
         +SmHRn8bmJl8wJO5kjDw+DmNJixhBo0SNZX3t+7xz8HrlkaEUs5DP8qR+nJqMKQfo/We
         NqPY5ejtA6JT47b/bVY4itHjZKO2hLxtKN5SQQwvUNbphv7IL4YNLaOcckwPm0FZrZIS
         Y7XcMnx7rDv+/7SL3HLc5cdDmd+uoex8UdwkHB39frZlZlE25qfLauG2+I6yPgL2Twzo
         bF3bO4OnBWFtXd7qFgmqXIz/SnyEOY/qAN73vnMbbjlcTibTKldfQRm1uUIffXoUp35d
         0upA==
X-Forwarded-Encrypted: i=1; AHgh+RobQv3DJOM5nWohuOSgwRpagz2o9SNJvgXnPq8GHV+p9/Eq69zE0hv/LeCbJPwefigP13rK7aJlItk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmRkjZ7Cruj+U1HqzPX19+SVDe4BfeALOXVG/pQxaR1+7na5LD
	jspZSuUZAabFFqskcgGi1JrhzJYcUtrwIUXFHgUJJVPhByBiJER9BG2r
X-Gm-Gg: AfdE7clQ7GKi5Tu4LnI1bMWUxCvY6WVL5j1D0JmU8IoDEepq2bwjTzEUsCj3ZsYrzLk
	cSPw6cGAktOxaAwLsJ0iBwlFkTUZCjwZsWE9bs/lpmWOFvB2cOF10ulIONlqkVVACoFsthBom+A
	Gm/QXFflUqhU4IZzijGP3xR6bAuLzGg6Bns4+SkAOcEcMESDctcW4PU1GGnKxMNP03MbnGtOl0Q
	vPgD+CEIyDmlawQumSntIBEz4OlEAeWpI4bX7k8hMgshWoC81qLtzbOLog4h4FwK/L1hsTOXRzr
	K2hhrTnc13pASEbZx+aoijXUQBuH0jgFgpUlx1fEJg/EkcWl6H7bXa9rEDDkHmqd/BEjwH+Kt+z
	LjFLWI1fMHxAnlnn1wXnNx84zgAH2rIji+8ExrEXz/PhlvilbNk/NseWYZ4eeSei0DW1XZ0HHiz
	U+Pw==
X-Received: by 2002:a17:903:32c3:b0:2cc:670d:9b2f with SMTP id d9443c01a7336-2cf349f4041mr28069715ad.33.1784293487195;
        Fri, 17 Jul 2026 06:04:47 -0700 (PDT)
Received: from localhost ([144.24.58.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb7c5sm5234901c88.10.2026.07.17.06.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:04:45 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthew Wilcox <willy@infradead.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jinchao Wang <wangjinchao600@gmail.com>
Subject: [RFC PATCH v2 06/13] mm/kwatch: add lockless per-task context pool
Date: Fri, 17 Jul 2026 09:04:30 -0400
Message-ID: <20260717130430.1902527-1-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717125023.1895892-1-wangjinchao600@gmail.com>
References: <20260717125023.1895892-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A task that enters the watched function needs somewhere to keep its
window state (nesting depth, owned watchpoint, config epoch). The
lookup runs in kprobe and NMI-like contexts, so it must not allocate
or take locks.

Use a preallocated open-addressing array hashed by task_struct
pointer. Slots are claimed with cmpxchg() and released with
smp_store_release(); lookup is a read-only probe sequence. The pool
size (max_concurrency) bounds how many tasks can be inside watch
windows concurrently; excess tasks are simply not tracked.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kwatch/Makefile   |   2 +-
 mm/kwatch/task_ctx.c | 125 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 mm/kwatch/task_ctx.c

diff --git a/mm/kwatch/Makefile b/mm/kwatch/Makefile
index 69c21ae62123..cc6574df0d68 100644
--- a/mm/kwatch/Makefile
+++ b/mm/kwatch/Makefile
@@ -1,3 +1,3 @@
 obj-$(CONFIG_KWATCH) += kwatch.o
 
-kwatch-y := deref.o
+kwatch-y := deref.o task_ctx.o
diff --git a/mm/kwatch/task_ctx.c b/mm/kwatch/task_ctx.c
new file mode 100644
index 000000000000..64383a4429e7
--- /dev/null
+++ b/mm/kwatch/task_ctx.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/slab.h>
+#include <linux/hash.h>
+#include <linux/sched.h>
+#include <linux/log2.h>
+#include "kwatch.h"
+
+static u16 kwatch_ctx_pool_size;
+static u16 kwatch_ctx_pool_mask;
+
+static struct kwatch_tsk_ctx *kwatch_ctx_pool;
+
+/* Pool size is a u16 and indexes a power-of-two hash table, so bound the
+ * request away from both the roundup_pow_of_two() u16 overflow (>32768 wraps
+ * to 0) and the degenerate size-1 case (ilog2(1) == 0 breaks hash_ptr()).
+ */
+#define KWATCH_CTX_POOL_MIN	256
+#define KWATCH_CTX_POOL_MAX	32768
+
+int kwatch_tsk_ctx_prealloc(u16 max_concurrency)
+{
+	if (max_concurrency < KWATCH_CTX_POOL_MIN)
+		max_concurrency = KWATCH_CTX_POOL_MIN;
+	else if (max_concurrency > KWATCH_CTX_POOL_MAX)
+		max_concurrency = KWATCH_CTX_POOL_MAX;
+
+	/*
+	 * Set the size/mask only when actually allocating, so they can never
+	 * drift out of sync with the live pool if prealloc is ever called
+	 * again without a matching free.
+	 */
+	if (unlikely(!kwatch_ctx_pool)) {
+		kwatch_ctx_pool_size = roundup_pow_of_two(max_concurrency);
+		kwatch_ctx_pool_mask = kwatch_ctx_pool_size - 1;
+
+		kwatch_ctx_pool = kcalloc(kwatch_ctx_pool_size,
+					  sizeof(struct kwatch_tsk_ctx),
+					  GFP_KERNEL);
+		if (!kwatch_ctx_pool)
+			return -ENOMEM;
+	}
+	return 0;
+}
+
+struct kwatch_tsk_ctx *kwatch_tsk_ctx_get(bool can_alloc)
+{
+	int start_idx, i, idx;
+	struct task_struct *t;
+
+	if (unlikely(!kwatch_ctx_pool))
+		return NULL;
+
+	start_idx = hash_ptr(current, ilog2(kwatch_ctx_pool_size));
+
+	for (i = 0; i < kwatch_ctx_pool_size; i++) {
+		idx = (start_idx + i) & kwatch_ctx_pool_mask;
+		t = READ_ONCE(kwatch_ctx_pool[idx].task);
+		if (t == current)
+			return &kwatch_ctx_pool[idx];
+	}
+
+	if (!can_alloc)
+		return NULL;
+
+	for (i = 0; i < kwatch_ctx_pool_size; i++) {
+		idx = (start_idx + i) & kwatch_ctx_pool_mask;
+		t = READ_ONCE(kwatch_ctx_pool[idx].task);
+		if (!t) {
+			if (!cmpxchg(&kwatch_ctx_pool[idx].task, NULL, current))
+				return &kwatch_ctx_pool[idx];
+		}
+	}
+
+	return NULL;
+}
+
+void kwatch_tsk_ctx_reset(struct kwatch_tsk_ctx *ctx, u32 new_epoch)
+{
+	struct kwatch_watchpoint *wp = xchg(&ctx->wp, NULL);
+
+	if (wp)
+		kwatch_hwbp_put(wp);
+	ctx->depth = 0;
+	ctx->epoch = new_epoch;
+}
+
+/* Release a slot we hold a pointer to: disarm its wp and free the slot. */
+void kwatch_tsk_ctx_release(struct kwatch_tsk_ctx *ctx)
+{
+	kwatch_tsk_ctx_reset(ctx, 0);
+
+	/* Pairs with READ_ONCE() in kwatch_tsk_ctx_get() */
+	smp_store_release(&ctx->task, NULL);
+}
+
+void kwatch_tsk_ctx_put(void)
+{
+	struct kwatch_tsk_ctx *ctx = kwatch_tsk_ctx_get(false);
+
+	if (unlikely(!ctx))
+		return;
+
+	kwatch_tsk_ctx_release(ctx);
+}
+
+void kwatch_tsk_ctx_release_wps(void)
+{
+	int i;
+
+	if (!kwatch_ctx_pool)
+		return;
+
+	for (i = 0; i < kwatch_ctx_pool_size; i++) {
+		struct kwatch_watchpoint *wp = xchg(&kwatch_ctx_pool[i].wp,
+						    NULL);
+		if (wp)
+			kwatch_hwbp_put(wp);
+	}
+}
+
+void kwatch_tsk_ctx_free(void)
+{
+	kfree(kwatch_ctx_pool);
+	kwatch_ctx_pool = NULL;
+}
-- 
2.53.0

