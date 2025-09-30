Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B1D25524D
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 02:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200318; cv=none; b=Y28TkfhisEdBdaMJUXDfRWhnXgEjaFs5nDDJx4nPmQqrDgvTICVPT1d1RmkN4bqSbUm+pWZdoOh3Y4ht3pw+dvWv/C7M+8eMTxLZUe6g6+EOAx9BxRohhJ12gb1Vm2BDYxKSzRdq3HNVMr4JdRXOmxoi1vis50Y7rDjaFy0FFes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200318; c=relaxed/simple;
	bh=wmwmRtcPH4ST6Dm0G2/AFHsMnlz3q9k9yRWhyo1wI/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wz4SbHKJn1xyDDVHhZbXYSW0z/RmMvG0KAp1mdMlmV/05W4NAxvKwLM7Jym42c2zkfn/CzdtUUHfZbJ+T1g7hKi+WIV4IeSoBPIuvSRQcN6TNNphk5rOHTf0PoV3GDThQ8btri8Q0TxSQwThXyMYPZDk+k2vi//NtjFiFGlfhqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMQ3RZdc; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMQ3RZdc"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7811a5ec5b6so2800951b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 19:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200316; x=1759805116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4BKEfc9ax2ksTKKBAwbjubQHvBiDjA54WMJGQTptLg=;
        b=KMQ3RZdckAmme0jUOCXJIopgemB2Ja56Kpmz+pbEeM0xoR/HYAly3J0SYhU6acxg9c
         TE1YANvW5GLqxlokWaBsC94u3Df3Poh7J2S51JRvuFVp5QAN4u0/5Bk78DnZflaGAIF3
         GaAHFrt/JiI3GGcSiAZQKNFeq5N/scmw79xffzCMMwoXlLpaig1EUpBnmgp1Xiw4lE+W
         yRRuhICYSgLsqg2mBt8118beN1+fESg9GutgwL7xJ4G0koaRA8mIIogGpHVqAX7Rf4LP
         cnwMekiQj0fEx2e6tzstCrH0wuSOhn7ui5xrX7TGCEuEe800b1rM4DQqwnuwfGOHLdgI
         wlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200316; x=1759805116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4BKEfc9ax2ksTKKBAwbjubQHvBiDjA54WMJGQTptLg=;
        b=ga21qG00syk1KbDqJjqL+7hf6l4UsGIE/1uwDslTdGtLgE0alMUWiCzf0jyYoU58o8
         EjVIr0sCAckiV2EpDZdpHHLD6D6XJLxyddS47E1MjhRWr46gI29DgoQepQClRCk86a45
         xF0loOzhExPKTDokcWhtp+PB/JPBuXlOnglc3jXKUlqjTEXe+FqgYw6JPC8yI1rnuNEQ
         2J58Xjv+al5D5suS2HuYAPac3R6KCdXS0b8yOB51N5OD0NOMwSS3R9AeSQLkXiPbKmti
         7HlCK+UschbVNwAZf1h/rp+kPR1YMMyXh5OfWP8r6w3AU5bJfgN+VkkSRU0FtEhcWjAt
         ei0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPUK3L3p5ZL3DqqrrAWNpzvonVOjTqQbI5Obdc/1tb30K8ETTL+2umyMKHKt928Mt39UA39cX7jzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUm1g+6FRd1K4zk/AQWjpyy13TkFp3QtIn9tW8llccvntQ1ZQk
	QzkLn5aRW+8UghrO6gIcN8IQ141Z8WKZRHA/+tJvOzzPKdWJJ78Wyyw1
X-Gm-Gg: ASbGncsWefOdCQgN9N4qkb+ThVd0AJavMWCt2s7dQQLmIieySeLEW4+8WLUL8ghTw2K
	b4ZCVtADQS64i4VpD25uoY7P1h3aRdJeCsp4LGbP+hSKXV+TkLtts14wQs+uaR+DVrWIunsDOIy
	c2E0ApHgrDjVBsjPzhhtIQypag0aCgn0JvQFdp9i4GFXvlZRil/dd6m+DfdDHvGH89DsTrqEcS+
	grEJUKVXpep04SWcXOu/TkRJAvJ/jr4YgfKbTeelDI2MdAgRBGdmLJkNr2Kt0QlBqyhHiwc14jj
	4luZmz1GAnW3ELBPxHcIT0NgGC63qj9k126YlCt7zC2Ortc2tTc7PIaMRBWnjaO4rmqglCiVCDJ
	2U9Ob606S26m/pjxqWQG/w5nH63UVoQ3O75WkPbdgul2U6C3A5kqhlaqsQQa8WM2/XQwMgPYyMy
	nChm0lfTzbj5E=
X-Google-Smtp-Source: AGHT+IEQuyQ0WfSSzPcc+c258KMZgmg4lZ9MhFnyLGeSTv6phqmEXsURuXiHXbyU/qbGHk1KY6eV1g==
X-Received: by 2002:a05:6a21:3296:b0:2b5:9c2:c584 with SMTP id adf61e73a8af0-31772a179dcmr3208370637.26.1759200315810;
        Mon, 29 Sep 2025 19:45:15 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c557418csm12399859a12.30.2025.09.29.19.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:45:15 -0700 (PDT)
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
Subject: [PATCH v6 11/23] sched: add per-task context
Date: Tue, 30 Sep 2025 10:43:32 +0800
Message-ID: <20250930024402.1043776-12-wangjinchao600@gmail.com>
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
index f8188b833350..6935ee51f855 100644
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
@@ -1481,6 +1482,10 @@ struct task_struct {
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

