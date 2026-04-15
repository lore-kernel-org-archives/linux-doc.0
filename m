Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF811DE894;
	Wed, 15 Apr 2026 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257755; cv=none; b=V5WowTCxKoBQWNn1FfdRcIFG5SUrETKH5PXVPVLl5Hb2+cLvtRl6MtfbxcncNnj/11iBpq/O6h5/uF2oYlfYpEEpk5Eqwd/Zg3K8MqkfXGNRu8u0xYkXCK7t1CgTSNygLYLdlo0OgwyLc3nQ4p8caEKIN7Zw3u5ZKpr7NbGGH48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257755; c=relaxed/simple;
	bh=IKxZY+QCBI1vssaB8Z4zLZVgxsls9tCS4vJ5EhuGOy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n6L3A/62GNDVdeGg4XqZBMOStZDHfraQ6vd2NlDpW/bEZfQngQ7dXUEEgN9MxbgBjQZke3lzmoVWX6CFDQTVoUwnKG9eKm7mqIRVtD10FAErMSZJLA3sBKi0GC08jpl/Amxg0yxBL67QNC2D43yoJzgT9tIKa3HP5+onsX8+zio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ZKuk2y4e; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ZKuk2y4e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=81PtAqf4EEJbz8tHNP/52MeVt8twHrcmo+JkGArzbSs=; b=ZKuk2y4efzxsb/lHX6Zcesie92
	ydtLVlZHMelFevN+NiBL91t4uWIwkxUJbFEl+nk45EcNWOojnmBqypiqXVgKAFyuHSZRxISrxSzwz
	xttF4FPHLTrWoD593KekIA78Jqu/BIoLvV8kSOPTyCiNgZFvEzEVLpNmf9O/CPyiD0++QiIur9HjU
	eAdUEW3XECc5pW5p8RUIpBHbWtNNxWM1N+vTLcCFGLhXxV7FgNkJYri3UU+syFdM0lzXHCaf7yvJE
	VghBMGliM+cpUhPRnZ1bi/gtpOiyPqTrCZ8dId+NOzO3C8UhYhFohMlFb3yK6WOj2i64LHg729bdM
	QGx6rFAA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCzmX-00Dqp4-2l;
	Wed, 15 Apr 2026 12:55:50 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 15 Apr 2026 05:55:01 -0700
Subject: [PATCH v4 2/3] mm/memory-failure: add panic option for
 unrecoverable pages
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-ecc_panic-v4-2-2d0277f8f601@debian.org>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
In-Reply-To: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=6778; i=leitao@debian.org;
 h=from:subject:message-id; bh=IKxZY+QCBI1vssaB8Z4zLZVgxsls9tCS4vJ5EhuGOy8=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp34rHH7UCpnidfUCEs2zkTLG1E2h07NZhpz0Zi
 25WmTkVjO+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCad+KxwAKCRA1o5Of/Hh3
 bWT3D/9jw9NwgA9KE/D8EiduG6QhX1Hs1DLTPLwaHjYM0qy8X5cwuGe9ZgfbeIl0+iMHubfnquQ
 2w/9O+5Oug9I9yNGdzIVCbnWfuCNLYABfSUHYToeL3/54ZzMB2u5aGA54c5lq9KYl4O0pYSptDD
 JD4Ep0uKeSwxiNZVgxZyPMa2nSio9PS8Ov4ajeJ5ASFxjhMndbxHVdNPZSwrn4ktb9+4Z7ZiP+2
 6ks/vXWy+slzptymRHjfCjjEuwxE4hhlwi0SbpA52GWJ+enwpov11zma0liEiYa9EkfhffJV7d8
 yts2HX30+m6oWgVAEku309czHPftjgQ6JGktm8vo0Eqjh8xRbAP4UBKpKovmu7ZBcWFa93tvAgO
 6i+kP99wxSueZn+9yvG6MNHTaDIyYkWksJ9lJGA0DkAN1/mVA2FH2Zw0z4hsxtNtN8D2tM/Fv6G
 pFt9K6g8Zn5l5TrdQhDIUmk+swl9vkuU7Ws5ahxG1pPE5z21wOaO/m43vn8BPc/Kfr7xWk7LZaX
 DN9AgbqJquqJcbHj88wnDpE1iqaeW3GqUuIATBEYebj9sxbG/bxoIfJYCuXDKMXAWMh6BBph81z
 BtAMc8YPsQU4NeiI5lbDVa5zeWo2n7mQ87Bcfr8z3hTYQ8mM573PQEk7knBpYbxwBebBOjfOo23
 SC/ibS11Q+g+tqA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Add a sysctl panic_on_unrecoverable_memory_failure that triggers a
kernel panic when memory_failure() encounters pages that cannot be
recovered. This provides a clean crash with useful debug information
rather than allowing silent data corruption.

The panic is triggered for three categories of unrecoverable failures,
all requiring result == MF_IGNORED:

- MF_MSG_KERNEL: reserved pages identified via PageReserved.

- MF_MSG_KERNEL_HIGH_ORDER: pages with refcount 0 that are not in the
  buddy allocator (e.g., tail pages of high-order kernel allocations).
  A TOCTOU race between get_hwpoison_page() and is_free_buddy_page()
  is possible when CONFIG_DEBUG_VM is disabled, since check_new_pages()
  is gated by is_check_pages_enabled() and becomes a no-op. Panicking
  is still correct: the physical memory has a hardware error regardless
  of who allocated the page.

- MF_MSG_UNKNOWN: pages that do not match any known recoverable state
  in error_states[]. A theoretical false positive from concurrent LRU
  isolation is mitigated by identify_page_state()'s two-pass design
  which rechecks using saved page_flags.

MF_MSG_GET_HWPOISON is intentionally excluded: it covers both
non-reserved kernel memory (SLAB/SLUB, vmalloc, kernel stacks, page
tables) and transient refcount races, so panicking would risk false
positives.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/memory-failure.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 7b67e43dafbd1..311344f332449 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -74,6 +74,8 @@ static int sysctl_memory_failure_recovery __read_mostly = 1;
 
 static int sysctl_enable_soft_offline __read_mostly = 1;
 
+static int sysctl_panic_on_unrecoverable_mf __read_mostly;
+
 atomic_long_t num_poisoned_pages __read_mostly = ATOMIC_LONG_INIT(0);
 
 static bool hw_memory_failure __read_mostly = false;
@@ -155,6 +157,15 @@ static const struct ctl_table memory_failure_table[] = {
 		.proc_handler	= proc_dointvec_minmax,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
+	},
+	{
+		.procname	= "panic_on_unrecoverable_memory_failure",
+		.data		= &sysctl_panic_on_unrecoverable_mf,
+		.maxlen		= sizeof(sysctl_panic_on_unrecoverable_mf),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
 	}
 };
 
@@ -1281,6 +1292,59 @@ static void update_per_node_mf_stats(unsigned long pfn,
 	++mf_stats->total;
 }
 
+/*
+ * Determine whether to panic on an unrecoverable memory failure.
+ *
+ * Design rationale: This design opts for immediate panic on kernel memory
+ * failures, capturing clean crashes rather than random crashes on MF_IGNORED
+ * pages.
+ *
+ * This panics on three categories of failures (all requiring result ==
+ * MF_IGNORED, meaning the page was not recovered):
+ *
+ * - MF_MSG_KERNEL: Reserved pages (identified via PageReserved) that belong
+ *   to the kernel and cannot be recovered.
+ *
+ * - MF_MSG_KERNEL_HIGH_ORDER: Pages that get_hwpoison_page() observed as free
+ *   (refcount 0) but are not in the buddy allocator. These are kernel pages
+ *   in a transient state between allocation and freeing. A TOCTOU race
+ *   (page allocated between get_hwpoison_page() and is_free_buddy_page())
+ *   is possible when CONFIG_DEBUG_VM is disabled, since check_new_pages()
+ *   is gated by is_check_pages_enabled() and becomes a no-op. However,
+ *   panicking is still correct in this case: the physical memory has a
+ *   hardware error, so an allocated hwpoisoned page is unrecoverable.
+ *
+ * - MF_MSG_UNKNOWN: Pages that reached identify_page_state() but did not
+ *   match any known recoverable state in error_states[]. This is the
+ *   catch-all for pages whose flags do not indicate a recoverable user or
+ *   cache page (no LRU, no swapcache, no mlock, etc). A theoretical false
+ *   positive exists if concurrent LRU isolation clears PG_lru between
+ *   folio_lock() and saving page_flags, but this window is very narrow and
+ *   mitigated by identify_page_state()'s two-pass design which rechecks
+ *   using saved page_flags.
+ *
+ * Pages intentionally NOT included:
+ * - MF_MSG_GET_HWPOISON: get_hwpoison_page() failure on non-reserved pages.
+ *   This includes dynamically allocated kernel memory (SLAB/SLUB, vmalloc,
+ *   kernel stacks, page tables) which are not PageReserved and fail
+ *   get_hwpoison_page() with -EBUSY/-EIO. These share the return path with
+ *   transient refcount races, so panicking here would risk false positives.
+ *
+ * Note: Some transient races in the buddy allocator path are mitigated by
+ * memory_failure()'s retry mechanism. When take_page_off_buddy() fails,
+ * the code clears PageHWPoison and retries the entire memory_failure()
+ * flow, allowing pages to be properly reclassified with updated flags.
+ */
+static bool panic_on_unrecoverable_mf(enum mf_action_page_type type,
+				      enum mf_result result)
+{
+	return sysctl_panic_on_unrecoverable_mf &&
+	       result == MF_IGNORED &&
+	       (type == MF_MSG_KERNEL ||
+		type == MF_MSG_KERNEL_HIGH_ORDER ||
+		type == MF_MSG_UNKNOWN);
+}
+
 /*
  * "Dirty/Clean" indication is not 100% accurate due to the possibility of
  * setting PG_dirty outside page lock. See also comment above set_page_dirty().
@@ -1298,6 +1362,9 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
 	pr_err("%#lx: recovery action for %s: %s\n",
 		pfn, action_page_types[type], action_name[result]);
 
+	if (panic_on_unrecoverable_mf(type, result))
+		panic("Memory failure: %#lx: unrecoverable page", pfn);
+
 	return (result == MF_RECOVERED || result == MF_DELAYED) ? 0 : -EBUSY;
 }
 
@@ -2428,6 +2495,20 @@ int memory_failure(unsigned long pfn, int flags)
 			}
 			res = action_result(pfn, MF_MSG_BUDDY, res);
 		} else {
+			/*
+			 * The page has refcount 0 but is not in the buddy
+			 * allocator — it is a non-compound high-order kernel
+			 * page (e.g., a tail page of a high-order allocation).
+			 *
+			 * A TOCTOU race where the page transitions from
+			 * free-buddy to allocated between get_hwpoison_page()
+			 * and is_free_buddy_page() is possible when
+			 * CONFIG_DEBUG_VM is disabled (check_new_pages() is
+			 * gated by is_check_pages_enabled() and becomes a
+			 * no-op). Panicking is still correct: the physical
+			 * memory has a hardware error regardless of who
+			 * allocated the page.
+			 */
 			res = action_result(pfn, MF_MSG_KERNEL_HIGH_ORDER, MF_IGNORED);
 		}
 		goto unlock_mutex;

-- 
2.52.0

