Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559909;
	b=OErxeR5yG9YI+dEyXwDPjntWovkv3h3+1o19q+AdJmkuOcheReFXcjTJEwW1GbNuCp04
	 Hsy+jHaZ+KFM+vruoQGXkaNxAzTFCY3LOF/NE5mykGc02GrgnWjKmSYPKxzKJ5u2dXfEO
	 Lm/z5fXbmU/mKjwlh9iwE4ZW9R6b+7hdYtWE1TdAc4Dlw5PdI+z25dtZW+KqoEcyBjNmo
	 4tvy4Wt2+057Lf+Y8JRS/zi1fe0SVn5JoG2XxMtm8a8uugbfKpeti9Fjm36mkIoK14NOm
	 P+wL5aNnLlfv2updXfd7H9aBl3CHX6qXSBKUS1H/LLWERibXsu/0GNhAe1/JXBhNvOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=lYzK3//iA/GrlqyqFKm7zb2MSKDdJnrLMa2XfcjD5wg=;
	b=qlMjNArekeAIGrNvN1xft6d7tltBhH5MYFAkt3WH1tXMn2YvkIov9ACI9iwDnh+AgJyw
	 +SQ76C2HPaJdGs/XOTfqZ8iP1TpBWAuC1ek+68HWbjTvJyOs2pgi0+HO404buBi1HYh9Z
	 UQ/ZUoQHSYVsJXCK9sELLEpbVzqp2BfNXcIUaMOrbhCzHqzEAFNx68LWZuEP1yWcMPi0v
	 qq3QCtvV75wv9tq06EpeFVsqxRFzS5kQxzPhz0TEXivFDOAHjA3mszrUpKSX0EsK9S1Lm
	 usGYh5WHwZi9gh2Haa2NZ00EcjIdliFxz47MMJeX9JR8Elv1lMb/svp7D8M5gWNR/Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qAxpPyJV;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF10C606C18A
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF10C606C18A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qAxpPyJV
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so185775a91.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559908; x=1795164708; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lYzK3//iA/GrlqyqFKm7zb2MSKDdJnrLMa2XfcjD5wg=;
        b=qAxpPyJVdu3Eo1gikOQIp3VEgu6evI6bjx90G+83OTZYzs/tWWWCzokW+VgZygsbPQ
         /KQVTxfv1tD2R/lcDTf6g1dTBF3SL3in/BCuo/OPJ94eh/Lko7ICKpGWDq1/QATgDBjA
         xyz1+ZZxef3f3a4jG7EbDh5j6bYOucCm696vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559908; x=1795164708;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lYzK3//iA/GrlqyqFKm7zb2MSKDdJnrLMa2XfcjD5wg=;
        b=gmmS2wD2lMPNv1xeBKHisaMPdUM244QbifhwYIOyMZU9kSG1+sHPSQGKex1TI5ZqEy
         rT210Q/DYJ96UFhR6wcglbDb2Sx3JrFGGg3y1Na20rhlDBfaXYS1gVovNDRCbSm7z4GZ
         crXivlwU2QemgeeSQglyHKR0l64Q+D/s95x9n2qHwp+RWxaXCIXOPENyOrU6fs9+ek7Q
         /0ESg6ouH3EtasZET57MWRWmgUDjC9sSZsogww3nIjZx37E65T6lrvWOikP5zxJ7q9Wu
         dZNZ6ZUaaeWq9eBmtVga2K2FQEi873l84RmKYUrwnwkVMs3PX/mBb99aSQxaAGIr/Q1+
         DJZg==
X-Forwarded-Encrypted: i=1; AL+hErH/8pxHUIaK2YF8bKEp0O/G8fQ2WF9fxCICW2+Pr0fUWB4tFsiwYeDFum/ao1vXSKYaHKzE+TC3nJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eBvYO42kurGUkjFXrJy4l6kArC6ugSod98I3zuxHbDPE3nJ+7
	ZVDvTa6qkGDbxII64jWIIuW+Tc7F9lxQIBoL0r0LniE7qzERGgUtDQ52W+7CZVHqp+I=
X-Gm-Gg: AYBFou0wow64NNIoEjMjsL3gTPRv9Z1v6Jth2w9lNxLUpV3V9my4/tRyj2ZQEKcn4gb
	bB2YzaLI+5gdW98LKOayjht9DEWDz2fkjsEc4Br2DNYKpwQPJho5TohNSspyEQkhm2O9waWvD+n
	UjPdWuzYkk6UqL9hKsty7lHxLDHMHQHVg55vlbnGOshlp5C6K+imld8hxtwzZlKzVGuW/ZvKXod
	2e677uTSwT1TO/I0Mf9PqjHV/BjDqyaVIOoj6pi07Gy/N+5PqKrEPCuYyMWodBTz9GnnUYNq4H1
	U3TJLJuVYWxq5Y0wa1Z8inXU9PIQdE2FM1lk44PaYNdOAxc8I9dQSfcicUb2uuFpV5G/8ta0NbP
	uHxXi33d+lWj9skwd0zM+tEh/CyMXTdAWdTxFydtcx14Lx4X6bPYRdaQmfhZcDh/0NKs2U433io
	RDQDbFKITtiIAyzPz8xRyVerbQBibwqJipdAbNLZm8JRbOE12oMIx/4mb6tLOlceTDJDeBoEhq3
	L/QtC1vrpQVSLc1A9xaa5BZlSNkufmctr1iCZu5EAt1MsVDRcKSEHHkUjwXt2/zvNFOxzGA3CRa
	trmMewLGeNjb8M/z2KYMxN6ZPR3W8b5QQ9Adjp6XXEBLItW4uYX7HWvBP4V8sy7lveg1f3DhRf0
	ktztHn8fdqP0KDhTk97ZsAGl/0CcEYd9wh/Nv2P3jU5C26nFqRcZl6ekUDd6Tw8qWxrRTTgGnOD
	IuAKJQvtYSQQBqOEuPLyNxVscrNDO7EfHU+dpklS4M+jdpbeRpdyJvP8rYIFW705EVXBagDa7TV
	LT1vC2/
X-Received: by 2002:a17:90b:584c:b0:3a4:b8dd:1447 with SMTP id 98e67ed59e1d1-3b1b0b5f9a7mr1634952a91.34.1794559907971;
        Fri, 13 Nov 2026 00:51:47 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35ac2sm8778891a91.17.2026.11.13.00.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:46 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:41 -0800
Message-ID: <9a4caff0336c78a7adc746786c81c9c01f89c40b.1794506262.git.chris@chrisdown.name>
In-Reply-To: <cover.1794506262.git.chris@chrisdown.name>
References: <cover.1794506262.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 5/6] mm/slab: Support disabling KMALLOC_PARTITION_CACHES at
 boot
To: Vlastimil Babka <vbabka@kernel.org>,
    Harry Yoo <harry@kernel.org>,
    Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>,
    Christoph Lameter <cl@gentwo.org>,
    David Rientjes <rientjes@google.com>,
    Roman Gushchin <roman.gushchin@linux.dev>,
    Kees Cook <kees@kernel.org>,
    Marco Elver <elver@google.com>,
    GONG Ruiqi <gongruiqi@huaweicloud.com>,
    Jonathan Corbet <corbet@lwn.net>,
    linux-mm@kvack.org,
    linux-hardening@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

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
 .../admin-guide/kernel-parameters.txt         |  7 ++++++
 mm/Kconfig                                    |  5 ++++
 mm/slab_common.c                              | 23 +++++++++++++++----
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c27bbe205051..91caeef33c3a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3045,6 +3045,13 @@ Kernel parameters
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
index e602ebabd6e4..5bb6e33fab49 100644
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
index 5575706b8938..20b066d61703 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -781,6 +781,17 @@ unsigned long random_kmalloc_seed __ro_after_init;
 EXPORT_SYMBOL(random_kmalloc_seed);
 #endif
 
+static bool kmalloc_partition_enabled __ro_after_init =
+	IS_ENABLED(CONFIG_KMALLOC_PARTITION_CACHES);
+
+static int __init setup_kmalloc_partition(char *str)
+{
+	if (!IS_ENABLED(CONFIG_KMALLOC_PARTITION_CACHES))
+		return 0;
+	return kstrtobool(str, &kmalloc_partition_enabled);
+}
+early_param("kmalloc_partition", setup_kmalloc_partition);
+
 /*
  * Conversion table for small slabs sizes / 8 to the index in the
  * kmalloc array. This is necessary for slabs < 192 since we have non power
@@ -1012,10 +1023,14 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
 		flags |= SLAB_CACHE_DMA;
 	}
 
-#ifdef CONFIG_KMALLOC_PARTITION_CACHES
-	if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END)
-		flags |= SLAB_NO_MERGE;
-#endif
+	if (kmalloc_partition_enabled) {
+		if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END)
+			flags |= SLAB_NO_MERGE;
+	} else if (type > KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END) {
+		/* Use the normal caches, which have already been created. */
+		kmalloc_caches[type][idx] = kmalloc_caches[KMALLOC_NORMAL][idx];
+		return;
+	}
 
 	/*
 	 * If memcg_kmem is enabled and this is a KMALLOC_NORMAL cache and not
-- 
2.56.1

