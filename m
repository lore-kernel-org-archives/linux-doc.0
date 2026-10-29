Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254082;
	b=G42k/PkSckYw8vd103Kk+zYBCBy2YtpYY96PAgl/SaKTc1uKMeqINlxJKcwJlVl+WvxH
	 zQdcKNIazFW/OP1vuPSs66fa3S4e63tBFjRFGjAk8M1Vx0D1cUiqPZxhSU8P7aef4ydl9
	 pLggjDP/QATozmna7t9Z8e50D68GLMJIhZmQvZ5cLD0KEGUY/1clA3egmbL45UsGSr8cA
	 u+e2D7+GVzTP0zhquRYPZQ99leA2ibRIE9CCM+2GEJlwDSB/NVHlcANPg3og6w3PWKJgU
	 Gt/b09QhIUS0cEyhRCtb+U8E8/mufga6Kz7+pnJbiB9/ikA59RHWJtCPfK5dwPEc5mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=KIyRNW6At3oCihbJNccAaO3bWJ8LNw9lR1egadV9gDM=;
	b=hU/mVDvZWXz2KRsMlKjE7MQbsi6WKVk7lzqG2n5QejgKvPTBVahM+lFfWg8cmalFdiuB
	 1Jpn4PtubGVW3JBhXIcPUDs40oh79iIPUoZYyJrRjd4QEoJclu350UVu9tpdEdtTGRAWw
	 O3LtsMdjKRF8v96T5Q7CKeTd2Xiyii4aTjoz/h0dLkOTEODdyZ0g+WLSU1nlLHgB95Y1L
	 9Jr6CPGDVZ6EBhTs6CG++FBIqhNidJ7GfSUTWDg0ywTseyIl3xHbGGK5EqNSWf+5LF1zu
	 40uuQLkzheKdlGgkKn8VEVl36FXW1RkCo9gqAvE7LGoH2ODXB7RcIEcNfFnvpPVHtBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="I/xnC8+n";
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD27606A31D
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD27606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=I/xnC8+n
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a058f74a54so854797b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 23:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793254081; x=1793858881; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KIyRNW6At3oCihbJNccAaO3bWJ8LNw9lR1egadV9gDM=;
        b=I/xnC8+nPsymSUHPSCVMndHbMjYrHGaw/y9W97v/V/2TNEsAbBBtCC0eACd7C6iOiB
         ASuuEHniK+dy6GiylaKYvhwWBE9+sneWyYMdevPhbS4Ji19fDeXXk1rT00IZNjslxLMk
         Ei6Ot5AsDmBrSOlXrS725Y2BufoI2xfgpZUi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254081; x=1793858881;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIyRNW6At3oCihbJNccAaO3bWJ8LNw9lR1egadV9gDM=;
        b=eHDIX5f+CDJ9yPXgCEViEyBIvKuI+54h0bpYtxyawX5oYbjzjiRhW/uDatHkHOZGHt
         mPVXEjHXMNnDCHrcW2nCNhYZlw4FHNuHJY/UGSLuVSECvgunJn+459k19roT31wP68i8
         BRihGYqKDzxfTL3IbJ5S8iWEFLHwgUcHLsl5h/0yOstqwrHN5XkE+u0UnxxrK+cBPG0i
         OUgGBV3oWsAd1A6ZkxADdVfvCiMZvDnPbg+AeXVoQeYn+jjyi7rwQroEYad/L4//KgK0
         Pn0AhcIhyrWMFRe5oqqPRdbKw8TAYdyedk/GWiuakI3rPWVXfcKn58vRhUvge8eMJjEo
         RNRA==
X-Forwarded-Encrypted: i=1; AKwUvBw81g8tuoJVq08xWjundQw/6gBVc0pQpoKrRY7u2DmMlztf84EgjGq0koy2Y00OP3g4aM5K/FtAgbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeY0fetkb4nEOvgHqgpXvDTnVjpUBMACJUpx7EyLimIe6Yz19t
	PzYQgTb7YDL9H4+5Kuchy4+UzUSVtJLG141EwIvTbxUgPCWqB2kPqUG9RMnmiWsrmiE=
X-Gm-Gg: AYBFou0FOiCUhDo+s/7SgA+ycOvsTkDRz9UWEgby37RqBnHsEDE1OmtckRYxaoBeL4M
	oA8gZK01knNAo2NBtce59pQWG6FLH2lvlNcx2+4J5XpzS2+wF3OF1x2n6TBYk3EKWi8XtJ1FkOZ
	F+PLSnq1NQokw7KHrqKXk2dUVDlm+TLYWx7lOCCNVNWTieiY6zAcX9Sj0Kzf7x2lKTEH0Ihd/iI
	uqhmL5BTH/E924Zkm/tR0wxXDHKsmn0SHLjqSNuv0MI5ikjM+XYNYC34Oa3aIdSrvzWAbHLxKfW
	zElvr+4GKUywpy4u2wV1SnIudrkKNG4Wqs/YfL5h/WgCWOXDumR+qO/Bsa3FlLy4bP9dYDK/wxU
	F/oYn76GQ3rOT/SDrr+OXCTBcnIY4VQY0sGzA9qMKDKUW8D3Md1SS+d0FvaaDsdKfFvApTqWxuJ
	iwFL59VdHZmxXQIiyrGPqusBc3DphaduJ2s7CSpOCoifL4B4tv4C8p0zmR7kBpl5efIVh599Cc8
	Yv1yVAUhlkyGSSWN3VnceCr1h4KKiz2q6es+YrnawcvphkUse/NgXClKKl5na52mz6zp8EGk9vc
	Upv9GrkTTaJbQNxcMuje7iYavqxo2rsldp16r65uqZPvvRuj7glc69dI/D7GoqFiEjiYu2qOHiq
	eRSMxpFApWGc2zGAUbeYi9bS1e/BoGAU0PmR3bgVszy6w6s5sRwJOU/FLIXddNEDgB6W2FFKI
X-Received: by 2002:a05:6a00:a0f:b0:886:5f48:3fca with SMTP id d2e1a72fcca58-8a6e7dc9293mr3736944b3a.37.1793254081351;
        Wed, 28 Oct 2026 23:08:01 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a3d5bd6asm1861640b3a.4.2026.10.28.23.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:08:00 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:07:55 +0800
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
Subject: [PATCH v2 2/6] mm/slab: Enable SLAB_FREELIST_RANDOM by default
Message-ID: <6bdc161bd869ead04b3b9a651ef6a83882ecbea3.1793253633.git.chris@chrisdown.name>
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

SLAB_FREELIST_RANDOM randomises the order in which the objects in a new
slab are handed out. Like SLAB_FREELIST_HARDENED, most distros already
enable it, and its cost is only paid when a new slab is set up.

With it on, the same system level benchmarks didn't change measurably.
Allocating from new slabs does get slower, by up to about 30% per object
in a microbenchmark which does little else.

So let's enable it by default too. SHUFFLE_PAGE_ALLOCATOR defaults to
SLAB_FREELIST_RANDOM && ACPI_NUMA, so it's now built in by default on
those systems, but page shuffling itself stays off unless it's enabled
with page_alloc.shuffle.

Suggested-by: Vlastimil Babka <vbabka@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 17d017e8fbef..92ff97ff24fb 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -200,6 +200,7 @@ config SLAB_MERGE_DEFAULT
 config SLAB_FREELIST_RANDOM
 	bool "Randomize slab freelist"
 	depends on !SLUB_TINY
+	default y
 	help
 	  Randomizes the freelist order used on creating new pages. This
 	  security feature reduces the predictability of the kernel slab
-- 
2.54.0

