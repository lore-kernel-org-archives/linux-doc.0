Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3F120767F
	for <linux-doc@vger.kernel.org>; Sat, 25 Jan 2025 05:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737782777; cv=none; b=LkwqUPt+/799Bm3ybaXBg95Hwwm5tlnmNDuFDWTkiLA6F7KqBhyjL7izv6hYc+H0L8X+4iaR+pds86Oo/odbUEm44ku/MGMcKk7R7/K1427fGznPR6nxFBmRSht5PPQUToUoKQJUhrCdtsDTWdwDV+YIu/YNxdcV4C8EYz4cN/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737782777; c=relaxed/simple;
	bh=aEtkYsQ/WkKEeXt9CBXl6mkcKsScO2YS9z/v9JWQHrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hxvVQRIxmIixfltwxn30NHe7T8n8zMfBmjVBRFt5/E6RfwaJAvC8nnMeaNBz34jYcjDdTxbg+Hf5/8WwrEUm0xOJjY9yeC3HX00RgX3Ln8kNxKPLuhLwmrwQ7Apckjp3r/9iEyOnF1+pKUBUt+sVhVY9DKRcvN4cu1XITd4D8L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=K/CzBH4q; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="K/CzBH4q"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee9b1a2116so610553a91.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 21:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737782776; x=1738387576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eCb6/WBehJQZpcvJZGWQL2Hz1Q/N9ND9H1TrdzwNMc=;
        b=K/CzBH4qikblVfz7GtZ7dABPqQ/J9YjiYHlxChSK4le8+xVT68DOrlBmQcT/W6JGDO
         kUdUh4G/f+FaUT01aKcP0V8HRToL/8ROSzSR8vn83qKyiP/hzcmOiGXUMKMgWWu19yJn
         GfJMJLO/o9ap4DZ65Z/clAq+9CGyCALblpRe8064CQV2f5UapOzSCr5VuYQBv1ileHSu
         hUpce9oKUt7+NKxOFKZgoh1ni3z7kuNvNuSzd9P7MJC41rpLSFw2z/nSJitFq/nF3FGs
         6d/vIk1bnYwPK6sOvpGKcvdqNUFWxwgd0rwXYAzGHFodYdU8kg7SYiIZ4g8Pv1GRV1JT
         WPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737782776; x=1738387576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eCb6/WBehJQZpcvJZGWQL2Hz1Q/N9ND9H1TrdzwNMc=;
        b=bXCpaaf9EuxH4kkqdgo11x9+FDYSTxWW5kcpqWnfNhJq6dvhLMQYztA7SDijdUmIhB
         DLI2tNKs+PVw0mF+6n9rin2YyJEYBGoQQCGjhH1XOMHuCAdcky0xR/YR2kw/a2+cN404
         vXKefqdd2Up+8xqWo+/h36EYHKHgHInvmcz6gr+kyY4siYMmJ9X+28dsZm57V7TLxBe/
         iu1c4/Zb+PwtGd7fUgMxcITUhQQHdWgAFxDcG+1rFDuAJhN0trD5IEV0Re+PxDRH6ks3
         kmc+y1WSAZvfFPByPMXnkpxohs5/7AsAZLp1I5qxQLNI9CWL/LtYLE4pnQYRj5C3AFTp
         kmBw==
X-Forwarded-Encrypted: i=1; AJvYcCVByvAnGedSkrXtDw5Yv0QXap01b1XaO9s/2cm3daT0pAfofkiNsj6AL/tIpMnikKN+6609QCZKiR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9wYZX+fwPdILnU6r0ZFypuh/A+VDYuJwCvbIgckIZwpjZHqyT
	KoG8wPgU2ERi0BFoFAXrOOjoS574MW+oBRxenENFeg/7eqaKN7cjB/uprGX9CAc=
X-Gm-Gg: ASbGncsTjFOy8kokDiAWvAeoeqBh52IzVpwgpvw/6U/vCiH9XMy9UoNTFA8JxoPcPS9
	X8kXZe1VlSiGC4cvUWld1dR0TQgSJXGtA4kFW2xK70ubIkcGtwjX758imcfAzwWW1J4dNEvFXBW
	0/HIvjElrqMtUiHY3JuQQVXs57CveAxLtSXavTtzTsoXzkzENx/Rcs9nNPOOiyTt1Unjsn1xYq+
	aZzNntczqj9gEYSjTboAdNR1BKFcA3vRtmVEMKbKTdGQ0FoVpIYO0WT6NS8mHkYBXdJkXTJp9QR
	2ppyoi1s/wpDKgnJZMCe9nk9oHk2ulJv/m2DcGpu3YQ=
X-Google-Smtp-Source: AGHT+IEF1uRgd/zoHtjikgksLY/feiCQXspGODJ2tSSlRF8u1Tj21NlAQAQEv3+mjbNYZi+a+IWdcA==
X-Received: by 2002:a05:6a21:900d:b0:1cf:4dae:224e with SMTP id adf61e73a8af0-1eb21470211mr18598282637.1.1737782775632;
        Fri, 24 Jan 2025 21:26:15 -0800 (PST)
Received: from C02DV8HUMD6R.bytedance.net ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496bbdc9esm2563856a12.63.2025.01.24.21.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 21:26:15 -0800 (PST)
From: Abel Wu <wuyun.abel@bytedance.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Yury Norov <yury.norov@gmail.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Chen Ridong <chenridong@huawei.com>
Cc: cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] cgroup/rstat: Cleanup cpu.stat once for all
Date: Sat, 25 Jan 2025 13:25:11 +0800
Message-Id: <20250125052521.19487-3-wuyun.abel@bytedance.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20250125052521.19487-1-wuyun.abel@bytedance.com>
References: <20250125052521.19487-1-wuyun.abel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There were efforts like b824766504e4 ("cgroup/rstat: add force idle show helper")
to escape from #ifdef hells, and there could be new stats coming out in
the future, let's clean it up once for all.

Signed-off-by: Abel Wu <wuyun.abel@bytedance.com>
---
 kernel/cgroup/rstat.c | 47 ++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/kernel/cgroup/rstat.c b/kernel/cgroup/rstat.c
index c2784c317cdd..dc6acab00d69 100644
--- a/kernel/cgroup/rstat.c
+++ b/kernel/cgroup/rstat.c
@@ -599,21 +599,39 @@ static void root_cgroup_cputime(struct cgroup_base_stat *bstat)
 	}
 }
 
+static struct bstat_entry {
+	const char	*name;
+	const int	offset;
+} bstats[] = {
+#define BSTAT_ENTRY(name, field)	\
+	{ name, offsetof(struct cgroup_base_stat, field) }
+	BSTAT_ENTRY("usage_usec",	cputime.sum_exec_runtime),
+	BSTAT_ENTRY("user_usec",	cputime.utime),
+	BSTAT_ENTRY("system_usec",	cputime.stime),
+	BSTAT_ENTRY("nice_usec",	ntime),
+#ifdef CONFIG_SCHED_CORE
+	BSTAT_ENTRY("core_sched.force_idle_usec", forceidle_sum),
+#endif
+	{ NULL } /* must be at end */
+#undef BSTAT_ENTRY
+};
 
-static void cgroup_force_idle_show(struct seq_file *seq, struct cgroup_base_stat *bstat)
+static void cgroup_bstat_entry_show(struct seq_file *seq,
+				    struct cgroup_base_stat *bstat,
+				    struct bstat_entry *entry)
 {
-#ifdef CONFIG_SCHED_CORE
-	u64 forceidle_time = bstat->forceidle_sum;
+	u64 *val;
 
-	do_div(forceidle_time, NSEC_PER_USEC);
-	seq_printf(seq, "core_sched.force_idle_usec %llu\n", forceidle_time);
-#endif
+	val = (void *)bstat + entry->offset;
+	do_div(*val, NSEC_PER_USEC);
+	seq_printf(seq, "%s %llu\n", entry->name, *val);
 }
 
 void cgroup_base_stat_cputime_show(struct seq_file *seq)
 {
 	struct cgroup *cgrp = seq_css(seq)->cgroup;
 	struct cgroup_base_stat bstat;
+	struct bstat_entry *e;
 
 	if (cgroup_parent(cgrp)) {
 		cgroup_rstat_flush_hold(cgrp);
@@ -625,21 +643,8 @@ void cgroup_base_stat_cputime_show(struct seq_file *seq)
 		root_cgroup_cputime(&bstat);
 	}
 
-	do_div(bstat.cputime.sum_exec_runtime, NSEC_PER_USEC);
-	do_div(bstat.cputime.utime, NSEC_PER_USEC);
-	do_div(bstat.cputime.stime, NSEC_PER_USEC);
-	do_div(bstat.ntime, NSEC_PER_USEC);
-
-	seq_printf(seq, "usage_usec %llu\n"
-			"user_usec %llu\n"
-			"system_usec %llu\n"
-			"nice_usec %llu\n",
-			bstat.cputime.sum_exec_runtime,
-			bstat.cputime.utime,
-			bstat.cputime.stime,
-			bstat.ntime);
-
-	cgroup_force_idle_show(seq, &bstat);
+	for (e = bstats; e->name; e++)
+		cgroup_bstat_entry_show(seq, &bstat, e);
 }
 
 /* Add bpf kfuncs for cgroup_rstat_updated() and cgroup_rstat_flush() */
-- 
2.37.3

