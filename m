Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C180FC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 08:11:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB4B261B93
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 08:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244285AbhKRIOS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Nov 2021 03:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244286AbhKRIOK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 03:14:10 -0500
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA43C061204
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:10 -0800 (PST)
Received: by mail-wm1-x34a.google.com with SMTP id z138-20020a1c7e90000000b003319c5f9164so3986547wmc.7
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 00:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=HAAXujUo7vJi9QoAYq1xZhWCtJcnOt42cvkKdKb2mZ0=;
        b=ZvljMtx+aBzGVGLPn7eWAsT73ExmZFn5/qieQKn1o0FrFOeRJR+W8/ayaqbIbk9TkV
         naIMN5BgLXuq0BX1QLAgT5iI+II4Tuc7HGQBvjS8az+pHHIEuOBs1M/cpJIFAhMVF9Dl
         ufft4/f8dllvEUBYZMcDl+bbqasvP5vObHHZTic25m1rDP4K5b+87b4dCCiu0L5ahS/M
         uPfzcCB/57abGkoWuIniqyUVWgh2ujmHqBG9UWHm1HA1IR7StDu4RMk25Khh0gH2UY19
         B+D7y4ylMleQBxH4zfRbPcwxo2QlCMRALtP7AhYHfvZb+JkLzgY5i5wMs3uPDOWvh9b1
         7J3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HAAXujUo7vJi9QoAYq1xZhWCtJcnOt42cvkKdKb2mZ0=;
        b=uEQTnTKJDGK+9PwXaWWx0jVoKB4eqHiD+I+vXAY5VVRy3ynRit/CEIhB/O0dt5JIXC
         M5J9PZ3LVOm1zETuMMtqlc59oM/CuSkAAGD1MkVy5v54RcZpxrZBbtE3ES+FG6obCxwr
         4Js4U1+AOc6QbEeAymkmPcjnxgaMrBiHFhD6g6z6OkToBM8pzyE0jI+2nwqRcWomifab
         XiQyglv+5iZqw6Kwfzr7x6MZXMFEq4GCAZmjjhM3JleltBKkpGfDL7mCCZS5tfbgqbCD
         Y8iufNi37givsOyWO/yk4E0HhFieNzc9bpJfV+5xnsnjaKCbkz25SGca0t4g7Y4B/QVx
         ZaAQ==
X-Gm-Message-State: AOAM533s4jFWcI/SwCEsIPqJY2CVBQEoVsEdZoiOwtmRpIVrnbeSSHjt
        mJCuocacWvOQYRzIQTIXT0kDQlkweg==
X-Google-Smtp-Source: ABdhPJxasck2gvp3pyOKdAMvcZlLYm/K2gi7xrgvcQBYIVlIkj9YBNax85HUGsxAxhDiLPq3hTBplPPqCA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:7155:1b7:fca5:3926])
 (user=elver job=sendgmr) by 2002:a05:600c:1d97:: with SMTP id
 p23mr7679237wms.186.1637223069169; Thu, 18 Nov 2021 00:11:09 -0800 (PST)
Date:   Thu, 18 Nov 2021 09:10:09 +0100
In-Reply-To: <20211118081027.3175699-1-elver@google.com>
Message-Id: <20211118081027.3175699-6-elver@google.com>
Mime-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v2 05/23] kcsan: Add core memory barrier instrumentation functions
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the core memory barrier instrumentation functions. These invalidate
the current in-flight reordered access based on the rules for the
respective barrier types and in-flight access type.

Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* Rename kcsan_atomic_release() to kcsan_atomic_builtin_memorder() to
  avoid confusion.
---
 include/linux/kcsan-checks.h | 41 ++++++++++++++++++++++++++++++++++--
 kernel/kcsan/core.c          | 36 +++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/include/linux/kcsan-checks.h b/include/linux/kcsan-checks.h
index a1c6a89fde71..c9e7c39a7d7b 100644
--- a/include/linux/kcsan-checks.h
+++ b/include/linux/kcsan-checks.h
@@ -36,6 +36,26 @@
  */
 void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
 
+/**
+ * __kcsan_mb - full memory barrier instrumentation
+ */
+void __kcsan_mb(void);
+
+/**
+ * __kcsan_wmb - write memory barrier instrumentation
+ */
+void __kcsan_wmb(void);
+
+/**
+ * __kcsan_rmb - read memory barrier instrumentation
+ */
+void __kcsan_rmb(void);
+
+/**
+ * __kcsan_release - release barrier instrumentation
+ */
+void __kcsan_release(void);
+
 /**
  * kcsan_disable_current - disable KCSAN for the current context
  *
@@ -159,6 +179,10 @@ void kcsan_end_scoped_access(struct kcsan_scoped_access *sa);
 static inline void __kcsan_check_access(const volatile void *ptr, size_t size,
 					int type) { }
 
+static inline void __kcsan_mb(void)			{ }
+static inline void __kcsan_wmb(void)			{ }
+static inline void __kcsan_rmb(void)			{ }
+static inline void __kcsan_release(void)		{ }
 static inline void kcsan_disable_current(void)		{ }
 static inline void kcsan_enable_current(void)		{ }
 static inline void kcsan_enable_current_nowarn(void)	{ }
@@ -191,12 +215,25 @@ static inline void kcsan_end_scoped_access(struct kcsan_scoped_access *sa) { }
  */
 #define __kcsan_disable_current kcsan_disable_current
 #define __kcsan_enable_current kcsan_enable_current_nowarn
-#else
+#else /* __SANITIZE_THREAD__ */
 static inline void kcsan_check_access(const volatile void *ptr, size_t size,
 				      int type) { }
 static inline void __kcsan_enable_current(void)  { }
 static inline void __kcsan_disable_current(void) { }
-#endif
+#endif /* __SANITIZE_THREAD__ */
+
+#if defined(CONFIG_KCSAN_WEAK_MEMORY) && \
+		(defined(__SANITIZE_THREAD__) || defined(__KCSAN_INSTRUMENT_BARRIERS__))
+#define kcsan_mb	__kcsan_mb
+#define kcsan_wmb	__kcsan_wmb
+#define kcsan_rmb	__kcsan_rmb
+#define kcsan_release	__kcsan_release
+#else /* CONFIG_KCSAN_WEAK_MEMORY && (__SANITIZE_THREAD__ || __KCSAN_INSTRUMENT_BARRIERS__) */
+static inline void kcsan_mb(void)		{ }
+static inline void kcsan_wmb(void)		{ }
+static inline void kcsan_rmb(void)		{ }
+static inline void kcsan_release(void)		{ }
+#endif /* CONFIG_KCSAN_WEAK_MEMORY && (__SANITIZE_THREAD__ || __KCSAN_INSTRUMENT_BARRIERS__) */
 
 /**
  * __kcsan_check_read - check regular read access for races
diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 24d82baa807d..840ed8e35f75 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -955,6 +955,28 @@ void __kcsan_check_access(const volatile void *ptr, size_t size, int type)
 }
 EXPORT_SYMBOL(__kcsan_check_access);
 
+#define DEFINE_MEMORY_BARRIER(name, order_before_cond)                         \
+	kcsan_noinstr void __kcsan_##name(void)                                \
+	{                                                                      \
+		struct kcsan_scoped_access *sa;                                \
+		if (within_noinstr(_RET_IP_))                                  \
+			return;                                                \
+		instrumentation_begin();                                       \
+		sa = get_reorder_access(get_ctx());                            \
+		if (!sa)                                                       \
+			goto out;                                              \
+		if (order_before_cond)                                         \
+			sa->size = 0;                                          \
+	out:                                                                   \
+		instrumentation_end();                                         \
+	}                                                                      \
+	EXPORT_SYMBOL(__kcsan_##name)
+
+DEFINE_MEMORY_BARRIER(mb, true);
+DEFINE_MEMORY_BARRIER(wmb, sa->type & (KCSAN_ACCESS_WRITE | KCSAN_ACCESS_COMPOUND));
+DEFINE_MEMORY_BARRIER(rmb, !(sa->type & KCSAN_ACCESS_WRITE) || (sa->type & KCSAN_ACCESS_COMPOUND));
+DEFINE_MEMORY_BARRIER(release, true);
+
 /*
  * KCSAN uses the same instrumentation that is emitted by supported compilers
  * for ThreadSanitizer (TSAN).
@@ -1143,10 +1165,19 @@ EXPORT_SYMBOL(__tsan_init);
  * functions, whose job is to also execute the operation itself.
  */
 
+static __always_inline void kcsan_atomic_builtin_memorder(int memorder)
+{
+	if (memorder == __ATOMIC_RELEASE ||
+	    memorder == __ATOMIC_SEQ_CST ||
+	    memorder == __ATOMIC_ACQ_REL)
+		__kcsan_release();
+}
+
 #define DEFINE_TSAN_ATOMIC_LOAD_STORE(bits)                                                        \
 	u##bits __tsan_atomic##bits##_load(const u##bits *ptr, int memorder);                      \
 	u##bits __tsan_atomic##bits##_load(const u##bits *ptr, int memorder)                       \
 	{                                                                                          \
+		kcsan_atomic_builtin_memorder(memorder);                                           \
 		if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
 			check_access(ptr, bits / BITS_PER_BYTE, KCSAN_ACCESS_ATOMIC, _RET_IP_);    \
 		}                                                                                  \
@@ -1156,6 +1187,7 @@ EXPORT_SYMBOL(__tsan_init);
 	void __tsan_atomic##bits##_store(u##bits *ptr, u##bits v, int memorder);                   \
 	void __tsan_atomic##bits##_store(u##bits *ptr, u##bits v, int memorder)                    \
 	{                                                                                          \
+		kcsan_atomic_builtin_memorder(memorder);                                           \
 		if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
 			check_access(ptr, bits / BITS_PER_BYTE,                                    \
 				     KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ATOMIC, _RET_IP_);          \
@@ -1168,6 +1200,7 @@ EXPORT_SYMBOL(__tsan_init);
 	u##bits __tsan_atomic##bits##_##op(u##bits *ptr, u##bits v, int memorder);                 \
 	u##bits __tsan_atomic##bits##_##op(u##bits *ptr, u##bits v, int memorder)                  \
 	{                                                                                          \
+		kcsan_atomic_builtin_memorder(memorder);                                           \
 		if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
 			check_access(ptr, bits / BITS_PER_BYTE,                                    \
 				     KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE |                  \
@@ -1200,6 +1233,7 @@ EXPORT_SYMBOL(__tsan_init);
 	int __tsan_atomic##bits##_compare_exchange_##strength(u##bits *ptr, u##bits *exp,          \
 							      u##bits val, int mo, int fail_mo)    \
 	{                                                                                          \
+		kcsan_atomic_builtin_memorder(mo);                                                 \
 		if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
 			check_access(ptr, bits / BITS_PER_BYTE,                                    \
 				     KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE |                  \
@@ -1215,6 +1249,7 @@ EXPORT_SYMBOL(__tsan_init);
 	u##bits __tsan_atomic##bits##_compare_exchange_val(u##bits *ptr, u##bits exp, u##bits val, \
 							   int mo, int fail_mo)                    \
 	{                                                                                          \
+		kcsan_atomic_builtin_memorder(mo);                                                 \
 		if (!IS_ENABLED(CONFIG_KCSAN_IGNORE_ATOMICS)) {                                    \
 			check_access(ptr, bits / BITS_PER_BYTE,                                    \
 				     KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE |                  \
@@ -1246,6 +1281,7 @@ DEFINE_TSAN_ATOMIC_OPS(64);
 void __tsan_atomic_thread_fence(int memorder);
 void __tsan_atomic_thread_fence(int memorder)
 {
+	kcsan_atomic_builtin_memorder(memorder);
 	__atomic_thread_fence(memorder);
 }
 EXPORT_SYMBOL(__tsan_atomic_thread_fence);
-- 
2.34.0.rc2.393.gf8c9666880-goog

