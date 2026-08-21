Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B061C3E009D
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 18:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338705; cv=none; b=oiYE/ldWwAesFZT+b07LixHzSIDdF2NDQJPTu1sSwcybK7bgifp8RGRkf09tXyQ4q3vkq00bJCh1TmNMpstHYlmjE5I8Zv1y1r8KntqgZjyKAzCCEwHdn4xyRkHaPQZ3rXOJSRuvQWtkoil25prqvjfvfff5CmmquMsfKvL7rjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338705; c=relaxed/simple;
	bh=bE3pWVKKdTpuMaQ8HVFIYEoYxc3fMC8VaZaqYRmtIio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ku0YCKRK7h9QaYbv61dz9gD+EP3o81J6la2lw9Q/IQgjGjHJ1GcL5VGFbk3xl0fAv1LnIEzuiFrGc8r1fykrZ8b4C2vqoDPIHhez1Kx72nwr8jwx42Y+ouWMV43GcLC6Cosxx4mOQqOcfrpHE3492HoZTbEKhOO0VPMM+DmI/jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WpYdYx5F; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ADzPuKSH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WpYdYx5F";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ADzPuKSH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W7KnOp/dzi6YYMtNTCErSrAxbzUuBVlszjrt1QEKyR0=;
	b=WpYdYx5FwqPwr15Ewp5o6jCsSj9ktNXPEUQqyunqdhCpiQyNIczuShxFLCQPtR31s43LSE
	ZwvYnvU0rP09YK9XRWzx7oxR+mDk2TFYV2+6Auqt0pwGbzxS/HM95vXyvCgTuzOGE/oRWc
	RM+Jya18DVU370UgPMrS/AE+NYk1z9k=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-Ap64Ch8ROLaLarR1VMgdFA-1; Fri, 21 Aug 2026 14:58:06 -0400
X-MC-Unique: Ap64Ch8ROLaLarR1VMgdFA-1
X-Mimecast-MFC-AGG-ID: Ap64Ch8ROLaLarR1VMgdFA_1787338685
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e8004d60eso230522885a.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 11:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338685; x=1787943485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7KnOp/dzi6YYMtNTCErSrAxbzUuBVlszjrt1QEKyR0=;
        b=ADzPuKSHQH6pEXjFXHRaIBShK89x8kcJkNsdxqErDNLjymnJlwhaxZxXRuG/v0zsFZ
         m7Kr9QM2WmVdubt2ebx1S1gOfXAdyh6Rc+8R60MkKEh+TzBaTMvaXjBVoh9yp2rUAWaT
         3KYJMIBW+4+MCmEG70mWJxlXYo6pz5cuMcOnzbYtJaqBDD+sGhHiFZl03Tz2F1uyOG6v
         fdbgMyVFEUoSe+5DemlDeZh3l08Z3BlIX4hwAZ17F9FHoFrBr5pSL18YDYs5SvHD8aXN
         EyyiXfYsos2PzdbIVcPee/X4adSgDlKNQvUDxdwpSr1zGR5M5Abtph96+FUI4vp8h4f2
         9eFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338685; x=1787943485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W7KnOp/dzi6YYMtNTCErSrAxbzUuBVlszjrt1QEKyR0=;
        b=XKZzv9fPl1QrKx2z0OkIooiMbw5eXFa8YqmXLEakqHqSl/OY3bkhvvdPYKfEdkt474
         eNaQHhtQMPj0Vi4vCP2y1ZQqASW8j2yfHQZ4RZbOAhnFtQW3ZhWpSgVxwIN/qHu/rbc6
         s+LTDoZ+G039QR9hFsKHdGymhuCH59nCKCfKR1nOJQxYjRreDHmcvcgU3iAsNrRcjJ7o
         aeSSyFjVSy+ZCmWz6XcskuoChldVfL7ZTWG7iU0vPw6MmniW6ZSlor16CUtR7eEV0wlj
         Rsg9qw7TEEADXUzgsEs8pB9YthBqzH9DVyPHXJ5ZUEeM+j/Gc2xaBau1QqXwbDtQevoK
         lO5g==
X-Forwarded-Encrypted: i=1; AHgh+RrKHAUmmyhnuWQvofTJABi1QrQqj4nJq4Ihl8qh1XATxiUM5d4HsKHptrmZzKVquB9/EhYZs9bXoPk=@vger.kernel.org
X-Gm-Message-State: AFuF++kyX3WDm2hRgK6VFUU/xKn+pYQdpND/QqcipWjMRRJwqpGlmSm8
	uGIfTgDhb/VbV77kp2FWnXqkanFnlAM7yV6Y5WGkN2BxRU2Wm3NUUR1WMjy3QCgFvBK8LBKKtJa
	I8BmZ+OI6ZxLZtcCoUNcmB7pborxW6yLuFyGQYNwqMmLSBZ9q6Wphzh6AMB+Cxg==
X-Gm-Gg: AR+sD13ed3PoUHAjqYVXARzRZGognuziQi/vK9l9uKHnxR4jU7gBXuvVx+ZTte6S+tC
	2EVIPE7n6X0SO3oJbIG9KlW/eY2HFn3J3bAqHHGydFP0TDn/7KCuGFVGcOs+FLopAkxXTEh+SoP
	IwFgWz34jO+OPDM4Mr3Q0RPfBF4LyGjYmWhZ1KXCR8bVTRXp/4QatAta0RwfAreUOjTT+Bj6F3k
	cvpsCk8M6aGkHJOzxHxzFpNDdXpvWTLJETl2Qy2qyjvO5KysQsnqCp3IpoBtT1Wwlvg9jkKM58I
	puZd10c1h0eRQKWtnnMmWMwHGVkaRM447kxUZk5gg/d1oOL7+8k1f9TNxXmjGsCmGEcUxRg4cN0
	oIoaR+wdbi6sobnNwdETYgS/UjyYZ6nKUl8xoPG4tWcDa
X-Received: by 2002:a05:620a:601b:b0:930:a26a:fb2a with SMTP id af79cd13be357-937394324demr865128885a.2.1787338684941;
        Fri, 21 Aug 2026 11:58:04 -0700 (PDT)
X-Received: by 2002:a05:620a:601b:b0:930:a26a:fb2a with SMTP id af79cd13be357-937394324demr865124585a.2.1787338684435;
        Fri, 21 Aug 2026 11:58:04 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9372fdf59f3sm385976385a.10.2026.08.21.11.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:58:03 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:56:58 -0400
Subject: [PATCH 06/11] memcg: register per-area usage counters in cgroupfs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-6-d21b165b8440@redhat.com>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
In-Reply-To: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.3

Expose memory.cma.<area>.{current,max} files under each non-root cgroup
when cgroupfs memory_cma_accounting option is enabled.

memory.cma.<area>.current reports the cgroup's CMA usage for that area.
memory.cma.<area>.max is a read-write limit (default: max).

Each CMA area gets a cftype template with its name set from the CMA
area's name.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 15 ++++++
 mm/memcontrol.c                         | 89 +++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 3dfc13f31a0c..39871a7a08a8 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1928,6 +1928,21 @@ The following nested keys are defined.
 	This setting has no effect if zswap is disabled, and swapping
 	is allowed unless memory.swap.max is set to 0.
 
+  memory.cma.<area>.current
+        A read-only single value file which exists on non-root cgroups. <area>
+        is the CMA area name (e.g. "reserved" for the default DMA CMA area).
+
+        The total amount of CMA memory currently charged to the cgroup for the
+        given CMA area. Only accounted when memory_cma_accounting is enabled.
+
+  memory.cma.<area>.max
+        A read-write single value file which exists on non-root cgroups. The
+        default is "max".
+
+        CMA usage hard limit for the given area. If a cgroup's CMA usage for
+        this area exceeds this limit, the allocation will fail. Only enforced
+        when memory_cma_accounting is enabled.
+
   memory.pressure
 	A read-only nested-keyed file.
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 8eca00d30fc5..f28d610a59ce 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6182,3 +6182,92 @@ void mem_cgroup_show_protected_memory(struct mem_cgroup *memcg)
 		K(atomic_long_read(&memcg->memory.children_min_usage)),
 		K(atomic_long_read(&memcg->memory.children_low_usage)));
 }
+
+#ifdef CONFIG_CMA
+static int memory_cma_current_show(struct seq_file *m, void *v)
+{
+	struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
+	int idx = seq_cft(m)->private;
+	unsigned long cur = page_counter_read(&memcg->cma_counters[idx]);
+
+	seq_printf(m, "%lu\n", cur * PAGE_SIZE);
+
+	return 0;
+}
+
+static int memory_cma_max_show(struct seq_file *m, void *v)
+{
+	struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
+	int idx = seq_cft(m)->private;
+	unsigned long max = READ_ONCE(memcg->cma_counters[idx].max);
+
+	return seq_puts_memcg_tunable(m, max);
+}
+
+static ssize_t memory_cma_max_write(struct kernfs_open_file *of, char *buf,
+				    size_t nbytes, loff_t off)
+{
+	struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
+	int idx = of_cft(of)->private;
+	unsigned long max;
+	int rc;
+
+	buf = strstrip(buf);
+	rc = page_counter_memparse(buf, "max", &max);
+	if (rc)
+		return rc;
+
+	xchg(&memcg->cma_counters[idx].max, max);
+
+	return nbytes;
+}
+
+static struct cftype cma_dfl_tmpl[] = {
+	{
+		.name = "current",
+		.seq_show = memory_cma_current_show,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{
+		.name = "max",
+		.seq_show = memory_cma_max_show,
+		.write = memory_cma_max_write,
+		.flags = CFTYPE_NOT_ON_ROOT,
+	},
+	{ }
+};
+#define CMA_DFL_TMPL_SIZE	(ARRAY_SIZE(cma_dfl_tmpl) - 1)
+
+static struct cftype *cma_dfl_files;
+
+static int __init mem_cgroup_cma_init(void)
+{
+	struct cftype *cft;
+	unsigned int i, j;
+	int count;
+
+	if (mem_cgroup_disabled() || !cma_area_count)
+		return 0;
+
+	count = cma_area_count * CMA_DFL_TMPL_SIZE;
+	cma_dfl_files = kcalloc(count + 1, sizeof(*cma_dfl_tmpl), GFP_KERNEL);
+	if (!cma_dfl_files)
+		return -ENOMEM;
+
+	for (i = 0; i < cma_area_count; ++i)
+		for (j = 0; j < CMA_DFL_TMPL_SIZE; ++j) {
+			cft = &cma_dfl_files[i * CMA_DFL_TMPL_SIZE + j];
+			*cft = cma_dfl_tmpl[j];
+			snprintf(cft->name, MAX_CFTYPE_NAME, "cma.%s.%s",
+				 cma_get_name(&cma_areas[i]),
+				 cma_dfl_tmpl[j].name);
+			cft->private = i; /* cma area index for counters in callbacks. */
+			lockdep_register_key(&cft->lockdep_key);
+		}
+
+	WARN_ON(cgroup_add_dfl_cftypes(&memory_cgrp_subsys, cma_dfl_files));
+
+	return 0;
+}
+subsys_initcall(mem_cgroup_cma_init);
+#endif /* CONFIG_CMA */

-- 
2.53.0

