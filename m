Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22856282F19
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 03:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780629026; cv=none; b=LXMkKiBDqAHUzWeSlw3JodlKUncYbUUDwlKQCrnXfw1RrWR8a1seRG6kfNqSGvPSKly0LqDYqmQpWepbXnyzHionTUnW1aKKVcM4c2f8fKJVxOrzC5R9z47pIDbtQatf1iOpRcxfndDOkdJujDieHn9JOQADFM/10wxOerCxvnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780629026; c=relaxed/simple;
	bh=t1mLICHhnLO6Jky0VScBSiBvl0tHQMm8najzZsWVzQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ODNDn/2Z6J2OOpEJUcgCSxmQR6ZbF3jSouqgcWY2d2T1I88A4zDWLfO+7as66nNmZTITDyRRdJ3nm1bewGpbMRPkfcuD8tBePu1Oh/Cy9qg0U2PvcCFhAkkkl4kzMNk5iNJdfYyJCnYxSju/YQQ7N92Ou34NqdFcc0ogKmYkFjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZMC6khA; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZMC6khA"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-36b8d414666so901616a91.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 20:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780629022; x=1781233822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZEmz9CjR/k1fq+15RyyqofRsMPk5Kd3zOMwojBu/vU=;
        b=bZMC6khAH9383EEsSLZQWxJNKeAIderYC6rSNpZKaaS3tQia09QMDGpuru9CzJ8grM
         X6qL16H7ha98TzJrdt4Iq2fProetQIv6cFjRePBzWI9Tp7LW8sldtbbyENsckC3aRYe9
         I7/B3cTWE2CJOCho6lx4mYmrY6UN7oxgGO8bjyMeKn3ejFQ5evtAPOHP2dwb/FTjXHWX
         M0Ei0SM3gr44aXrhsz8wBSBJ0FV5N7jYCaLY7vBXxFmCj5nUPQnpHjf0KEHU48Nec7Fj
         TYNKITtMyoyV//uaJwmGh11GI60dC5sQPuiyRdDwtUNs2/t2zCG8qNF8RuYMZmwgIfQQ
         ifcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780629022; x=1781233822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZEmz9CjR/k1fq+15RyyqofRsMPk5Kd3zOMwojBu/vU=;
        b=FYHnqQ8mUjXMR/eh6NjFE6z8hwqT21LqopAUvlhdMoOee9STM9C1xuz23RY1rF2MEC
         O5egaxnhVYgyfcFjIA8iBEaOPsIjzWlNyCXNetnIVVhu/SFlI7vInZgGb5huKSK/mDeV
         s7kxJHpNi7LdhcC+SbD8BdQMISjmYuyszIium2qk6B3heHVFrT9WhYcNXRmbgJ/wx3NX
         LPiP5KOHrZdQo62/QNWwixD25Ips3b165pGCA80x5h6NTUYcqzjTmF31tXeM+SIpd6+H
         9LO8+qk7sfJwEn1DBqutbqH5GjEJmwEBA9TEVORpgY0ddrAbiixQ9keVTnqTTLKGESHj
         gjLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KPJmz/hy55C5dfvjuC9RF6c3F7d1KgfgwURVsYtOjbzyCDBuyn+xNKOrpe9dnDVuu8/cvi5+eZBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDvHcHBy5dUrerDaZJK77BzVa7CkYwfSczlya+kmPYFh0QdQ7e
	F7cxaJ7Z8GNb8Svb2sNaTw+BGbUKixlVMeDsB+vbRPVufCPbcmxeb/Av
X-Gm-Gg: Acq92OH0AbHC2gXHWftedcZPO6pqoOdqiL/GaU19X4Y7g5JzBJoJT2TQI5aRzlhCSla
	zrwny+4sxOgXzAcxztbW2ZReSkpzbQgZUj6EuosAorwf5rp1USkf2WJjjF6AFyDKnhpnLRObLzw
	CR4s2jKtyT57s0MthLNeLBzyYCYWfsN40yuEqNceXCme8bS6Ys5eSRU38ChEKnHgejoZ3EFEs7o
	nh2SuF7KMl7MQcfz2qP5P0HqjCkQcndXTEMJhTDJDgAlBByXTlRrmY8olTJM8cI+Ik0TwzS7GMY
	0KrSnY/wppIs2ZWaDhIxK6bbptGllciQS4HZRKssWMJTyvGmK2/ctwnhocr6iD3rzCSN6VFVRP4
	r1GNyC/mE/SZbe6BgYoANe9TOXhJsRR8j9zKqGhmIQaUMT+y41iwPsks7Iv6IVvOs/0nlEooznQ
	2DoEChpKwCLHzpzD1ZYZ838LZjraymetU=
X-Received: by 2002:a17:90a:fc45:b0:36d:a510:f8eb with SMTP id 98e67ed59e1d1-370eeff1e46mr1595157a91.3.1780629022034;
        Thu, 04 Jun 2026 20:10:22 -0700 (PDT)
Received: from kernel.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37133082519sm295006a91.1.2026.06.04.20.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:10:21 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: sj@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Wang Lian <lianux.mm@gmail.com>
Subject: [PATCH] Docs/damon: add TLB flush policy document
Date: Fri,  5 Jun 2026 11:10:08 +0800
Message-ID: <20260605031008.397328-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

DAMON avoids TLB flushes after clearing PTE Accessed bits for sampling.
The overhead was measured and found significant [1].  Production
workloads with large working sets flush TLB buffers naturally, so
accuracy impact is negligible.

On systems with large TLB buffers and small test workloads, stale TLB
entries persist across sampling intervals and produce false negatives.
This comes up repeatedly on the mailing list and in private inquiries
[2][3].

Add a document on the design decision, trade-offs, test environment
problems, and recommendations.

Link: https://lore.kernel.org/20200403103059.12762-1-sjpark@amazon.com [1]
Link: https://lore.kernel.org/20260117020731.226785-3-sj@kernel.org [2]
Link: https://lore.kernel.org/all/20260526145034.91594-1-sj@kernel.org [3]

Co-developed-by: Wang Lian <lianux.mm@gmail.com>
Signed-off-by: Wang Lian <lianux.mm@gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/mm/damon/index.rst     |   1 +
 Documentation/mm/damon/tlb_flush.rst | 131 +++++++++++++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 Documentation/mm/damon/tlb_flush.rst

diff --git a/Documentation/mm/damon/index.rst b/Documentation/mm/damon/index.rst
index 318f6a7bfea4..5e239437dab3 100644
--- a/Documentation/mm/damon/index.rst
+++ b/Documentation/mm/damon/index.rst
@@ -19,6 +19,7 @@ DAMON is a Linux kernel subsystem for efficient :ref:`data access monitoring
 
    faq
    design
+   tlb_flush
    api
    maintainer-profile
 
diff --git a/Documentation/mm/damon/tlb_flush.rst b/Documentation/mm/damon/tlb_flush.rst
new file mode 100644
index 000000000000..394f7b86102a
--- /dev/null
+++ b/Documentation/mm/damon/tlb_flush.rst
@@ -0,0 +1,131 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================================
+DAMON TLB Flush Policy
+==========================================
+
+:Author: Kunwu Chan <kunwu.chan@gmail.com>
+:Author: Wang Lian <lianux.mm@gmail.com>
+
+Overview
+========
+
+DAMON monitors data access by sampling PTE (Page Table Entry) Accessed bits
+using ``ptep_test_and_clear_young()`` and ``pmdp_test_and_clear_young()``.
+These functions clear the Accessed bit but do **not** flush the TLB
+(Translation Lookaside Buffer).  This is an intentional design choice.
+
+Questions about this behavior come up repeatedly, both on the mailing list
+and in private inquiries.  This document describes the reasoning, the
+trade-offs, and recommendations for users and testers.
+
+Background
+==========
+
+DAMON's access check works as follows:
+
+1. Clear the PTE Accessed bit for a sampled page.
+2. Wait for one ``sampling interval``.
+3. Check if the Accessed bit has been set again by the hardware.
+
+If the bit was set again, the page was accessed during the sampling interval.
+
+On architectures with hardware-managed TLB (e.g., x86, arm64), the CPU may
+cache the Accessed bit state in the TLB.  After DAMON clears the Accessed bit
+in the page table, a stale TLB entry with the old Accessed bit remains in the
+TLB.  When the workload accesses the page, the access hits the stale TLB
+entry and does not trigger a page table walk, so the Accessed bit in the page
+table is not set again.  DAMON therefore fails to detect real accesses on its
+next check, reporting false negatives.
+
+Flushing the TLB after clearing the Accessed bit prevents stale TLB entries
+and eliminates this problem.  Functions such as ``ptep_clear_flush_young()`` and
+``pmdp_clear_flush_young()`` provide this behavior.  However, TLB flushes come
+at a performance cost.
+
+Why DAMON Does Not Flush TLB
+============================
+
+DAMON intentionally avoids TLB flushes to keep monitoring overhead low.
+The decision was made after measuring the performance impact of adding TLB
+flushes to the sampling path.  The measurement showed the overhead is
+significant enough to matter for production use [1]_.
+
+Production workloads typically have large working sets that flush TLB buffers
+anyway through normal memory access patterns.  Stale TLB entries that could
+cause monitoring inaccuracies are evicted by the workload's own memory activity
+before the next sampling interval.  The accuracy impact is therefore negligible in
+production.
+
+The following table summarizes the trade-off:
+
++---------------------+-----------------------------+---------------------------+
+|                     | Without TLB Flush (current) | With TLB Flush            |
++---------------------+-----------------------------+---------------------------+
+| Monitoring Overhead | Low                         | Higher (flush cost)       |
++---------------------+-----------------------------+---------------------------+
+| Accuracy (prod)     | Good                        | Good                      |
++---------------------+-----------------------------+---------------------------+
+| Accuracy (test)     | May degrade                 | Good                      |
++---------------------+-----------------------------+---------------------------+
+
+Impact on Testing and Small Workloads
+=====================================
+
+The lack of TLB flush becomes problematic when the working set is small enough
+to fit entirely within the TLB reach.  This is common in test environments
+and synthetic benchmarks.  In such cases, stale TLB entries persist across
+sampling intervals, so DAMON reports false accesses and monitoring results
+become incorrect.
+
+For example, on a machine with a large TLB buffer, a test workload of a few
+tens of megabytes may never experience TLB eviction.  DAMON's WSS (Working Set
+Size) estimation can report 100% error (all regions reported as accessed,
+or none reported as accessed depending on timing), and DAMOS schemes may never
+trigger correctly.
+
+This issue was observed in DAMON selftests and was addressed by increasing the
+test working set size to simulate production-like conditions, rather than
+changing DAMON's TLB flush behavior [2]_.  The selftest working set size was
+increased up to 160 MiB for this reason.
+
+Recommendations
+===============
+
+For Users
+---------
+
+If you observe unexpected ``nr_accesses`` values or inaccurate working
+set size estimates, the cause is likely stale TLB entries from DAMON's
+sampling without TLB flushes.  This happens when the working set fits
+within the TLB reach, which is uncommon for production workloads but can
+occur with small workloads.  See the For Testers section below for
+how to verify this.
+
+For Testers and Developers
+--------------------------
+
+When writing DAMON tests, ensure the test workload's working set is large
+enough to trigger natural TLB eviction on the target test machine.  The
+exact size depends on the CPU's TLB configuration.  The DAMON selftest for
+WSS estimation uses 160 MiB per region after finding smaller sizes
+unreliable on systems with large TLB buffers [2]_.
+
+For out-of-tree tests, gradually increase the working set size until DAMON
+reports stable and accurate results, then use that size as the baseline for
+subsequent tests on the same hardware.
+
+If DAMON reports unexpectedly high ``nr_accesses`` or empty
+``tried_regions``, the ``diagnose_empty_tried_regions.py`` script from
+DAMON selftests can help determine whether stale TLB entries are the cause.
+
+The existing DAMON selftests follow this approach [2]_.
+
+References
+==========
+
+.. [1] `DAMON TLB flush overhead measurement
+   <https://lore.kernel.org/20200403103059.12762-1-sjpark@amazon.com/>`_
+
+.. [2] `DAMON selftest: increase working set size for reliable results
+   <https://lore.kernel.org/20260117020731.226785-3-sj@kernel.org/>`_
-- 
2.43.0

