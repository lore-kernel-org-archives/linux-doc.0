Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160886;
	b=TyR2mE/BjjC6FVvtTQ1JGgZMkJQhpBTmUCNvvqIyetZ1qf7Ik4fU058o1uZdFjz73duY
	 FJDN/IyKNLansO0uuK63ZtbROdbe94sYzptEkIQxBKJFUBG1zvBasF5Ozn0B63j4wh4SA
	 smB8xEZBd0yHaUqic+ZwePmoz44Lv/L3JzSR1gWiya5rbX7fPWFmGtPtHolUt6gFelu5S
	 bKuiYYxYIHXVFKqhnUEb1lfo1ibcokeoyMh3XJ+hyo0N3Glqm4CcFypjDrle1e52mSMYl
	 bX7JBd1IAOkzXouj8JC17qyFsXV79Qw1EWwcIZ/4VC6Ltya3yLgJAZEzgMMiV61OrRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160886;
	h=DMARC-Filter:DKIM-Signature:Subject:X-Original-From:X-Mailer:
	 In-Reply-To:To:From:Date:X-Lms-Return-Path:Content-Transfer-Encoding:
	 Cc:Message-Id:Content-Type:Mime-Version:References;
	bh=KU/0A4X+KAaLkdtLWi9oM8/JR72sv7pM4/duoNwVWJs=;
	b=x6+egkC22k3TLS2L5LXu9BLWs6Y8Dwc7PBRexu+QFs7fhFJXB7e3fae+A7nehOxA8dBK
	 BPssmKMmNtxKWQ+EhAFaztkwp3KelwbrjoleIqlU1Xl4KiojrXWQfBaJFIyEZohNM9yPW
	 zC4Nt/7CmK2WeWbgQ/H5ipZJkLapw5p/ZAbFl0eObdPKZptXGd6WFxPzdPwdIq6Si119O
	 J/SyA+HoQvcYPEkIYlC/xk5j2mWAPpmbw0fQgrme6f16nAA/BwDzF2iZkDuxWHJh88oRN
	 X/5idL+wqOB9xFFtO07RIOX08cRRkm0RkkIOs2L/dMZlBphVa5hoM73udAVZhgEs8Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=XXbSx7eL;
	arc=none smtp.remote-ip=209.127.230.114
Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBBB606A324
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 04:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FBBB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=XXbSx7eL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793160879; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=KU/0A4X+KAaLkdtLWi9oM8/JR72sv7pM4/duoNwVWJs=;
 b=XXbSx7eLYDocUKAVPFz96s7iHNCtBWnzh5RGvprfSAOtgjov7vGLJCeY6lstCUgdhf9RUH
 p0EBvrsDdCnfzPCQoKbN2L5OOZXYaBIf6mTEZwwtvbpyJphS2DQXBI5+sywEacaZSecLTn
 gkVdy8J/6emXRZDD9z+mlZwOfTE0I9qe6ASup2D1zAoS8lyLJT/XxZXDEzJEbd5RoJnu+0
 qhvFNc1j+ots3oaJVxsx3AXzOk5Tv2A2yCRCrQHTYIJtccSiABF+lAfpgFdUOzFVpMaPWa
 S9o5kw6b+iPc4XuswspbS+mLqs97xS/t6yJqEROXs7t8VHedytes2hJb8uD5Zg==
Subject: [PATCH v2 2/3] sched/numa: do not feed tiering promotions into task placement stats
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261028041253.74839-1-lizhe.67@bytedance.com>
To: <akpm@linux-foundation.org>, <bsegall@google.com>, <david@kernel.org>, 
	<dietmar.eggemann@arm.com>, <gourry@gourry.net>, 
	<joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <riel@redhat.com>, 
	<rostedt@goodmis.org>, <vincent.guittot@linaro.org>, 
	<vschneid@redhat.com>, <ziy@nvidia.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Wed, 28 Oct 2026 12:12:52 +0800
X-Lms-Return-Path: <lba+26ae176ad+81d302+vger.kernel.org+lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20261028041253.74839-3-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028041253.74839-1-lizhe.67@bytedance.com>

NUMA balancing has separate mode bits for normal task placement and
memory tiering. In memory-tiering-only mode, NUMA hinting faults on
slow-tier pages are used to detect hot pages and promote them to a top
tier. They are not normal task-placement faults.

For slow-tier folios, memory tiering reuses the folio last-cpupid field
to store access-time metadata. numa_migrate_check() therefore cannot
return a real cpupid for those faults. Before this change, it returned the
same all-ones last_cpupid value that normal AutoNUMA uses for a first or
unknown access.

That can make a memory-tiering-only promotion look like an ordinary first
private AutoNUMA fault. After a successful promotion, do_numa_page()
reports the target top-tier node to task_numa_fault(), so the existing
slow-node skip no longer applies. task_numa_fault() then accounts the
fault in p->numa_faults and p->numa_faults_locality, and
task_numa_placement() can consume that sample to update normal task
placement state even though normal NUMA balancing is disabled. In other
words, hot-page promotion feedback can leak into the CPU placement
heuristic.

Mark faults that carried access-time metadata with TNF_ACCESS_TIME. If
normal NUMA balancing is disabled, keep the migrated-page accounting but
skip normal task-placement accounting for those faults.

When normal NUMA balancing and memory tiering are both enabled, promoted
pages can still feed task placement. In that mode, the user has enabled
both CPU placement feedback and tiering promotion, so a promoted top-tier
fault is treated as an ordinary unset-cpupid AutoNUMA fault.

This does not change whether a page is promoted. It only prevents
memory-tiering-only promotion faults from being consumed by the normal
AutoNUMA placement heuristic.

Using a fault flag avoids reserving an in-band value from the cpupid
namespace, where any masked value may also be produced by a real CPU/PID
pair.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 include/linux/sched/numa_balancing.h |  1 +
 kernel/sched/fair.c                  | 13 +++++++++++++
 mm/memory.c                          |  6 ++++--
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched/numa_balancing.h b/include/linux/sched/numa_balancing.h
index 52b22c5c396d..200f50075d5c 100644
--- a/include/linux/sched/numa_balancing.h
+++ b/include/linux/sched/numa_balancing.h
@@ -14,6 +14,7 @@
 #define TNF_SHARED	0x04
 #define TNF_FAULT_LOCAL	0x08
 #define TNF_MIGRATE_FAIL 0x10
+#define TNF_ACCESS_TIME	0x20
 
 enum numa_vmaskip_reason {
 	NUMAB_SKIP_UNSUITABLE,
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 46a11f5ddafb..136207b62d87 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4149,6 +4149,19 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
 	if (!p->mm)
 		return;
 
+	/*
+	 * Slow-tier pages use last_cpupid as access-time metadata instead of
+	 * a real cpupid. Do not feed these faults into normal task placement
+	 * when normal NUMA balancing is disabled.
+	 */
+	if (flags & TNF_ACCESS_TIME) {
+		if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL)) {
+			if (migrated)
+				p->numa_pages_migrated += pages;
+			return;
+		}
+	}
+
 	/*
 	 * NUMA faults statistics are unnecessary for the slow memory
 	 * node for memory tiering mode.
diff --git a/mm/memory.c b/mm/memory.c
index 0fb676dd2bd6..00b171e2fe23 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6241,10 +6241,12 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 	 * For memory tiering mode, cpupid of slow memory page is used
 	 * to record page access time.  So use default value.
 	 */
-	if (folio_use_access_time(folio))
+	if (folio_use_access_time(folio)) {
+		*flags |= TNF_ACCESS_TIME;
 		*last_cpupid = (-1 & LAST_CPUPID_MASK);
-	else
+	} else {
 		*last_cpupid = folio_last_cpupid(folio);
+	}
 
 	/* Record the current PID accessing VMA */
 	vma_set_access_pid_bit(vma);
-- 
2.20.1
