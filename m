Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F182FF673
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715221; cv=none; b=DVOUKHhjJVokCT3iu+1I4tLM8P1DUl3eYeZajQqbtbbj69p6+XIE54y9gZqGHmRkRyanobU6aAat4BbegApA/97Ji1c/lkYA0jHOYb03QGAw9FAmKqVys5xYT7q57D2G2yv78mxJT+nSXafrjdYCKFOdKpeLvsKAODxot9McJ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715221; c=relaxed/simple;
	bh=zgbvGJBSx4YBKNkqO/qzz/La9XfnZ3vAatfFaQMoL7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFSgs5myxYovAvoFij7KUOkcBrLWFVZborx9Sf3M/VjJrJDz0CBZZ8wOOKNB5jOvPFTHknsweUz90RA0aZUgc1aQCrVXH4UFglmYcwWQDaKf3N7MNdgzjND+YkBKCc7/IIOV7rpni/+8Vkcq6spHXlCE5x9BvwOxXKCZZh9k1FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fW0ETLeQ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fW0ETLeQ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b5241e51764so5251784a12.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 05:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758715215; x=1759320015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmaGbmiuxIsK0xKTEWJ/f7gfwC2bw8p0SOLh4b9Z4FY=;
        b=fW0ETLeQCFX8OFWb9u250UoVfhDWanBM+gtDWVOLh0/w6XBqCDew2W0/fZkeJNJiZ1
         qMORdyFC2XLNKCYNu4P08Y3EanKlp0FmAiHO0HMpwTd7b/DEMCez4DK/ABIXfF/P81mZ
         np1yGnCd4gD37MIK/3v2bFzRIJz5oKLP5Y4PaxKtE5ctLPwRVByKYVJq53tCe8tb2ffL
         oyYfuzw7BkjT1g4t8DfbYfn2/AJyt1Rwl3ls6piKNdQSaRnZ6gKunmEeh2bohr8NZOkH
         b+sESF4Zql4iaDXIVvlXDxsrmaWTvU2jgUQ5MQqJQod0P9Hpapj/VJbBWnQzlveryClN
         43ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758715215; x=1759320015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmaGbmiuxIsK0xKTEWJ/f7gfwC2bw8p0SOLh4b9Z4FY=;
        b=MYy1FDn73FtOEC8xZrY3vowUzFjA1OA/oKGDvTmWJK72+ThAl9YQ1+buG/XTRrfKJD
         r9qkD8v5650fvBlFl225TAO3SYmO416bGRGfkxNxf4DQRpq5RWlmzTD9SPyyKlstbkcP
         Vrmeb5YJ9fCjO8NPv/kl8+M3mf+L4RhRiQNahSu0FD+VejCSqhEpzHeNcufST+8ky5o0
         7BNuOiumXxJZhR9yIE+oari++JJ39nuFLl70XjaR4iW8h3OF5OSMgLfMFkLTVXwQu9+O
         sQAPUMxPBZCQNkoefXqqadyOJTpl0Eq4rOYGPMuEW5VWKO3BU5wrRG9s8spV7tzxvTu6
         lgCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT2wxlUeR40W5Io8umeSiOABjzxmZ9nigfUveusm6yM39YJHBTahWJhnOmdTt6QOGV1RheVveuBjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZgI1+Vci4jmWobvDX3LxtZwhk0spqp18WcvMcPFHJhCUUjxo3
	vbFRKi2B/gu/3j/jQ90EpSw+DWXgChzMb1F2Nio79Su85Pqz9bzbmA0IQJAAAWKc2CIIgg==
X-Gm-Gg: ASbGncu18sGoJbS583etiw9DdVaWiZDzVgwaQCWPj1EAsxmlb1bcMyGg+80ia2YH5Hu
	qfjdX/c8mqL5np+MOU4QkCa0iX+SBEZduMuSPexiajur/SNE1kFI5RJCOCVQOQ/LlhWfB37UERR
	RHIwDXy1fbfz38Kx3dhPn4WYWYqHiwZijnW/2S0Q8PkuyevZdrTWIMydKLA3FNEyX4RwfVCj17G
	ceXCDj58DbHixgX/xuqQzAMoxKm9QuvcrRE3WHWIU4irsS4yf9eEXhIOf3TADLAaZPAxgxRCIjv
	QD2GVlL1ZgBFFQd2JDpHhNsmE1Urbh92Lg4JlabwGJp81Lw8XKTQ3Vdd3Uyp6oRubtPvpi6JBBl
	5sxIICfwq81jLxlpH15rNYEU=
X-Google-Smtp-Source: AGHT+IG5AidgxW/pjwMRKvZXF7BqnVmuGXBXEakixJFL1V8tNMywu8qGgSCIq0aUezqYi7cmWgbNjA==
X-Received: by 2002:a17:903:2450:b0:268:f83a:835a with SMTP id d9443c01a7336-27cc9a91248mr60312585ad.60.1758715214591;
        Wed, 24 Sep 2025 05:00:14 -0700 (PDT)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de5dbsm189402185ad.84.2025.09.24.05.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:00:13 -0700 (PDT)
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
Subject: [PATCH v5 16/23] mm/ksw: add self-debug helpers
Date: Wed, 24 Sep 2025 19:59:22 +0800
Message-ID: <20250924115931.197077-1-wangjinchao600@gmail.com>
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

