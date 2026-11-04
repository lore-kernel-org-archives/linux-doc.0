Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811331;
	b=5M+MhA9VESXehagrSMyZQJQi1UhtFu8Zr/HXecWyO/cl4cw/V1u5XUsg6EtZXRL8F1Ts
	 AqQ8QziMdnXooOT4c8NAF1Uu5HlKwWP3m3rIsSkaqgZ4YuQ/x7eY3HCx5GS+SeOMqmMqT
	 8p7qj10f30eIguq9Uk+BqbBZF2dqZJhYekTXIgCVDJu1L0Sdw8FQrsP7fKPv2HPSnvfsS
	 8r85STop8TcC+Hh4TVUKGo0qMCUOkeQXJqWSTGSdbFsp6WDIcv1DkhiDRJhbq2WigT0pu
	 li+QumJNTsDuAoCAj6Lx+5JYOso1CXMWtqRixJVVEFHzb3mgkl2Os5xQB0cX0laowgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=svAmYvSZ5GutHDmHcCUE5c3ghjL8LeEt2/DysvEiXC8=;
	b=pgKnV31p0g7UmNjZdsqE62P40Va7KSlXyy6ykiJj50pUDHIyi7MoYLfxUXmP6TXI9zsk
	 9pn8hR9EL2cbU4elFHvu/fhFsI8nGuftV+NfNI86zrWaGvWIvxnL2ZTsd5SHVkwtOWAAd
	 SI7Z8F9+GzRR5D4RattFxOXZPoJbhBT0oAWAsXNnKtzBzOj3Y30/Gw+F4OzJAbHkKwx4J
	 r6TdMzIT7NPbUBQOjbg2Lof3Qb/5naYQhooDJ+KYNHuGunbDSrhsmTqJ1xl7O5UBVdJRf
	 mtTLaEAv3GsvGMsAqa96uF56gNNp6Nfn4UbsUBng0b4jTmutm9ZJ8HfC+/1e0Z+KT5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0uqz35L;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D836A606A31B
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D836A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0uqz35L
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36d6e342f98so868117eec.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811330; x=1794416130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svAmYvSZ5GutHDmHcCUE5c3ghjL8LeEt2/DysvEiXC8=;
        b=q0uqz35LO15DM4psgbOfG0V+FsAvkp5rl/pScZ0E/Zq8+SfrQji7h6wIFyIc7EcHTU
         Y+lSGlLv/WcQ80KJXV6uMP1oQUKWLoRAUEQvnRpkkrEVTV0eIWFLJMCj+COsZSOKAhV9
         Ph2AUvPaNZdKZwK7RhJvSBeA8edXi4plGh+ULoiBC58GpI+FrF7gPPNSwswEhmvMcjjs
         mP07hEwy3jZ/X/RXk2MggMcaps8ZB/l9D5TJclAtn5NFRsuYSh3mP8fOuT+JQ4UWeBvJ
         rKLlVf8objJ9AdWsPqUmuJSpI+5wM5qVRy+/FCa3HnqVQgdRSPMcwxd70SXcAbdcwATT
         B4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811330; x=1794416130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=svAmYvSZ5GutHDmHcCUE5c3ghjL8LeEt2/DysvEiXC8=;
        b=pHKFHPU6ptr3Vr7QaUqMokL+Eyw7AmiamvJmaPb5WzX+tofBDBbCGYr78ZNuafzNFw
         r1xb21QOh9NxWdwM7+P/OExH4CS5zdBY5w4/3GJNiYT+rVu9bNpmy3+Ki7u0OXPeciwO
         EubeW9vLeqF0n4PrqfSI4bkGVv3BYJip9yWLKdCwthhMM/ht2lxLwOyRapLh0zKR72xT
         1uobqqi5GK1XJoivmgU81PFgfCB5OvRZgaSpRSTl+pe0Mx+HJboZpcmloje08oBjK/J8
         8K7ezpfSx3mYSd+JgBKJo9kNYgeWdYx5mjQUSaF20inqreRDjSjOA2J1mN6mVK9KHi25
         8gdw==
X-Forwarded-Encrypted: i=1; AKwUvBxlpTqng0uLF43p+rzF8/Ber5sZAz5zjBOBCLDZ959FJ3fVLsPRHUm/eGbez5n61I6q6hF5/N2MWE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V8jZ3csA/SNlfnPpkoJwxCScedGv50BTVXrw14avMFJvhW4L9
	8WYVxa6MlNkZpntiT30IquUOy3ked9NaYqRNINl4vwOjOhEh0egW4YUd
X-Gm-Gg: AYBFou1eUy6Njyi2QjzECcKghPhy5zN8i4nMKz4s7NBgUVIO5NNdDpI4+TyRQR6GeTT
	nDsS+nzUVuXMmRPuUoMwqIO/nw/dKtF2gTKHmzH3i9gUmXwYnsBQoINiQsCpofeAl829AhEk9Hy
	JVPFbq9JAKLUc+w71QoczjaTqrsxePh8f4wFUtDm+X7Mu8W0wMEvLXwuqcq4KLrWRqg3TWn2e1J
	EuQ195X69fSA01kyeVJBmHhdhqzOdGdFTtbuINa142WDsSKWYGO5zCP2EvGfJWw38gQqKMxR4kH
	SUUOS8LEhJgY43oolgD4XKrCUFNY0SB0OgJ8ZgKE60/Jg7OBp7eyRMe1d0kEBigwGQGT8UH+fvy
	Md+yhG7xJo3b6L/ardUDG9agqzvheDBLCVFMAqk6xGH++/mnTh8nDT7DfCH+TK0ToGPdX83VRvh
	NLiuWKBwCM2aG+lezPpCdNMdMsjxJ6omsybcIzAs0TVuplOVjILoUmwZifwCEtaVwueXkcRPH2D
	64tUDyq3hCRkzgAChlKuuImBXCvGqJSedF9JJXzy/K/vdf2QOp6i1hEX8O8L9cUmXKUDXs1IsQr
	maK+ensUUjepj4jPuQBPaSuvsMrNI0spBbJZt20=
X-Received: by 2002:a05:7301:4242:b0:358:dfed:d0fe with SMTP id 5a478bee46e88-36a42219d4fmr23626146eec.5.1793811329298;
        Wed, 04 Nov 2026 08:55:29 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:55:28 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 01/28] hazptr: Add shared scan kthread
Date: Thu,  5 Nov 2026 00:54:19 +0800
Message-ID: <20261104165504.2430480-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Batch concurrent hazptr_synchronize() callers into a single kthread
scan.  Waiters sleep on completions instead of busy-waiting.

The kthread processes queued waiters sequentially: for each waiter,
it scans per-CPU slots and both overflow-list phases until the
address is released.  This is the same scan the direct fallback
performs, delegated to a kthread.

Waiters are embedded in the caller's stack frame, so no dynamic
allocation is needed in the synchronize path.  Fall back to the
direct scan if the kthread is unavailable.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/hazptr.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index b06164aac3a7..013c24021c43 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -12,6 +12,10 @@
 #include <linux/mutex.h>
 #include <linux/list.h>
 #include <linux/export.h>
+#include <linux/completion.h>
+#include <linux/kthread.h>
+#include <linux/swait.h>
+#include <linux/sched.h>
 
 #define HAZPTR_WILDCARD	((void *) 1UL)
 
@@ -234,6 +238,145 @@ void hazptr_scan_overflow_list_period(void *addr, unsigned int scan_idx)
 	}
 }
 
+/* Helper: scan both overflow-list phases. */
+static void hazptr_scan_overflow_list_all(void *addr)
+{
+	unsigned int scan_idx = READ_ONCE(hazptr_overflow_list_phase);
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
+
+		hazptr_synchronize_overflow_list(&overflow_list_flip->array[scan_idx], addr);
+		hazptr_synchronize_overflow_list(&overflow_list_flip->array[flip_list_phase(scan_idx)], addr);
+	}
+}
+
+/*
+ * Shared scan: batch concurrent hazptr_synchronize() callers into a
+ * single kthread-driven scan, avoiding redundant per-CPU and
+ * overflow-list walks per caller.  Waiters sleep on completions
+ * instead of busy-waiting.
+ */
+
+struct hazptr_waiter {
+	struct list_head node;
+	void *addr;
+	struct completion done;
+};
+
+struct hazptr_scan_state {
+	struct task_struct *kthread;
+	struct swait_queue_head wq;
+	bool wakeup;
+	struct mutex lock;
+	struct list_head pending;
+	struct list_head scanning;	/* kthread only */
+};
+static struct hazptr_scan_state hazptr_scan;
+
+/*
+ * Queue @addr for the shared scan.  The waiter lives on the caller's
+ * stack, so no allocation is needed.
+ */
+static void hazptr_synchronize_queued(void *addr)
+{
+	struct hazptr_waiter waiter = {
+		.addr = addr,
+	};
+
+	init_completion(&waiter.done);
+	INIT_LIST_HEAD(&waiter.node);
+
+	mutex_lock(&hazptr_scan.lock);
+	list_add_tail(&waiter.node, &hazptr_scan.pending);
+	if (!READ_ONCE(hazptr_scan.wakeup)) {
+		WRITE_ONCE(hazptr_scan.wakeup, true);
+		swake_up_one(&hazptr_scan.wq);
+	}
+	mutex_unlock(&hazptr_scan.lock);
+
+	wait_for_completion(&waiter.done);
+}
+
+static void hazptr_scan_do_cycle(void)
+{
+	struct hazptr_waiter *w, *n;
+	LIST_HEAD(done);
+
+	mutex_lock(&hazptr_phase_lock);
+	mutex_lock(&hazptr_scan.lock);
+	list_splice_tail_init(&hazptr_scan.pending, &hazptr_scan.scanning);
+	mutex_unlock(&hazptr_scan.lock);
+
+	if (list_empty(&hazptr_scan.scanning)) {
+		mutex_unlock(&hazptr_phase_lock);
+		return;
+	}
+
+	/*
+	 * Process each waiter: scan per-CPU slots and overflow lists
+	 * until the waiter's address is released.  This is the same
+	 * scan the direct fallback performs, delegated to a kthread so
+	 * callers sleep instead of busy-waiting.
+	 */
+	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+		hazptr_scan_cpu_slots(w->addr);
+		hazptr_scan_overflow_list_all(w->addr);
+		list_move(&w->node, &done);
+	}
+
+	mutex_unlock(&hazptr_phase_lock);
+
+	list_for_each_entry_safe(w, n, &done, node) {
+		list_del_init(&w->node);
+		complete(&w->done);
+	}
+}
+
+static int hazptr_scan_kthread(void *unused)
+{
+	for (;;) {
+		bool idle;
+
+		swait_event_idle_exclusive(hazptr_scan.wq,
+					   READ_ONCE(hazptr_scan.wakeup));
+		hazptr_scan_do_cycle();
+		mutex_lock(&hazptr_scan.lock);
+		idle = list_empty(&hazptr_scan.pending) &&
+		      list_empty(&hazptr_scan.scanning);
+		if (idle)
+			WRITE_ONCE(hazptr_scan.wakeup, false);
+		mutex_unlock(&hazptr_scan.lock);
+		if (idle)
+			continue;
+		schedule_timeout_idle(1);
+	}
+	return 0;
+}
+
+/*
+ * Initialize the scan kthread.  Failure falls back to the
+ * direct scan.
+ */
+static int __init hazptr_scan_init(void)
+{
+	struct task_struct *t;
+
+	init_swait_queue_head(&hazptr_scan.wq);
+	mutex_init(&hazptr_scan.lock);
+	INIT_LIST_HEAD(&hazptr_scan.pending);
+	INIT_LIST_HEAD(&hazptr_scan.scanning);
+
+	t = kthread_run(hazptr_scan_kthread, NULL, "hazptr_scan");
+	if (!IS_ERR(t))
+		smp_store_release(&hazptr_scan.kthread, t);
+	else
+		pr_warn("hazptr: scan kthread failed, using direct scan\n");
+	return 0;
+}
+core_initcall(hazptr_scan_init);
+
 /*
  * hazptr_synchronize: Wait until @addr is released from all slots.
  *
@@ -261,6 +404,12 @@ void hazptr_synchronize(void *addr)
 	/* Memory ordering: Store A before Load B. */
 	smp_mb();
 
+	/* Pairs with smp_store_release in hazptr_scan_init(). */
+	if (smp_load_acquire(&hazptr_scan.kthread)) {
+		hazptr_synchronize_queued(addr);
+		return;
+	}
+
 	guard(mutex)(&hazptr_phase_lock);
 
 	/* Scan per-CPU slots. */
-- 
2.43.0

