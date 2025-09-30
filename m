Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB5C242D60
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 02:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200298; cv=none; b=IvoF/jFFtkTnnMDJym3qVPTq4JrkIz/IraXKlRuAFY9Kfbcm4TP0boWzgD4Re/5JS9cQUFysL5QUAfgGMsY/D3zIS9rhDX48yXTjxWR2Tuufn8jONHfkodPmbflYP1xocqc1OjkaGOsxWknv+jAgON0sH2m2ZBOXIuF5lpvHNwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200298; c=relaxed/simple;
	bh=nvDFxA5+kzzGy254IQd/07joD3bGnycuza2xxZ+JqIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVBigRx4KtORyyZEoSFb18t2vHMTESkRAh1Im3LujAl3Laf/gyWsVE84RmqDchxHiUPB1H+qi/W+OiOpD7NNTfE/Ddvl+0jbmhz3Daa49Y/o/zbim9P/8Rbwk/IngsVvh6nvl6OWT4pUJgHBcLFSxp6TLy/q5q4zEZiRWaCHMeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJ76OFhY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJ76OFhY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-28832ad6f64so22361685ad.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 19:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200296; x=1759805096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NW3rnfkFZjd7Zh69vJKiLybxjQ5f/0P49rVAWgM4UU=;
        b=mJ76OFhYyoEVI1m6MmA90KWiXh0cWoZ+eVR32ITQ1dl8xZlM6ELU4o/auxNRHvKf+F
         bck2JmEnVSLQwXMsluy+z9wGgo7KYB4mpwaFKr40+Rx1A9e2NQWFraw+b9RKDtaq2Iuv
         rdG36KAv5nA5sQ4JyE9FNpdfQ2dOgkPHUOSF1rHLLbSM3Vg1RZ1op3VY7jff+zz+S08C
         ai0MrjNUcAGMf6daJwhHFMLozqdK0fDvfb58SuNv8pYJwXFeqf5ztAMxXslYiPZC9UZc
         soNL6a5z4FBLavJhyi1WdWifEkRayE29joiC9LrjHAL7KIq6TjxdZty/D6+IF3xKelJ0
         /DSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200296; x=1759805096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NW3rnfkFZjd7Zh69vJKiLybxjQ5f/0P49rVAWgM4UU=;
        b=chuSWjYMoykboh4VtmleU5UpE07YcG34+RQfQA9N8KM2qPdtWLPsuI/mHaMt7fUbZj
         6nChWCb9MsX0GDClCq/8qQceeSPmJe+wAtRSIzxY5/FsxdQNIoEEMtIkF2HHlJ+jvux0
         TmK6QUMkayk7GLo9uU/1Afjl8Ilc9oD56YLxBBFLG+XYrXxgx5EqYiKTABQKrEKWxyxm
         xIv9qOeMOw5aEwi0zHpI6VTYvZR65Ry5BZr2F2LTRQfKItj9JR2ZdH0HtYLZIIQ8JXXk
         Zxl40ljtCxWg5WCq9nT0MdYV0TW6aS0KLr3p2Vfsai47txWzBOkr1lF82Ghg+dumEU+t
         km0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPoCKcsIZ/QF6l7QrPa5HkRhKxyx8x73HKfjWbyxzBhhRLJRBva6uLQwo339KXDNZkGKFoHxEfKok=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbF0I23CeLEz7IP4mtYbpYKTVgIV5pRxUy/4CNxCgHwTPlE12N
	ZmZWVGsTfuWRV2kOo07gcRzlxHfOJbu3enFAVJxv7VaB+v9q/yCrl2qr
X-Gm-Gg: ASbGncsFqD2ttd3MNXREyeCPvombNgIEfAxj5E7zE71agYmC0B5uB6fWiW1sHK7c60s
	hTQO98jeC0WiEwqRgyAW1Z7KAZcy7Vn/UQtTYchLEiI1JENKJ4zInD4PDk/+EgVvJ/ykwrn5k99
	+YjQPi+Lsej7B9HWvSl3ii+REt9ROsGBP40Uy1eIoWghriOYHIMExaLh6GiWnoWxz3wM1l54DCS
	YDAeAEQ6BhPDBTunSuAG98mcB/q3vUKKgX3K8IbURiDbZeWR2ZCMywL23KZxuEp1mEakoXPh60O
	vKcQiKLwtwRx9Vaa5kffS+llv0uVY6TM3RdkKEeuQ1sxLw8ulpyG5dP8VEPoeQEYjF4pcxlaflT
	Be/Mz1ND3md12fDo5yDfskEHWITNwUXahFtciByHYkAepTFEvHUi8c4RCKKpu0aa5Iw==
X-Google-Smtp-Source: AGHT+IH29Thtb5D6YkJakO5t9BTsEfGfbuz5XXYNk5kI0v7F6fpI1sv279aA08He56DkC5ZrjPjoLw==
X-Received: by 2002:a17:902:e54a:b0:270:b6d5:f001 with SMTP id d9443c01a7336-27ed4a0d542mr209110885ad.23.1759200295846;
        Mon, 29 Sep 2025 19:44:55 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69952b3sm145098075ad.96.2025.09.29.19.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:44:55 -0700 (PDT)
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
Subject: [PATCH v6 07/23] mm/ksw: add HWBP pre-allocation
Date: Tue, 30 Sep 2025 10:43:28 +0800
Message-ID: <20250930024402.1043776-8-wangjinchao600@gmail.com>
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

Pre-allocate per-CPU hardware breakpoints at init with a place holder
address, which will be retargeted dynamically in kprobe handler.
This avoids allocation in atomic context.

At most max_watch breakpoints are allocated (0 means no limit).

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kstackwatch.h | 13 +++++
 mm/kstackwatch/watch.c       | 97 ++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 983125d5cf18..4eac1be3b325 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -2,6 +2,9 @@
 #ifndef _KSTACKWATCH_H
 #define _KSTACKWATCH_H
 
+#include <linux/llist.h>
+#include <linux/percpu.h>
+#include <linux/perf_event.h>
 #include <linux/types.h>
 
 #define MAX_CONFIG_STR_LEN 128
@@ -32,4 +35,14 @@ struct ksw_config {
 // singleton, only modified in kernel.c
 const struct ksw_config *ksw_get_config(void);
 
+/* watch management */
+struct ksw_watchpoint {
+	struct perf_event *__percpu *event;
+	struct perf_event_attr attr;
+	struct llist_node node; // for atomic watch_on and off
+	struct list_head list; // for cpu online and offline
+};
+int ksw_watch_init(void);
+void ksw_watch_exit(void);
+
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index cec594032515..1d8e24fede54 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -1 +1,98 @@
 // SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/cpuhotplug.h>
+#include <linux/hw_breakpoint.h>
+#include <linux/irqflags.h>
+#include <linux/mutex.h>
+#include <linux/printk.h>
+
+#include "kstackwatch.h"
+
+static LLIST_HEAD(free_wp_list);
+static LIST_HEAD(all_wp_list);
+static DEFINE_MUTEX(all_wp_mutex);
+
+static ulong holder;
+bool panic_on_catch;
+module_param(panic_on_catch, bool, 0644);
+MODULE_PARM_DESC(panic_on_catch, "panic immediately on corruption catch");
+
+static void ksw_watch_handler(struct perf_event *bp,
+			      struct perf_sample_data *data,
+			      struct pt_regs *regs)
+{
+	pr_err("========== KStackWatch: Caught stack corruption =======\n");
+	pr_err("config %s\n", ksw_get_config()->user_input);
+	dump_stack();
+	pr_err("=================== KStackWatch End ===================\n");
+
+	if (panic_on_catch)
+		panic("Stack corruption detected");
+}
+
+static int ksw_watch_alloc(void)
+{
+	int max_watch = ksw_get_config()->max_watch;
+	struct ksw_watchpoint *wp;
+	int success = 0;
+	int ret;
+
+	init_llist_head(&free_wp_list);
+
+	//max_watch=0 means at most
+	while (!max_watch || success < max_watch) {
+		wp = kzalloc(sizeof(*wp), GFP_KERNEL);
+		if (!wp)
+			return success > 0 ? success : -EINVAL;
+
+		hw_breakpoint_init(&wp->attr);
+		wp->attr.bp_addr = (ulong)&holder;
+		wp->attr.bp_len = sizeof(ulong);
+		wp->attr.bp_type = HW_BREAKPOINT_W;
+		wp->event = register_wide_hw_breakpoint(&wp->attr,
+							ksw_watch_handler, wp);
+		if (IS_ERR((void *)wp->event)) {
+			ret = PTR_ERR((void *)wp->event);
+			kfree(wp);
+			return success > 0 ? success : ret;
+		}
+		llist_add(&wp->node, &free_wp_list);
+		mutex_lock(&all_wp_mutex);
+		list_add(&wp->list, &all_wp_list);
+		mutex_unlock(&all_wp_mutex);
+		success++;
+	}
+
+	return success;
+}
+
+static void ksw_watch_free(void)
+{
+	struct ksw_watchpoint *wp, *tmp;
+
+	mutex_lock(&all_wp_mutex);
+	list_for_each_entry_safe(wp, tmp, &all_wp_list, list) {
+		list_del(&wp->list);
+		unregister_wide_hw_breakpoint(wp->event);
+		kfree(wp);
+	}
+	mutex_unlock(&all_wp_mutex);
+}
+
+int ksw_watch_init(void)
+{
+	int ret;
+
+	ret = ksw_watch_alloc();
+	if (ret <= 0)
+		return -EBUSY;
+
+
+	return 0;
+}
+
+void ksw_watch_exit(void)
+{
+	ksw_watch_free();
+}
-- 
2.43.0

