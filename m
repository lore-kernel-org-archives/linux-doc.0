Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B6F3D8116
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338683; cv=none; b=N9R3abmz+Knk+CnrMdyTCLSIYQNKQcQrl5ddkR8fel3o60x2YNQxHwoEZ1SFCRUAi69vKuEIK1PKPvscfZct2A69+S0u2YaECt6REL1RG3kJodiHGIMlHMw0+TKY2CjZoDLNE7rUoEACIvV8ZyrWf7d4ZMCB3Vvz6PIbHmsATLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338683; c=relaxed/simple;
	bh=FdhRs7+oHCYsp+CTVU4k6mJwmdQ1MxeWy7ohBCCfz6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o+OVHWNJ0uWA5y/kLleHfvn7lzguOu5HH/di/CnjhSTVDmeUaP4ZpfL8sr7yweWyoi1n50Erv1a9eldHd1CpLvvCOi4L7MNrhXGWoAkHSzVIGo35aAgVNG6QragNSh2Ui+57p9D4L09Y6tED0iV2NGldJO2ABeCYm67nWIUVPx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jWp5CBxv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ihnRhT3D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jWp5CBxv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ihnRhT3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWFFYMU2hrPabnXta24MU9itEej9rdB7ueY1dj1pl/A=;
	b=jWp5CBxvVCPNz/i0w6epdVbDeKMifnyGKg+0JyW6fkrqwmFy2XP8dFQVe9TSsVy7wBhtrC
	YDNm1pT+V3GwsiTX5iUH57hl9QD0C+WAYjXjNyQd6BcUVfVvp1kbpp4k/bptH46TDfKn3x
	8PsYEkYm9WsCRLDIFviTb9UHg0nmZbs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-APPa6cFoMCSvbojfySq-tw-1; Fri, 21 Aug 2026 14:57:58 -0400
X-MC-Unique: APPa6cFoMCSvbojfySq-tw-1
X-Mimecast-MFC-AGG-ID: APPa6cFoMCSvbojfySq-tw_1787338677
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d7b3b6aa2so16461111cf.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 11:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338677; x=1787943477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWFFYMU2hrPabnXta24MU9itEej9rdB7ueY1dj1pl/A=;
        b=ihnRhT3DHTWNQfc5SrjxbBuiV+nNESyf04RXYVYeMGCngWOJNBYCI8ffDhnjNco1I8
         ZYc+mrBZy8gMndobfIFJVxKYsWSIO1z5/zHb+xv/Mbd9vA8q/RF+DOPIFchoLMmNzS0i
         dXD8o+Jn3vT/mKMq3BLg7JH8bFhVWflLljWhFHrDkea5I9suHM9bnng5nQiOweZjSfNH
         3MSIzjAY0TGrPLwc5fziVA7U86V8HVq+juDIgzCpiuZ4sCNouaI/aocl8AGa03fOyQX5
         yV6b/bNj65zKW+D3hnbxLBC7PSSEMvaTJKHLkmOZwqjJV+s3tA5mYaRAKwJfmbMHU9jA
         LoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338677; x=1787943477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWFFYMU2hrPabnXta24MU9itEej9rdB7ueY1dj1pl/A=;
        b=iWU3hshDWMUs0zjV4tBL9TRt2vy6GsYuQfHLYcfv71V6wzMeo3HhY8nDMLHiN8FwBd
         OAl1747dtw/TL8FlSfXiBcKI4nvxvOUxESUmSnBL74UYvJWKyHgvxYgA/5y3Xp3/McRP
         JnV8Q0BhIvzP9qdnsQfezSXD/wvFMwKcYJwkh3If/a6cqvswRpx70ZdiAwuM1P/SLLO1
         AJsrOscXbosLG+B5lpWT8fdipog3D1KEMra3K3iqLrfXFUCW3mpTAHfQYHrXmOud98BY
         hyXX3UsnV3bg0h51sbMufgrqg7/8JgMQy21ixgI+kECpJ8CluOL0I8Es+i7Nn9dK3z9f
         geQA==
X-Forwarded-Encrypted: i=1; AHgh+RpmsfH9X55+lxTlT0lsqstIdWXXQvpiSrPHzMiZ5QocmC4FYLY99UaYackNHvf3sxUnkqJhDQSvBNg=@vger.kernel.org
X-Gm-Message-State: AFuF++ndRci9ZLOZHFqr44OKGZZAG/P0Rvb0rdxxVSPsPzYx/E6aiSzn
	Ivowx530NNb8QTUguwJvSWVeNdyFrUpVAbwXUZvze/okRfM81VETf7yfXc1xYbn9OaPppoJp5ga
	fPIODiPZC5ddR9PwhR72EiSV2fkmA51WawFN4WnzWkpqaJS7swc/mGth2Gjl1Lw==
X-Gm-Gg: AR+sD12jz1btl7khBfBWuzRR59PbsKH98Im0Yy/X9i7JzLjRsKZxnwkafJQW10U979H
	9iLeyY1Ad0BwGmoLncNwbGePro25pZwRO41o/XA6Ub+AXuTDmQht2J7B6GkugVxMdI2tLOoSt59
	AT1EsdMMFS7hmRrN/yYIlyKxXvJXcohuZt7YIJvXKYtsqCUuFC88cTtCUAfKtYqtE3lEqX9ZtNR
	60rXZpPFZl6aRh5I98FAHzCCHy1vgD4FqRcT4vxaMSsgyI6BtpyfP5H++oykk6jk62K0DE0+t9a
	6HMT4Z4T5IRaoL8dv5ckiHdHgFI03C/ShE1/eE+SFyzlzyn+KpY0R6mZ8CkncYIQyK57uUseiMp
	dDDuTSZ7qoUX6F4Hc/maBc/HsyTrFHS99CE7Suhw5Qpfx
X-Received: by 2002:a05:622a:2592:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52df59ebf4fmr86912171cf.26.1787338677389;
        Fri, 21 Aug 2026 11:57:57 -0700 (PDT)
X-Received: by 2002:a05:622a:2592:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52df59ebf4fmr86911721cf.26.1787338676950;
        Fri, 21 Aug 2026 11:57:56 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aae6f4sm985701cf.16.2026.08.21.11.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:57:55 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:56:55 -0400
Subject: [PATCH 03/11] cgroup: add memory_cma_accounting mount option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-3-d21b165b8440@redhat.com>
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

Add a cgroup v2 mount option that will be used later in this series to
enable CMA memory accounting under memcg.

The option is made opt-in as it will charge allocations to the cgroup's
overall memory usage, which changes existing expectations.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 20 ++++++++++++++++++++
 include/linux/cgroup-defs.h             |  5 +++++
 kernel/cgroup/cgroup.c                  | 15 ++++++++++++++-
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index aed195a71cbf..3dfc13f31a0c 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -246,6 +246,26 @@ cgroup v2 currently supports the following mount options.
           will not be tracked by the memory controller (even if cgroup
           v2 is remounted later on).
 
+  memory_cma_accounting
+        Count CMA memory usage towards the cgroup's overall memory usage for
+        the memory controller, and expose per-CMA-area usage counters. This
+        behavior is opt-in, so as to not cause regression on existing setups.
+
+        A few caveats to keep in mind:
+
+        * CMA areas are reserved at boot time, memory is only charged to a
+          cgroup when a CMA allocation is performed on its behalf.
+        * CMA pages allocated while this option is not enabled will not be
+          tracked by the memory controller, even if cgroup v2 is remounted
+          later on with this option. Charges happen at allocation.
+        * CMA allocations are charged both to the cgroup's memory counter
+          (limited by memory.max) and the per-area CMA counter (limited by
+          memory.cma.<area>.max). Hitting either limit can cause an allocation
+          to fail. If CMA usage pushes the cgroup over memory.high or
+          memory.max, the memory controller will attempt to reclaim other
+          memory only. CMA memory charged to the cgroup is not reclaimable.
+          Limits should be sized to accommodate the expected CMA pressure.
+
   pids_localevents
         The option restores v1-like behavior of pids.events:max, that is only
         local (inside cgroup proper) fork failures are counted. Without this
diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index de2cd6238c2a..15f3f7110c5b 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -129,6 +129,11 @@ enum {
 	 * Enable legacy local pids.events.
 	 */
 	CGRP_ROOT_PIDS_LOCAL_EVENTS = (1 << 20),
+
+	/*
+	 * Enable cma accounting for the memory controller.
+	 */
+	CGRP_ROOT_MEMORY_CMA_ACCOUNTING = (1 << 21),
 };
 
 /* cftype->flags */
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index b5b461d4418b..12184f85ad10 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -1985,6 +1985,7 @@ enum cgroup2_param {
 	Opt_memory_recursiveprot,
 	Opt_memory_hugetlb_accounting,
 	Opt_pids_localevents,
+	Opt_memory_cma_accounting,
 	nr__cgroup2_params
 };
 
@@ -1995,6 +1996,7 @@ static const struct fs_parameter_spec cgroup2_fs_parameters[] = {
 	fsparam_flag("memory_recursiveprot",	Opt_memory_recursiveprot),
 	fsparam_flag("memory_hugetlb_accounting", Opt_memory_hugetlb_accounting),
 	fsparam_flag("pids_localevents",	Opt_pids_localevents),
+	fsparam_flag("memory_cma_accounting",	Opt_memory_cma_accounting),
 	{}
 };
 
@@ -2027,6 +2029,9 @@ static int cgroup2_parse_param(struct fs_context *fc, struct fs_parameter *param
 	case Opt_pids_localevents:
 		ctx->flags |= CGRP_ROOT_PIDS_LOCAL_EVENTS;
 		return 0;
+	case Opt_memory_cma_accounting:
+		ctx->flags |= CGRP_ROOT_MEMORY_CMA_ACCOUNTING;
+		return 0;
 	}
 	return -EINVAL;
 }
@@ -2068,6 +2073,11 @@ static void apply_cgroup_root_flags(unsigned int root_flags)
 			cgrp_dfl_root.flags |= CGRP_ROOT_PIDS_LOCAL_EVENTS;
 		else
 			cgrp_dfl_root.flags &= ~CGRP_ROOT_PIDS_LOCAL_EVENTS;
+
+		if (root_flags & CGRP_ROOT_MEMORY_CMA_ACCOUNTING)
+			cgrp_dfl_root.flags |= CGRP_ROOT_MEMORY_CMA_ACCOUNTING;
+		else
+			cgrp_dfl_root.flags &= ~CGRP_ROOT_MEMORY_CMA_ACCOUNTING;
 	}
 }
 
@@ -2085,6 +2095,8 @@ static int cgroup_show_options(struct seq_file *seq, struct kernfs_root *kf_root
 		seq_puts(seq, ",memory_hugetlb_accounting");
 	if (cgrp_dfl_root.flags & CGRP_ROOT_PIDS_LOCAL_EVENTS)
 		seq_puts(seq, ",pids_localevents");
+	if (cgrp_dfl_root.flags & CGRP_ROOT_MEMORY_CMA_ACCOUNTING)
+		seq_puts(seq, ",memory_cma_accounting");
 	return 0;
 }
 
@@ -7520,7 +7532,8 @@ static ssize_t features_show(struct kobject *kobj, struct kobj_attribute *attr,
 			"memory_localevents\n"
 			"memory_recursiveprot\n"
 			"memory_hugetlb_accounting\n"
-			"pids_localevents\n");
+			"pids_localevents\n"
+			"memory_cma_accounting\n");
 }
 static struct kobj_attribute cgroup_features_attr = __ATTR_RO(features);
 

-- 
2.53.0

