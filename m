Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7332A20767F
	for <linux-doc@vger.kernel.org>; Sat, 25 Jan 2025 05:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737782762; cv=none; b=tGRvpKQzO01/Gf2hcp+dS000D+S3/HFNPPU8e9kw0Oy6vEjvbFfzK4uie77z0b+yOG1/aY1Ikp6MJu06+mUmAJfrCFCMq7VWupPUHljH2whThmwTsdoewbndJ1/6HrHrb6ZZ49YivXPodLkMi5tWnNjVP2tJ345xcU1NdGYwhik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737782762; c=relaxed/simple;
	bh=LKw6HaeW05jbHUxXDx+rmwHbEdYlclYGnPRLLJQzy60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kJWkSHFU36D9GvsM0HZZq1UssFwmHDmLdTrYIngzvbrMEJsi5tfRxIVmzqoF8IEOWT1d/VLqQ7cKQo0hoGg4HkBioyJhrTf1X2KWULvtOS0GSgu6r/F+rJlVjn1/tONCPsxTrpiFDkk3Vb9RQr602Dj/cfvOVluF3VYzMwqeEZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UiCe0ZHM; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UiCe0ZHM"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f45526dea0so631169a91.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 21:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737782761; x=1738387561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiWK8iJRg8z+aUiF8sWc5hRLfRD7QwQ2HIsrRNActc8=;
        b=UiCe0ZHM79m0DJUIW7mXuZI1NCNFTQeCcmr7a2pF1sHywNWdAm6FAGSqxX63nM5sVk
         soCWx6nTw18SG0IPgk9zJH0Pf4MCPQZdL1jLVER/Nvoq6AVcBAE7967YC++cNptzSUlP
         ea2UmkJHyJVXgOuOigyCjubv+kbUsYpxCPzGuFqomXMCFRfvpNtnDaD2HYF/VCIvEXxj
         PFRXeitqvbuVwOD8oI0ghWHAKs8U7tpqxPBixp4bzORz3q4MQx+qDUQZpQw7JJ4pfm3S
         UtZed/g0sYObWYwO/jmvR7u4hXzmEgWC/KbwNfhtDHqTli1BKSlaPs8gxQz8P2KHhXkg
         e4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737782761; x=1738387561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiWK8iJRg8z+aUiF8sWc5hRLfRD7QwQ2HIsrRNActc8=;
        b=HMTyDH+g+AainYKWnvaJYGv7nXygJ7W5C6kMOxiCA9naKa2LeiO4zA935Y5NPGRDjz
         uQbZlXK4bA6Pnqa1aV2QuIHykOMOOljU4WvaX7NFHbiWpnLIIZ2KaQtHGsgcZAivJM7/
         IiJ+XyqKYMK92DB3EniUMk6xjPn6XvffcxOPhRPlI8yXLtlw/DtfYYj5gmnj67fBOwh9
         fRqZ/PJUZLpkn7jWdmhC+oceQzHmMf1IVpV7jnyi6xnVD8bmkZaiBWuh9sh7dFPIqnoK
         4VnRup0MBQHJaLTpiTfI7klUlnCwi/D2U0vHzO48hTx3uoYWY7uv8rj4EIJQw7nLQeJf
         shww==
X-Forwarded-Encrypted: i=1; AJvYcCXaNebMwzPodCzge2VypH6DEt6GfHBmpXOQ+uqb/S9knpP6Ke232AUIIrKn6froiDruE15YeZmDO9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwWURMnHZZz+57P/wnO/XEoh6NbmpBw1m6sPLkIPl0gCZywxG3
	EvsQzv0hlIG1d64fOkmo3abtVuJAfEG7fMX8iUr1x7SZEAfipSxmrfsTogse2tY=
X-Gm-Gg: ASbGncsjPBMmgvuO88DlU2sxSD2Gp7n+licmwDMuWyok3qLqfYolnOaidwhALiz10Yl
	y0JUyM6hmQXC+cqcd9pcXpujEIlbgRcKe0raZM9cjnnVqyA798n5/QHWairvUHEIhRX3eNd8ehp
	xqck1jJDQs1uXUqMj9DKDhoLq8r6ISkYhNJ38zKAYzhM/fdYABgkjCqLTwbK4a7FoCxTFLt2ZIH
	tXAeEyubyF/N6CoiniIiu2UmTzvhE40SXbbCISTwFb1s6c21XAuLPUJLwJJS9xHL8IPbmQuMDGW
	SgnEJwgeKZOYMmX63n8me8nEGu7LXokg2Pne/8Fe7H4=
X-Google-Smtp-Source: AGHT+IH+E7+zyXLvCWAiXzV6o5l6ebSPI18pr2IFPQuGjkRm7m10xzWPBeH3vqaVimkyMkQaYvC5FA==
X-Received: by 2002:a17:902:e750:b0:215:2bfb:3cd7 with SMTP id d9443c01a7336-21c3562959bmr192927435ad.10.1737782760661;
        Fri, 24 Jan 2025 21:26:00 -0800 (PST)
Received: from C02DV8HUMD6R.bytedance.net ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496bbdc9esm2563856a12.63.2025.01.24.21.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 21:26:00 -0800 (PST)
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
	Yury Norov <yury.norov@gmail.com>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Chen Ridong <chenridong@huawei.com>
Cc: cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] cgroup/rstat: Fix forceidle time in cpu.stat
Date: Sat, 25 Jan 2025 13:25:10 +0800
Message-Id: <20250125052521.19487-2-wuyun.abel@bytedance.com>
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

The commit b824766504e4 ("cgroup/rstat: add force idle show helper")
retrieves forceidle_time outside cgroup_rstat_lock for non-root cgroups
which can be potentially inconsistent with other stats.

Rather than reverting that commit, fix it in a way that retains the
effort of cleaning up the ifdef-messes.

Fixes: b824766504e4 ("cgroup/rstat: add force idle show helper")
Signed-off-by: Abel Wu <wuyun.abel@bytedance.com>
---
 kernel/cgroup/rstat.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/kernel/cgroup/rstat.c b/kernel/cgroup/rstat.c
index 5877974ece92..c2784c317cdd 100644
--- a/kernel/cgroup/rstat.c
+++ b/kernel/cgroup/rstat.c
@@ -613,36 +613,33 @@ static void cgroup_force_idle_show(struct seq_file *seq, struct cgroup_base_stat
 void cgroup_base_stat_cputime_show(struct seq_file *seq)
 {
 	struct cgroup *cgrp = seq_css(seq)->cgroup;
-	u64 usage, utime, stime, ntime;
+	struct cgroup_base_stat bstat;
 
 	if (cgroup_parent(cgrp)) {
 		cgroup_rstat_flush_hold(cgrp);
-		usage = cgrp->bstat.cputime.sum_exec_runtime;
+		bstat = cgrp->bstat;
 		cputime_adjust(&cgrp->bstat.cputime, &cgrp->prev_cputime,
-			       &utime, &stime);
-		ntime = cgrp->bstat.ntime;
+			       &bstat.cputime.utime, &bstat.cputime.stime);
 		cgroup_rstat_flush_release(cgrp);
 	} else {
-		/* cgrp->bstat of root is not actually used, reuse it */
-		root_cgroup_cputime(&cgrp->bstat);
-		usage = cgrp->bstat.cputime.sum_exec_runtime;
-		utime = cgrp->bstat.cputime.utime;
-		stime = cgrp->bstat.cputime.stime;
-		ntime = cgrp->bstat.ntime;
+		root_cgroup_cputime(&bstat);
 	}
 
-	do_div(usage, NSEC_PER_USEC);
-	do_div(utime, NSEC_PER_USEC);
-	do_div(stime, NSEC_PER_USEC);
-	do_div(ntime, NSEC_PER_USEC);
+	do_div(bstat.cputime.sum_exec_runtime, NSEC_PER_USEC);
+	do_div(bstat.cputime.utime, NSEC_PER_USEC);
+	do_div(bstat.cputime.stime, NSEC_PER_USEC);
+	do_div(bstat.ntime, NSEC_PER_USEC);
 
 	seq_printf(seq, "usage_usec %llu\n"
 			"user_usec %llu\n"
 			"system_usec %llu\n"
 			"nice_usec %llu\n",
-			usage, utime, stime, ntime);
+			bstat.cputime.sum_exec_runtime,
+			bstat.cputime.utime,
+			bstat.cputime.stime,
+			bstat.ntime);
 
-	cgroup_force_idle_show(seq, &cgrp->bstat);
+	cgroup_force_idle_show(seq, &bstat);
 }
 
 /* Add bpf kfuncs for cgroup_rstat_updated() and cgroup_rstat_flush() */
-- 
2.37.3

