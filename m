Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E548323816D
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 02:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200277; cv=none; b=oU8150WuDj8KC4vtL7LrfCLvUWkshdZp831WnPaLKTqxZa77VtWHc3p6BiCHlN2Ky504HeaS0mHe6cW4OLnHSt/vEb4Uplb52cqZxKCXjcyA/9OjOjhkDfuwLbVwx9l8oM/R+lqk5oBOQ5W3ikzT9dZyanfSXnRWB3DW/lpA59A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200277; c=relaxed/simple;
	bh=boxEQn+lY/C6jkvJZFjK01G2rW6t0U2zmcOwIq1YIoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPZgej8XCILJMdgHxUVzYeGXueWqYOBfdgEaADdAX6Ru40tfYA2nJKfovZnPLwFaWT9vrjrot1CpdIxsXpAAZMPOLpS9BXZ5Eri7iSNJTJt4fGeHhRhS03oS8brv8/V0t8Ygd8t03XcGpSaYsAM9ZayScZfTGg6Nb5ezDZfjEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC2DSGZK; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC2DSGZK"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77f7da24397so4519170b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 19:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200275; x=1759805075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLL9szq8LgdVljgQmrpuYN0dKjRbhwJ4oBDbEm6eF/Y=;
        b=bC2DSGZK64bV0V4VwYrPhZ87NyeXrn4N1/gDgu1QEAOXxYyoDSWwqTIgW99eX8D002
         ebw+gg2ofPjgYVxo6cmu0TKU6yEwfgV6lPJUNynSobkRUUfzwwH/jWcXpZME4rEhNruv
         o1ENNjwOKRbZttzLmaSAspqTNbeUqc6p72F57f2qpAf7P0cbk1FqS+NYLJTlNdOBS42z
         dGsJDosoIATTiqmpD5NerWCnQSqE8nhPEHMW2fJS+GsNInj7jmXDr2KT6wgyWqvptTbR
         O37aE88YOo/Q3Ul9XUCYjzzosK7dAjZPiauwMt9Nwsowbb8VAP6KJR/yjsHTeUzR56mc
         9gMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200275; x=1759805075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLL9szq8LgdVljgQmrpuYN0dKjRbhwJ4oBDbEm6eF/Y=;
        b=o84vyJGP0OqsromuhQl1XpAJpkM751viUWJ5YLo6YBYgyA/W+pBxx4NS98/z2XP6Py
         uPLshEBkhFkn2dy/y3n6MGiZfKkdDCwHBVJ2rC1M+gCEdbuBcWZcMl1VNG/GKdNUgdqe
         HM1Z+XRAQ+xU7Txu0XARWll+2Swg2H7VDGx8r81JweDVCRyspsRdksWQPZebtkAOKbkJ
         8/H+A++Jdeln16Yh6bD/r9xJauSpRTEYBJ08YTeiZGZgqbRopYxObzVAq8SkEzyI7cMJ
         6C31rLCe+4qz+oFr6x80PTxjykSlguGABCzJnTzqVDlMAAKEDEkcAcz/IiU39j0yr5Am
         NeaA==
X-Forwarded-Encrypted: i=1; AJvYcCWLSsPuIn01Zvg9oKwctEK+on6wSEYjnogykUNOg+DJQhwVdvxz7ciKA/LzodTCjh1wU1eB7WlrRkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKdSEIfxt5wKjzLNrvKuVPk+e14sapRGUPnu0HWHLKmUa6lijE
	WxdhhUpGKRkqqbSNuHYi/NBZta/fYVNlQvnvKjFMV+O/jkKmvxKvO3Zl
X-Gm-Gg: ASbGncuXdwp50gpUvGpwJ7fN8VOQSz9VSnWYt8CPEC5lQDlidir9h8AnmlrbiDteoWN
	QrmrJ2r9uVkW/GFRj6ihRW37fr3zUAeXnfy7qrBP3C9vM9hy5I4he9qQ4kMttqMX89fWm/1jmXG
	cWgFw2Di1SjOhyMYlPDyWUEoE1Mvw25JDQKdCjfY0drbav/kmahMdsD/hRVKaBGchZ1iTm8Rsje
	F6+d0v67LuJ6iVlVRrUyfqNp00PGrTDSHQl1LyqAoPiztYe+f0HwW8pjFGaAvCtFp1cckbGY0Xi
	r3gJRFyt+ZaClnaFBg3QGtImof3zeTOiulCupVkV/ymOkkH0lTlROr2Q+qK0vY4DfPpPRAeIXta
	FkiusovIwp6S8b7y3oGja7Piqj53OzGO4OMr8ckAkKQ89vTtYM4liAyo+2TnkTzkd89NAwF14T6
	bK
X-Google-Smtp-Source: AGHT+IFKAUJd50skyQZezOIyRCzitP2KYWlsYqho8uHybu50MFOQdhfyrcEbVkIiLwip8Qb7gZ0ySg==
X-Received: by 2002:a05:6a00:4b46:b0:77f:416e:de8e with SMTP id d2e1a72fcca58-780fceb5040mr19851033b3a.26.1759200274983;
        Mon, 29 Sep 2025 19:44:34 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238f11esm12449091b3a.19.2025.09.29.19.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:44:34 -0700 (PDT)
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
Subject: [PATCH v6 04/23] mm/ksw: add build system support
Date: Tue, 30 Sep 2025 10:43:25 +0800
Message-ID: <20250930024402.1043776-5-wangjinchao600@gmail.com>
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

Add Kconfig and Makefile infrastructure.

The implementation is located under `mm/kstackwatch/`.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/Kconfig.debug             |  8 ++++++++
 mm/Makefile                  |  1 +
 mm/kstackwatch/Makefile      |  2 ++
 mm/kstackwatch/kernel.c      | 23 +++++++++++++++++++++++
 mm/kstackwatch/kstackwatch.h |  5 +++++
 mm/kstackwatch/stack.c       |  1 +
 mm/kstackwatch/watch.c       |  1 +
 7 files changed, 41 insertions(+)
 create mode 100644 mm/kstackwatch/Makefile
 create mode 100644 mm/kstackwatch/kernel.c
 create mode 100644 mm/kstackwatch/kstackwatch.h
 create mode 100644 mm/kstackwatch/stack.c
 create mode 100644 mm/kstackwatch/watch.c

diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 32b65073d0cc..24f4c4254f01 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -309,3 +309,11 @@ config PER_VMA_LOCK_STATS
 	  overhead in the page fault path.
 
 	  If in doubt, say N.
+
+config KSTACK_WATCH
+	bool "Kernel Stack Watch"
+	depends on HAVE_HW_BREAKPOINT && KPROBES && FPROBE && STACKTRACE
+	help
+	  A lightweight real-time debugging tool to detect stack corruption.
+
+	  If unsure, say N.
diff --git a/mm/Makefile b/mm/Makefile
index ef54aa615d9d..665c9f2bf987 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_PAGE_POISONING) += page_poison.o
 obj-$(CONFIG_KASAN)	+= kasan/
 obj-$(CONFIG_KFENCE) += kfence/
 obj-$(CONFIG_KMSAN)	+= kmsan/
+obj-$(CONFIG_KSTACK_WATCH)	+= kstackwatch/
 obj-$(CONFIG_FAILSLAB) += failslab.o
 obj-$(CONFIG_FAIL_PAGE_ALLOC) += fail_page_alloc.o
 obj-$(CONFIG_MEMTEST)		+= memtest.o
diff --git a/mm/kstackwatch/Makefile b/mm/kstackwatch/Makefile
new file mode 100644
index 000000000000..84a46cb9a766
--- /dev/null
+++ b/mm/kstackwatch/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_KSTACK_WATCH)	+= kstackwatch.o
+kstackwatch-y := kernel.o stack.o watch.o
diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
new file mode 100644
index 000000000000..78f1d019225f
--- /dev/null
+++ b/mm/kstackwatch/kernel.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+
+static int __init kstackwatch_init(void)
+{
+	pr_info("module loaded\n");
+	return 0;
+}
+
+static void __exit kstackwatch_exit(void)
+{
+	pr_info("module unloaded\n");
+}
+
+module_init(kstackwatch_init);
+module_exit(kstackwatch_exit);
+
+MODULE_AUTHOR("Jinchao Wang");
+MODULE_DESCRIPTION("Kernel Stack Watch");
+MODULE_LICENSE("GPL");
+
diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
new file mode 100644
index 000000000000..0273ef478a26
--- /dev/null
+++ b/mm/kstackwatch/kstackwatch.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _KSTACKWATCH_H
+#define _KSTACKWATCH_H
+
+#endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
new file mode 100644
index 000000000000..cec594032515
--- /dev/null
+++ b/mm/kstackwatch/stack.c
@@ -0,0 +1 @@
+// SPDX-License-Identifier: GPL-2.0
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
new file mode 100644
index 000000000000..cec594032515
--- /dev/null
+++ b/mm/kstackwatch/watch.c
@@ -0,0 +1 @@
+// SPDX-License-Identifier: GPL-2.0
-- 
2.43.0

