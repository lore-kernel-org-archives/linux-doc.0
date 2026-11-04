Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811340;
	b=T3nhxnXHZB2WGL5V8pYBvNmmz/gj/kMbaJo5OdId/ni41juClveu5Elh6rv+e+lRoWe/
	 roGlpghl6ewCmsvXp4dzXrvIDXlYOSwHxzKgCEiO7eraowlGUNEpR80yqYiZ5Hn6a8T5g
	 FVtRuoicMj7eC3XAW2aERhenmr1jz9+5nBaaaz6LHT66TuMQjy3dbcmEhPy7vVvWHPwCf
	 aAEEaBGzXKgL5V+zlG5DtdXPi5mbWYXiQ+zIkD/yv9VRPHsZ/EdvN9Rp9O9JqqW2nf9T7
	 YVHg2UQNnb4PoSFpvXpC5owozoe/Gtka6674Ih4+k+J6A2gB0VgRxuVIqr75pZW/hAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GfiEJ9ZFFgFLvm1lz7uB9aBGd1QKPWSUh66STtJdHAI=;
	b=xP0XyD7AxZqCaoT9g9HNLH//nM0eFceASGhkpPkL9rbZ+1Z7l4lEmGp0tAj8/6JfYxeN
	 nDDHhKHJM3KsJxRajjbgTgWdQTZeHm4Dq+7l9UQcMlTc3vkw8DZcYPNz/ebGwv1wlMqcq
	 yxrqIFak82Ma660TXKnf1+geIBjPC/vjPfOQG+P87lKS/kyMiMCXEHkjKHICPvKzYHfv4
	 3GD4onXugUexLQbkSm0Q8qhO/7xiEFJwA8QqevcI2+UBPry3vKk5QxSuAc4T0bNp5HW1n
	 WeZkVlAf37KI+mjG4kKZv1MdgLl8wdQJXDmo8aog6zBWhzPH1PzKAPWED17bsUDIUZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xf8O32Ua;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1D6606A329
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F1D6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xf8O32Ua
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36661f953e4so1255233eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811339; x=1794416139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfiEJ9ZFFgFLvm1lz7uB9aBGd1QKPWSUh66STtJdHAI=;
        b=Xf8O32Ua/K8LxgJ7sbXqPBXwHkdxv+vRskincGO6vQ8zK5h53QtNjUPd8nry9ho1vA
         mq3AQCf2j1Maalwu9nkipJdcNSPBYC2HFJb/NFANPgqiJizNEjsATBqouJtGp6zEIQYf
         7utJvj219RiRm8VRVUOSFJ8ZGEL4Ogl3NHLkKzfqtwlbzhI0HAX9qz4snpqtOquj/B2w
         i1Gu/j4GQC7q4v0kPmLiZfC9weAuK+JEDz1HAY8QW1Z3Nptb6wZdfjd+/eOm8tqXO7qq
         oALi8+Ui0UkS1BmtB4upr9haqFcHba+mcLaJ8w7DFFDmc2nOpogToR5/72TEAU7M7e0d
         fa5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811339; x=1794416139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GfiEJ9ZFFgFLvm1lz7uB9aBGd1QKPWSUh66STtJdHAI=;
        b=SucBb9kJZDF0cijqYVykJZ22Xt7xJLvzQlm6IQl5pUNDut9I2/LYPG3uEvZmg1/amH
         N5pEbx2qMdVijbmR5FmH4uDxnNpwA1mjsiJq/Q/mwipMd+FQ4Llxyg9ZGZkI8nzPYDum
         pxnjXocF8c6DCNKCsvdLHdUDhzirU62K6sul5qp8nAj/irj4VoVQ/s98FdybNSN5UfrQ
         P6MfviS8dhVhhlGbLCsLPO+ewGVJ6PZ54Anuc3wfF1IY0k/RCZRdx44ApFcghw/n/OzA
         iTPDUrvc2GsMjYyr+61BN9KBeWOwDf07b5TPcpqJeNDAFBtiEMygVcCtf00yz3bW78yF
         fvBw==
X-Forwarded-Encrypted: i=1; AKwUvBwEWCvRs6QGbCODF449W2FrI6IEKckSI5mOsel1x78FiBXpRVXSofUWK1PmzROJVaJYEi5/U65v2/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uHxR34MYlEH7IOP6I84GPYLMjooh13RXCJshC5uQiTXAQGv8x
	qFDUzXJY07jKDy6Z/K0tVgCN8ai4+MEnEaXxOWAxQgkPEaQtoQMvUSgR
X-Gm-Gg: AYBFou1+WyYaKCnmTOfLaE+DjkxzBDEIaYJSbwXKhk1gMxbai4qlGk2InHaluhE50U0
	OBimIvxnPCCyCPsa7I+uePn6tMxnOKyyvdnQvAcwGmW6BcX+rBLEeTuXB3tIvYoTqMGgPTIiipQ
	4nLyXYmYtWcV34wXBylT624IPSF1YovKdf+TBVa4OMNFZqtuRTEeG1MaDxJq9DQjjKLf6zaMH14
	FrAD1VaacYaCKwLJNMJEfMsLx4wFQPBe1t80PrVbvXQaiUGpcMubHcM0/5QsWK7cfBTbwiq3Na+
	rSvclBhnMSJOSA6Zcspzhy17h+c3c/dIqkIEytFUGgKpg5jXmtYEcQ4nWklmUvZiVrQw+WhM+6U
	xKvui7toJryNEAH49t1mPiJg28K/rKynTWlFSaY12em1WPVkPlqApA+JSfujmv4gabxbUsrUi87
	8ViYnTzdXISVvGQVUEhh1y5jwDQyRRJEhfwg9RTDxJQ/G5FBCDCyO3JaQCDH/tuZTGbVADDH3Hp
	Xk6RML4GiTt8SkcQgKAGe+PYyciv7TO55OLms0K8h/R6waFxo3pJbGidcSKLT7+zfF++Mevt3U4
	PBcYuo4ygKC+EOITMQ/CIqtIZktBm05ERJcdpE4=
X-Received: by 2002:a05:7300:dd42:b0:36a:7c69:3f83 with SMTP id 5a478bee46e88-36c8d2540fcmr6653140eec.3.1793811338443;
        Wed, 04 Nov 2026 08:55:38 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:55:37 -0800 (PST)
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
Subject: [PATCH 02/28] hazptr: Use Bloom filter for shared scan waiters
Date: Thu,  5 Nov 2026 00:54:20 +0800
Message-ID: <20261104165504.2430480-3-kunwu.chan@gmail.com>
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

Replace the per-waiter sequential scan with a shared Bloom filter
built during a single walk: each observed non-wildcard address
sets three bits.  A waiter whose address hashes to an unset bit
can be completed without another slot walk.

A Bloom filter has no false negatives, so an address absent from
the scan cannot be held by an observed slot; false positives only
delay completion to a later scan cycle.

The filter uses a one-page bitmap with three multiply-shift hash
functions.  It lives in the hazptr_scan_state and is only touched
by the scan kthread.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/hazptr.c | 122 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 116 insertions(+), 6 deletions(-)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 013c24021c43..059c356ceaa7 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -16,6 +16,8 @@
 #include <linux/kthread.h>
 #include <linux/swait.h>
 #include <linux/sched.h>
+#include <linux/bitops.h>
+#include <linux/bitmap.h>
 
 #define HAZPTR_WILDCARD	((void *) 1UL)
 
@@ -57,6 +59,12 @@ unsigned int flip_list_phase(unsigned int phase)
 	return 1 - phase;
 }
 
+static
+bool is_wildcard(void *addr)
+{
+	return (unsigned long)addr == (unsigned long)HAZPTR_WILDCARD;
+}
+
 static
 struct hazptr_slot_item *hazptr_get_free_percpu_slot_item(void)
 {
@@ -252,6 +260,98 @@ static void hazptr_scan_overflow_list_all(void *addr)
 	}
 }
 
+/* Number of hash functions for the Bloom filter. */
+#define HAZPTR_BLOOM_HASHES 3
+
+/* Number of bits in the Bloom filter bitmap: one page. */
+#define HAZPTR_BLOOM_NBITS (PAGE_SIZE * 8)
+
+struct hazptr_bloom {
+	unsigned long map[PAGE_SIZE / sizeof(unsigned long)];
+};
+
+/*
+ * Multiply @addr by a per-hash odd constant and use the high bits
+ * as the Bloom filter index.
+ */
+static unsigned long hazptr_bloom_hash(void *addr, unsigned int i)
+{
+	static const u64 mult[HAZPTR_BLOOM_HASHES] = {
+		0x9E3779B97F4A7C15ULL,
+		0xC2B2AE3D27D4EB4FULL,
+		0x165667B19E3779F9ULL,
+	};
+	u64 hash = (u64)(unsigned long)addr * mult[i];
+
+	return hash >> (64 - ilog2(HAZPTR_BLOOM_NBITS));
+}
+
+static void hazptr_bloom_reset(struct hazptr_bloom *bloom)
+{
+	bitmap_zero(bloom->map, HAZPTR_BLOOM_NBITS);
+}
+
+static void hazptr_bloom_add(struct hazptr_bloom *bloom, void *addr)
+{
+	unsigned int i;
+
+	for (i = 0; i < HAZPTR_BLOOM_HASHES; i++)
+		__set_bit(hazptr_bloom_hash(addr, i), bloom->map);
+}
+
+static bool hazptr_bloom_contains(const struct hazptr_bloom *bloom, void *addr)
+{
+	unsigned int i;
+
+	for (i = 0; i < HAZPTR_BLOOM_HASHES; i++)
+		if (!test_bit(hazptr_bloom_hash(addr, i), bloom->map))
+			return false;
+	return true;
+}
+
+/*
+ * Walk all slots and record observed non-wildcard addresses into
+ * the Bloom filter.  A single pass suffices on the try_acquire
+ * fast path (readers publish their target directly).
+ */
+static void hazptr_scan_walk(struct hazptr_bloom *bloom)
+{
+	int cpu;
+
+	hazptr_bloom_reset(bloom);
+
+	for_each_possible_cpu(cpu) {
+		struct hazptr_percpu_slots *percpu_slots = per_cpu_ptr(&hazptr_percpu_slots, cpu);
+		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
+		unsigned int idx;
+
+		for (idx = 0; idx < NR_HAZPTR_PERCPU_SLOTS; idx++) {
+			struct hazptr_slot_item *item = &percpu_slots->items[idx];
+			void *v;
+
+			v = smp_load_acquire(&item->slot.addr);
+			if (v && !is_wildcard(v))
+				hazptr_bloom_add(bloom, v);
+		}
+		for (int i = 0; i < 2; i++) {
+			struct hazptr_overflow_list *list = &overflow_list_flip->array[i];
+			struct hazptr_backup_slot *b;
+			unsigned long flags;
+
+			raw_spin_lock_irqsave(&list->lock, flags);
+			hlist_for_each_entry(b, &list->head, overflow_node) {
+				void *v;
+
+				v = smp_load_acquire(&b->slot.addr);
+				if (v && !is_wildcard(v))
+					hazptr_bloom_add(bloom, v);
+			}
+			raw_spin_unlock_irqrestore(&list->lock, flags);
+		}
+	}
+}
+
+/* Need is_wildcard for the Bloom filter */
 /*
  * Shared scan: batch concurrent hazptr_synchronize() callers into a
  * single kthread-driven scan, avoiding redundant per-CPU and
@@ -272,6 +372,7 @@ struct hazptr_scan_state {
 	struct mutex lock;
 	struct list_head pending;
 	struct list_head scanning;	/* kthread only */
+	struct hazptr_bloom bloom;	/* kthread only */
 };
 static struct hazptr_scan_state hazptr_scan;
 
@@ -315,19 +416,28 @@ static void hazptr_scan_do_cycle(void)
 	}
 
 	/*
-	 * Process each waiter: scan per-CPU slots and overflow lists
-	 * until the waiter's address is released.  This is the same
-	 * scan the direct fallback performs, delegated to a kthread so
-	 * callers sleep instead of busy-waiting.
+	 * Walk all slots and record observed addresses into the
+	 * Bloom filter, then complete waiters whose address is
+	 * not present.  On the try_acquire fast path, readers
+	 * publish their target directly (no wildcard transient),
+	 * so a single pass suffices.
 	 */
+	hazptr_scan_walk(&hazptr_scan.bloom);
+
+	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+		if (!hazptr_bloom_contains(&hazptr_scan.bloom, w->addr))
+			list_move(&w->node, &done);
+	}
+
+	mutex_unlock(&hazptr_phase_lock);
+
+	/* Waiters still blocked: their address was observed present. */
 	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
 		hazptr_scan_cpu_slots(w->addr);
 		hazptr_scan_overflow_list_all(w->addr);
 		list_move(&w->node, &done);
 	}
 
-	mutex_unlock(&hazptr_phase_lock);
-
 	list_for_each_entry_safe(w, n, &done, node) {
 		list_del_init(&w->node);
 		complete(&w->done);
-- 
2.43.0

