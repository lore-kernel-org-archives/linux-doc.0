Received: from forwardcorp1b.mail.yandex.net (forwardcorp1b.mail.yandex.net [178.154.239.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC77740B0F1;
	Wed,  5 Aug 2026 09:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923438; cv=none; b=FOUZgFGdUqBeBFv2+hCnwPPiqJZz5lts9GQuLycSeTCaYWsCeSlk2frV7e715Bsq+ITHSxZIqEhtiy27vPYgks82LpzpnwB7u9TPxUeJ6QGF/QgivgGVq3fcDcaPVZN9mflDU236Yq2zGAWrMFRohFeL0oH1f0uuzFrjErRJOzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923438; c=relaxed/simple;
	bh=vB22L7UG1eUGKv/env9KbOguTU2gRMB4zLo21TYg9lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWEvWCp2HTTh0+yYzVklDz5s45kukAAUHzs1wK1pwJB33c1MgnBBpGrZgX6JARopGA1kSAH/qYgk1brpMqkI5uqLMuH2/rHkSeFpS0pj6l5azT/gh7lOn8I7KCjVWpKB+njADfRZd060g1Y4aGBiWIR2Qi2JrotK4ARTMbgHrfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru; spf=pass smtp.mailfrom=yandex-team.ru; dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b=bdUXnjOx; arc=none smtp.client-ip=178.154.239.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b="bdUXnjOx"
Received: from mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:43a8:0:640:574d:0])
	by forwardcorp1b.mail.yandex.net (postfix) with ESMTPS id 8713A808EE;
	Wed, 05 Aug 2026 12:48:58 +0300 (MSK)
Received: from i101646577.yandex-team.ru (unknown [2a02:6bf:8080:43c::1:39])
	by mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (smtpcorp) with ESMTPSA id lmErQB23hCg0-GTyl9azN;
	Wed, 05 Aug 2026 12:48:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1785923337;
	bh=OEgYGOPyUdkWmhmw/xLhA86o+THVk2n1bh92QDcf71k=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=bdUXnjOxIJbJYiNdTjGbNTzkBxiVQ3SdcnT1P5qghHticrfxnq1e/xKGktvs/H4xA
	 S+zvLyi/kSOot3/D/cPt8SM6z6/zUKiBxFU6T8y6y+S8nkrLLo29v9Dl1tt5b5kK80
	 nwPiHJBSIQi5MuYFDRVX+vXLa5poj+IolBlcaHhY=
Authentication-Results: mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@kernel.org>
Cc: Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Hao Li <hao.li@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: [RFC PATCH 2/3] mm/slub: count kvmalloc() allocations forced to vmalloc()
Date: Wed,  5 Aug 2026 12:48:42 +0300
Message-ID: <20260805094843.292134-3-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805094843.292134-1-d-tatianin@yandex-team.ru>
References: <20260805094843.292134-1-d-tatianin@yandex-team.ru>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vm.kvmalloc_max_contig_order changes allocation behavior silently.  There
is no way to tell whether a given value is doing anything at all, or how
much of the workload it affects, short of tracing kvmalloc() by hand,
which makes it hard to pick a value and hard to notice when a workload
starts running into it.

Add a kvmalloc_forced_vmalloc counter to /proc/vmstat, incremented for
every allocation that skipped kmalloc() because of the limit.  Requests
above KMALLOC_MAX_SIZE are skipped by the limit like any other, since the
attempt would fail regardless, but they are not counted, as they would
have reached vmalloc() either way.  What is left is the number of
allocations the limit actually diverted, which is what is needed to tell
whether it is set sensibly.

Note that the counter stays at zero while the sysctl is left at its
default, since no allocation is denied in that case.  Determining what to
set the limit to in the first place still requires tracing kvmalloc()
directly, or setting the limit on a canary first and reading the counter
there.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 Documentation/admin-guide/sysctl/vm.rst |  5 +++++
 include/linux/vm_event_item.h           |  3 +++
 mm/Kconfig                              |  2 ++
 mm/slub.c                               | 15 ++++++++++++++-
 mm/vmstat.c                             |  3 +++
 5 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index bc669052c50b..4581fb68c974 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -394,6 +394,11 @@ the order of KMALLOC_MAX_CACHE_SIZE up to MAX_PAGE_ORDER.
 Requests above KMALLOC_MAX_SIZE end up in vmalloc() whatever this is set to,
 since kmalloc() cannot serve them at all.
 
+The kvmalloc_forced_vmalloc counter in /proc/vmstat counts the allocations
+that were routed to vmalloc() because of this limit.  Requests that
+kmalloc() could not have served anyway are not counted, so the counter only
+reflects allocations the limit itself diverted.
+
 
 legacy_va_layout
 ================
diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index 03fe95f5a020..c060c06ca2d2 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -145,6 +145,9 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		DIRECT_MAP_LEVEL2_COLLAPSE,
 		DIRECT_MAP_LEVEL3_COLLAPSE,
 #endif
+#ifdef CONFIG_KVMALLOC_ORDER_LIMIT
+		KVMALLOC_FORCED_VMALLOC,
+#endif
 #ifdef CONFIG_PER_VMA_LOCK_STATS
 		VMA_LOCK_SUCCESS,
 		VMA_LOCK_ABORT,
diff --git a/mm/Kconfig b/mm/Kconfig
index 9b1fcabb6d8f..0ca7fc5321cf 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -262,6 +262,8 @@ config KVMALLOC_ORDER_LIMIT
 	  This enables the vm.kvmalloc_max_contig_order sysctl, which caps
 	  the allocation order kvmalloc() is willing to ask the page
 	  allocator for.  Larger requests are routed to vmalloc() directly.
+	  It also adds the kvmalloc_forced_vmalloc counter to /proc/vmstat,
+	  which tells how many allocations were routed this way.
 
 	  The default value of the sysctl preserves the existing behavior,
 	  so saying Y here only makes the tunable available.
diff --git a/mm/slub.c b/mm/slub.c
index 0a9910602cec..7287949ea247 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -51,6 +51,7 @@
 #include <linux/kprobes.h>
 #include <linux/debugfs.h>
 #include <linux/sysctl.h>
+#include <linux/vmstat.h>
 #include <trace/events/kmem.h>
 
 #include "internal.h"
@@ -6916,7 +6917,19 @@ static bool kvmalloc_order_denied(size_t size)
 	if (likely(sysctl_kvmalloc_max_contig_order >= MAX_PAGE_ORDER))
 		return false;
 
-	return get_order(size) > sysctl_kvmalloc_max_contig_order;
+	if (get_order(size) <= sysctl_kvmalloc_max_contig_order)
+		return false;
+
+	/*
+	 * kmalloc() cannot serve anything above KMALLOC_MAX_SIZE, so such a
+	 * request would have reached vmalloc() with or without the limit.
+	 * Skipping the doomed attempt is still worthwhile, but the limit did
+	 * not divert anything, so do not account it.
+	 */
+	if (size <= KMALLOC_MAX_SIZE)
+		count_vm_event(KVMALLOC_FORCED_VMALLOC);
+
+	return true;
 }
 
 static const struct ctl_table kvmalloc_sysctl_table[] = {
diff --git a/mm/vmstat.c b/mm/vmstat.c
index f534972f517d..e7139c0947ce 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1459,6 +1459,9 @@ const char * const vmstat_text[] = {
 	[I(DIRECT_MAP_LEVEL2_COLLAPSE)]		= "direct_map_level2_collapses",
 	[I(DIRECT_MAP_LEVEL3_COLLAPSE)]		= "direct_map_level3_collapses",
 #endif
+#ifdef CONFIG_KVMALLOC_ORDER_LIMIT
+	[I(KVMALLOC_FORCED_VMALLOC)]		= "kvmalloc_forced_vmalloc",
+#endif
 #ifdef CONFIG_PER_VMA_LOCK_STATS
 	[I(VMA_LOCK_SUCCESS)]			= "vma_lock_success",
 	[I(VMA_LOCK_ABORT)]			= "vma_lock_abort",
