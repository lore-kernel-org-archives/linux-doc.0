Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFA420A5F5
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 01:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742435786; cv=none; b=XSZVnXjhH7XP+kXG+rzgzFdT2EgTuheTtLZXtwpiYxwSC7P34h5DYlkiBMBSa4YNeN+BKUnHXrfTLFf960D+NYL9CBNWy/tly55Dpgtd/WvjDK21MPgdHbDxcVdAvUSCU2hpsBW5fKS6pQsyYXfntoS7hOQpJtUB9O7n3gJqqi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742435786; c=relaxed/simple;
	bh=qaXI3W/fquZKoC2tWGhwR7n7UZjktLGpU7tPd9W5uhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bc4EelMtL8SbOxHZlQylhHUpYKRo93KSrN6zWEDr5gLpRXHOqxnsCZcWu0oEVaVAf5jskYjTy6a3rswHpkn+U01c5QmiyQU0lB4DZ89vjOYJmEu6bNZ7S5nRtwTQEkY2WoI7koJA3rKVN+IGxxHhn+y8I4+atSWe3iViIwbx9Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mNkxCB72; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mNkxCB72"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff64898e2aso2236865a91.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 18:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742435784; x=1743040584; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+uiHbtbR2+LTCG9tPghyUo9+PEq69RRB7eOXIX8kmmQ=;
        b=mNkxCB720B2kmtJDA1a7eUCO6e5z8NnBgfi1EMIXH/GpYi/j1sU9s5Q8j3Xn27QjyL
         gp2Fu7If7d0KIWqxOutdPwkfUurlnL5ce4ca8WUDocQUTKl2VGjdBUZb4KW1lHMigp2e
         A1TBaVT4Gjs6Ppjx379DlhO4XbW260/Q7zx3qHuhpz6dSkY8Fg+060OoT5v8EtG5pWjq
         VQAIzoLs9d9OHSPn+4WvPwSxwaH0h2uWrqAncyyBLJWLpxdAh41WTfH69wqX8hz9O/bu
         thW+rDDwsw66oBaZ6tuCwO0LFhvgsiyp94t6q+k3MDczkfGtXJZmPhHMeXwKKvwOjiQu
         38oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742435784; x=1743040584;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+uiHbtbR2+LTCG9tPghyUo9+PEq69RRB7eOXIX8kmmQ=;
        b=ZB2LU1HnJ8XsgP4LIOg1LJAjaT1uhpt1oTjU+XlsERb7YKTMihxU0TbDYkcmxMUubU
         m26g0rrH6MjGaWNJjBfwJr8J6233uLvo0JJ6mcoNezvcqZksLELrtb+Is06KLZPxEJaf
         DLcqSpeWR/prRIdxTEn4B6htHJyEd0ehGV+upbJ9H7DtlLLcHcZVkRxnY1bhNsI8YUXn
         nLRXJ8DPrO9Ik36BZRZW6oChQTnCCMSVa86ibyaOSYuVn+Wqy475obGv5b7yUq/s1ciE
         bO66AcIsaYFAlhuN4JgcADp5/77HX5OwwTJa1sfwgfD6VNuE0kBXOtGNv5F0TNFNsOjK
         T8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXHuTGAJbcgf/cwht8jIdcIMTfa0ZXpCDRVfAUwGtFp+6nx5t7pgFkCfKtgiwvcRbiBAz+7TJQct+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQiod8RwNBO6EfkQkxs5F7LV4FzpwtHY+jFWWXKsQV2dysi4aI
	PGjeDRQRuUn2OW3DmGMZN8npIHAP2mQZWMMfwanifKwqJnbnrjqHldrjpC8jMyJCZNGrqqRsf90
	VsX3B6wQpg7JoPyLBaQ==
X-Google-Smtp-Source: AGHT+IGco0TbFvrpWaz7RU09LVDLIbrwQOB0hzzeh7i66UCW7yrWSDQtXXKFJgzbGrQWcK/LzqGUCqggvCd+K/bd
X-Received: from pgvr15.prod.google.com ([2002:a65:60cf:0:b0:ad8:bdc2:8a33])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:69c:b0:1f5:8bf4:fde0 with SMTP id adf61e73a8af0-1fd0904c18cmr2493103637.9.1742435784427;
 Wed, 19 Mar 2025 18:56:24 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:55:50 -0700
In-Reply-To: <20250320015551.2157511-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320015551.2157511-16-changyuanl@google.com>
Subject: [PATCH v5 15/16] memblock: add KHO support for reserve_mem
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	dave.hansen@linux.intel.com, dwmw2@infradead.org, ebiederm@xmission.com, 
	mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, krzk@kernel.org, 
	rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

Linux has recently gained support for "reserve_mem": A mechanism to
allocate a region of memory early enough in boot that we can cross our
fingers and hope it stays at the same location during most boots, so we
can store for example ftrace buffers into it.

Thanks to KASLR, we can never be really sure that "reserve_mem"
allocations are static across kexec. Let's teach it KHO awareness so
that it serializes its reservations on kexec exit and deserializes them
again on boot, preserving the exact same mapping across kexec.

This is an example user for KHO in the KHO patch set to ensure we have
at least one (not very controversial) user in the tree before extending
KHO's use to more subsystems.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 mm/memblock.c | 179 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index d28abf3def1c..dd698c55b87e 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -17,6 +17,10 @@
 #include <linux/seq_file.h>
 #include <linux/memblock.h>
 
+#ifdef CONFIG_KEXEC_HANDOVER
+#include <linux/kexec_handover.h>
+#endif /* CONFIG_KEXEC_HANDOVER */
+
 #include <asm/sections.h>
 #include <linux/io.h>
 
@@ -2431,6 +2435,176 @@ int reserve_mem_find_by_name(const char *name, phys_addr_t *start, phys_addr_t *
 }
 EXPORT_SYMBOL_GPL(reserve_mem_find_by_name);
 
+#ifdef CONFIG_KEXEC_HANDOVER
+#define MEMBLOCK_KHO_NODE "memblock"
+#define MEMBLOCK_KHO_NODE_COMPATIBLE "memblock-v1"
+#define RESERVE_MEM_KHO_NODE_COMPATIBLE "reserve-mem-v1"
+
+static struct kho_node memblock_kho_node = KHO_NODE_INIT;
+
+static void reserve_mem_kho_reset(void)
+{
+	int i;
+	struct kho_node *node;
+
+	kho_remove_node(NULL, MEMBLOCK_KHO_NODE);
+	kho_remove_prop(&memblock_kho_node, "compatible", NULL);
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserve_mem_table *map = &reserved_mem_table[i];
+
+		node = kho_remove_node(&memblock_kho_node, map->name);
+		if (IS_ERR(node))
+			continue;
+
+		kho_unpreserve_phys(map->start, map->size);
+
+		kho_remove_prop(node, "compatible", NULL);
+		kho_remove_prop(node, "start", NULL);
+		kho_remove_prop(node, "size", NULL);
+
+		kfree(node);
+	}
+}
+
+static int reserve_mem_kho_finalize(void)
+{
+	int i, err = 0;
+	struct kho_node *node;
+
+	if (!reserved_mem_count)
+		return NOTIFY_DONE;
+
+	err = kho_add_node(NULL, MEMBLOCK_KHO_NODE, &memblock_kho_node);
+	if (err == 1)
+		return NOTIFY_DONE;
+
+	err |= kho_add_string_prop(&memblock_kho_node, "compatible",
+				   MEMBLOCK_KHO_NODE_COMPATIBLE);
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserve_mem_table *map = &reserved_mem_table[i];
+
+		node = kmalloc(sizeof(*node), GFP_KERNEL);
+		if (!node) {
+			err = -ENOMEM;
+			break;
+		}
+
+		err |= kho_preserve_phys(map->start, map->size);
+
+		kho_init_node(node);
+		err |= kho_add_string_prop(node, "compatible",
+					   RESERVE_MEM_KHO_NODE_COMPATIBLE);
+		err |= kho_add_prop(node, "start", &map->start,
+				    sizeof(map->start));
+		err |= kho_add_prop(node, "size", &map->size,
+				    sizeof(map->size));
+		err |= kho_add_node(&memblock_kho_node, map->name, node);
+
+		if (err)
+			break;
+	}
+
+	if (err) {
+		pr_err("failed to save reserve_mem to KHO: %d\n", err);
+		reserve_mem_kho_reset();
+		return NOTIFY_STOP;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int reserve_mem_kho_notifier(struct notifier_block *self,
+				    unsigned long cmd, void *v)
+{
+	switch (cmd) {
+	case KEXEC_KHO_FINALIZE:
+		return reserve_mem_kho_finalize();
+	case KEXEC_KHO_UNFREEZE:
+		return NOTIFY_DONE;
+	default:
+		return NOTIFY_BAD;
+	}
+}
+
+static struct notifier_block reserve_mem_kho_nb = {
+	.notifier_call = reserve_mem_kho_notifier,
+};
+
+static int __init reserve_mem_init(void)
+{
+	if (!kho_is_enabled())
+		return 0;
+
+	return register_kho_notifier(&reserve_mem_kho_nb);
+}
+core_initcall(reserve_mem_init);
+
+static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t size,
+					  phys_addr_t align)
+{
+	int err, len_start, len_size;
+	struct kho_in_node node, child;
+	const phys_addr_t *p_start, *p_size;
+
+	err = kho_get_node(NULL, MEMBLOCK_KHO_NODE, &node);
+	if (err)
+		return false;
+
+	err = kho_node_check_compatible(&node, MEMBLOCK_KHO_NODE_COMPATIBLE);
+	if (err) {
+		pr_warn("Node '%s' is incompatible with %s: %d\n",
+			MEMBLOCK_KHO_NODE, MEMBLOCK_KHO_NODE_COMPATIBLE, err);
+		return false;
+	}
+
+	err = kho_get_node(&node, name, &child);
+	if (err) {
+		pr_warn("Node '%s' has no child '%s': %d\n",
+			MEMBLOCK_KHO_NODE, name, err);
+		return false;
+	}
+	err = kho_node_check_compatible(&child, RESERVE_MEM_KHO_NODE_COMPATIBLE);
+	if (err) {
+		pr_warn("Node '%s/%s' is incompatible with %s: %d\n",
+			MEMBLOCK_KHO_NODE, name,
+			RESERVE_MEM_KHO_NODE_COMPATIBLE, err);
+		return false;
+	}
+
+	p_start = kho_get_prop(&child, "start", &len_start);
+	p_size = kho_get_prop(&child, "size", &len_size);
+	if (!p_start || len_start != sizeof(*p_start) || !p_size ||
+	    len_size != sizeof(*p_size)) {
+		return false;
+	}
+
+	if (*p_start & (align - 1)) {
+		pr_warn("KHO reserve-mem '%s' has wrong alignment (0x%lx, 0x%lx)\n",
+			name, (long)align, (long)*p_start);
+		return false;
+	}
+
+	if (*p_size != size) {
+		pr_warn("KHO reserve-mem '%s' has wrong size (0x%lx != 0x%lx)\n",
+			name, (long)*p_size, (long)size);
+		return false;
+	}
+
+	reserved_mem_add(*p_start, size, name);
+	pr_info("Revived memory reservation '%s' from KHO\n", name);
+
+	return true;
+}
+#else
+static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t size,
+					  phys_addr_t align)
+{
+	return false;
+}
+#endif /* CONFIG_KEXEC_HANDOVER */
+
 /*
  * Parse reserve_mem=nn:align:name
  */
@@ -2486,6 +2660,11 @@ static int __init reserve_mem(char *p)
 	if (reserve_mem_find_by_name(name, &start, &tmp))
 		return -EBUSY;
 
+	/* Pick previous allocations up from KHO if available */
+	if (reserve_mem_kho_revive(name, size, align))
+		return 1;
+
+	/* TODO: Allocation must be outside of scratch region */
 	start = memblock_phys_alloc(size, align);
 	if (!start)
 		return -ENOMEM;
-- 
2.48.1.711.g2feabab25a-goog

