Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35134F4D1C
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617330; cv=none; b=eMY07OI0G6RXGlAK69INPcbZS16nAutRpKVK+tfIL1KJhmKUUrirlmxOGuD8LMYYm9188lKmeP0uQG9dCyP+J8T6cXKnYxRuiG64NqXCaEDzIlKZ9S2/t4yFpf1yXyTJieVe1OhQPIqV4YIL3oRXQb2rzoZltPpKhrhUGr30AOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617330; c=relaxed/simple;
	bh=fqb9OvcrF+1YGNg2ZQpu0FVkmCJMPIgeYZw98qjd2TE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GdIP+9CFMAAMW7korGGw4RekwkmuQv5K3xmZ4jrIXDE/IbqScJ8qwnVM06JWOj9kypYYu9JAgr9AB+IDTgKdTxKLVyxZAqjqK7FwJUX2otAeV7hnhC859OeuqdcrIGBf0IPm6aUZtaOlgTdWnHibZsAozikvTy95KqjaCoQTSKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R9oWZ0rV; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R9oWZ0rV"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49ffe48d1dfso23512115e9.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617323; x=1791222123; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5BgLva5vXrAwBl9Y3v1BBOsVeywVgMCKKqE5NVyRxk=;
        b=R9oWZ0rV7gKjtA+la0UmSJwqWvDqq8wPLqFAoKyMDtFhs+vbe53tpGCRzWJ9ioM8F6
         MZksfaaiPsdWKeF9s75UWfH005UDaew0pgQPt4kE2S/O3XZuJ7PNkRZekOjBByC1ietp
         /WWRysDJT2/2FG/y+UryCV7l5fWn4Mt+FJlpcbD+B+8L6DLhBifTJVYlpI3q9RdRpNJ5
         pCzff2k5EJbV9W5yOnqn5NIDZ5ws2C0oS4uK52rsdaIQeDmVPompBLDRP+GHORm/SZDm
         UASyolwVaW6G/QQ3sN79899OUbU4HhV6rZkcpqLNXCcBYBCO1vsB1gs2hfo1xCcVo1J3
         IYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617323; x=1791222123;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5BgLva5vXrAwBl9Y3v1BBOsVeywVgMCKKqE5NVyRxk=;
        b=bniQQfpzLzTnm1s8uDTNuaHLpdcGjCb1I45Oshwv/v51CVcEHWi1fumzB1rnjl1+lU
         8+3jnVOCeLFeg1XjfcG8zWFmNM6s5SpEbxug1jnRpttSZRtcTk4qYvc89V4aFTSMGY8J
         0A/j+EvWixgWTXX0HIQIuIl8jQD1fk5jqR9J9x0vhovSpurdECbguqrhzaYjveurwu3l
         I0Mjf6sWMF+zdSsk7DW8lRqzWeYsfqmae6t7jRMJqXE6Nh7xnhKuaJ1bW2QVp+Rn/JGx
         3NyeMAiac3q+gHrzxU0wKmIwKd3T936ygQ7PObEyce2tn26JdtdsdZxSpvRx7KOBH3aQ
         eZsw==
X-Gm-Message-State: AFuF++lIg2rSEqhARlDbOBJbPaKxpzPdL+xEdCks9h0l3SfCsArG+RQz
	jit5OQHBZbQvMe9wpHg4lpEq/7Uuf8vJDHGIbxFdPG8wcqY37rclbn5ERl6T4n2VXuv+tkHjOxB
	cQsEB1AhzSKRtOaaf+DN7099FK/SVzdv2q45OCUleoV3zor/MdSLoXS0fNareQYWiv318/3RLj3
	rCO84Zezdqo4GNzC1ZqaAQY1+vFBZtYvb5TTD703ozpsiSefI2sIU=
X-Received: from wmhj21.prod.google.com ([2002:a05:600c:3015:b0:49e:8337:33d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c4:b0:49f:c331:39e4 with SMTP id 5b1f17b1804b1-49fe66ca101mr236733115e9.7.1790617322864;
 Mon, 28 Sep 2026 10:42:02 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:19 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-13-smostafa@google.com>
Subject: [RFC PATCH 12/15] sched/task_stack: Introduce ARCH_HAS_VARIABLE_STACK_SIZE
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
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

When CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE is enabled, the kernel stack
may not be fully populated with the THREAD_SIZE virtual area.

Teach task_stack_size() to return the size of the vm area and not a
fixed size.

This propagates to end_of_stack() which makes functions like
stack_not_used() and set_task_stack_end_magic() to use the lowest
valid stack address instead of THREAD_SIZE which would cause data
aborts.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/Kconfig                     | 10 ++++++++++
 include/linux/sched/task_stack.h |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index 45c657772362..d6fa2ccb0599 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -431,6 +431,16 @@ config HAVE_ASM_MODVERSIONS
 	  <asm/asm-prototypes.h> to support the module versioning for symbols
 	  exported from assembly code.
 
+config ARCH_HAS_VARIABLE_STACK_SIZE
+	bool
+	depends on VMAP_STACK
+	depends on !STACK_GROWSUP
+	depends on THREAD_INFO_IN_TASK
+	help
+	  An arch should select this if it supports dynamically configuring the
+	  kernel stack size.
+	  For example the kernel stack size can be from the command line.
+
 config HAVE_REGS_AND_STACK_ACCESS_API
 	bool
 	help
diff --git a/include/linux/sched/task_stack.h b/include/linux/sched/task_stack.h
index 4a808f9c4631..07d73adaecd1 100644
--- a/include/linux/sched/task_stack.h
+++ b/include/linux/sched/task_stack.h
@@ -10,6 +10,7 @@
 #include <linux/magic.h>
 #include <linux/refcount.h>
 #include <linux/kasan.h>
+#include <linux/vmalloc.h>
 
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 
@@ -96,6 +97,10 @@ static inline unsigned long *end_of_stack(const struct task_struct *p)
  */
 static __always_inline unsigned long task_stack_size(const struct task_struct *task)
 {
+#ifdef CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE
+	if (task->stack_vm_area)
+		return task->stack_vm_area->nr_pages * PAGE_SIZE;
+#endif
 	return THREAD_SIZE;
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

