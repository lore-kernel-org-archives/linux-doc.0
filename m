Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254156;
	b=5KQNKvIhFJLqJtBKfjl+5TZpDiedN9wq1Q0okDEYZLW1TMarEUrhG82uELEKd8ImslXt
	 UeUn4LTfGTVHBkMd8jearS9bIkRwatoae4BKoe504X3PTco6m2a3+a2jWRgpZ9APGzd+3
	 L2V1s6v48okutrE81aohsj5FxytwUFOHhBSZUAOl1DYHMebOof+s/xOJWRt/xQJH2ygFb
	 wXh36rGvCEuFXYM9dp3us4wAI5KX8cg4yfq5g+vf2CP3izBUdV2oCt+Vi4G02SMF9imuI
	 5i0eozxP2o0dX3Y4YryFALoEFSFVINxZkyV5q7K9tgXtnww5TGQFbM5DjfqBP9baoYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=TnENC99p6Lehtk+q2wiObbhSP6H/cGEPWJzdL6TBkdc=;
	b=AFlhpS2nyr0pMXgO1Z+GWG3afjGJlYA9mDSdfBY7W87Xeb9tyrPF3/isjGRRQ7Db9WF8
	 YvZGQCF8Ce9UHMUjuYYXJiGreSVAshGQbceZAlDY78mWvkKiocg5hU4wNjZMdmj+N9TDS
	 zorZS6yQFcCbYcdrrFlZS3sxFisQF1lx6iGEouGafWvpDlpo/ObxrEzPrUICfe4CZznA8
	 BLCdWJTqZ/sBh27NzAFlaBT5ZiHYO+ilTM7HbvtX8iglGCaEFuKmRueAiPNbxTfY/Sio4
	 Y0AoBl1cnAu8KDUEGrALp09ZXqVQzNU0HhIO5TEoZGVPZ3h5wRT2209GOx2wEvcHnkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=G2oXuuMZ;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3B2606A322
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F3B2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=G2oXuuMZ
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e985106c0cso15296565ad.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 23:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793254155; x=1793858955; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TnENC99p6Lehtk+q2wiObbhSP6H/cGEPWJzdL6TBkdc=;
        b=G2oXuuMZx27T7MTdteDxVRZzx91gBkxgG+OWKgozn9T+tELcU3T4zLqvl4C1Pv4YUo
         Q+L0vWHYoy6UEsBnfZNS30p440w5hc97l5DWbBQ/puezPRvYABOkSes28YH4SxkOAt6m
         VKZU4n3Rn+QkCH2ncZS2bwX4FWyeChexJBRLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254155; x=1793858955;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnENC99p6Lehtk+q2wiObbhSP6H/cGEPWJzdL6TBkdc=;
        b=EyRWn47xqz96K8cwFE7zLqM45tp09eD6XJma9Dr8aPYIpzembIg9LoI1/Yake11lj4
         hJSXoweGK/EWxID9Qr9xPPeb8/9/pgXcFqClSom2K83+Tgu3kuuMKE342su02GfZR3hY
         QWRjVCykqB7Skjg4Sb4+QCPRIZs2eOYst6wMqblkdUB6HUFU83WAINfpYx22xVzKYA1C
         Ag0vfqVLeEftH5rvvJwzz4qHWlPt962wwKdcoWXIR+chX40KJpEZy+iI3krfFMCxn6aF
         pIADMqiN+OA2glWwMxR1xrhw5OjK+e4t/COckkMTISb2aDi5/nVzWJY2koqJqPbT9Zj9
         u2PQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6dpN40kaRv13l+MPC/rlce/N/H6/HiWq7BIrK02ECa9s6Lyj8WouXJkIyME0V4abknJ1TMexRiWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxyd3b5sK4ayQZbf/3ZIGeRw7rVlSAekcx2eE/iTalr2x1MwPv
	e0vgyTjja25BKOmfqTtbsO+DWmuLS6dRVsMiTHEPlk/SLKmZ0QamD+ifwfyLt0/t6uQ=
X-Gm-Gg: AYBFou1JBcwwHkGpIN3x7sRE/IZXkSTVTLRr4RGJO4O9u7+rWppwqXvmdA3AVMXt/UM
	LTpCC8rvqnIbm2r6wUAdDE8ZOMijZ0PZu0RHXuhFTdiMZTPviwo8M/4ZqQ6L8dUOkujjNBSoNkA
	DDU5S0IY+MErWJUBxRitq11Pi1VAEaUzBcBc7sfOu7l5tt86k9lqf0uGLS5aCftEuW6KdK+w6y1
	m9XjegnWYR/JlUHWNlWcrISXjilE9In7oAkGgGjwR/fiP4DKFKig2ltDVwpOy+dGROj2xIoegwA
	Km+FmcmFeJLriW92Ake0v+5TAhfdZKCB0v4cutaCQZPUTuawUcG3R5ccnr/q6QYohnig+ZMlrKT
	Dndd3q42pgQOFDjyL4FZ5eyde/VUT7XQUkVzNYTLy61e7dHGwGIXtUbuizr0WLWhUDwAbB5XvwM
	F6a+Twh53PWG6DtKefY8hRe6hdYVyqTn13/5ZwmkzxvQynVBfyn51+5dPMaRWMMy3BXybfaSDg6
	EC+/JPPuNqhnVd7HakaEbdwoWoiw8Ruf2Goh1Gptffe/qHtj2J4oOvS/g49+5zbC9B54/4IL+Zy
	77dhq0ihCSosB4/aUfXKJL38RXXY0+48BeEdDwG1A1HT17WVktGVPUGQ52bTEkDy8X9AHrg3R8I
	SJkdKQPLfKb7274nHekvOZuu2sxkvhgNW9++QrtgXqxVU9buZGXIj9fKr2HBi4oi/dezNhBeH
X-Received: by 2002:a17:90b:590d:b0:3ab:2d46:1dd6 with SMTP id 98e67ed59e1d1-3ae57e401aemr3777671a91.4.1793254155497;
        Wed, 28 Oct 2026 23:09:15 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7fe923sm2789462a91.8.2026.10.28.23.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:09:14 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:09:09 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 5/6] mm/slab: Support disabling KMALLOC_PARTITION_CACHES
 at boot
Message-ID: <617bbfdce4fb2689c2510f0cd7f9adbb3ab8edfa.1793253633.git.chris@chrisdown.name>
References: <cover.1793253633.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793253633.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

KMALLOC_PARTITION_CACHES creates several copies of each normal kmalloc
cache and spreads allocations across them. That costs a fair bit of
memory: Harry measured about 18 MiB more slab memory after boot on a 64
CPU, 64 GiB VM, mostly from under-used slabs [1]. Like SLAB_BUCKETS, it
can only be chosen at build time.

Add a kmalloc_partition= early parameter, enabled by default on kernels
built with CONFIG_KMALLOC_PARTITION_CACHES=y. When it's off, the copies
alias the normal caches rather than being created.

Let's leave kmalloc_type() unchanged since each index simply resolves to
the same cache when partitioning is off.

Link: https://lore.kernel.org/r/179312451613.474906.1475329637924619088@kernel.org [1]
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  7 +++++++
 mm/Kconfig                                    |  5 +++++
 mm/slab_common.c                              | 19 ++++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index de2fd6963a16..6633a553a79c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3054,6 +3054,13 @@ Kernel parameters
 			Configure the RouterBoard 532 series on-chip
 			Ethernet adapter MAC address.
 
+	kmalloc_partition= [MM,EARLY]
+			Format: <bool>
+			Enable or disable kmalloc cache partitioning on
+			kernels built with CONFIG_KMALLOC_PARTITION_CACHES=y.
+			Ignored without that option.
+			Default: on.
+
 	kmemleak=	[KNL,EARLY] Boot-time kmemleak enable/disable
 			Valid arguments: on, off
 			Default: on
diff --git a/mm/Kconfig b/mm/Kconfig
index 48078c1fd26f..b90b3915fcd5 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -266,6 +266,11 @@ config KMALLOC_PARTITION_CACHES
 	  limited degree of memory and CPU overhead that relates to hardware
 	  and system workload.
 
+	  The partitioning can be disabled at boot with the
+	  "kmalloc_partition=0" kernel parameter, in which case the copies
+	  are not created and all normal kmalloc allocations use the
+	  regular kmalloc caches.
+
 choice
 	prompt "Partitioned slab cache mode"
 	depends on KMALLOC_PARTITION_CACHES
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 9fe48da12010..5391149a2eed 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -781,6 +781,16 @@ unsigned long random_kmalloc_seed __ro_after_init;
 EXPORT_SYMBOL(random_kmalloc_seed);
 #endif
 
+#ifdef CONFIG_KMALLOC_PARTITION_CACHES
+static bool kmalloc_partition_enabled __ro_after_init = true;
+
+static int __init setup_kmalloc_partition(char *str)
+{
+	return kstrtobool(str, &kmalloc_partition_enabled);
+}
+early_param("kmalloc_partition", setup_kmalloc_partition);
+#endif
+
 /*
  * Conversion table for small slabs sizes / 8 to the index in the
  * kmalloc array. This is necessary for slabs < 192 since we have non power
@@ -1013,8 +1023,15 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
 	}
 
 #ifdef CONFIG_KMALLOC_PARTITION_CACHES
-	if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END)
+	if (!kmalloc_partition_enabled) {
+		/* Use the normal caches, which have already been created. */
+		if (type > KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END) {
+			kmalloc_caches[type][idx] = kmalloc_caches[KMALLOC_NORMAL][idx];
+			return;
+		}
+	} else if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END) {
 		flags |= SLAB_NO_MERGE;
+	}
 #endif
 
 	/*
-- 
2.54.0

