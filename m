Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB9C2DF12C
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007473; cv=none; b=UaJvQ9Ziqe/Zz/dSirLKs6AXL7WnJq8nNqCOpMEddpc3dRTib/ZrflW3kp35kojmCjFRuQCrRXgU480T4i6YfhpSN0BKf69dxwGNa4K8WQDYJ68j3bheq6Zi5Hw8qdOHzAqMsZlWMb5hTYaWhrzL8HTpeNlutTxLfJLEXTy4kw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007473; c=relaxed/simple;
	bh=zK4RWkz30MU/OH8jEOTvGZJj2/7wnecqVuCjoc5/aOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSSoz9Y7widBnpuvxGA0kqTFvXnaiue4794peSLPkiKDhPjnrL0Z0Vorgy6FbZy4AKSdxlrjC+pm1fHL+aKOwmE7Hbs8zuJRg8NAB0DEILMPrGZzFii89dzNOULj4ATSf5jIzqD+kprEn/apdRXm88XUO967jI5aCWbUXTNYRCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUQKyRWS; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUQKyRWS"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32ec291a325so641351a91.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 03:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007471; x=1760612271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPor1AiTaHON3BhVq+NCy46wTls72eqNmMOTROEZDIU=;
        b=OUQKyRWS4NogfY8BKn70Mh5zqkNfWaMf1ej46t3EeqmhIzH77wL3IrQoFcmsSnNt8T
         oiJf7v6AZzNxPpoZ9mOwkWbowmLLclVGMWt+yqVfDwiTTeJ5M4GlRqfXof8NWTVMwoDm
         1s3uXUTMLqyoKoCtjiocVkkszgMND+F9C38eoorWaZZuRGfJ9gR1a9B3dth8Fsx+RFo3
         XOxOaROnb5dDAQZBhJzWSXPAyV9j5gThTCUjg8ajdpyL3bMf4a8daEOamlzNMBGBN7Ca
         HIT4pHppqIROfYf2ua2k+b6fhhBg1OwSrYmJTaP6rkgM/8Ivw1onylWTQnfrmRRNwbHe
         /ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007471; x=1760612271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPor1AiTaHON3BhVq+NCy46wTls72eqNmMOTROEZDIU=;
        b=GdLZWgngVXd7sCdrMbCrfRXKhF6lDsp4wQyxLMESuvjKt4Pi+JPl1unG8wqUMlB2ex
         RyzKjnRlLmi2UB1JeuLp5O4qgdFtw8fncgWVKelKMjhHCNTDnATcRNRjPvJXpC940zMj
         qo6Xe2NQLiYUE2P2s3TW839/aO49cePCRYlHGMGPQWDvWjkU9Ks7YsjLtU/YI9JIGjUR
         M+eSsMN15w4rAnFjNUpIKoiRpKQPo7StbH9FGifNz+emF5iW0avOsJFyyljZOzfc5CCf
         ohmASFBfaUag2hVjXLLAd4y3h9OlAbh5y1EBP2xOqKpGKcuuDeCV4EhQI+TW6yqbg+83
         PNSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2faEKc2OoujHVLx9GgiBhGjaDm8QZnAfRD0PShFAMtVzYj2NYPmKO3U/0mfETUKn2CXY8zAkkWKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBf1t8a1Wbt2ZJYV44uFgjFdlqvNvUBnqhhCbJ6rs0GMRAcxVq
	szMWt3rKmiiBwofekzwkArtVJI2J3Q1jl+4ecSfmq1Lkxl/79U7eefNY
X-Gm-Gg: ASbGncvadP3WvI6+QS52uoHb/yq/WHqY/GJ6Y7bU9kU/9cJ14kRMT5ofOCiY2VFaUIk
	VUWnhd7Mkkvt1BIt8YDmO/8wEoDEYcX35Od3ICQRH24vOds7V95WfkzFE6cbW+5yFyeUP/q1rFm
	1tWnralGrBZZyeAzyHZltsD10i0Mm4CuCE7nb+88aSM8VMcn31GF/ZhRLMxmzMYZXQfrbkNsTAR
	hXggt4/H70kXtXmHyV6byHz30Y2SKLlPXF3BAFd4ypHE2QVXqMRXhGo/TMujfTDQLV0rfERT/pZ
	PIzfqzvlo9oHFxjfaOXC2Hw3o3SCfpJeoSXX+lgB2Pk/iQfCtQ7e1b+GVElEBniW9Y+eDuMri0n
	xG53WXA2quwHI46f3TWvWd9RXCRLBPp7tlpbvh+nYX+B+SUqs9BUyOrP3swOd
X-Google-Smtp-Source: AGHT+IGfoiP7FyJn6BgVbF1cW+pirt064OXDV5hiE6L+A4G5ft0+AYVVqaDAH6C+gBiZsXo7qM0L8w==
X-Received: by 2002:a17:90b:3ec1:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-33b5111491amr9148774a91.9.1760007470702;
        Thu, 09 Oct 2025 03:57:50 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b513926fesm6702757a91.21.2025.10.09.03.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:57:50 -0700 (PDT)
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
Subject: [PATCH v7 11/23] sched: add per-task context
Date: Thu,  9 Oct 2025 18:55:47 +0800
Message-ID: <20251009105650.168917-12-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009105650.168917-1-wangjinchao600@gmail.com>
References: <20251009105650.168917-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce struct ksw_ctx to enable lockless per-task state
tracking. This is required because KStackWatch operates in NMI context
(via kprobe handler) where traditional locking is unsafe.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 include/linux/kstackwatch_types.h | 14 ++++++++++++++
 include/linux/sched.h             |  5 +++++
 2 files changed, 19 insertions(+)
 create mode 100644 include/linux/kstackwatch_types.h

diff --git a/include/linux/kstackwatch_types.h b/include/linux/kstackwatch_types.h
new file mode 100644
index 000000000000..2b515c06a918
--- /dev/null
+++ b/include/linux/kstackwatch_types.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_KSTACK_WATCH_TYPES_H
+#define _LINUX_KSTACK_WATCH_TYPES_H
+#include <linux/types.h>
+
+struct ksw_watchpoint;
+struct ksw_ctx {
+	struct ksw_watchpoint *wp;
+	ulong sp;
+	u16 depth;
+	u16 generation;
+};
+
+#endif /* _LINUX_KSTACK_WATCH_TYPES_H */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index cbb7340c5866..707b34f26264 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -22,6 +22,7 @@
 #include <linux/sem_types.h>
 #include <linux/shm.h>
 #include <linux/kmsan_types.h>
+#include <linux/kstackwatch_types.h>
 #include <linux/mutex_types.h>
 #include <linux/plist_types.h>
 #include <linux/hrtimer_types.h>
@@ -1487,6 +1488,10 @@ struct task_struct {
 	struct kmsan_ctx		kmsan_ctx;
 #endif
 
+#if IS_ENABLED(CONFIG_KSTACK_WATCH)
+	struct ksw_ctx		ksw_ctx;
+#endif
+
 #if IS_ENABLED(CONFIG_KUNIT)
 	struct kunit			*kunit_test;
 #endif
-- 
2.43.0

