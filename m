Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086554;
	b=YzdKRDKndgm4t/N0wFhc1N2sf4GxjBKrvKuEO1jOC18V3rpkdxA1eJk5DCdjiZPZRGNt
	 zkSZINSHeNTz9EXZxrmTC9OHm14WH9Vc9u81d8RXvpDTPnENkTFKOFC+XKkxIppCQDWfU
	 8wNQ1jkmgWFy4GzIYoSigl/Ts+q6qJDgrRDpjtfS00Ob9Y3jdYbdn6tGxB09mF8lJ07MQ
	 H9XDAmhmxncKSZ5EyWL7gIkFYH9+wZtMebuP8BBFj3ypysyH2I02LHgMp1j2W8Zq75xwO
	 CReq+jO4WZdDuVgkWuFDsAoDXg9SA8iL2T262QOjcfqqequmbui57kCjREaBByda0Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=aAleu3PFDaaloUL3fp9TR8UUZq+CL8OXKyhY9njoszw=;
	b=uJkzbKE2f1Jsd0TrT9aqT+48vKMGlaZd+Vf+3cOF1rLjFgL9Ak8zvaS+4RfB0nGnBYPw
	 1c9Sj8gMNWB+gYrSNMS/gWpTWxRSqaKFSKO3Ny0iJmvdKK4kjToy7AEGq/AVTxZWtkJWs
	 NtHBmQN0qaqAyoytky9PA58wKjk5b6Ulyx9wuNksq/KN4J4JchYDSfWhUGIaHt1VYHHta
	 bYkwie59/h7qQCuMnFFhxEfDR+jgWwIQjg6X3OHWh+bvZJKUVVoK0zGhn/zOz1dsgRBL+
	 wrbmM5+3ocnZOlucwd0mnzNp4MbIPAN0dEMaLQgJQec1uzpg6DutgMosy0lNdNC/hjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=UA+RMIvd;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF20606A31D
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 07:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF20606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=UA+RMIvd
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e987a2ba0cso24101375ad.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 00:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086553; x=1793691353; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aAleu3PFDaaloUL3fp9TR8UUZq+CL8OXKyhY9njoszw=;
        b=UA+RMIvdJDiDPeX/NjNZrP60ECVkNVdz5unnwoSR8k6neRC99YxJu+tZQ4l6XDJul5
         VKBgjMwFh83zsMth2P6QZMjYAHPFZX1UPTpIjC2sJZXYGp6DhJfmFCQFWoup7+5G35oY
         TzxKVGL7soDKtAjYzTb6jCNU3NgUnmMzEe9ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086553; x=1793691353;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAleu3PFDaaloUL3fp9TR8UUZq+CL8OXKyhY9njoszw=;
        b=SZ8m6jwoInYsl3p8A3X0EKpiar9gRRwgvqf7khqGpQ74M/8S5SADd9HIS9q+GMkZkD
         aRVJ2E6zl1w1K030o+EOekHBgHM6fa3UEh39iatqFs9PI8fgmOkccRuB2pEItlnzlmd+
         3IM0bkuGpIMkTj5+rvcC3vyoEcqWm/ql59vt4/3UB9u2JVEAOlTKTh1pLseIcgfDMlHQ
         1jN14/ccAVddjaSE8FLwfVkUfBd0xqNcjh3+6/+kjhC/DH67MNYm1ZotdMQW0nJwoe61
         xK1arAQV5jFwpNTL4DsYxV4w+q8O2wTJlwhcDJ0cTYJjSRSr6ub4nMhujGynlaoB8c/w
         Etag==
X-Forwarded-Encrypted: i=1; AKwUvBxczKy5bWgCZCgiU3q/k4e5Y2bHpZuX0SFFzwpwQhYuPYoXTg3NRybe+CfdFpB2BW+Us0EFv2Jy04k=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/wciQ35BcvRRiCa19n5XaGVUHaV9YAmdoNbo42/XEXNpKnBiV
	PsXxSFIW9POK1vbRjjEHO5fh3x537YvqSIwi5Qa0c3WsuoW2/WXHQg1MROCIK3EZYWY=
X-Gm-Gg: AYBFou2vz0TMO5nCHxKH1Mngtr7dY/pQFIoXc+hlTo+t8IgQt+BqpBiGZXjFKv8baRZ
	zsrmuE1FYwrR+GJ4+eFitMgaak8J/sqPYEQ2WBnp4lSwkaVKWugoXgdOjh+nFVW6z2XiBODOcYm
	OHY7UvkD6fX9unwk9GFMc+aLivb/2S1EXrz6sgdGmEsCzAhcD9DvrQyFLLx2PKo7ZPF5Lvtvv3b
	SQtMzUMh1yT2MEwWQKFoCEbAfTY9sVa2BncuRSPK6I0z1kB+75I5j57byeVGrQRfP66l11wtO2m
	VqIom4PeE61aMJJ33WChZb5iFNzKyn+ti3fDo6k2N/3Ih+55fM5dtOwz8C6gJwuG8DOHW4aAXqR
	ZeNl0CUhxjxJX4DSHJIgElxhWk/eLMm8yc596W/0UvzBbt0S8A0DfZgi0tRNG4awiLot6gsH4iY
	Z60ucjWn1zW6i2JYkX8Cd8C/wDnJHvlqoE3TJARNKikDnP1/sWt1qQVf495r9OdSJU3Ih3ww3uf
	ft7CuISXrEnBDMQ8AYVCAn2r4XREEMNCSELfLwdKn1KlBN1qPJCjZW6XgfDQdOMCy3Ss31kix2h
	S64bvqPXIduOFXG5xNpDFc5KEIC4fZYEZo11J0FEAAcJhMEcJ51o6M4B3MxYQCOh4BJjrW3oJn5
	17k694Yf9pCJG3qsiKjayPqo=
X-Received: by 2002:a17:90b:1652:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3adead4f65fmr8276505a91.41.1793086553098;
        Tue, 27 Oct 2026 00:35:53 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406506c2sm2520384a91.14.2026.10.27.00.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:35:52 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:35:49 +0800
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
Subject: [PATCH 3/8] mm/slub: Support disabling freelist randomisation at boot
Message-ID: <58f32032f0f5f3828322780aca1847f1cd80cef0.1793086056.git.chris@chrisdown.name>
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

Add a slab_freelist_random= early parameter, enabled by default on
kernels built with CONFIG_SLAB_FREELIST_RANDOM=y.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 mm/Kconfig                                      |  3 +++
 mm/slub.c                                       | 16 ++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ddf2f6fd60be..5c4d784e7786 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7021,6 +7021,13 @@ Kernel parameters
 			without that option.
 			Default: on.
 
+	slab_freelist_random= [MM,EARLY]
+			Format: <bool>
+			Enable or disable slab freelist randomisation on
+			kernels built with CONFIG_SLAB_FREELIST_RANDOM=y.
+			Ignored without that option.
+			Default: on.
+
 	slab_max_order= [MM]
 			Determines the maximum allowed order for slabs.
 			A high setting may cause OOMs due to memory
diff --git a/mm/Kconfig b/mm/Kconfig
index 3ae97fec9946..56c422684b44 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -205,6 +205,9 @@ config SLAB_FREELIST_RANDOM
 	  security feature reduces the predictability of the kernel slab
 	  allocator against heap overflows.
 
+	  The randomisation is enabled by default and can be disabled at
+	  boot with "slab_freelist_random=0".
+
 config SLAB_FREELIST_HARDENED
 	bool "Harden slab freelist metadata"
 	depends on !SLUB_TINY
diff --git a/mm/slub.c b/mm/slub.c
index de4937fcb293..7e9dadda3d10 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3424,12 +3424,23 @@ static inline struct slab *alloc_slab_page(gfp_t flags, int node,
 }
 
 #ifdef CONFIG_SLAB_FREELIST_RANDOM
+static bool slab_freelist_random __ro_after_init = true;
+
+static int __init setup_slab_freelist_random(char *str)
+{
+	return kstrtobool(str, &slab_freelist_random);
+}
+early_param("slab_freelist_random", setup_slab_freelist_random);
+
 /* Pre-initialize the random sequence cache */
 static int init_cache_random_seq(struct kmem_cache *s)
 {
 	unsigned int count = oo_objects(s->oo);
 	int err;
 
+	if (!slab_freelist_random)
+		return 0;
+
 	/* Bailout if already initialised */
 	if (s->random_seq)
 		return 0;
@@ -3456,6 +3467,11 @@ static void __init init_freelist_randomization(void)
 {
 	struct kmem_cache *s;
 
+	if (!slab_freelist_random) {
+		pr_info("SLUB: freelist randomisation disabled\n");
+		return;
+	}
+
 	mutex_lock(&slab_mutex);
 
 	list_for_each_entry(s, &slab_caches, list)
-- 
2.54.0

