Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086573;
	b=3/uuitinmiJOzoM4VLnfJdPkCUnCsqq5XuR4F+ltSJBWgSChA0coCeGKMkTzH0vgzek/
	 YHbAV+6Fz2klyU2j/+7XWOqi+gyH2oeyWgl/3r6WVrzg00IX38zJ+PGCLUfbFtETS4QKU
	 G+6H7NRSkzCUy0d3zLv2JZ7XoFg41xGR8yWq4ZSL4lhfgAVFbiZVKemz5NcHEeZPFfEAO
	 K+MpvLSatGYtmQ+ylq/5vcCgIjlzQCGi9Ar1xCkAmsYw++or7lT+ycNlCB8Dmo8VIKYLS
	 sO6V4ZV8RsV0dHOorkxQoWyL2/P+i52ve8e13fiofV0Td7yaccVDegkCgYI018RxtRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=TeuNf51TxMDPa7xvpxS6POY5MbCscFG1kBCUI4jUNC8=;
	b=hA8ePgqvAJny8vqD2eoaWfHx9pE561PSAWXoC1sg+Cff12sDlwfEG2X9pUIBBW2L3VgA
	 cJqGVkd+MGXszxT2b8GaCt6sQCeQ9YDsSB0K3Kmeku/z9XLtngk2Ez093p0Xt01gdr/an
	 +P9S3JPsjc/qo+427+NWDnViTvQcGM4n2I3J9AzTWxmIjbNLwgBcawtoCZaqnJirKV9Hm
	 hUrM6u6ys2WSf6RR8884hfD7/yXxswwm1uJifq65ZXtjfvyCfMAukcxUhT2hwwPLqI9bl
	 8VVMOgGla/Vn9Mj4inwgV6nG1nedn554f2ADvdDhv8QKKlbBX4NV4dzXgYApn4J50xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=t4sIvf2W;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93971606A325
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 07:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93971606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=t4sIvf2W
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e8246b13cbso33775655ad.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 00:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086565; x=1793691365; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TeuNf51TxMDPa7xvpxS6POY5MbCscFG1kBCUI4jUNC8=;
        b=t4sIvf2W+qLD3CqixmNHF0jnDEYkWaLv3ueAF9jTKdiJ8+KHNWlRKPFIoTJ7z195sY
         rls9+daC9CvtMAIjT2Avi6img8Qy0ImQ222XCWXDZP7l9SwTQIYRrFQoAqb4HcNOT6d+
         4UDhL0yFtHTxYVz/Mn6Htvuo3fj1IELxkYP+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086565; x=1793691365;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeuNf51TxMDPa7xvpxS6POY5MbCscFG1kBCUI4jUNC8=;
        b=lU4bs5839v5B5H8EoY0czsf5swb5YPDbVbp7JP9YcA7hOslHOAms/OicbiozMd+9jH
         ds1WMgzGqlnvA/FxjvcMihfnXGmpQkhf1QM6Smpa+ITDLAgIFr4JAriAuNxHS7I8Gs5h
         0qxV2DHdiZ3BRrm2n6mSj1J2NYKlqkpy5AwVtuoC78aQSJaSGYPOvc2ME73fB0VyW1T4
         g626QPqXjMbH7UBrXau8TB1J743saA5qoH0iC9Z01UQLUDMCEwJzohcRNUdoxhUgFAs+
         Ic+Os9wyZEGcpD5mivYod9y2Y5bblUkqn/MaSNX6tW12CExQKbcnUFKksQ7HR+ptO09G
         1M5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzFYhDxNSiq9xz0RmIjM0bOSx4PiqLA5/lkLS5HAuf7AA04J8Lh1s/AFTrgRn/W6X25NEutHNhkGAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqdk/5RufFsPCwRQeJxdiM7L2DLoOWOEoUfNxbYNQTz6sQa8Bl
	lRtyzgsJngR8Wt+qQXNKnx5yQxviSv4koBNJSdtjKNeAf7wYMwbvOv7UwOv/owi7S8k=
X-Gm-Gg: AYBFou3YiOSI8SvE1lxmmje261jwD4iYZg6xmd1DFJjPz5foT3yDRCEf0lsRKsss0bE
	f8ZTN7f1qYJi9iXAhAq/rMz6QiZRPgPBsJLP+RKn6Vr9z+vlL0/TJ4ODNqkBHgEE2H/zi4galpo
	MJAe/YnCQJSd2ylGGfA+yPA0PqcSaQV5OSe+1vXOZ2Ac+FLZXl3WWb1wX3WBkTxJkJ/6tD2fXjx
	9h+HVawjmuoJkcetJyc+FkIjFfJLiqlzogfd8+slK7Ud9Bdr8BTzKPzXBat0hdiM8d38tihUpDm
	ujnU0dUZ6jM1YvmRcKY2q3ZWJsrN8w6tQd85mA3iquR2yjQYdbr2UqZ6Sh1Iwq7L0t4eaZ8P9sl
	XNFlLr5EX+HNIMV9Sixsd/O4NiHGccW9GjE26rKWTWOpFBnYlYJleWnIy0ZOuGQwcjs4Zgc0uxj
	b2tFMhyaij0EC9Upu5x5U7PZLDM5eD/Kvrg328pzfxt09fM9edJNWup7StzPkhXOOAGSwbxXHNO
	Y9+Blv+Q4/HzECXqxqvgxZuJjS0eqnG7rDsUxFZN8OFqs3nUFAwuUmY5XeMpzObK+87snrGAkhZ
	KoB5fB9KvPb0GnGm2KvvJq/eZCcyGSBymteWYoiJGyq0MXQ5EKqdaVbNL8+DiJulaE+NPuT0hdV
	M73OgWWVbPt2pwHO0Y6KtcOY=
X-Received: by 2002:a17:902:cccf:b0:2e3:598:75b8 with SMTP id d9443c01a7336-2ea9c67507bmr74148095ad.27.1793086564825;
        Tue, 27 Oct 2026 00:36:04 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ce5912sm5015185ad.71.2026.10.27.00.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:36:04 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:35:59 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 5/8] mm/slab: Support disabling SLAB_BUCKETS at boot
Message-ID: <11c73e97a9a8a2a532b3637c290657f99dd6a69f.1793086056.git.chris@chrisdown.name>
References: <cover.1793086056.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793086056.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Add a slab_buckets= early parameter, enabled by default on kernels built
with CONFIG_SLAB_BUCKETS=y.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  8 ++++++
 mm/Kconfig                                    |  4 +++
 mm/slab_common.c                              | 26 +++++++++++++++----
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5c4d784e7786..20710d6ccd1f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7001,6 +7001,14 @@ Kernel parameters
 			apic=verbose is specified.
 			Example: apic=debug show_lapic=all
 
+	slab_buckets= [MM,EARLY]
+			Format: <bool>
+			Enable or disable separate kmalloc buckets on kernels
+			built with CONFIG_SLAB_BUCKETS=y. When disabled,
+			allocations use regular kmalloc caches. Ignored
+			without that option.
+			Default: on.
+
 	slab_debug[=options[,slabs][;[options[,slabs]]...]]	[MM]
 			Enabling slab_debug allows one to determine the
 			culprit if slab objects become corrupted. Enabling
diff --git a/mm/Kconfig b/mm/Kconfig
index 56c422684b44..ebdf14a87c71 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -235,6 +235,10 @@ config SLAB_BUCKETS
 	  of extra pages since the bulk of user-controlled allocations
 	  are relatively long-lived.
 
+	  The separate buckets can be disabled at boot with the
+	  "slab_buckets=0" kernel parameter, in which case these
+	  allocations use the regular kmalloc caches.
+
 	  If unsure, say Y.
 
 config SLUB_STATS
diff --git a/mm/slab_common.c b/mm/slab_common.c
index e66c0778ee98..b7a46c368ab1 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -410,6 +410,16 @@ EXPORT_SYMBOL(__kmem_cache_create_args);
 
 static struct kmem_cache *kmem_buckets_cache __ro_after_init;
 
+static bool slab_buckets_enabled __ro_after_init = IS_ENABLED(CONFIG_SLAB_BUCKETS);
+
+#ifdef CONFIG_SLAB_BUCKETS
+static int __init setup_slab_buckets(char *str)
+{
+	return kstrtobool(str, &slab_buckets_enabled);
+}
+early_param("slab_buckets", setup_slab_buckets);
+#endif
+
 /**
  * kmem_buckets_create - Create a set of caches that handle dynamic sized
  *			 allocations via kmem_buckets_alloc()
@@ -424,10 +434,12 @@ static struct kmem_cache *kmem_buckets_cache __ro_after_init;
  *
  * Context: Cannot be called within an interrupt, but can be interrupted.
  *
- * Return: a pointer to the cache on success, NULL on failure. When
- * CONFIG_SLAB_BUCKETS is not enabled, ZERO_SIZE_PTR is returned, and
- * subsequent calls to kmem_buckets_alloc() will fall back to kmalloc().
- * (i.e. callers only need to check for NULL on failure.)
+ * Return: a pointer to the cache on success, NULL on failure or when the
+ * separate buckets were disabled with the "slab_buckets=0" boot parameter.
+ * When CONFIG_SLAB_BUCKETS is not enabled, ZERO_SIZE_PTR is returned. In all
+ * of these cases subsequent calls to kmem_buckets_alloc() with the returned
+ * value fall back to kmalloc(), so callers that can live without separate
+ * buckets do not need to check the return value.
  */
 kmem_buckets *kmem_buckets_create(const char *name, slab_flags_t flags,
 				  unsigned int useroffset,
@@ -448,6 +460,10 @@ kmem_buckets *kmem_buckets_create(const char *name, slab_flags_t flags,
 	if (!IS_ENABLED(CONFIG_SLAB_BUCKETS))
 		return ZERO_SIZE_PTR;
 
+	/* NULL makes kmalloc_slab() use the regular kmalloc caches. */
+	if (!slab_buckets_enabled)
+		return NULL;
+
 	if (WARN_ON(!kmem_buckets_cache))
 		return NULL;
 
@@ -1059,7 +1075,7 @@ void __init create_kmalloc_caches(void)
 	/* Kmalloc array is now usable */
 	slab_state = UP;
 
-	if (IS_ENABLED(CONFIG_SLAB_BUCKETS))
+	if (IS_ENABLED(CONFIG_SLAB_BUCKETS) && slab_buckets_enabled)
 		kmem_buckets_cache = kmem_cache_create("kmalloc_buckets",
 						       sizeof(kmem_buckets),
 						       0, SLAB_NO_MERGE, NULL);
-- 
2.54.0

