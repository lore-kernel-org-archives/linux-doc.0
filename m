Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA1F2BEC52
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617330; cv=none; b=QmdOfo4YPbPnWJeyiZJJ++hJY3HDqTDufUNA3hTowkD2nw4k7bPzrfdrU/jI636JPhHoc/rVRIG1UpmKE9YZZzDWB9qxsPdv57CC0FAI25UXy643VUQ/+tO36YxprKpfyQc5xSmmP+dZZJ5GSgpDkBtNDwZnSONeX6L/Y+32ZKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617330; c=relaxed/simple;
	bh=RvCHcUH58yjJupLOvtO7BpR8q4h0ix3uvkPrlmgoNTw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oh8i9ZdaQoQv4cnwuPIs4j3TDF/QnUOLwD+aFma/NNicFoPsPXaZrO548NKVMUidYsEwojwQt0leM6+dW75yNXBCDWbLUZGJGdUCA/RU/A1w+UTzJ+6nAGYNHblk3rIirvmr17Fow7QdNM1ZNbGOuJ28zFckIzJ5lzScX8wtIg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gcPvqBRy; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gcPvqBRy"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-486f3c0d896so1680322f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617324; x=1791222124; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RH6hoqk7EsLMc9nVwpPE+90gab30BNeM/1qTHEr8Y8=;
        b=gcPvqBRyrkTqTj9Xp7/Apr8BpjqdHtn+pUxQRgqMULopM66Y7Xgu35Df98dLUdoaRz
         K92Vb7ubSu41aLq8rSfaWWDyKlxLpBEqNpdErpvzpbMisM9jTt7rQ02f4i6jNDSXrIU8
         WEcvE3BhJ62w5c8HkEhXE5iXbJ5OwwoUDdYq6l4l931NvaxTYyz3T9U1tQwe+8b8EYLs
         Xm7y++4yT42QQBNWT0C7HUtt81wuVZalbLHn6ccLpP6t0v2xJMdpcTQfiOz6AntIQnP4
         Z3JTZEJh9fzvDezHSVzNB9Hoq5/W1HkupCm+1RK1ehwJL0rmWw2vpEBdyf17kWcX+DXY
         fDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617324; x=1791222124;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RH6hoqk7EsLMc9nVwpPE+90gab30BNeM/1qTHEr8Y8=;
        b=noxHCQQWbzB+miA828UBIsu6itxAw8isgJQbaDbJhxfy9s6+WxDCXbXajdGfH7RgdW
         tCnxOq77//kHTezsXT2lvYr/Cv8zhJ3a176KV8wLpK8PIpV+GfyyW8KSCYmmWHOeLOQZ
         hEG9j2M+F/bq6k3KNsODBNHkOfBOS/ec/ewXwAYXNqnpcDOt8ieAjmA0UmR0gxaX6V8j
         crTbRnQ2adVM5MtgwyQkyWImloO72Dk7ZhWJu/OZ16b85GIHbG0C4JHdW8rkf34uC6EK
         BpbJDCYN15LYast6mEpPn9S4yy4fXo8RP79/ZPYHt/8bGhNhuLUCa5VxoToArbmRyLvN
         AyOg==
X-Gm-Message-State: AFuF++lcqUatU3PdVFt+BsaqFymMx6NtXAtNNmNfJg/MlcaNha6MLeyN
	uYh8dYz0rV560jeO/zI8krn76a2eVQiR+By/f+scuB8aG1pBpE/BIdSPTZV+HiH187y9W8sq7Px
	X418cBQHgdVONcWgzO5axv3x1sjdjFuHzwob0hhyu7XmjDmN7WSByhEyuxAAIYk/eT28hlmqmQK
	tPf3pQKE6QKZFOwzPmjcohZOtqYje0ESW5O3enPAUDs+o2Z7c/B7I=
X-Received: from wmon22.prod.google.com ([2002:a05:600c:4656:b0:49e:7ce3:41f9])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a15:b0:49f:e444:cc4c with SMTP id 5b1f17b1804b1-49ff06bdb00mr183042675e9.12.1790617324124;
 Mon, 28 Sep 2026 10:42:04 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:20 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-14-smostafa@google.com>
Subject: [RFC PATCH 13/15] fork: Implement partial VMAP stack allocation
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Linus Walleij <linus.walleij@linaro.org>, David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"

When CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE is enabled, architectures can
allocate a VMAP stack that is smaller than the full THREAD_SIZE.

This introduces arch abstraction arch_vm_stack_pages() which defaults
to THREAD_SIZE / PAGE_SIZE.
During stack allocation, the kernel will map only the requested number
of pages at the top of the THREAD_SIZE virtual area (as the stack
grows down), leaving the bottom unmapped. This saves memory while
retaining the same virtual alignment and guard page overflow detection
characteristics.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[Rebased, used vm_area->nr_pages directly in one instance]
[Depends on !PREEMPT_RT]
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
[Fix races around accounting]
[Use GFP_ATOMIC when executing in the scheduler]
[Depend on INIT_STACK_ALL_* config]
[Fix bugs in some error paths and edge cases]
[Don't cache partially faulted stacks]
[Added out-var to tell if address is on target stack]
Signed-off-by: David Stevens <stevensd@google.com>
[Remove dynamic stack related code, and update commit message]
[Fix memory leak in error path of alloc_vmap_stack()] and use
 VM_UNINITIALIZED before installing the pages]
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 include/linux/thread_info.h |  8 +++++
 kernel/fork.c               | 68 +++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/include/linux/thread_info.h b/include/linux/thread_info.h
index 307b8390fc67..8f052ec82402 100644
--- a/include/linux/thread_info.h
+++ b/include/linux/thread_info.h
@@ -92,6 +92,14 @@ static inline long set_restart_fn(struct restart_block *restart,
 #define THREAD_ALIGN	THREAD_SIZE
 #endif
 
+/*
+ * Arch selecting CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE should override this
+ * with kernel stack size.
+ */
+#ifndef arch_vm_stack_pages
+#define arch_vm_stack_pages()	(THREAD_SIZE / PAGE_SIZE)
+#endif
+
 #define THREADINFO_GFP		(GFP_KERNEL_ACCOUNT | __GFP_ZERO | __GFP_SKIP_KASAN)
 
 /*
diff --git a/kernel/fork.c b/kernel/fork.c
index ca8e68882316..66fbad3d4cbd 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -119,6 +119,8 @@
 
 /* For dup_mmap(). */
 #include "../mm/internal.h"
+/* For clear_vm_uninitialized_flag(). */
+#include "../mm/vmalloc.h"
 
 #include <trace/events/sched.h>
 
@@ -272,6 +274,71 @@ static bool try_release_thread_stack_to_cache(struct vm_struct *vm_area)
 	return false;
 }
 
+#ifdef CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE
+static struct vm_struct *alloc_vmap_stack(int node)
+{
+	gfp_t gfp = GFP_VMAP_STACK;
+	unsigned long addr, end;
+	struct vm_struct *vm_area;
+	int err, i;
+
+	vm_area = get_vm_area_node(THREAD_SIZE, THREAD_ALIGN,
+				   VM_MAP | VM_UNINITIALIZED, node, gfp,
+				   __builtin_return_address(0));
+	if (!vm_area)
+		return NULL;
+
+	vm_area->pages = kmalloc_node(sizeof(void *) * (THREAD_SIZE >> PAGE_SHIFT),
+				      gfp, node);
+	if (!vm_area->pages)
+		goto cleanup_err;
+
+	for (i = 0; i < arch_vm_stack_pages(); i++) {
+		vm_area->pages[i] = alloc_pages_node(node, gfp, 0);
+		if (!vm_area->pages[i])
+			goto cleanup_err;
+		vm_area->nr_pages++;
+		mod_lruvec_page_state(vm_area->pages[i], NR_VMALLOC, 1);
+	}
+
+	end = (unsigned long)kasan_reset_tag(vm_area->addr) + THREAD_SIZE;
+	addr = end - (arch_vm_stack_pages() * PAGE_SIZE);
+
+	err = vmap_pages_range(addr, end, PAGE_KERNEL, vm_area->pages, PAGE_SHIFT);
+	if (err)
+		goto cleanup_err;
+
+	clear_vm_uninitialized_flag(vm_area);
+	return vm_area;
+
+cleanup_err:
+	remove_vm_area(vm_area->addr);
+	if (vm_area->pages) {
+		for (i = 0; i < vm_area->nr_pages; i++) {
+			mod_lruvec_page_state(vm_area->pages[i], NR_VMALLOC, -1);
+			__free_page(vm_area->pages[i]);
+		}
+		kfree(vm_area->pages);
+	}
+	kfree(vm_area);
+	return NULL;
+}
+
+static void free_vmap_stack(struct vm_struct *vm_area)
+{
+	int i;
+
+	remove_vm_area(vm_area->addr);
+
+	for (i = 0; i < vm_area->nr_pages; i++) {
+		mod_lruvec_page_state(vm_area->pages[i], NR_VMALLOC, -1);
+		__free_page(vm_area->pages[i]);
+	}
+
+	kfree(vm_area->pages);
+	kfree(vm_area);
+}
+#else
 static inline struct vm_struct *alloc_vmap_stack(int node)
 {
 	void *stack;
@@ -286,6 +353,7 @@ static inline void free_vmap_stack(struct vm_struct *vm_area)
 {
 	vfree(vm_area->addr);
 }
+#endif /* CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE */
 
 static void thread_stack_free_work(struct work_struct *work)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

