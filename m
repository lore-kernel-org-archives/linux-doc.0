Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F397149C57
	for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 17:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737654503; cv=none; b=nJ4FTCOoAe6VcyuOm/8LYTg4gQSVAaKID5o6e2DjEffzOwtJGWbkL10fh+b9/xF7Q1NwuuSZUfXe1LyhK5id7JwHt8B5Rdz/QggXObNHqgSq71BlwPFVAGp3N7XEQv8GGqxbXta3bnoLNFvkGxH9Q+ONLoPdbVgFK5+2RemRwv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737654503; c=relaxed/simple;
	bh=LKw6HaeW05jbHUxXDx+rmwHbEdYlclYGnPRLLJQzy60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TneMFBi9KJZkVQyHzKB7Q7zXEbuBXcs6WLWkhkOYstFwQxljYJkEnN2Zk0jAzM5+jApDyg4ATqVjm4R5GJFZhjzMynfCZ+ZYTceMkDIy57+S29bk156kktZTGsJd1Xr6IJmmRSHmkDfAfp3sFjM1LQ+N9bWNC749MDYLGMExiZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=B0h7By2t; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="B0h7By2t"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216325f516fso2374415ad.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 09:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737654501; x=1738259301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiWK8iJRg8z+aUiF8sWc5hRLfRD7QwQ2HIsrRNActc8=;
        b=B0h7By2tqMltoFaj4euT6p3nWVu3zn15QRdxf9PlIN5OHWJs7mVvnHF13rvdobRmWw
         EaUnuiOpVyQLGoNg/F1Wrni07+GHsHKrXtZPlLKCq6R23JiwsXEVrV6aefxNL2sJCF/k
         6SCJWxI/9s+unvQvu4oLKCJ8/0uSX6dquPkO5SddHpM8/7NVV+Ajxh1Ol7NyLX3MNUGk
         EjzPTFWRj2R4TfquW0tCtl/eD6IdzgGQ7Z2h8TOH50edy7e/hZz0kOhR2N6v7Hb6xREj
         lHECH26LgnRfjcgK0LuzJQIejhCw16Ss/GeUihJ6bfIzH4DXoEWHdNPO5USwytdZb1vJ
         QV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737654501; x=1738259301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiWK8iJRg8z+aUiF8sWc5hRLfRD7QwQ2HIsrRNActc8=;
        b=RC3W2UZFXBg5uwgYgymyI/laTQgmC2eYaZlPCPAG//jtHE97CzuUu8P4H7u5dQVca1
         Ti0OsQKCF8MZT/lnapBPJYrFBgpVgbFNFtZQ+viepSBHeRFRXyoU1baIzv3GYSMBdw8p
         Uge8VMM0zDq0pjHECX056wfGeJFT9LLl5VtqBDxjHYvOBaMpW/bGwzJPiBeJA4m88mAv
         gJRUtCG1ho1Gd2f8wh6kzmx0B4ViG1xEsVZ94tQKj/zoH688mmI5mRSxCBG8hYyG9tQg
         KyKqglvoP4SOyg1JvfmoyvqYZ3WQcTYmjCgv2LiELoQ7z6oF2d+jnSwh1FFxxyQI4Xju
         JIEw==
X-Forwarded-Encrypted: i=1; AJvYcCXFQSH70NvQmiVZgGtcfyini4G0Xt3jy0bFOd40autLJXsMVZ9KS749fkeGq3VSyRV2EVNuVU9cCK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuOKDw01adhldFvaPYk9yh4LjXpD0VwQqRLJrHRVgJsSGGQ2fA
	OvdoeRupG/YsUmTWkwZGdWmUWupmCy89tjW8waMLcYdqW3rgq3LpjLnAzFwtz9Q=
X-Gm-Gg: ASbGncvjX5GGOXuInE3UQwgg3DiiWrdul9gWwTvIFHfKPE4Xi/pofxkwgMAsSXyQGdW
	XYf4Gg+JmEJgIXG51aMlzf/h7xB8mnKcRnh7/oPLioe9+i40aJsSCSbdU8Wr/SCDm+iM2dXQ2ct
	iQlfFhTZyj+Vn9i1ZBXLup2HD2LobXEOACMND5VgfQHE3poO5i+YArVeq8ZnD9ToqOS9ly/8ymD
	LbZO2qgbR29hOHmJWKCcBwE8qaqN5LtH3D5w9FmEk5ysqYM+1rRFaMFpHUoIqtRHgvHpHIH28ET
	AmT0OWD8MTLrAhWe+jr1r1PJrQPMzwBV5pp3ATAO2+o=
X-Google-Smtp-Source: AGHT+IEqB68REsf/Kze/kPNv67JNu8zBFzaX7VHnFfW4RVplM5vlL8i36rgiPBi5eWFCEfMpK9w1Yg==
X-Received: by 2002:a17:902:ebca:b0:215:2f19:1dd with SMTP id d9443c01a7336-21d79b26016mr49359925ad.11.1737654501385;
        Thu, 23 Jan 2025 09:48:21 -0800 (PST)
Received: from C02DV8HUMD6R.bytedance.net ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141c4esm1620765ad.110.2025.01.23.09.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 09:48:20 -0800 (PST)
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
	Thomas Gleixner <tglx@linutronix.de>,
	Yury Norov <yury.norov@gmail.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Chen Ridong <chenridong@huawei.com>
Cc: cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] cgroup/rstat: Fix forceidle time in cpu.stat
Date: Fri, 24 Jan 2025 01:47:01 +0800
Message-Id: <20250123174713.25570-2-wuyun.abel@bytedance.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20250123174713.25570-1-wuyun.abel@bytedance.com>
References: <20250123174713.25570-1-wuyun.abel@bytedance.com>
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

