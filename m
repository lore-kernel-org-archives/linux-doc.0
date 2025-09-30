Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9965024DD13
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 02:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200312; cv=none; b=NZ5OzZ4UD2WZ8rPwRku/kDAS5IbPrR9huWFKO5w6hYfSuud3naHcqG0AIkcVH1V95Bm4dlzNs0CaiRLS5goVqSIcbbzzKpNZhVlcWvJyMmgnwIrI6qH92qCpSje1rknThFfrLVOiuGm00RlJvoD69AZHvV3Q+coloXE8PwzaT1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200312; c=relaxed/simple;
	bh=EtuMaKP8CWfi9pjY9FcQGV9HEHi4WtiOKMPT566R1T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pIKaTveVQHZhkhuGubzphPF3178kqrvrwBYNnXrTnApUVO+/jFoNCHgqqrBxL62whyu3FAX4Zc6x/mdmqsnh8Kv7dMt8p/AD6VQPJVOqVDQhG4DatxarxWF07QLQLz5sRghHpzEotcb9bf+Tes4suE0HmIodGR5vp+rcs0W9qFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsITOqqY; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsITOqqY"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-781997d195aso1892607b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 19:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200310; x=1759805110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VplC5p74+BCL3Xjzqw2UL/AL1hevTQUKrGPaYOT40mY=;
        b=GsITOqqYnKqZ1zRX4YByuGKp8skPIoPTvM2JpobPjAuYfxoIK8XcoyyL/slPo7DPzx
         g7QcrpZkln2+aaFM9C/a0nzNKl2IVdXxpsao+IuZoWj2ncebpODIgQAQp/vTbOasgvvc
         wk2gJDEUdhKiG8C6CXEu30npaYDNHzDVYv8MWtf3l1zz/p36tUiYM6C74IovR1cQblNg
         879SZoWJ94tFnPnmxyqFA6605yTBqNmybm0vCSiTxsky7t+JL+mrFVnzSSAjH094i/Hp
         ii44jnyfE427PJEBd+VWOGIdWCQlQ2Tb5PnbzLaaoAXIxTCyWc06a+AxacNyQSC5R/ro
         Gdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200310; x=1759805110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VplC5p74+BCL3Xjzqw2UL/AL1hevTQUKrGPaYOT40mY=;
        b=Nq3rtMKFKyte/XBUWvn+qWFfwXjF6UjIFkRPCjrr8XpYcO0W7sV1hQG7WQ8XGjRsxe
         SnZtpPxG/aCdAwptiOjlp4GL9+uZDWCLmV7EH8BrpCcAVDGtRZ9I+Hx6lIInDIB3tjNe
         YxuV7nzWQYu5SOwfIZ19hO/GjlfIB32S3e92lmws4qZ8izyHeQfycbgymy3/Osi5I7+c
         8AdQPSxEezkceQ9/DJBiZa/me2DkpDm2Y/A6A22Eqrrp7jYGkzsJSPCBCf/s99Ra0NtQ
         klYVDbTafGFpY1bc4vbM5p9zvs/HekPB76JnQsguwjsLvxIJ+XPwI7kHAgZawH2ZeGyr
         zfjw==
X-Forwarded-Encrypted: i=1; AJvYcCXNO1KUZZIbUXNeWAi2s5hytSFCLULMx1cxcR7s2PijW5RaRHNNRsxmnKiFr2ts2ZnqjVHOEe+S6sU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWT2l68qozAQYB8jb5O9mfJ3/LoD3e73LJZsLzamF+UjSa7HV2
	p1iVDM9X/tHRqAsZZNtI5QeLkYwyrVTNu5xLs83ztC/n7VfiyGfabNF7
X-Gm-Gg: ASbGnctqr2G9EYv8dnADzPCUp1ROwZcACVd00Nr3H12IPNqni8YgwRhaczfB8cKorQ9
	pTkJc78bnpmJfHbutKgRCFbx+vhcKdsI/gGN8YT2ScvmlFeWqVULMt7oLbU+SaZP0kHY54zELGe
	E+mC0Gz5nfNRmgPU+8x2QtKotuVO3YEQ8QDeImYn0bnDiYOOW4KXjqmGFi87Ox3F9db4VgNcq69
	gQ7X8Jrag1PHOf9AqHhwd5gOW5iAJyQMYv4O4XwfedRilB7Tf4rJsP21Wn/sY03U/hUO/ixzyXi
	YCoCXF00s6ZDeukO4wOh63yj4uquKA0dzwp7+W9qqLsi71ZVLmYUHDluNo0LVXxeZ/1j9ttB/ay
	0pZIpIwsJqtw8pZI579PDsw+2+oUmtagJJ6iX4CHfjQhrvj2ZHjlDXEuxZ11RMi4FQ+FfWJHTYa
	ne
X-Google-Smtp-Source: AGHT+IFzdUzonqFGpCtXDfhyMuXTs8sxTYcPas1DIEDImQCxbrq0zIYK9+c7MQCk4izaUyzaG6ziGA==
X-Received: by 2002:a05:6a21:e098:b0:250:f80d:b355 with SMTP id adf61e73a8af0-2e7cdd9ffe2mr5395317637.33.1759200309894;
        Mon, 29 Sep 2025 19:45:09 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b23206sm12485889b3a.58.2025.09.29.19.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:45:09 -0700 (PDT)
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
Subject: [PATCH v6 10/23] mm/ksw: support CPU hotplug
Date: Tue, 30 Sep 2025 10:43:31 +0800
Message-ID: <20250930024402.1043776-11-wangjinchao600@gmail.com>
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

Register CPU online/offline callbacks via cpuhp_setup_state_nocalls()
so stack watches are installed/removed dynamically as CPUs come online
or go offline.

When a new CPU comes online, register a hardware breakpoint for the holder,
avoiding races with watch_on()/watch_off() that may run on another CPU. The
watch address will be updated the next time watch_on() is called.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/watch.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index 722ffd9fda7c..f32b1e46168c 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -89,6 +89,48 @@ static void ksw_watch_on_local_cpu(void *info)
 	WARN(ret, "fail to reinstall HWBP on CPU%d ret %d", cpu, ret);
 }
 
+static int ksw_watch_cpu_online(unsigned int cpu)
+{
+	struct perf_event_attr attr;
+	struct ksw_watchpoint *wp;
+	call_single_data_t *csd;
+	struct perf_event *bp;
+
+	mutex_lock(&all_wp_mutex);
+	list_for_each_entry(wp, &all_wp_list, list) {
+		attr = wp->attr;
+		attr.bp_addr = (u64)&holder;
+		bp = perf_event_create_kernel_counter(&attr, cpu, NULL,
+						      ksw_watch_handler, wp);
+		if (IS_ERR(bp)) {
+			pr_warn("%s failed to create watch on CPU %d: %ld\n",
+				__func__, cpu, PTR_ERR(bp));
+			continue;
+		}
+
+		per_cpu(*wp->event, cpu) = bp;
+		csd = per_cpu_ptr(wp->csd, cpu);
+		INIT_CSD(csd, ksw_watch_on_local_cpu, wp);
+	}
+	mutex_unlock(&all_wp_mutex);
+	return 0;
+}
+
+static int ksw_watch_cpu_offline(unsigned int cpu)
+{
+	struct ksw_watchpoint *wp;
+	struct perf_event *bp;
+
+	mutex_lock(&all_wp_mutex);
+	list_for_each_entry(wp, &all_wp_list, list) {
+		bp = per_cpu(*wp->event, cpu);
+		if (bp)
+			unregister_hw_breakpoint(bp);
+	}
+	mutex_unlock(&all_wp_mutex);
+	return 0;
+}
+
 static void ksw_watch_update(struct ksw_watchpoint *wp, ulong addr, u16 len)
 {
 	call_single_data_t *csd;
@@ -210,6 +252,16 @@ int ksw_watch_init(void)
 	if (ret <= 0)
 		return -EBUSY;
 
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"kstackwatch:online",
+					ksw_watch_cpu_online,
+					ksw_watch_cpu_offline);
+	if (ret < 0) {
+		ksw_watch_free();
+		pr_err("Failed to register CPU hotplug notifier\n");
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

