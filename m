Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27CE2DB7BB
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206441; cv=none; b=G4sFCZUIaDXNPIMET0YCl9O/Nd9tlxE3uiDWhSDBAX4cGHclQ1Y2/3YxIpxsuJHef6CJu6vKZdnk3C8mblqlkxdVBaX27qLxQsEryUHDndrwDlV7fzmGu/3pfhIuzgELxvpAAw5y+IQcP6Z6GiwZ+tA9r9NZM5fE8ppSREbB4UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206441; c=relaxed/simple;
	bh=OWvl2gDr2tO8/A0xx+YxYDi6nhszzlOeBBlrlVUDVH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRmd7kYLgfP5rH2pml5i7D4TccgPW/+FBGkiOsumkXXJZRxBsrzYFajlUzeKbXEGgsTOX0b2lCCxnKLNSC2fVqGP2GNwJ9PP6O9rbt4JIqVsPvalyW+UYF7m8wkarLkezrh7MI0lhVs0H55J8s5+LIK1HqPTxaJHnuaP4QfxGNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M6AeiHQg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P8X18DB+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M6AeiHQg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8X18DB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779206438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lxAuh/+LJ+cDVuOYgE+wIRcTwCiP9gqh5qSpye35R00=;
	b=M6AeiHQgRJsOdti41ruI8VEvJM1AIb3R8U7ErsDVuf0QleECnZ5Bf4K1C6zAb1MTmGgQAH
	+NYH8fVN16JS33juIwK3wo/8BJrstkV60pwoF8K4TBeN/+fu02Cko5Gvq4a4LzUrd6Zc1E
	JyzF6kN+j2Xx7M8MrCjo8E4+fp5Ou1g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-3G124HCcPu6ixBk8xWUrlQ-1; Tue, 19 May 2026 12:00:35 -0400
X-MC-Unique: 3G124HCcPu6ixBk8xWUrlQ-1
X-Mimecast-MFC-AGG-ID: 3G124HCcPu6ixBk8xWUrlQ_1779206435
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8baa173eacbso17516936d6.0
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779206435; x=1779811235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxAuh/+LJ+cDVuOYgE+wIRcTwCiP9gqh5qSpye35R00=;
        b=P8X18DB+GAmxeHl2m7T18XCC1vbWNkLiYSRw4QGRrpwM/F6e6LigNviI1n4QxKhMgt
         WXZsJVZLeiMRzyEmp5wyyIUiR2vOUUhhik7jkA1hdcrVcklsbS/a5f9iu/xKLTrnGRc3
         3TeZ5FauihjBSKP9d3RMZShGWX3YVrp82unaQZSqrlO+ASelDJyS8DQIXa96VKmaqeBd
         zSM+rmHl+dudOXieyW6ES5OT+vdmlDj3lTcXyVwMWkvjA3hfQqEi6vC+R6d7JPpt9ipS
         c6gdDmuxjPoF9fnY9RV4cQLucIdEtDt/+g+mfQ4GqedtHGblLyS/9FxbNJ7xOTWb4NHt
         MGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206435; x=1779811235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lxAuh/+LJ+cDVuOYgE+wIRcTwCiP9gqh5qSpye35R00=;
        b=jTkBa61TwOgyyWVHUTtByrfWokk8nc4VEb3L/j4M1pR755DTBiOn3yokPsKsM2IQiO
         /xe6KpZcouH3WDFS0yaLWSudleDESdW7XOipbd47YaYBcW6Z8DN36jy/0ADIn7suclHi
         PhF0yszcLo7MA+h517Tp93PxuPPiCCiZkaxR6/+Ez8s6BKRN2+TtQyHDYtwwjQsRse6Y
         S6dhlIm/wXmGPmDXONiyETuzTukt/dT9j2HnlZtCyIlJa/BWTvtSqT3Ru6VTqx3RRFbm
         VTXFb8rIImsQIj8NGGSebEDesfZg8Lu94JagIWKCfC6bZ5hWyZ8hlt59dpUuophilfsl
         p1XA==
X-Forwarded-Encrypted: i=1; AFNElJ/OKRgzZ5d+BR5EG8oyhSdPOXC2gTzjNJhCEeW83EKmaVUqUaKubXCfNfFuhzf+801Q6hEhJfQA53A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt0CRHUFqPBc/A2bWV3pevUjN9WUYYJvJly9aog8l69aiyztW2
	vClHJyPVjCIrBRE/6/kePUxzX2+aOr3VzalgjcVLvUQ81IaLNeP4lM5MpHoBxeOjDtx6L2wY97l
	MUc0MQAwemyTJWOedhqK/I03c9+miZFwIzB2P+NLykdTHO5cGX1EUm591rt+hMg==
X-Gm-Gg: Acq92OGt9p0Gg8nTB+CQ/Md9AosnfpXwclGEBeui8eS0+FbsmA/GHGNR25kA8U5lsMd
	+0gJSfY8Ni+V9okp2S28/bBIYOhN3IGk3xfNi+43BQAQAeJZeesUcPnqblp3rlSFWMUQuoLT+wL
	tVnKOD9kqdAJL/vIpKzZRikYuk27aQKCuYkrLUwn6joeDL2Odmh4iC+FRLA6Q5QbdNRscwLDc87
	lRd+s+Qw8OQcdOE/gJytzj7q6R9iMvX0IwBC0RyRsFgGs/iKbDLQXDfvFe7YQhdkK5i7XZJGlqu
	uLkAq5qES0BbxQTrU8F/3ic8w1TzJ0Z3vCrDwF4pIOPd4c6mW4Wc0ZtqrTI1vl3OTzScMOcE8Ae
	SAuc16Wk6VlQY3hoqyr1YSGHdGn7VQE6B6oIU1vOOcDsB/4ncZUSoShb4Z2e/sYbv4LORuaPSfz
	5+
X-Received: by 2002:a0c:ea52:0:b0:8c9:c38a:20e1 with SMTP id 6a1803df08f44-8ca0f5ab3bemr240747386d6.10.1779206434518;
        Tue, 19 May 2026 09:00:34 -0700 (PDT)
X-Received: by 2002:a0c:ea52:0:b0:8c9:c38a:20e1 with SMTP id 6a1803df08f44-8ca0f5ab3bemr240746326d6.10.1779206433782;
        Tue, 19 May 2026 09:00:33 -0700 (PDT)
Received: from localhost (pool-100-17-21-205.bstnma.fios.verizon.net. [100.17.21.205])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca36095326sm95016266d6.14.2026.05.19.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:00:33 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Tue, 19 May 2026 11:59:02 -0400
Subject: [PATCH v2 2/2] cgroup/dmem: add dmem.memcg control file for
 double-charging to memcg
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-cgroup-dmem-memcg-double-charge-v2-2-db4d1407062b@redhat.com>
References: <20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com>
In-Reply-To: <20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com>
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
 Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
 Dave Airlie <airlied@gmail.com>, linux-doc@vger.kernel.org, 
 Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2

Add a root-only cgroupfs file "dmem.memcg" that lets an administrator
configure whether allocations in a dmem region should also be charged to
the memory controller.

To handle inheritance, dmem adds a depends_on the memory controller,
unless MEMCG isn't configured in.

Double-charging is disabled by default. Once a charge is attempted, the
setting is locked to prevent inconsistent accounting by a small 4-state
machine (off, on, locked off, locked on).

The memcg to charge is derived from the pool's cgroup, since the pool
holds a reference to the dmem cgroup state that keeps the cgroup alive
until it gets uncharged.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  23 +++++
 kernel/cgroup/dmem.c                    | 158 +++++++++++++++++++++++++++++++-
 2 files changed, 178 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 6efd0095ed995b1550317662bc1b56c7a7f3db23..1d2fa55ddf0faa17baa916a8914d3033e8e42359 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2828,6 +2828,29 @@ DMEM Interface Files
 	  drm/0000:03:00.0/vram0 12550144
 	  drm/0000:03:00.0/stolen 8650752
 
+  dmem.memcg
+	A readwrite nested-keyed file that exists only on the root
+	cgroup. It configures whether allocations in a dmem region
+	should also be charged to the memory controller.
+
+	Upon the first charge to a region, its setting can no longer be changed
+	and is reported as "[true|false] (locked)".
+
+	Charges to the memory controller are visible in ``memory.stat`` as the
+	``dmem`` entry, reported in bytes.
+
+	An example read output follows::
+
+	  drm/0000:03:00.0/vram0 false
+	  drm/0000:03:00.0/stolen false (locked)
+
+	Writing uses the same nested-keyed format::
+
+	  echo "drm/0000:03:00.0/vram0 true" > dmem.memcg
+
+	This file is only available when the kernel is built with
+	``CONFIG_MEMCG``.
+
 HugeTLB
 -------
 
diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index 1ab1fb47f2711ecc60dd13e611a8a4920b48f3e9..e07b20b8025c528f190f84c76b088cb8a32a7f5e 100644
--- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -17,6 +17,14 @@
 #include <linux/refcount.h>
 #include <linux/rculist.h>
 #include <linux/slab.h>
+#include <linux/memcontrol.h>
+
+enum dmem_memcg_status {
+	DMEM_MEMCG_OFF,
+	DMEM_MEMCG_ON,
+	DMEM_MEMCG_LOCKED_OFF,
+	DMEM_MEMCG_LOCKED_ON,
+};
 
 struct dmem_cgroup_region {
 	/**
@@ -51,6 +59,14 @@ struct dmem_cgroup_region {
 	 * No new pools should be added to the region afterwards.
 	 */
 	bool unregistered;
+
+	/**
+	 * @memcg_status: Whether allocation in this region should charge memcg.
+	 * DMEM_MEMCG_OFF/DMEM_MEMCG_ON or
+	 * DMEM_MEMCG_LOCKED_OFF/DMEM_MEMCG_LOCKED_ON, frozen after first allocation.
+	 * Transitions to a locked state are one-way.
+	 */
+	atomic_t memcg_status;
 };
 
 struct dmemcg_state {
@@ -609,6 +625,34 @@ get_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_region *region)
 	return pool;
 }
 
+static bool apply_memcg_charge(atomic_t *status)
+{
+	int state = atomic_read(status);
+
+	for (;;) {
+		switch (state) {
+		case DMEM_MEMCG_OFF:
+			state = atomic_cmpxchg(status, DMEM_MEMCG_OFF,
+					       DMEM_MEMCG_LOCKED_OFF);
+			if (state != DMEM_MEMCG_OFF)
+				continue;
+			return false;
+		case DMEM_MEMCG_LOCKED_OFF:
+			return false;
+		case DMEM_MEMCG_ON:
+			state = atomic_cmpxchg(status, DMEM_MEMCG_ON,
+					       DMEM_MEMCG_LOCKED_ON);
+			if (state != DMEM_MEMCG_ON)
+				continue;
+			return true;
+		case DMEM_MEMCG_LOCKED_ON:
+			return true;
+		}
+		WARN_ONCE(1, "Invalid memcg_status (%#x).\n", state);
+		return false;
+	}
+}
+
 /**
  * dmem_cgroup_uncharge() - Uncharge a pool.
  * @pool: Pool to uncharge.
@@ -624,6 +668,12 @@ void dmem_cgroup_uncharge(struct dmem_cgroup_pool_state *pool, u64 size)
 		return;
 
 	page_counter_uncharge(&pool->cnt, size);
+
+	if (atomic_read(&pool->region->memcg_status) == DMEM_MEMCG_LOCKED_ON &&
+	    !WARN_ON_ONCE(size > (u64)UINT_MAX << PAGE_SHIFT))
+		mem_cgroup_dmem_uncharge(pool->cs->css.cgroup,
+					 PAGE_ALIGN(size) >> PAGE_SHIFT);
+
 	css_put(&pool->cs->css);
 	dmemcg_pool_put(pool);
 }
@@ -655,6 +705,8 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
 	struct dmemcg_state *cg;
 	struct dmem_cgroup_pool_state *pool;
 	struct page_counter *fail;
+	unsigned long nr_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	bool charge_memcg;
 	int ret;
 
 	*ret_pool = NULL;
@@ -670,7 +722,28 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
 	pool = get_cg_pool_unlocked(cg, region);
 	if (IS_ERR(pool)) {
 		ret = PTR_ERR(pool);
-		goto err;
+		goto err_css_put;
+	}
+
+	charge_memcg = apply_memcg_charge(&region->memcg_status);
+	if (charge_memcg) {
+		/* mem_cgroup_dmem_charge limitation from try_charge_memcg */
+		if (size > (u64)UINT_MAX << PAGE_SHIFT) {
+			ret = -EINVAL;
+			dmemcg_pool_put(pool);
+			goto err_css_put;
+		}
+
+		if (!mem_cgroup_dmem_charge(pool->cs->css.cgroup, nr_pages,
+					    GFP_KERNEL)) {
+			/*
+			 * No dmem_cgroup_state_evict_valuable() could help,
+			 * there's no ret_limit_pool to return.
+			 */
+			ret = -ENOMEM;
+			dmemcg_pool_put(pool);
+			goto err_css_put;
+		}
 	}
 
 	if (!page_counter_try_charge(&pool->cnt, size, &fail)) {
@@ -681,14 +754,17 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
 		}
 		dmemcg_pool_put(pool);
 		ret = -EAGAIN;
-		goto err;
+		goto err_uncharge_memcg;
 	}
 
 	/* On success, reference from get_current_dmemcs is transferred to *ret_pool */
 	*ret_pool = pool;
 	return 0;
 
-err:
+err_uncharge_memcg:
+	if (charge_memcg)
+		mem_cgroup_dmem_uncharge(pool->cs->css.cgroup, nr_pages);
+err_css_put:
 	css_put(&cg->css);
 	return ret;
 }
@@ -845,6 +921,71 @@ static ssize_t dmem_cgroup_region_max_write(struct kernfs_open_file *of,
 	return dmemcg_limit_write(of, buf, nbytes, off, set_resource_max);
 }
 
+#ifdef CONFIG_MEMCG
+static int dmem_cgroup_memcg_show(struct seq_file *sf, void *v)
+{
+	struct dmem_cgroup_region *region;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(region, &dmem_cgroup_regions, region_node) {
+		int state = atomic_read(&region->memcg_status);
+
+		seq_printf(sf, "%s %s\n", region->name,
+			   state == DMEM_MEMCG_ON ? "true" :
+			   state == DMEM_MEMCG_OFF ? "false" :
+			   state == DMEM_MEMCG_LOCKED_ON ? "true (locked)" :
+			   state == DMEM_MEMCG_LOCKED_OFF ? "false (locked)" :
+			   "(invalid)");
+	}
+	rcu_read_unlock();
+	return 0;
+}
+
+static ssize_t dmem_cgroup_memcg_write(struct kernfs_open_file *of, char *buf,
+				       size_t nbytes, loff_t off)
+{
+	while (buf) {
+		struct dmem_cgroup_region *region;
+		char *options, *name;
+		bool flag;
+
+		options = buf;
+		buf = strchr(buf, '\n');
+		if (buf)
+			*buf++ = '\0';
+
+		options = strstrip(options);
+		if (!options[0])
+			continue;
+
+		name = strsep(&options, " \t");
+		if (!name[0])
+			continue;
+
+		if (!options || !options[0])
+			return -EINVAL;
+
+		if (kstrtobool(options, &flag))
+			return -EINVAL;
+
+		rcu_read_lock();
+		region = dmemcg_get_region_by_name(name);
+		rcu_read_unlock();
+		if (!region)
+			return -ENODEV;
+
+		atomic_cmpxchg(&region->memcg_status,
+			       flag ? DMEM_MEMCG_OFF : DMEM_MEMCG_ON,
+			       flag ? DMEM_MEMCG_ON : DMEM_MEMCG_OFF);
+		/* Continue if a region is already locked. */
+
+		kref_put(&region->ref, dmemcg_free_region);
+	}
+
+	return nbytes;
+}
+#endif
+
 static struct cftype files[] = {
 	{
 		.name = "capacity",
@@ -873,6 +1014,14 @@ static struct cftype files[] = {
 		.seq_show = dmem_cgroup_region_max_show,
 		.flags = CFTYPE_NOT_ON_ROOT,
 	},
+#ifdef CONFIG_MEMCG
+	{
+		.name = "memcg",
+		.write = dmem_cgroup_memcg_write,
+		.seq_show = dmem_cgroup_memcg_show,
+		.flags = CFTYPE_ONLY_ON_ROOT,
+	},
+#endif
 	{ } /* Zero entry terminates. */
 };
 
@@ -882,4 +1031,7 @@ struct cgroup_subsys dmem_cgrp_subsys = {
 	.css_offline	= dmemcs_offline,
 	.legacy_cftypes	= files,
 	.dfl_cftypes	= files,
+#ifdef CONFIG_MEMCG
+	.depends_on	= 1 << memory_cgrp_id,
+#endif
 };

-- 
2.52.0

