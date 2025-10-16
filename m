Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635852D374F
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626025; cv=none; b=K8iPkPVcVIrQ9Vr9wSFecpmG5WkFwLbz3DGiXIP/BSxfGrABy5kM+lcqKr5I2jzP6mHYxjQG8KVCi+4W1ZM3hhSZXKed0K72Izm8UOxDeQffG/tPD/472/2osOLOAOq4EIjsvsQsgil5WiEyY6lwWZ2vsL9R8NiwVT/BjFQkDAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626025; c=relaxed/simple;
	bh=udG4u+C2ZRYoWfcR0oorTmw5eUGfOQlVhzCX6e7sXHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=akKqfefMZrse/Fz+fCFTBpxZKAZFHONu3nBgiGZYUyj54ojECxjo/1Bh5lkoBGU4y5HVTDXd7UDp+oas2Wsn4cZcvqqyGJDRGHmZUw3+fBmLZnbhp3KWh7DZrVetV5cH7ATjTsjS+iGf7qu1rexTFdbUOO2EmFD9W5h2kY+pajI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=yonch.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=yonch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-43f86ddb3f4so286375b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 07:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626022; x=1761230822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBHn6CsGRDAUCK2Z49Yacln3ofSUz8trsXQy6V4TvmY=;
        b=HEVKXoRnTpC7BLw9cB1HHdSB3upWqOCw8w9DX5AHivyDxR/RXgHlh1QrnLOIzeKnXI
         DXRC6l7j2XxV0KjjnTHdU3ttbBzRxyWnl4FV/8Edv9OGEfCFJwGKEfVYSzgwTTfeHflL
         DwjJWCtTVBDjyCoY/Bb9Kw6yvk8KgpeE7eeSDH1wud+ISeZ6SsU6blAMKPry6Q2YZVIv
         07e7z9+4A+w1UsvS63GO/jqtXAN5SILbsHIqE52hMsMyudEzbAoeSq/D0mLO/bs17aDg
         oI589Ik+gtVVLN61nU9qslPeUnVll3+QGs2iVabmOgyIBNxLdbSh1Cf4g38qgQgULKbj
         h+TA==
X-Forwarded-Encrypted: i=1; AJvYcCUZujt04GIzPMgkRy6uBqDmLMurluc63xQTy4nB/r+r5gh5Kms9G4w6vdGKEivZ/yBMwOQh88E1B6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQi9mTbSsPYH4ajwAXIIqpASDqErVLJrqzhFulCJQBV4XCHPQ+
	DIwSobb6EFpNhTmSX8oB7eZbHB9IzjgKCNEDn8j37+cx9HHu9yjUGmlt
X-Gm-Gg: ASbGnctgVwAyGin3gDHZkEEt+RMAsU2YuxFqUScGpC4gGkzGYl/hvmftHFVKyX6/l8b
	u4ivixYetCDkjBfj/FakD7IfG7gT4Q/e1AuwjZv/znDIuc0ezGP3vQLt/Cd3H79WMyiDAv8vC4Z
	V7xiLi1aCB3fYdFPXL02Phnv/JdoSrDLWPkagBcWRa/O7jEUQ3zX//Sr7B+KZNGdfnjy+2OdyqX
	pUQpLF13KAPZl3w/OLTrR9OiUOvuApMbivHs0TDNzbt7Sd5SNAeZagu8UW43RssOmw16qrpitLl
	KoVWE+47cBLfIhoRes3CfKfIQ6KfECfUyYDdZaWi3HpFZg/h7c+3vrjymgw6ddN8vbLwMgcW/wG
	cuBDL4TKN+Qg93Bzcll3XtXeU0t3qTUS8LqUn2eD5dQ9Y8jJJVoh4RzpdpUGkAKxc0QFG9/1w+6
	FvXbUSViyKbxsTPOejXKaw+F5XYTMttEZzcqHEQG27sWrGb4IrNlNoB+79P63rBYqfMSY=
X-Google-Smtp-Source: AGHT+IFDXse00m2TWPZi7Thsyfiz1q30tLZZikOylS+Gewam/P4dv7Cstc52U+FEl+CdZhH12tCOWg==
X-Received: by 2002:a05:6808:1514:b0:43f:6f82:e16f with SMTP id 5614622812f47-443a2dd8597mr136457b6e.12.1760626022395;
        Thu, 16 Oct 2025 07:47:02 -0700 (PDT)
Received: from localhost.localdomain (syn-067-079-108-173.biz.spectrum.com. [67.79.108.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-441cc812f24sm3678018b6e.12.2025.10.16.07.47.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Oct 2025 07:47:02 -0700 (PDT)
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
Subject: [PATCH 1/8] resctrl: Pin rdtgroup for mon_data file lifetime
Date: Thu, 16 Oct 2025 09:46:49 -0500
Message-ID: <20251016144656.74928-2-yonch@yonch.com>
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

Add .open and .release handlers to mon_data kernfs files so a
monitoring file holds a reference to its rdtgroup for the file's
lifetime. Store the rdtgroup in of->priv on open and drop it on
release. Provide rdtgroup_get()/rdtgroup_put() helpers.

This lets code that only has an open monitoring fd (e.g. the resctrl
PMU event_init path) safely resolve the rdtgroup without having a
kernfs active reference.

No functional change intended.

Signed-off-by: Jonathan Perry <yonch@yonch.com>
---
 fs/resctrl/internal.h |  2 ++
 fs/resctrl/rdtgroup.c | 62 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index cf1fd82dc5a9..63fb4d6c21a7 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -360,6 +360,8 @@ void resctrl_mon_resource_exit(void);
 void mon_event_count(void *info);
 
 int rdtgroup_mondata_show(struct seq_file *m, void *arg);
+int rdtgroup_mondata_open(struct kernfs_open_file *of);
+void rdtgroup_mondata_release(struct kernfs_open_file *of);
 
 void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
 		    struct rdt_mon_domain *d, struct rdtgroup *rdtgrp,
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 0320360cd7a6..17b61dcfad07 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -332,6 +332,8 @@ static const struct kernfs_ops rdtgroup_kf_single_ops = {
 static const struct kernfs_ops kf_mondata_ops = {
 	.atomic_write_len	= PAGE_SIZE,
 	.seq_show		= rdtgroup_mondata_show,
+	.open			= rdtgroup_mondata_open,
+	.release		= rdtgroup_mondata_release,
 };
 
 static bool is_cpu_list(struct kernfs_open_file *of)
@@ -2512,12 +2514,26 @@ static struct rdtgroup *kernfs_to_rdtgroup(struct kernfs_node *kn)
 	}
 }
 
+/*
+ * Convert an kernfs active reference to an rdtgroup reference.
+ */
 static void rdtgroup_kn_get(struct rdtgroup *rdtgrp, struct kernfs_node *kn)
 {
 	atomic_inc(&rdtgrp->waitcount);
 	kernfs_break_active_protection(kn);
 }
 
+/*
+ * Get rdtgroup reference count from existing reference
+ */
+void rdtgroup_get(struct rdtgroup *rdtgrp)
+{
+	atomic_inc(&rdtgrp->waitcount);
+}
+
+/*
+ * Decrement rdtgroup reference count, when converted from kernfs active ref
+ */
 static void rdtgroup_kn_put(struct rdtgroup *rdtgrp, struct kernfs_node *kn)
 {
 	if (atomic_dec_and_test(&rdtgrp->waitcount) &&
@@ -2532,6 +2548,20 @@ static void rdtgroup_kn_put(struct rdtgroup *rdtgrp, struct kernfs_node *kn)
 	}
 }
 
+/*
+ * Decrement rdtgroup reference count
+ */
+void rdtgroup_put(struct rdtgroup *rdtgrp)
+{
+	if (atomic_dec_and_test(&rdtgrp->waitcount) &&
+	    (rdtgrp->flags & RDT_DELETED)) {
+		if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
+		    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED)
+			rdtgroup_pseudo_lock_remove(rdtgrp);
+		rdtgroup_remove(rdtgrp);
+	}
+}
+
 struct rdtgroup *rdtgroup_kn_lock_live(struct kernfs_node *kn)
 {
 	struct rdtgroup *rdtgrp = kernfs_to_rdtgroup(kn);
@@ -3364,6 +3394,38 @@ static int mkdir_mondata_all(struct kernfs_node *parent_kn,
 	return ret;
 }
 
+int rdtgroup_mondata_open(struct kernfs_open_file *of)
+{
+	struct rdtgroup *rdtgrp;
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+	if (!rdtgrp) {
+		rdtgroup_kn_unlock(of->kn);
+		return -ENOENT;
+	}
+
+	/*
+	 * resctrl relies an kernfs active references to guard access to struct
+	 * rdtgroup from kernfs_open_file. Hold a reference in the file
+	 * descriptor so perf_event_open() can retrieve the rdtgroup.
+	 */
+	rdtgroup_get(rdtgrp);
+	of->priv = rdtgrp;
+
+	rdtgroup_kn_unlock(of->kn);
+	return 0;
+}
+
+void rdtgroup_mondata_release(struct kernfs_open_file *of)
+{
+	struct rdtgroup *rdtgrp = of->priv;
+
+	if (rdtgrp) {
+		rdtgroup_put(rdtgrp);
+		of->priv = NULL;
+	}
+}
+
 /**
  * cbm_ensure_valid - Enforce validity on provided CBM
  * @_val:	Candidate CBM
