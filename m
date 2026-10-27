Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086576;
	b=vE2yUGEKFOJpF1b1bzgrOzY87F8zH6j57Hn0a1Q+1dHBppS/UadtxPwklnTw7xgpP9r9
	 d/H6W4A9b9SUFMwiuR9WT64fPTvbyf6yDfeAxtyOJcwp1+euizp8dpKztFLlBYqK3YzKH
	 ts1NDd7nHj/nBin3NRlVQOjlK2RJiuKWm1euRST7YoLIxd7Fr1Lf3ZtopIOx632YCjLXa
	 UsV7OMBAzeIWZixPD/jS34tEbAjR8T7Xe/uEVxRfG+tvUPEp4rb7xV1jv70T1FQ8K1eK2
	 sg1kA4R6WNxbARshThu5CZcSF2TiY34UngVAkw7M97TT2KbIhCr/43AfH+OoeGw8yvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=dOacexIKHraWCg9yl1hlssxWGivRL2xIzkUcida+0nw=;
	b=vRvKI2JbMrMZ5n8Fgg3R/1x+Y9cdZu0SVcw6LsSiFYPDQZPxBhlxYcGWvfMAsvAwHqGF
	 H6k584UdCzNpJUKxq8YBFUjJi/x6HdKA4zN7XbIlQlCb14aJK3yNHgc1f8AurZJ48T0VR
	 /WWRGv6yDPFUoq2h9FeTgOo+EdV421yKsF/gDXagAky2S2ZX4Tml/tCGr8XxrFLdYKaKB
	 jaS/eOu+u68xk6OusPO4xcSWrlaFNTb7XaO+n0r+BXm+hcFfHZFXMBXa2LjqtuPL+y1qI
	 mS77kuAwFsHZkaIIfRRVfbEhYcTiFmohasXz8UiL7HUmR1FaHGaTYTo9IgJxKAJ3eHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=M79mcIHG;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BA8606A32A
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 07:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11BA8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=M79mcIHG
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae25008e2aso800813a91.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 00:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086575; x=1793691375; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dOacexIKHraWCg9yl1hlssxWGivRL2xIzkUcida+0nw=;
        b=M79mcIHGuHPL1m6cfk9iKqAoGpVCK2z7DNCA0lY6hiO5ngsUUYaEIXNrDLp6x5FtEy
         57XZ6PyeZmYRslT6UnKALitb4LNl0rsd1LJKUUQ/udMuod62deAlUV3wjhvQjRuyeYbK
         YuS1bUTyJeVf/gn28Nc6gDACb0NVuZ9RcHsYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086575; x=1793691375;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOacexIKHraWCg9yl1hlssxWGivRL2xIzkUcida+0nw=;
        b=1bOb/igSz0o9gKRh3/vnIqfxt1yyNJRCaUM+lWvzb9gay5U+B8GyWrHj0avbw0ynbq
         XK/srraPD5E6r3jqvgcc/Xcs69MNkUI5RMCc4MPIwLELCziDu101q0sWVztiuxCBDG8T
         1DMNf+kLr+K3etjhXmvpKL/t0kU6c1/wvKJfoApqRClTyTQuthYbZXVIoJpm5qxTeUms
         c1frphFMoFBqLoJWCT/TOUHAaI/uAlRuqVNoa1u44CrQjkT/Y9PcA550HuFaILSHQzUs
         JMyYMnhFl6QBCZ6wLGjDoBj+aj7QhYMKLW403Ig+AxQe/x36UmGl8Vh18igiuwOtEVAm
         oNFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4HzAdyOTdDonUHNWi15DAqWJcG7Ch2cciOmtr2OGWPQuu4qkOXTWJYsBMWkir7cDCMrIIkkhvzNs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8ijgKV8deego4KhsdGa5gQWVYZ4fASpa2GexL4H26WgjaRMjR
	g3aZm2jpnXaWr1l35yoVTeXuJjFtFnYLhayUPMlGlmRzbhWpBtFIXKmfsYBIu/GBJWM=
X-Gm-Gg: AYBFou2dck5pfNnbHmEZAVGm6BmD7mr/ACNa6gZKoJlZBlSDQ4Lgpb/4HZmyzw9MFLB
	GUNlsJN9YN7AFIkLGaD6ir+iRt1amIeRZkBUopVe5Bmn2XyUGj4BO2Dih1nP/Fb2ez1G/5hbQXZ
	xyWObYMS1FQtXLRQQ3u5SxfSbUIzANZU00PInB/sm5q6whIAO6J+p7lFzUzMujMH5lrw1o2MZbF
	iXXk9tQVDQnZqjhoHBEcjeNE1WKdm2JGQ3Cd2xNwCY7N0QNmwzFVpqNa5FiwVFO7WZLfR/m1H3n
	fJxEgupwTexyJSaligOEOs2RgxS38Dmr5LCXzPhP7caefyhqJiBal1n8UE61Cd/J2bMQ3fMlJxv
	fykaY6baCWAll1/avR4+m9anP/Er8pU8ZqYK4UvhPb5Zi/JUi2d/O+4F9BhidMwzx+MRoqLIfp9
	BAN8ihJ9WUMVd9U8Uzd84KxyhSoocU6lh5WLDtg8m7KON9NVERni3RYGuizfYaRIjt3ffPKFSiJ
	kAqv+VP4qHJf9eZ0AJlp98dO7O5CnoD+R6JIXz1WyMnoJ98VrrR1NPS93T1JGvZWj2Umci90RY/
	cL/5pC4b6FAUHPoNl6JsPsWJDkR6Kj4rMe2dZt/Ch0Kb/C8KbJqcYCOgfs6N+1VLUh5RpCX1+NA
	t+3W34kl8EcUcwjufxxvuv/s=
X-Received: by 2002:a17:90b:48cb:b0:3ab:1b19:78ed with SMTP id 98e67ed59e1d1-3adea9dca32mr7453567a91.21.1793086575392;
        Tue, 27 Oct 2026 00:36:15 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40472ed9sm2570983a91.16.2026.10.27.00.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:36:14 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:36:10 +0800
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
Subject: [PATCH 7/8] mm/slab: Support disabling KMALLOC_PARTITION_CACHES at
 boot
Message-ID: <1b07254587060aea4bb296ceb10f80e09b46e95a.1793086056.git.chris@chrisdown.name>
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

Add a kmalloc_partition= early parameter, enabled by default on kernels
built with CONFIG_KMALLOC_PARTITION_CACHES=y.

Let's leave kmalloc_type() unchanged since each index simply resolves to
the same cache when partitioning is off.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  7 +++++++
 mm/Kconfig                                    |  5 +++++
 mm/slab_common.c                              | 19 ++++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 20710d6ccd1f..9752bd2aaa72 100644
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
index ebdf14a87c71..12fbd7075705 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -270,6 +270,11 @@ config KMALLOC_PARTITION_CACHES
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

