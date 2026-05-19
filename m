Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E80C2DCBF8
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206508; cv=none; b=YbKMUFR5SG9009K4QqQnhU2f5/JH/gCuvbgIjmJqGL9Myq0lgjKw0aBBdSio9BBE8EyIcWzkocFI1tR+t57+Qr+9R+H8bpSiqKR0KxAT+l6F3m6OGfU3H8bJuIwFSbExP2B3UnlYwkOW5c/5LY/tokTmcHYroGVYcmN9WRuH3So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206508; c=relaxed/simple;
	bh=m6bdn04H37lQht89QtTbnUX523/2qZixGamCNPKOT80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSuM8UTiox9OOcuEGZtZY6VF7TIbCDpho52xoAwECgPdMca9iCchM1fuQjP5cMAwf2yndOo9T4ufb+zSebjEogQmFYTQEbWGAPt/IisKRQy1djmEtxWiebLGelyYj+8FLYKhv11XDxudsilTCkunL6V0p7zw/jYyUXJvV2P9dyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OxTnzH/P; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YYZuMyhT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OxTnzH/P";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YYZuMyhT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779206506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cipZ17JT05Ge5l1VfUm/NtrMByICdVG7S5/ux07qG+4=;
	b=OxTnzH/PRjzrqpADJ+QbUp40J3k8PoxBSucl4RZ1bRsg6zeoNXSnqTgmO1f5TH+t4IeAXz
	JXWs1m8krQQ6bLVP/qzOR52Gpn28v9mofT64jg5ygz5xFDSln7Pc4zO0a30mowkBSWrGUc
	jJGJmRSBN0CUEZ7i2d60hTVWInuvT+I=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-pUp3KWpbPeqRVJBb10H43g-1; Tue, 19 May 2026 12:01:45 -0400
X-MC-Unique: pUp3KWpbPeqRVJBb10H43g-1
X-Mimecast-MFC-AGG-ID: pUp3KWpbPeqRVJBb10H43g_1779206505
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90fbc9782c9so753952285a.0
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 09:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779206505; x=1779811305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cipZ17JT05Ge5l1VfUm/NtrMByICdVG7S5/ux07qG+4=;
        b=YYZuMyhTnrPP6HvVETcwGABjbms+3HdGmX1PFtSF8vhQBq80ySytVZz6Wz8q4Ok06A
         9nnjQ54h7U6JjRGK8KJn/bzKA3riG8afcbFYnsQHovXxUflTssd4mcCRHO9aOVtEErEL
         muTdX4U2ew9neAB7dctdWjAUVYAklJjQzuurU6akSMmCe2ye2Rk3p4SLJbmAo6KKTcD7
         bgG/cUyOdtJKMJbalTj30QaQNxTMfrMfyGH3ddnXru3A52q02KND4uG09oVw2glK7LU+
         2ZItyAVigNMkib2ODCtfn5i1a2IzxINNu05j3G6AZ004GJpyfGQPpnDqXxHJl9Or+BlT
         3fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206505; x=1779811305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cipZ17JT05Ge5l1VfUm/NtrMByICdVG7S5/ux07qG+4=;
        b=BzITt8PCeAWACMMAKJ6rmkw5W4CRjS2dw8+jslzb1IoqeAoiN422ZPVA55aDCKA5Ul
         9ZIcOwIc/CQcEpVTudDDjzHkS0zjokcLCBhSmRmBZq+uAYVLL7vIZt+4fszxoHSzmkZV
         uwQxJBrMtrf/hm0yogzXSq9mpImyuOfDTpBLL7ocd61R+3A6cEEAt74RfrYN95+R9aZK
         t1s36MGv0ncJfldMkX8JUl7tL5g6codUbjq+dxr8qKBl3ZB4fKvvRrQvLBViGfSq7bbq
         NY26gKQENytyulYngHXZWGf2kq/CBkRuEKBntmy5IfvxiRU+a5cF7Nyc11fi57Y9eVZ+
         S14A==
X-Forwarded-Encrypted: i=1; AFNElJ9vvSW0jEZ6IVNlXcbeWqpfKSdYfQakGee6c62tG7+yVzlW4oY2qcTm5wkZrEgqSw1tHGo6piiDsI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEugGLzUceVe2AmQt4kh0nGUD0PkBg+yvDF3OhtapyrwwvqfHS
	2CkO0uz9bpYOlmHIg7ySay9BO4OGodzt0lC+VvjpIKlUtWP0S+ZbzXDepKDWe1hJt9QY+fnyL+m
	YIG4E1XcsqAmahDxAyrdG3nJx7uCkux7y8WAUwRq1I88LPHREF0x+SI07xMpT2w==
X-Gm-Gg: Acq92OHLw0A2k/K5fCh5DGlCpjfLcRkNWoBTtrMSS5xqu+QmEJ3rhzWYhU/7X50X9f7
	OGiAYilB+8XGopU6SX3yODtkLpt1VsyhejEesMlhSJ0rxaDn4mOunw5HRoNDuhXL2rRP4Zm1fnR
	wrO8jaLAvTFozR9hXjuFpHq8JCiclwDZ4aYR4TkkQqSXEvnlpJM6/nzqLYiwZs/DyyNLVCIXjfm
	OVtuOXJPaktV/JOeh4SnMoNNZOBvJc2pJEGmJB6NU5YIGOMEsV60xLgUWbBeluDQUNn2uqnMXO4
	jIIsI+sjjXg86aJfYsgy3dOB4afyUzZv7GqwSK4G3CNdCHIB+E3i2XwTeTiLHS5CVpwoyS853mG
	dsgs5rDU+xqZZ30bNVYE1BhnD2zRYQDQqM5fcF9qqmiK8/jpH3d50UM2zJ85c6HBfKQ==
X-Received: by 2002:a05:620a:7116:b0:90a:708c:e6d9 with SMTP id af79cd13be357-911d10425e9mr3114786085a.56.1779206463353;
        Tue, 19 May 2026 09:01:03 -0700 (PDT)
X-Received: by 2002:a05:620a:7116:b0:90a:708c:e6d9 with SMTP id af79cd13be357-911d10425e9mr3114014285a.56.1779206432003;
        Tue, 19 May 2026 09:00:32 -0700 (PDT)
Received: from localhost (pool-100-17-21-205.bstnma.fios.verizon.net. [100.17.21.205])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bd62e233sm1876151185a.45.2026.05.19.09.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:00:31 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Tue, 19 May 2026 11:59:01 -0400
Subject: [PATCH v2 1/2] mm/memcontrol: add dmem charge/uncharge functions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-cgroup-dmem-memcg-double-charge-v2-1-db4d1407062b@redhat.com>
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

Add mem_cgroup_dmem_charge() and mem_cgroup_dmem_uncharge() to allow
dmem pool allocations to optionally be double-charged against the memory
controller. Take the struct cgroup from the dmem pool's css as there is
no convenient object exported to represent these allocations. These will
resolve the effective memory css from that cgroup and perform the
charge.

Introduce a MEMCG_DMEM stat counter to memory.stat to make the cgroup's
dmem charge visible.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 include/linux/memcontrol.h | 16 ++++++++++++
 mm/memcontrol.c            | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index dc3fa687759b45748b2acee6d7f43da325eb50c1..8e1d49b87fb64e6114f3eb920293e14920290fe7 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -39,6 +39,7 @@ enum memcg_stat_item {
 	MEMCG_ZSWAP_B,
 	MEMCG_ZSWAPPED,
 	MEMCG_ZSWAP_INCOMP,
+	MEMCG_DMEM,
 	MEMCG_NR_STAT,
 };
 
@@ -1872,6 +1873,21 @@ static inline bool mem_cgroup_zswap_writeback_enabled(struct mem_cgroup *memcg)
 }
 #endif
 
+#if defined(CONFIG_MEMCG) && defined(CONFIG_CGROUP_DMEM)
+bool mem_cgroup_dmem_charge(struct cgroup *cgrp, unsigned int nr_pages,
+			    gfp_t gfp_mask);
+void mem_cgroup_dmem_uncharge(struct cgroup *cgrp, unsigned int nr_pages);
+#else
+static inline bool mem_cgroup_dmem_charge(struct cgroup *cgrp,
+					  unsigned int nr_pages, gfp_t gfp_mask)
+{
+	return true;
+}
+static inline void mem_cgroup_dmem_uncharge(struct cgroup *cgrp,
+					    unsigned int nr_pages)
+{
+}
+#endif
 
 /* Cgroup v1-related declarations */
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index c03d4787d466803db49cdaa90e6d6ba426b7afe2..91a7ac16b6eac2d6c3700b6885a068bf8b640706 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -433,6 +433,7 @@ static const unsigned int memcg_stat_items[] = {
 	MEMCG_ZSWAP_B,
 	MEMCG_ZSWAPPED,
 	MEMCG_ZSWAP_INCOMP,
+	MEMCG_DMEM,
 };
 
 #define NR_MEMCG_NODE_STAT_ITEMS ARRAY_SIZE(memcg_node_stat_items)
@@ -1606,6 +1607,9 @@ static const struct memory_stat memory_stats[] = {
 #ifdef CONFIG_NUMA_BALANCING
 	{ "pgpromote_success",		PGPROMOTE_SUCCESS	},
 #endif
+#ifdef CONFIG_CGROUP_DMEM
+	{ "dmem",			MEMCG_DMEM		},
+#endif
 };
 
 /* The actual unit of the state item, not the same as the output unit */
@@ -5909,6 +5913,67 @@ static struct cftype zswap_files[] = {
 };
 #endif /* CONFIG_ZSWAP */
 
+#ifdef CONFIG_CGROUP_DMEM
+/**
+ * mem_cgroup_dmem_charge - charge memcg for a dmem pool allocation
+ * @cgrp: cgroup of the dmem pool
+ * @nr_pages: number of pages to charge
+ * @gfp_mask: reclaim mode
+ *
+ * Charges @nr_pages to @memcg. Returns %true if the charge fit within
+ * @memcg's configured limit, %false if it doesn't.
+ */
+bool mem_cgroup_dmem_charge(struct cgroup *cgrp, unsigned int nr_pages,
+			    gfp_t gfp_mask)
+{
+	struct cgroup_subsys_state *mem_css;
+	struct mem_cgroup *memcg;
+
+	/* CGROUP_DMEM and MEMCG guarantees this cannot be NULL. */
+	mem_css = cgroup_get_e_css(cgrp, &memory_cgrp_subsys);
+
+	/* Use the memcg, if any, of the dmem cgroup. */
+	memcg = mem_cgroup_from_css(mem_css);
+	if (!memcg || mem_cgroup_is_root(memcg)) {
+		css_put(mem_css);
+		return false;
+	}
+
+	if (try_charge_memcg(memcg, gfp_mask, nr_pages)) {
+		css_put(mem_css);
+		return false;
+	}
+
+	mod_memcg_state(memcg, MEMCG_DMEM, nr_pages);
+	css_put(mem_css);
+	return true;
+}
+
+/**
+ * mem_cgroup_dmem_uncharge - uncharge memcg from a dmem pool allocation
+ * @cgrp: cgroup of the dmem pool
+ * @nr_pages: number of pages to uncharge
+ */
+void mem_cgroup_dmem_uncharge(struct cgroup *cgrp, unsigned int nr_pages)
+{
+	struct cgroup_subsys_state *mem_css;
+	struct mem_cgroup *memcg;
+
+	/* CGROUP_DMEM and MEMCG guarantees this cannot be NULL. */
+	mem_css = cgroup_get_e_css(cgrp, &memory_cgrp_subsys);
+
+	memcg = mem_cgroup_from_css(mem_css);
+	if (!memcg || mem_cgroup_is_root(memcg)) {
+		css_put(mem_css);
+		return;
+	}
+
+	mod_memcg_state(memcg, MEMCG_DMEM, -nr_pages);
+	refill_stock(memcg, nr_pages);
+	css_put(mem_css);
+}
+#endif /* CONFIG_CGROUP_DMEM */
+
 static int __init mem_cgroup_swap_init(void)
 {
 	if (mem_cgroup_disabled())

-- 
2.52.0

