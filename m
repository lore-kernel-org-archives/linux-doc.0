Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC8D3451BE
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626028; cv=none; b=HeFLfsyED5BuetVdYYLhmRjYj6Q3T8AVZWYOIs/Ba9zrMV7I/C90TwJk1VYOP5nnM7e3kiPxUz+9F8OPwzQjd+64IYd+hQ/2ceBRd1lGLTgo/Rl9fHWH+z6j4eb3/Oh/rS9N995PVN45f+JrYL2KmdUSjLB/vckOLQ3WmcWUK7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626028; c=relaxed/simple;
	bh=vxd5viqIAF53p9qHcx2+SSC6DWLKIshKJ2YVAGNmP6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KmSIDLxwbZsMSUM71Y0KcPMrLx3J6HmH4C2gsF7uvX4KzsYD+68x+BHu4kuml3c3Z96FVdXF6IQVMrjMqe9lnH+b4lcJy4f7L60GYCCCIwyt2aeM59xlejgu7njwf8yBrfU0g/qTH9nLxhGyEItnk+h9LDw7N8R+5Zv4tddsorg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=yonch.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=yonch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3b15f0027d9so365336fac.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 07:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626025; x=1761230825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkeQ5GVzAIUDDgYC2BBLNxE47r9RQHz/6gTcvpiCb7E=;
        b=NCmmkALj1EdIj/0Z0arMOEb/v8AgUiX7RfeSAobLxZHIN1R9NjZgsOB5aBLrWCg5UV
         XKJd4Gc9x6KtSha9jXxhLRN8/VYfqVCOUmwNz9XJEWw5KYPcnUhzo8cNxYMR5oLxWJgY
         YiRRGor9Qz9ALpgV3HnOgd9QCft9XmYiybZ3HZhBpCciy2iBIzLakbZLG2HoMoIVzb+R
         lAC87Vn3UWPjexgFyBqK+qtVJkAvLbsGDrrzsp7IyLfrMeqTsWmdcsg1W0AEq9mn1veH
         dThBw+9Lp2q5XCoeJUHtHnFJ67ecHYuuYA7ooSbpRIBih+AhLpJqTApNDLQylkNHyq97
         Nv5A==
X-Forwarded-Encrypted: i=1; AJvYcCXc7gUS6OMs6ghTRnjhwCkm7iHt9OTwMsDhanqq6sZnOxAwk8LzxOGLzDLFndNZhKqzHmbF+SewX/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ16qsMw8AxEhnZDm+WVw94Gh56aLmJzc46/X4Dw6UgSy1pOBv
	N1e0aEPZXDBTXOFS4iSGsHwifKs7tjxH9J78xgQM27trVcV894CL8Gef
X-Gm-Gg: ASbGnctAqS+qF8no0Ul9xEj6K2qyFQ+QiWz2iVh4tWer2yEfWN75E69uWYQBILSYyGm
	/0+PZonsLrF2ZPLH5F+4XwSCflFZoY5aoweaF8MNZYgnaw+u7O5PpNBvPugvRxLHKsmdMe/Hsiw
	9wSBRoz4WY8bRf4wptQ7feAweuwvsJi85g9OxXUhbO0oC3sNmiZta1JaJcJM0fnpjmvqpqMhTV/
	M0gKS7bzKOQhazUHbXnMx3HPtij7XFxcUxDYDpUv9gCTBYujM4vhbPqb30bMg+fIwVPgCdy43nk
	uLKXoBCe9P6L5Rqz6yDUMwH80hzERjrw4gnM8DH0atFzaGQNNKPnNmGNGS43VgQSYUEviqJ/C2h
	vGthz2hS8O5/x0eGDd0kxkvwmMZxa2RU38B7yX1+kwGwDfC8iNQeZGXmgZUEVdvK00PfAhUWEZQ
	mkFdTuNqWEEvdBZea+emKDo1RS0aEfH8FQiqJpqRf/slKveCrnkVQxa32n
X-Google-Smtp-Source: AGHT+IHad8QU7400Suvztwz7R3TknwRXuPTBhGJThjhex4bA27wajLbo4tHyKKwflCEojRIUm28PFg==
X-Received: by 2002:a05:6808:14c5:b0:43f:507f:ced2 with SMTP id 5614622812f47-443a2f1b8camr127533b6e.23.1760626025484;
        Thu, 16 Oct 2025 07:47:05 -0700 (PDT)
Received: from localhost.localdomain (syn-067-079-108-173.biz.spectrum.com. [67.79.108.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-441cc812f24sm3678018b6e.12.2025.10.16.07.47.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Oct 2025 07:47:05 -0700 (PDT)
From: Jonathan Perry <yonch@yonch.com>
To: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	James Morse <james.morse@arm.com>,
	Roman Storozhenko <romeusmeister@gmail.com>,
	Jonathan Perry <yonch@yonch.com>
Subject: [PATCH 4/8] resctrl/mon: Create mon_event_setup_read() helper
Date: Thu, 16 Oct 2025 09:46:52 -0500
Message-ID: <20251016144656.74928-5-yonch@yonch.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251016144656.74928-1-yonch@yonch.com>
References: <20251016144656.74928-1-yonch@yonch.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the selection of monitored event from the kernfs seq_show
handler to a helper function. This provides a single setup path that
the resctrl PMU will reuse.

Add mon_event_setup_read() to encapsulate domain lookup,
rmid_read_init(), and selection of the valid CPU mask for the read.
Rework rdtgroup_mondata_show() to call the helper before reading.

No functional change intended.

Signed-off-by: Jonathan Perry <yonch@yonch.com>
---
 fs/resctrl/ctrlmondata.c | 71 ++++++++++++++++++++++------------------
 fs/resctrl/internal.h    |  2 ++
 2 files changed, 41 insertions(+), 32 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index f28328c49479..d1e4cf6f2128 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -594,32 +594,16 @@ void mon_event_read(struct rmid_read *rr, cpumask_t *cpumask)
 		resctrl_arch_mon_ctx_free(rr->r, rr->evtid, rr->arch_mon_ctx);
 }
 
-int rdtgroup_mondata_show(struct seq_file *m, void *arg)
+int mon_event_setup_read(struct rmid_read *rr, cpumask_t **cpumask,
+			 struct mon_data *md, struct rdtgroup *rdtgrp)
 {
-	struct kernfs_open_file *of = m->private;
 	enum resctrl_res_level resid;
 	enum resctrl_event_id evtid;
 	struct rdt_domain_hdr *hdr;
-	struct rmid_read rr = {0};
 	struct rdt_mon_domain *d;
-	struct rdtgroup *rdtgrp;
-	int domid, cpu, ret = 0;
 	struct rdt_resource *r;
 	struct cacheinfo *ci;
-	struct mon_data *md;
-	cpumask_t *cpumask;
-
-	rdtgrp = rdtgroup_kn_lock_live(of->kn);
-	if (!rdtgrp) {
-		ret = -ENOENT;
-		goto out;
-	}
-
-	md = of->kn->priv;
-	if (WARN_ON_ONCE(!md)) {
-		ret = -EIO;
-		goto out;
-	}
+	int domid, cpu;
 
 	resid = md->rid;
 	domid = md->domid;
@@ -639,30 +623,53 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 				ci = get_cpu_cacheinfo_level(cpu, RESCTRL_L3_CACHE);
 				if (!ci)
 					continue;
-				rmid_read_init(&rr, r, NULL, rdtgrp,
-						     evtid, false, ci);
-				cpumask = &ci->shared_cpu_map;
-				goto perform;
+				rmid_read_init(rr, r, NULL, rdtgrp,
+					       evtid, false, ci);
+				*cpumask = &ci->shared_cpu_map;
+				return 0;
 			}
 		}
-		ret = -ENOENT;
-		goto out;
+		return -ENOENT;
 	} else {
 		/*
 		 * This file provides data from a single domain. Search
 		 * the resource to find the domain with "domid".
 		 */
 		hdr = resctrl_find_domain(&r->mon_domains, domid, NULL);
-		if (!hdr || WARN_ON_ONCE(hdr->type != RESCTRL_MON_DOMAIN)) {
-			ret = -ENOENT;
-			goto out;
-		}
+		if (!hdr || WARN_ON_ONCE(hdr->type != RESCTRL_MON_DOMAIN))
+			return -ENOENT;
+
 		d = container_of(hdr, struct rdt_mon_domain, hdr);
-		rmid_read_init(&rr, r, d, rdtgrp, evtid, false, NULL);
-		cpumask = &d->hdr.cpu_mask;
+		rmid_read_init(rr, r, d, rdtgrp, evtid, false, NULL);
+		*cpumask = &d->hdr.cpu_mask;
+		return 0;
 	}
+}
 
-perform:
+int rdtgroup_mondata_show(struct seq_file *m, void *arg)
+{
+	struct kernfs_open_file *of = m->private;
+	struct rmid_read rr = {0};
+	struct rdtgroup *rdtgrp;
+	int ret = 0;
+	struct mon_data *md;
+	cpumask_t *cpumask;
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+	if (!rdtgrp) {
+		ret = -ENOENT;
+		goto out;
+	}
+
+	md = of->kn->priv;
+	if (WARN_ON_ONCE(!md)) {
+		ret = -EIO;
+		goto out;
+	}
+
+	ret = mon_event_setup_read(&rr, &cpumask, md, rdtgrp);
+	if (ret)
+		goto out;
 	mon_event_read(&rr, cpumask);
 
 	/*
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index dcc0b7bea3ac..486cbca8d0ec 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -366,6 +366,8 @@ void rdtgroup_mondata_release(struct kernfs_open_file *of);
 void rmid_read_init(struct rmid_read *rr, struct rdt_resource *r,
 		    struct rdt_mon_domain *d, struct rdtgroup *rdtgrp,
 		    int evtid, int first, struct cacheinfo *ci);
+int mon_event_setup_read(struct rmid_read *rr, cpumask_t **cpumask,
+			 struct mon_data *md, struct rdtgroup *rdtgrp);
 void mon_event_read(struct rmid_read *rr, cpumask_t *cpumask);
 
 int resctrl_mon_resource_init(void);
