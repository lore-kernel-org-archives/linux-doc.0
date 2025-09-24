Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DDB3009DB
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714730; cv=none; b=txY0SNJeMPB/eku3wrPWqvUsdv+yw2Z4oRFdO3NvfnQOn5162FQMjNnxgSumaQWJ3KclD+FkeTVDuzrBy+6gixN101SicaOBdmvpXaQSvAbsEHTF5kscCMoyJtDoG3Ofmy4SEl9dQZIUDG93FD9gxaqST5zGqQdpUCxl365usc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714730; c=relaxed/simple;
	bh=0RaB9b3mDxARpzNAU+b9+OM/53UguV9OX02ut00avNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+kVd4/FLpxfOPFS1XymCAsqSBwI3cnUgUmVBWBKWg4jl07e6YtBbpk7R7EPIcjXJeLdaiodNKBg+u42RbphIzDSH5Qz1c9nPYGz/bl1O/T2UupVdy01P3kIjbOx2VnvqczEgCs/fWU96jWkqsAvonHYl3bmbPhbrETw79YTtW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+v++12s; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+v++12s"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77f22902b46so4234122b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 04:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758714728; x=1759319528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8p2Xfne7CGpLjN/MkaU3Ee28S3aCNgQ2oxnJpFebIbs=;
        b=T+v++12s5brHCNTWifVwXfprSbOp2vY7Kz7WzqdxX2dFd9PaxwdSo3gZVfUmbGdHXl
         AdvCo4i9eBI6gobaa0qwQze6Mc+q1cvkC/zeXhXXfHiVxf+fzFTwXXpSXgB0mMGq2MFY
         gGbh86DUYJZmFNAVhuUiBPSWlxTPWbCPDemnsWxGBN6gUUxl6rrgVCBHLf3E1Er2MuL0
         CL/b+Qpwsah4sHUobR5jjfBVfz+P4nZVSKj1iEjto++4KlNmOWzHl03GyDGELvszw1cJ
         cJEbgbk/EmrgUsarjC5jC5gXvlT+KR5PyKW7IosJBm0UDRaZ00TtTXqlW+Z3Hh/8tO3Q
         2dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714728; x=1759319528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8p2Xfne7CGpLjN/MkaU3Ee28S3aCNgQ2oxnJpFebIbs=;
        b=gmIFuMQ4gc4Vk9YvFg3aO3szniUr0sbG5shFLVgkZtf6OZi9kcpLVec/5w45ZtEg8v
         XT3UProDbIsc16hWX8UBMMMhpods1Y93nNaS2YI7CLH/fx42wIKMORk5L95koDdDc5mE
         TmUqn9CsGEp0h16LLniAxaKl0ZXmf8W46UpsOUMFDGuoqHz+fre1gItokV9z/cPpWwcT
         pZ/D9DCbhyO9CFG4rzbn+B9D9MFbqJUTLGKh0kNY6la2w4hyD5fet15AFD7Ovbo2I9sA
         svOqFLMhBs0NW2WDRd7POE10Yc4VoBGSuiSQDQu+dwm6S849c0hWmgmDY8lLSdUgE3Hm
         bbYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9dA+dcAj+T0mY7wu8KaNJSDMeFR8HiJqreg8LOPn7c8ahN8z6rz65iw623rONV2irqYtz7ollZA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/3eDHMRniaAViqHhPOO9pgIW0MamvVtkeDnl2KxkO3RrNKtr/
	uxMIvrtXAL2mxVIB/X3fZ5PogGNOWAIs1MXCi/TSGAh26zjybARl0TVr
X-Gm-Gg: ASbGnct75gIDI+tZzMHVZVkfEO0hpsCZL0d21JdL8AMUL9fmsUyiQD7/puu5RrM1GFy
	j3Zt06cWi7mawQgXJZcJ47/xkflgWV5S0+u/WRfUee1uwnYg6Ycs8Y/8Q9WrdRcFSwNAGDjk6r4
	f4JFuvpVanR4CHeXGNjj9yzIvfNVv6xMZI4+6t6qJiupjDTXKg8gEU5GdPgo85PmG5lBUXr6e5H
	BocxtDpMVBMLZllvUsXU6c2V+M1u25cxH/1j0vGzPIe1hIZwklkjrmHn/UxYgNFAkldRIkl8Cwj
	0gXXtVi06cyOH4ocYTkUrgsC5wblnZrNmCCNdXCN7CXWWG5x3jG5aw48vCzdStlLCTTG2KuaSkG
	e4pjSzHAkVlu/XlSYOaHjHJkGng==
X-Google-Smtp-Source: AGHT+IFvFtl/EyZ7iXrxXzX/exhl4mgRDo22qwkFSgnKL3W11UaAqeIdwbc9uDs1HMk5jHchDAVYeQ==
X-Received: by 2002:a05:6a21:99a7:b0:2b5:9c2:c596 with SMTP id adf61e73a8af0-2d0009e2f3bmr8556644637.6.1758714727810;
        Wed, 24 Sep 2025 04:52:07 -0700 (PDT)
Received: from localhost ([23.142.224.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb7aad7sm18582634b3a.12.2025.09.24.04.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:52:07 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
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
Subject: [PATCH v5 09/23] mm/ksw: ignore false positives from exit trampolines
Date: Wed, 24 Sep 2025 19:50:52 +0800
Message-ID: <20250924115124.194940-10-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924115124.194940-1-wangjinchao600@gmail.com>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because trampolines run after the watched function returns but before the
exit_handler is called, and in the original stack frame, so the trampoline
code may overwrite the watched stack address.

These false positives should be ignored. is_ftrace_trampoline() does
not cover all trampolines, so add a local check to handle the remaining
cases.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/watch.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index 887cc13292dc..722ffd9fda7c 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -2,6 +2,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/cpuhotplug.h>
+#include <linux/ftrace.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/irqflags.h>
 #include <linux/mutex.h>
@@ -18,10 +19,46 @@ bool panic_on_catch;
 module_param(panic_on_catch, bool, 0644);
 MODULE_PARM_DESC(panic_on_catch, "panic immediately on corruption catch");
 
+#define TRAMPOLINE_NAME "return_to_handler"
+#define TRAMPOLINE_DEPTH 16
+
+/* Resolved once, then reused */
+static unsigned long tramp_start, tramp_end;
+
+static void ksw_watch_resolve_trampoline(void)
+{
+	unsigned long sz, off;
+
+	if (likely(tramp_start && tramp_end))
+		return;
+
+	tramp_start = kallsyms_lookup_name(TRAMPOLINE_NAME);
+	if (tramp_start && kallsyms_lookup_size_offset(tramp_start, &sz, &off))
+		tramp_end = tramp_start + sz;
+}
+
+static bool ksw_watch_in_trampoline(unsigned long ip)
+{
+	if (tramp_start && tramp_end && ip >= tramp_start && ip < tramp_end)
+		return true;
+	return false;
+}
 static void ksw_watch_handler(struct perf_event *bp,
 			      struct perf_sample_data *data,
 			      struct pt_regs *regs)
 {
+	unsigned long entries[TRAMPOLINE_DEPTH];
+	int i, nr = 0;
+
+	nr = stack_trace_save_regs(regs, entries, TRAMPOLINE_DEPTH, 0);
+	for (i = 0; i < nr; i++) {
+		//ignore trampoline
+		if (is_ftrace_trampoline(entries[i]))
+			return;
+		if (ksw_watch_in_trampoline(entries[i]))
+			return;
+	}
+
 	pr_err("========== KStackWatch: Caught stack corruption =======\n");
 	pr_err("config %s\n", ksw_get_config()->user_input);
 	dump_stack();
@@ -168,6 +205,7 @@ int ksw_watch_init(void)
 {
 	int ret;
 
+	ksw_watch_resolve_trampoline();
 	ret = ksw_watch_alloc();
 	if (ret <= 0)
 		return -EBUSY;
-- 
2.43.0

