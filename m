Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646243;
	b=suZKgfny3KzYOnDgaG1yErYvx3XTj3ZQOhw7K5w2Dq5LNHMSM4CUJZxRAm/G50RP1Wpc
	 p9zy1psaNUBifIA+SjBlrd6rbgFLU/dF36o2YtFRkkHNcoAbAAbnPLLUFtjM54u2R29aX
	 bbuFunocR8iEWwEpUZTMP2Kc6YF1snvSjNasPL76N4Yo0ookuZKf69mgpwVYEa7Jk46bR
	 BBbhQD1OFP0Bnmq07FMNxY/a5tKpHjEPs3/cHXn8XTH4zghlrfPl8B+wzryIUcRpZGB1l
	 FKB2yvWn+JpCLNOiNZFhs/7t4O+sK8f+h+Qhbs6bRG8KviI3LQh+2k8+AXWpExQy+aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TTPx+dOGfrZ2gbZc2iR4OE7g80jE9NdI9RPBQdZQId4=;
	b=Y6L9J2D1DoPuyf4uuzTrMdZo7o+upK+gKAHfSPTyzXgxneMnyipUc/xEfi51t2NU2iU7
	 hShXheium4yvEtXlvuU7jF30DuvbOioZZDkETrvjU6Kc3B8jhSMER9DejNMUCPKPHxGOz
	 pO7mg/xzMZSTc4DUJ2LJ1Ir8iTOSA4VFvwpm9uvep2ViTVy8n4WpULHV8XXpMnCE12ySc
	 nsfJQG5nTcSjxq8x48oibMlGmHgf6ekauSLL4KR07qppt7E8jHE5bbDGcegSDjO4Ar/xU
	 8BN4xsi0a4QwdMvD64IgeiYX16ZL8S5xkjpDPLpgIiasFAYbbwLVvNm6gV2qG+NqLUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AdN4huIO;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BF2606A331
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78BF2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AdN4huIO
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so2693475e9.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 22:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646237; x=1793251037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTPx+dOGfrZ2gbZc2iR4OE7g80jE9NdI9RPBQdZQId4=;
        b=AdN4huIOEb9xbX5xMLra7nydL2zGIS5k7IK7y+jEzEhFwRCKZE5TIjVOxzMJQrIE+F
         65t36xUBpUfa/FQhopULXQlO8Wo+s+g/Mxi8OIxSpH5dy14JtFT0xJA4VtZDmUdz/in1
         dnwuXbJ1kf8cJ07iQ6NsUMJ5I4Be16T4MhIbxSSD/NQpZ5xyNY0V8A3eAJEmdKYCsWQo
         hwcRgHeBNstZOVPGhBliKDgyPzaspDCwAd+xZcTsJjNwaQ5AbKZoXXJ1Fd6KtrTegGKR
         ds5NKGTKCUNm/LyNwkdt0xwVEnV10sHkjYMdFMv/7CJzFOVv+AGYPxyrtuNTUx2wPd08
         RtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646237; x=1793251037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTPx+dOGfrZ2gbZc2iR4OE7g80jE9NdI9RPBQdZQId4=;
        b=Ap8Gj6ZoByuHZ0I95CPTl5bD6438akC/54qtk0PBnl0a6Dls+5/vMbwOVxDYw3IkBp
         CPtB2GVj1+KGZIpc78WcZRJdgva17yGPc7//v4XTcoC7uZIEqATawklbW9MoPEErtK/W
         9octP6lAsCKqVuXSVoaEfQ9N/Kfeq96nVsGaMMHa+EOi4UmJmmoH4Q2s5YW/DKg+xsYy
         If+W52CY5PPPryYAvZ1bBWXLnqcwmkgXAvijBfyM9bEpPaXlYQRsQ1uPg5iKattB4VZe
         nBUfvbIuXAooCRRciNWIiyinsmjEXqkxb1hKKOlbnSfUK245TaLzpdU/rVMi4vA37g83
         Ks6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzaEJtVGl+37edCjEwtHaGz+uBoBK9vNQQX0MScOlygL9DNNyYphyFOHMvd2GgSdCwfj1ZL054sI0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmVr73gZodtEWPh+NIhRWah2Ei00syM133QOmH/wNl8PYnuns7
	GQtX/El+ZM1LS0GZ9yf3WX6sxI7HUkJzfmHIqkSg0PlNXpVo/0OoRTZw
X-Gm-Gg: AYBFou338xwtUPCP/z5G1wqMLnSg4FkOFJEgjTO6EomEomyUQYKNAKoQhd+0HaR90H/
	fUM/upfNxUxlh7+/WMzAPIctm9LFy/f+wbOubs/9VHBIAAcgkhmKeVwISm9JfXSGkvSxEhKQHlO
	WgxXTtN+aH/65v1EWnifQLHi4VTQZrtX1jik50Vh+R7f36J5TSmBS4gmJ6CatPQykg3EoG9bP2K
	WYIc1ppj9lggC3fgBefulKojCyEIj14/xgcIhR2UvI2x1qjZzlgBUdRdF5w9SHEwQG1OyG6IPfq
	FmxBff4kFRalOfZF2KJd65moujFjBDFFpc6on9sE0Y4mXgfk1j7mJsWDsPw6rdYH03M6P9aCH7c
	NHDcNBoAj46vVA3FjcDpC3gQnxxK/9i+mGxr8IOHwbom4IiVDBr6I+/8JgkSw7H6rDxAveLsnul
	asv7l3fZBzl4ejhbuZ0McpdHwYF1cLCP3Z06/WU8mDIBCrtAlltf9ww2yRPj7Q2hOKu0znQywJj
	uqVN4/xhIcU+tYqbU55NjHrEKszBHV8KjgUl3lf8iPItevdMTd2XqP1BAGqDXvqs13xZJVLQzGC
	C2nGCT79RToIDmrlpJIKJQ6vKDoiVuhHqbjsIuqmw33UXiue1DhagyV8q0tFGjWrvZSidqV7jVe
	U+y78PpGmMiEd7gHtpeNpcFftLyN6j+6LBqdcRqdpjj4837uovwopX2N4M7E=
X-Received: by 2002:a05:600c:c83:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a204aace0amr25847565e9.5.1792646236628;
        Wed, 21 Oct 2026 22:17:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 01/12] sched: Split preempt-count bookkeeping from raw updates
Date: Thu, 22 Oct 2026 07:16:43 +0200
Message-Id: <20261022051654.79224-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
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

Very early entry code may need to update the preempt count before
instrumentable debug and tracing code can run. Conversely, return code may
need to finish instrumentable validation and latency tracing before raw
teardown.

Add preempt_count_add_finish() for bookkeeping after a raw addition. Add
preempt_count_sub_prepare() for validation and tracing before a raw
subtraction. Keep preempt_count_add() and preempt_count_sub() behavior and
ordering unchanged.

Keep latency tracing in each calling path so CALLER_ADDR0 identifies the
caller. Force the start and stop helpers inline because trace provenance
depends on their stack frames.

Assisted-by: LLM
---
 include/linux/preempt.h |  9 ++++++
 kernel/sched/core.c     | 68 +++++++++++++++++++++++++++++++++--------
 2 files changed, 65 insertions(+), 12 deletions(-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 2e689de7b29ab..ad2c35b6813fb 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -228,6 +228,15 @@ extern void preempt_count_sub(int val);
 #define preempt_count_dec_and_test() __preempt_count_dec_and_test()
 #endif
 
+#if defined(CONFIG_PREEMPTION) && (defined(CONFIG_DEBUG_PREEMPT) || \
+					defined(CONFIG_TRACE_PREEMPT_TOGGLE))
+void preempt_count_add_finish(int val);
+bool preempt_count_sub_prepare(int val);
+#else
+static __always_inline void preempt_count_add_finish(int val) { }
+static __always_inline bool preempt_count_sub_prepare(int val) { return true; }
+#endif
+
 #define __preempt_count_inc() __preempt_count_add(1)
 #define __preempt_count_dec() __preempt_count_sub(1)
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1754d9f95f2cf..562d54b978960 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5978,7 +5978,7 @@ static inline void sched_tick_stop(int cpu) { }
  * If the value passed in is equal to the current preempt count
  * then we just disabled preemption. Start timing the latency.
  */
-static inline void preempt_latency_start(int val)
+static __always_inline void preempt_latency_start(int val)
 {
 	if (preempt_count() == val) {
 		unsigned long ip = get_lock_parent_ip();
@@ -5989,6 +5989,28 @@ static inline void preempt_latency_start(int val)
 	}
 }
 
+static __always_inline void preempt_count_add_debug_checks(void)
+{
+#ifdef CONFIG_DEBUG_PREEMPT
+	DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >=
+				PREEMPT_MASK - 10);
+#endif
+}
+
+/**
+ * preempt_count_add_finish - Finish a raw preempt count addition
+ * @val: The value which was added to the preempt count
+ *
+ * Complete the debug checks and latency tracing after an entry path had to
+ * update the raw preempt count before instrumentable code could run.
+ */
+void preempt_count_add_finish(int val)
+{
+	preempt_count_add_debug_checks();
+	preempt_latency_start(val);
+}
+NOKPROBE_SYMBOL(preempt_count_add_finish);
+
 void preempt_count_add(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
@@ -6004,13 +6026,8 @@ void preempt_count_add(int val)
 		return;
 #endif
 	__preempt_count_add(val);
-#ifdef CONFIG_DEBUG_PREEMPT
-	/*
-	 * Spinlock count overflowing soon?
-	 */
-	DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >=
-				PREEMPT_MASK - 10);
-#endif
+	preempt_count_add_debug_checks();
+	/* Keep latency attribution in the preempt_count_add() stack frame. */
 	preempt_latency_start(val);
 }
 EXPORT_SYMBOL(preempt_count_add);
@@ -6020,13 +6037,13 @@ NOKPROBE_SYMBOL(preempt_count_add);
  * If the value passed in equals to the current preempt count
  * then we just enabled preemption. Stop timing the latency.
  */
-static inline void preempt_latency_stop(int val)
+static __always_inline void preempt_latency_stop(int val)
 {
 	if (preempt_count() == val)
 		trace_preempt_on(CALLER_ADDR0, get_lock_parent_ip());
 }
 
-void preempt_count_sub(int val)
+static __always_inline bool preempt_count_sub_debug_checks(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
 	/*
@@ -6036,15 +6053,42 @@ void preempt_count_sub(int val)
 	unsigned int pc = preempt_count();
 
 	if (DEBUG_LOCKS_WARN_ON(pc - uval > pc))
-		return;
+		return false;
 	/*
 	 * Is the spinlock portion underflowing?
 	 */
 	if (DEBUG_LOCKS_WARN_ON((val < PREEMPT_MASK) &&
 			!(preempt_count() & PREEMPT_MASK)))
-		return;
+		return false;
 #endif
+	return true;
+}
+
+/**
+ * preempt_count_sub_prepare - Prepare a raw preempt count subtraction
+ * @val: The value which will be subtracted from the preempt count
+ *
+ * Run debug checks and latency tracing before an entry path performs a raw
+ * preempt count subtraction after all instrumentable code has returned.
+ *
+ * Return: true when the caller should perform the subtraction.
+ */
+bool preempt_count_sub_prepare(int val)
+{
+	if (!preempt_count_sub_debug_checks(val))
+		return false;
+
+	preempt_latency_stop(val);
+	return true;
+}
+NOKPROBE_SYMBOL(preempt_count_sub_prepare);
+
+void preempt_count_sub(int val)
+{
+	if (!preempt_count_sub_debug_checks(val))
+		return;
 
+	/* Keep latency attribution in the preempt_count_sub() stack frame. */
 	preempt_latency_stop(val);
 	__preempt_count_sub(val);
 }
-- 
2.39.5 (Apple Git-154)

