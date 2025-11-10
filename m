Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7609A286412
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 16:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792635; cv=none; b=u55SohvOnYJrKv+05PSwx9A7PLsssP0R0zU1mQ07IFinokK2vVsfptUOp9clGOkQrTuhsOfoYPI0EyqQ8MKEVE7Zqmf2CEqg5yuLONmc/WLCRoV8aD+AxhDJzP7Kb7xjsgnv665KGy2imT+eaBLBXC22DJPvrZfZJXNJGx91Ep0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792635; c=relaxed/simple;
	bh=tFikxSFFwCv1IrH9L1W4062VVacCAi+rgy+45fumM8s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gVBCZ4nTgR75XeZqoxGqGqbwiDVhOs+FlNulLcneuAfKOWfyLGcxr5TP3vGuY/Wj3joTP4Y/DGeJPZY6kNPLgWUJIc2UGxujfUZHzwonXGnpNGb+xgBb/7vvvYelL6x+wE3c2M3LQWN1OSelT5V1T69AXX46CorxDkZojnFjxro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWRYCoeV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWRYCoeV"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7a9c64dfa6eso2528050b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 08:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792633; x=1763397433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfQWKEWM8M6Sp/kqVVWTo1Q3rJtTZ9aAiY0lp7l1vgw=;
        b=JWRYCoeV4eIdOwpESd27XIKf+8iT9XrLIIU2jDVzQjePsiyeqGtpVSajomSGvRHYPr
         73xZxrSgsxBIyk8T3RKT2tyUAQFRmn6O7j9G+5TXjJays7s51C5ZhLH2+1ELSnl3FVWx
         /j/8evvaTnz0ACzy2wBZgwWfMO1O00/UK1m6W4AxHzFzVzwZSFXDMJuQMPgmst2hvNyy
         YhPPih+OU+A1ZISMUp/YuElrzAzRqBsWJt/GwYFmNitde1cXClk1CVh3wSpkx4TF7f9z
         jeGYHw+nFoS7uWrJ/w0hmM0zCbf86hhoPxyXFBVxDzqrlL17t6qXgSMYm7isveahbFkq
         g7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792633; x=1763397433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OfQWKEWM8M6Sp/kqVVWTo1Q3rJtTZ9aAiY0lp7l1vgw=;
        b=Kn/1/43F2gxwm5M8kv4mwQ7UIEUWhAsuyv1G7MDPExDKwO93AuNnr9/QasyinsL/US
         +dfI1JP9v6o9o+vE9q+/ScwDUGDp/cfkYZNozMEuaZVFHZ0Cno/y4DZAFt3Lg3HUopGi
         nvrXkE5DPyz13EnJ/Xy/XQU+mI1FVYPWoOxNcHiL2BDvZY/31ofRzZzn/RfOORc/+sDQ
         hirJx1Ix1rV1JlrIanii8RU2ntvi1rY3KvH3kD0pl97NJWQbzu/2hwhT4n8VlstFF5rf
         flvtfCXQ8RcqBUbmdlxXsPmipq2bEN6OvRVitMjJ7fD7e9be88aIHdOw13HZqcRGosY6
         y1Ug==
X-Forwarded-Encrypted: i=1; AJvYcCU/xyeo5osuSqjOtIuTGaWkbnpXzQ8cGi5YchoxeuMJEEFbsXNb5ixviEWIZrCUQ/Et4y62NKHWjt0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5GvmQ1ttR4ZROQO6ER24r1M2/mPPmNAq063Tw7Fbc3X4FzPPJ
	oos4GxnkgHc/7o2V7boKKoJP0wXX13An7x2+y/oIgBVrPdmNXEuv77H1
X-Gm-Gg: ASbGncsb5gKUM2DBqw09M7iB21vlXlrx44bijz6SF/tDT+MfSVbp3ZJrHTfmco333hJ
	pIo2pAjUKNjAWDUs5xWE5+zkmXzW27vpB2SZLAdrcffowoW7StyMmRuLgV0yZMQ8mTmmUcJOglP
	gHzTEEUJkThtS8cfLhu6vz/NLhc0+ZMKK8PV1GM7TaFVNDDNwGD8NQ+YwVzaQmYFElWD5OEBcHr
	BtqOqXrGZvS7it3KDnMjs8zZtmz19NJJrMLWbE/olOnTd/EUayU1zrv6TE+hSV3EUpM98fyGk3W
	ZXYBXalnzO86v4hf+pYnQ0/ARtTaEdQTgNoHEZiOjHA3T087N831s65sYtLFGqkpz+iuWmuMNtT
	vuO8Ol6ar6i1t8PILhzYFtgaLjcPGOOjvm02TaNNm0iDlEwCvQFFCj5mwRhKjWRCdc8Xd6RXKcX
	UH+zhmKjF30S0/6ezeedvklQ==
X-Google-Smtp-Source: AGHT+IHERHOBNDq56+F7J5rW3t9aw2ypcpu6OwOvG+DJGpa6Vz1ez0X0Vnm2nUUH/tERSMimjoOmZw==
X-Received: by 2002:a05:6a20:5483:b0:342:873d:7e62 with SMTP id adf61e73a8af0-353a2d42046mr10346355637.29.1762792632699;
        Mon, 10 Nov 2025 08:37:12 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17784bsm12559855b3a.47.2025.11.10.08.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:37:12 -0800 (PST)
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
Subject: [PATCH v8 07/27] mm/ksw: add HWBP pre-allocation
Date: Tue, 11 Nov 2025 00:36:02 +0800
Message-ID: <20251110163634.3686676-8-wangjinchao600@gmail.com>
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

Pre-allocate per-CPU hardware breakpoints at init with a place holder
address, which will be retargeted dynamically in kprobe handler.
This avoids allocation in atomic context.

At most max_watch breakpoints are allocated (0 means no limit).

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 include/linux/kstackwatch.h | 13 ++++++
 mm/kstackwatch/watch.c      | 93 +++++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/include/linux/kstackwatch.h b/include/linux/kstackwatch.h
index ada5ac64190c..eb9f2b4f2109 100644
--- a/include/linux/kstackwatch.h
+++ b/include/linux/kstackwatch.h
@@ -2,6 +2,9 @@
 #ifndef _KSTACKWATCH_H
 #define _KSTACKWATCH_H
 
+#include <linux/llist.h>
+#include <linux/percpu.h>
+#include <linux/perf_event.h>
 #include <linux/types.h>
 
 #define MAX_CONFIG_STR_LEN 128
@@ -38,4 +41,14 @@ struct ksw_config {
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
index cec594032515..4947eac32c61 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -1 +1,94 @@
 // SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/cpuhotplug.h>
+#include <linux/hw_breakpoint.h>
+#include <linux/irqflags.h>
+#include <linux/kstackwatch.h>
+#include <linux/mutex.h>
+#include <linux/printk.h>
+
+static LLIST_HEAD(free_wp_list);
+static LIST_HEAD(all_wp_list);
+static DEFINE_MUTEX(all_wp_mutex);
+
+static ulong holder;
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
+	if (ksw_get_config()->panic_hit)
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

