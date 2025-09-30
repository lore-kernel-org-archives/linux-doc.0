Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A169225779
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 02:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200287; cv=none; b=FitYTXPF95Z3RRHYN03tLlMztZbjRacAO00yPXSrnQigMv3tKWnNkf5HRI4UWNdptcVMHhJ5iFuA7i9r+SCq2VWSxZBBkryRT7AcuzCyKkB/TKif0IziwJ1Bhu5zMGsyc/qM+wSGVmwYrQoZ82KNHGjqNI3BPs888PDOb4es9JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200287; c=relaxed/simple;
	bh=Feu6QMw0Ju5Y4dTxQ53cERWbV/8rWQzq92gPB2aNeXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f85Q2/5Y45gA9tMK+XSn+S69HLzGXsAonYA/L/299+g35Srgpttez4MT4M9kgk98XIEPge5QVDD7wTR+Tp8b0vT2rTGpSX27nNlbq+Lw6Epkt/t4yOchqwT7tsVItX9B1pkirvCGkjMuHIXdIAIm4ZnG9l68KkqGU0B4fntTeq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cD9UsyAP; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cD9UsyAP"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-330631e534eso5504086a91.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 19:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200285; x=1759805085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGY4NXn9SYrwp2MIROIAsCXd8mHWC2w3iRZMJXUxzyw=;
        b=cD9UsyAP5k2wj4gs9yH53Z5F0evW6nvZeYep6U0kGGBeOq22iMBGQ10fM4HLmh6GoF
         ibawQ7frk+355kuKbgNVplNh2RBpcejEqPqp8ekEoIAd/nN0lrc8n7zGmNOu1PNXZjSl
         i+jMW7vO3nhuGEKYovvsy+1U+FVTZv+u3oxyDCVIa/7HagNJvsc63RMlohld5WAoArmv
         WsgKXvDy2bkVe6dLS1kaRSdoMxVgyyN6+EzILqOlGDHRWQGxakjNwT9P4VnSx5ENfSZL
         ezdf4YzogQO0TaQ5Ji79Dh7FUajDGZcrv7mkd4HnUmIAz22USLvwRkj2cQKWmYxQirj/
         X4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200285; x=1759805085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGY4NXn9SYrwp2MIROIAsCXd8mHWC2w3iRZMJXUxzyw=;
        b=swSvux9JpwqAZRyYvMvwd8BrlwPyXj88T8ISnERV3ZEIjTcD+wPBFl5rtqUKBxpEx5
         TOqtHz/ZyPHxA1BuER7ab8Sgvx0iVTz3d4FC+kbAFQxchcJPTQ80V6L1yzHSwy92xN8Q
         CTBY/RMemzBPsHr9pfkPkX7BYmcQEPxCNCHrRs9z+QbkoFwsWZTVac1qeQjU5VZrFlWK
         kHjmIpj6/kNU1oDXGNjJuNovbRYs+tykao3wUSNPDVMexnI0zTkG2h2GQ1eoyJh7IidW
         mp5ul5DDWmQPR5BLfFBuJapZbe3Z9ewO1ZaZs2gzojDDL2860G95Ihu9fpnlAxL9E96t
         /i7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWb6qxdDcZ5Ws9jLAgBeCW7ARsgdIGVaqdF7bHXLmlXMr2l/2l9wazHm0B91RLp6zC8An7khd00pp4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz6aH5rA5lX/U1NB1qXX+G2BFAcJ4Xmtri40Hm53Z60yJ9vCAf
	x+S3cCKlMqO/fImYyVU9+cm0P0spwJnwnyIilaCEFXtQTO5FqHL8WEHT
X-Gm-Gg: ASbGncsv3HyRSM47xLjZJEdX76gABBDPRhPHau1Ggcs7UGM0mEWzdKIhUS8fyycijwh
	iZA/Yt7iLM+c/VmQP8kk+7rR3TZevOIJtzR48setzsa1+rx+lZqfjghrbr4qXubMRKUea+9SkRQ
	WDakStNb9VdUfj0G94Li1/05rVVV5wbFWSoOVK9CteMJ12V5cLTWXFLELy2LmBsmyyAWTCHMsMt
	1u7on1syh4+Y80ipaz9uAWd6H3foagjhqfAQcTZW8vRqgLf5YtSutBJ9Fadh9qNVXgjAGChralU
	x69o62bvvfnOy+BkiFuXhJ9w2IfwbwFngEhUazyA7/PM8HBDXl4l5pz10pUH26G7niThgnpTHLO
	rmol6RbOuILHgO7p+MA5s1hIasordw+7mWfPjL4GV7nTOLtQuVsW2zk+o7B3MnBWMtqKRxdwm49
	EW
X-Google-Smtp-Source: AGHT+IFCIxJ+f2ZP7/SRGQLtykJQ9skkyS5Xc4YM8nOS80KRWl9hYAY1JbghIyfFVwcemJPxzbxqqQ==
X-Received: by 2002:a17:90b:1347:b0:330:6edd:9cf with SMTP id 98e67ed59e1d1-3342a2b0f1fmr20209339a91.22.1759200285220;
        Mon, 29 Sep 2025 19:44:45 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bdac46bsm18593679a91.12.2025.09.29.19.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:44:44 -0700 (PDT)
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
Subject: [PATCH v6 05/23] mm/ksw: add ksw_config struct and parser
Date: Tue, 30 Sep 2025 10:43:26 +0800
Message-ID: <20250930024402.1043776-6-wangjinchao600@gmail.com>
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

Add struct ksw_config and ksw_parse_config() to parse user string.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kernel.c      | 112 +++++++++++++++++++++++++++++++++++
 mm/kstackwatch/kstackwatch.h |  27 +++++++++
 2 files changed, 139 insertions(+)

diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
index 78f1d019225f..3b7009033dd4 100644
--- a/mm/kstackwatch/kernel.c
+++ b/mm/kstackwatch/kernel.c
@@ -1,16 +1,128 @@
 // SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/string.h>
+
+#include "kstackwatch.h"
+
+static struct ksw_config *ksw_config;
+
+struct param_map {
+	const char *name;       /* long name */
+	const char *short_name; /* short name (2 letters) */
+	size_t offset;          /* offsetof(struct ksw_config, field) */
+	bool is_string;         /* true for string */
+};
+
+/* macro generates both long and short name automatically */
+#define PMAP(field, short, is_str) \
+	{ #field, #short, offsetof(struct ksw_config, field), is_str }
+
+static const struct param_map ksw_params[] = {
+	PMAP(func_name,   fn, true),
+	PMAP(func_offset, fo, false),
+	PMAP(depth,       dp, false),
+	PMAP(max_watch,   mw, false),
+	PMAP(sp_offset,   so, false),
+	PMAP(watch_len,   wl, false),
+};
+
+static int ksw_parse_param(struct ksw_config *config, const char *key,
+			   const char *val)
+{
+	const struct param_map *pm = NULL;
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(ksw_params); i++) {
+		if (strcmp(key, ksw_params[i].name) == 0 ||
+		    strcmp(key, ksw_params[i].short_name) == 0) {
+			pm = &ksw_params[i];
+			break;
+		}
+	}
+
+	if (!pm)
+		return -EINVAL;
+
+	if (pm->is_string) {
+		char **dst = (char **)((char *)config + pm->offset);
+		*dst = kstrdup(val, GFP_KERNEL);
+		if (!*dst)
+			return -ENOMEM;
+	} else {
+		ret = kstrtou16(val, 0, (u16 *)((char *)config + pm->offset));
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * Configuration string format:
+ *    param_name=<value> [param_name=<value> ...]
+ *
+ * Required parameters:
+ * - func_name  |fn (str) : target function name
+ * - func_offset|fo (u16) : instruction pointer offset
+ *
+ * Optional parameters:
+ * - depth      |dp (u16) : recursion depth
+ * - max_watch  |mw (u16) : maximum number of watchpoints
+ * - sp_offset  |so (u16) : offset from stack pointer at func_offset
+ * - watch_len  |wl (u16) : watch length (1,2,4,8)
+ */
+static int __maybe_unused ksw_parse_config(char *buf, struct ksw_config *config)
+{
+	char *part, *key, *val;
+	int ret;
+
+	kfree(config->func_name);
+	kfree(config->user_input);
+	memset(ksw_config, 0, sizeof(*ksw_config));
+
+	buf = strim(buf);
+	config->user_input = kstrdup(buf, GFP_KERNEL);
+	if (!config->user_input)
+		return -ENOMEM;
+
+	while ((part = strsep(&buf, " \t\n")) != NULL) {
+		if (*part == '\0')
+			continue;
+
+		key = strsep(&part, "=");
+		val = part;
+		if (!key || !val)
+			continue;
+		ret = ksw_parse_param(config, key, val);
+		if (ret)
+			pr_warn("unsupported param %s=%s", key, val);
+	}
+
+	if (!config->func_name || !config->func_offset) {
+		pr_err("Missing required parameters: function or func_offset\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
 
 static int __init kstackwatch_init(void)
 {
+	ksw_config = kzalloc(sizeof(*ksw_config), GFP_KERNEL);
+	if (!ksw_config)
+		return -ENOMEM;
+
 	pr_info("module loaded\n");
 	return 0;
 }
 
 static void __exit kstackwatch_exit(void)
 {
+	kfree(ksw_config);
+
 	pr_info("module unloaded\n");
 }
 
diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 0273ef478a26..a7bad207f863 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -2,4 +2,31 @@
 #ifndef _KSTACKWATCH_H
 #define _KSTACKWATCH_H
 
+#include <linux/types.h>
+
+#define MAX_CONFIG_STR_LEN 128
+
+struct ksw_config {
+	char *func_name;
+	u16 depth;
+
+	/*
+	 * watched variable info:
+	 * - func_offset : instruction offset in the function, typically the
+	 *                 assignment of the watched variable, where ksw
+	 *                 registers a kprobe post-handler.
+	 * - sp_offset   : offset from stack pointer at func_offset. Usually 0.
+	 * - watch_len   : size of the watched variable (1, 2, 4, or 8 bytes).
+	 */
+	u16 func_offset;
+	u16 sp_offset;
+	u16 watch_len;
+
+	/* max number of hwbps that can be used */
+	u16 max_watch;
+
+	/* save to show */
+	char *user_input;
+};
+
 #endif /* _KSTACKWATCH_H */
-- 
2.43.0

