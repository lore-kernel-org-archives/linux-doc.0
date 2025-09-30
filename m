Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D12261B98
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 02:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200344; cv=none; b=U0JlYqKcJ7FmItB0YN4OIpPpROQCBzP2KUIO/UOvOrpI4y+V0i0KbpuT7w9viGCHe6cwa7MeSPoE/fxEi+D8QP5tBnjZRKGYiFgxI7Tu3D8KE0uMmEWzNgxbSgDIcWa4cuOqvKjrgvK16ZsvQ/o1a21oTV5LOgV1/fPi8XNd3Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200344; c=relaxed/simple;
	bh=zgbvGJBSx4YBKNkqO/qzz/La9XfnZ3vAatfFaQMoL7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFQttb76QmPi9gkI+VJHR5oXM/piKeT7jTeQOSuwS/ABwMFbyi4VKvnhNKl5mNLPqiHaYQkSWAluHqbAPJWwxcXfKqnG/A5Cx+oWjz+Cdz7AouI+EjobNWD0ZzGkXmjD1iQ/3zndhcBJlOwdmuShweJcKjj0Oru+Ltpp/RNiAPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKJOEc+9; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKJOEc+9"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-78100be28easo3958897b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 19:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200341; x=1759805141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmaGbmiuxIsK0xKTEWJ/f7gfwC2bw8p0SOLh4b9Z4FY=;
        b=VKJOEc+94AKnpJiVOpWnQ6DKSsWX1R1XbyHo5/r/AG6aDGAWk9wPLSshoMM+livdS+
         MyEuw5bGfLyFLEN+CymB1AYeyMGWWzvzslOuckXZNL+LkSjQP5bzS2nXeQjKnytOTkYn
         I3znRL92dI+MXIBc0Fotj3NpYAr6hAMRbuIxDzLO9p6jaZ0voXC2/ADIbtgpiE45AqYk
         6KiAb/IiOHKoiHWF38rhEnx8s7VaaJkf9vC+I5pJNvNIGogQNziLULRwmmnUmEFUMU9c
         FfGiRCJb+mhy38xk1bCLHPsMgriXv6C+zhRwB5OmgZb8gtGClZpvwOrAEAqybrDgc9kW
         ouvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200341; x=1759805141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmaGbmiuxIsK0xKTEWJ/f7gfwC2bw8p0SOLh4b9Z4FY=;
        b=eqlo362NDWnn7PJdso1AuQGSLwU9aQMA2pdx819D2FO4tWRYfYx+/uTyaD6w7YVX2A
         Z7MpCzzhHwvYkQ+DNiNQmyxPQ3ooAPETjKCFFjKe22ZQJqHjSjAwDWKyhZTdTApVkrZx
         dhdKWNfs6Qsg2WKuUtosS5pR+H0mITxKFuqXvqKgG/Cg7C+JlW7rF6oAdQ+fX0zwOG0n
         DOUsqvQHj7c84JhleNJhcy6hXiMy3zq7PMSg6XjcIPyRvwcYU0KQFqkcmQBHaq6ftH+u
         wjHmmVGQhGZT/SlYn3ycDqrCalfU7vAqaNf+a9FyHsWH8H76fiYzOXWQREqy1f+vkVFA
         jRhw==
X-Forwarded-Encrypted: i=1; AJvYcCXGg2MslB67/KZjo5w8IkMAzhfxcrb831ZB3wbBSZuLxrbnOLlDtNaJg2DoQpbAlg89ZRl6V5LdqL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAwgbxZRR68zp9Ty2d+s2parV9r441pKZpE+qUGmFPEIP+Jbft
	N4QdSkmFcIWonTldKoC2PrmObNc6MXZ7JkfcJcrYI0BIw9CpOZK+Uv66
X-Gm-Gg: ASbGncu4O3xVy2vNRZf9ngANIQQy2avdHefIeUtooHvWW6VxcgGK7VAKgp/Vpyxnizg
	XW+ZgQWEKIM9MvJSo4LhjxkEfcVbJ3B5NzuOVmbO9aJAmi59+qzXDXaXkYDDseTYhSCawEx2dCE
	5wQ81flgHgN1YG58SeJ9jRTicEgxOtA9D961sBqaQApba0Hpal+qQUJGhcj8C53w01VkEpCGfLY
	aVaMQrO2An6TAb8kV/vhIMC1oe75mMiWcSChSt4fxkEQPBhvRGid7o1jUoIUO7/La2A849OcGW2
	FSzQdVC+Yu+idh9RzZ55wNxqj4LxBUyQ1q8gX2KFTBir+d3UbVb1gy6s2e8aiFOuOCdjAfDGvkQ
	yyDQhdR5HBvWM3HPT2K3HzVkqA1uhMWfbgr+x47W/lOVnvidEYtOW455PjNdX0ypQhQ0wUeBLAd
	2L
X-Google-Smtp-Source: AGHT+IE0ZzT2Ls3FLJQKvDsDE35NvUvpfAF/CKszp2PRAknfZulRv/lUTsOjo2MTaS5CdAlTIrrq4A==
X-Received: by 2002:a05:6a00:26ed:b0:781:2ba:ef14 with SMTP id d2e1a72fcca58-78102baf1e4mr14490364b3a.25.1759200341230;
        Mon, 29 Sep 2025 19:45:41 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b64cc6sm12378142b3a.71.2025.09.29.19.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:45:40 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Rong Xu <xur@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Nam Cao <namcao@linutronix.de>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	"David S. Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: Jinchao Wang <wangjinchao600@gmail.com>
Subject: [PATCH v6 16/23] mm/ksw: add self-debug helpers
Date: Tue, 30 Sep 2025 10:43:37 +0800
Message-ID: <20250930024402.1043776-17-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930024402.1043776-1-wangjinchao600@gmail.com>
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide two debug helpers:

- ksw_watch_show(): print the current watch target address and length.
- ksw_watch_fire(): intentionally trigger the watchpoint immediately
  by writing to the watched address, useful for testing HWBP behavior.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kstackwatch.h |  2 ++
 mm/kstackwatch/watch.c       | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 4045890e5652..528001534047 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -52,5 +52,7 @@ void ksw_watch_exit(void);
 int ksw_watch_get(struct ksw_watchpoint **out_wp);
 int ksw_watch_on(struct ksw_watchpoint *wp, ulong watch_addr, u16 watch_len);
 int ksw_watch_off(struct ksw_watchpoint *wp);
+void ksw_watch_show(void);
+void ksw_watch_fire(void);
 
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index f32b1e46168c..9837d6873d92 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -269,3 +269,37 @@ void ksw_watch_exit(void)
 {
 	ksw_watch_free();
 }
+
+/* self debug function */
+void ksw_watch_show(void)
+{
+	struct ksw_watchpoint *wp = current->ksw_ctx.wp;
+
+	if (!wp) {
+		pr_info("nothing to show\n");
+		return;
+	}
+
+	pr_info("watch target bp_addr: 0x%llx len:%llu\n", wp->attr.bp_addr,
+		wp->attr.bp_len);
+}
+EXPORT_SYMBOL_GPL(ksw_watch_show);
+
+/* self debug function */
+void ksw_watch_fire(void)
+{
+	struct ksw_watchpoint *wp;
+	char *ptr;
+
+	wp = current->ksw_ctx.wp;
+
+	if (!wp) {
+		pr_info("nothing to fire\n");
+		return;
+	}
+
+	ptr = (char *)wp->attr.bp_addr;
+	pr_warn("watch triggered immediately\n");
+	*ptr = 0x42; // This should trigger immediately for any bp_len
+}
+EXPORT_SYMBOL_GPL(ksw_watch_fire);
-- 
2.43.0

