Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269ED31A547
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 16:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792661; cv=none; b=tbk67+7PHzS5ghPrvpaevqrBCytkdHzV1Le1cO8TUFNQOQ+X+v2j68yyLkL6p9jjMOi2GpbkSH78RDSa6U7jC0pqt6tv1PNxxBh40u6Igw/DWU+/KFada/b/WKKSsGzgvk/1yZctxvI6sTgfLZKMe1fSCaslOS5jdJTb2mcLAn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792661; c=relaxed/simple;
	bh=xxEQ3A3gLYi43VcM4txNyA5nH16DvxbSfWTaDMVtF+U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bR4Kj7f0QQtGMGEnhWqhFMDdCxvkXxbmHxOUOtK/oArvAcFng+/LTa+vhXaLWY3glsX+xdteU/nbgp4TtH/Z+c2H7nqbI2pcS1MKqxr1T9t3ce53RheiEbKIFbI2UZuWEJjpPoCnVzv1jBauXkiwXnTawRY5pGHzMGzdm4nqSgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuPlXl+q; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuPlXl+q"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso2824901b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 08:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792659; x=1763397459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qY+qINpaOz0cBrftmlOPWeh/tDbDV+8hjCudsDUPv3w=;
        b=KuPlXl+qZQSyNBuOAXuQO4DRHm7J492d13z6AiLgqUOlc8hHq489IyM+p6zboLWI1s
         oj0ve+yu+Sj8ohA+TjPxqmmpS3+9eSIzzgNFqAvL72AMmOcz8GVyl1jf1tKn0HD4zOtc
         Z9cjjKHdMHPQoFSxGeapBSH5iEetnGTdYVk8njOc34pX5TaZ56Q9egMCaJ4IhZSbbucT
         MCneCHQstUg6l03SD3K50IkpgDNDbDhpRRq3MXqBfCq2fFxQn0+TXk5bca3vo6p66TpD
         h5CDZrrAGmnmWUUe1OQPx6eJLLkzMpA/F2kAUls2mIkKLkNeao2GGUbr2KlUDlOM8X4L
         Y+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792659; x=1763397459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qY+qINpaOz0cBrftmlOPWeh/tDbDV+8hjCudsDUPv3w=;
        b=AqwmAFQE38g/JsXZc10VpB2VDK5OZDiCf/YOwWgIpqYNEKpA5zl8etgzq8aX3d3npb
         DDzu3OTx/AjyxwwkAeemTDFT99vC3KV171FyOfsEHHHLW8dXab9G3pi7xwy8nWibBNXy
         YeoeMj+chabsUXBnNerTbO7UwWcKavNUF0UKFoNc46dBan844p8eHpX1Ikvr9JBts8gb
         OeFZHB0DmJUBQi8afVrhplYcfc4RkMNdJMfjOZbcWJpoGMy7P6oTT1aT0pzh17cN196l
         KJV51SIfwtkapxJYv30NVwCdCj7m6Sksre9xKIE+NLkfakJiN0Hj5VDRBJeaK2EHKUcn
         6jPg==
X-Forwarded-Encrypted: i=1; AJvYcCWmlS2804q4ZVn0V9PTxll7VctLnvhzgX8XBo8DRxRamluSTJUW08AYi1uK8p/1Kksp1z1z8KzUbjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzRLGomgRbBi6BwFiOt1gk3Hec6SgF0LfqiUa3F/PKa1g5ZXmS
	mWQuNoDJl598aTi2J/S/RK61jQnYGl0bk8PtQVxp/7AJfKfPMF5kncJ0
X-Gm-Gg: ASbGncs9YGxXQT5CWjbvdSKgvlLQyUVbAPfeRbl0tEuCsMD7VUNckPbO+adyXmTdmSa
	2v6k9rFj3gEgT6+WN2DOkjoAWpJctFvwwqoiTyuSRVNHny/zlCDGy9t7ryRa3xSGxyLXDROrzJS
	DMknrK696FvAzoQdbHN0VVLnHV7WYJYqFu3BOGynNDzcIGyYLzIgYSEN+18vLEGtCOuHEkv8ynT
	wga8oUh0WrpMC/njToiXocjiIhzVtui4JzcNYPtpg2yCfNkgN6W3Z4dmvgqrwwlQO8W5P3YipJV
	jS8Q6Uiyt4xx9yDY1r9d8AjQUa0XHAOntXYomJco6nqUdPukYgGOQL2mqiwSMjIQs0z9hw89FcO
	p+JDZEC+4ohuJ2gC26wFzjdzO/C2m0xniAkM9PM+PvszRd5l8OyYC07NjlTita5GwNomAUyjEp5
	lrcjtCn1f2cYSC2aPLB4SblA==
X-Google-Smtp-Source: AGHT+IH2fkExOiw2xx23499QoJR+0QVGEltJ2Kq069nEQ8OMBF3QJ74WPA0vkc5LrwSnkN3SgQQOIA==
X-Received: by 2002:a05:6a21:6d97:b0:334:8d0b:6640 with SMTP id adf61e73a8af0-353a13aaf66mr12767757637.8.1762792659125;
        Mon, 10 Nov 2025 08:37:39 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8e750c1sm13193534a12.1.2025.11.10.08.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:37:38 -0800 (PST)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	David Kaplan <david.kaplan@amd.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	Kees Cook <kees@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	"Liang Kan" <kan.liang@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Rong Xu <xur@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	workflows@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v8 13/27] mm/ksw: add per-task ctx tracking
Date: Tue, 11 Nov 2025 00:36:08 +0800
Message-ID: <20251110163634.3686676-14-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110163634.3686676-1-wangjinchao600@gmail.com>
References: <20251110163634.3686676-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each task tracks its depth, stack pointer, and generation. A watchpoint is
enabled only when the configured depth is reached, and disabled on function
exit.

The context is reset when probes are disabled, generation changes, or exit
depth becomes inconsistent.

Duplicate arming on the same frame is skipped.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/stack.c | 67 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
index 3aa02f8370af..96014eb4cb12 100644
--- a/mm/kstackwatch/stack.c
+++ b/mm/kstackwatch/stack.c
@@ -11,6 +11,53 @@
 static struct kprobe entry_probe;
 static struct fprobe exit_probe;
 
+static bool probe_enable;
+static u16 probe_generation;
+
+static void ksw_reset_ctx(void)
+{
+	struct ksw_ctx *ctx = &current->ksw_ctx;
+
+	if (ctx->wp)
+		ksw_watch_off(ctx->wp);
+
+	ctx->wp = NULL;
+	ctx->sp = 0;
+	ctx->depth = 0;
+	ctx->generation = READ_ONCE(probe_generation);
+}
+
+static bool ksw_stack_check_ctx(bool entry)
+{
+	struct ksw_ctx *ctx = &current->ksw_ctx;
+	u16 cur_enable = READ_ONCE(probe_enable);
+	u16 cur_generation = READ_ONCE(probe_generation);
+	u16 cur_depth, target_depth = ksw_get_config()->depth;
+
+	if (!cur_enable) {
+		ksw_reset_ctx();
+		return false;
+	}
+
+	if (ctx->generation != cur_generation)
+		ksw_reset_ctx();
+
+	if (!entry && !ctx->depth) {
+		ksw_reset_ctx();
+		return false;
+	}
+
+	if (entry)
+		cur_depth = ctx->depth++;
+	else
+		cur_depth = --ctx->depth;
+
+	if (cur_depth == target_depth)
+		return true;
+	else
+		return false;
+}
+
 static int ksw_stack_prepare_watch(struct pt_regs *regs,
 				   const struct ksw_config *config,
 				   ulong *watch_addr, u16 *watch_len)
@@ -25,10 +72,22 @@ static void ksw_stack_entry_handler(struct kprobe *p, struct pt_regs *regs,
 				    unsigned long flags)
 {
 	struct ksw_ctx *ctx = &current->ksw_ctx;
+	ulong stack_pointer;
 	ulong watch_addr;
 	u16 watch_len;
 	int ret;
 
+	stack_pointer = kernel_stack_pointer(regs);
+
+	/*
+	 * triggered more than once, may be in a loop
+	 */
+	if (ctx->wp && ctx->sp == stack_pointer)
+		return;
+
+	if (!ksw_stack_check_ctx(true))
+		return;
+
 	ret = ksw_watch_get(&ctx->wp);
 	if (ret)
 		return;
@@ -49,6 +108,7 @@ static void ksw_stack_entry_handler(struct kprobe *p, struct pt_regs *regs,
 		return;
 	}
 
+	ctx->sp = stack_pointer;
 }
 
 static void ksw_stack_exit_handler(struct fprobe *fp, unsigned long ip,
@@ -57,6 +117,8 @@ static void ksw_stack_exit_handler(struct fprobe *fp, unsigned long ip,
 {
 	struct ksw_ctx *ctx = &current->ksw_ctx;
 
+	if (!ksw_stack_check_ctx(false))
+		return;
 
 	if (ctx->wp) {
 		ksw_watch_off(ctx->wp);
@@ -91,11 +153,16 @@ int ksw_stack_init(void)
 		return ret;
 	}
 
+	WRITE_ONCE(probe_generation, READ_ONCE(probe_generation) + 1);
+	WRITE_ONCE(probe_enable, true);
+
 	return 0;
 }
 
 void ksw_stack_exit(void)
 {
+	WRITE_ONCE(probe_enable, false);
+	WRITE_ONCE(probe_generation, READ_ONCE(probe_generation) + 1);
 	unregister_fprobe(&exit_probe);
 	unregister_kprobe(&entry_probe);
 }
-- 
2.43.0

