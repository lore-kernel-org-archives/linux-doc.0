Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985222;
	b=Vt1AfNDnWB3TQee/Bk3uIyc8XXQelYzDTkyzkYZieiKvuK/nJfrA+b7IazQypJXEd0BN
	 tWo7bvk54/ne9bcE9gw+vT3Iic5qj53Xxf4YRmA0a//DnvYQXC5OYIR2L1ObroTQU7AlF
	 u9Th3afCDcF4NI9jyXnGefGdNphVX9MbjdSsuUE5kMmD2pUSP1V9lQzzOxVh6T1ZKFP82
	 tX6AhfnF93pVeqwdRGWpqDtnOuJsXS4uEU9Yo55GhTZMz08zyfxcxdkIKCKnj0mTFEDS5
	 RPg4OkfByuUuD10AENHS5+jqCZ7VgE9N2wPwXWnpnw/cRKv3tiioWx154hK0PAG229w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=0V4gHLbmmxLCmFwABtKMRTJRoH0Xzn0d+2gsbwvgOkM=;
	b=O0P9mCXte3zCGRI3VbtrKPyT0tQpzczkkQLb4VhCqBm178DBUKvLbsIXKjczR3wtS3d2
	 9EQi6ZF4pMRs2OlAgwMFFf/j6PS5bVhPx+5TWFLadeXmV88yMZItgAGnjTsBJ2s99zx1a
	 CJVyTE9R+W1OnEnILn/aY2Avj+jJ6NpgBu88WBr0MzL4NAxRe3ArcniHeIc1ft/BDfc/W
	 cnGzDEvRZLZUVB0k/WrJ/HvJAbKgu4kuy7WoDKhkcEJLPDywI/DgDLPOm9FJM35hZKWDp
	 aIgwJN8vEK1f9HLpc+l7qAOzmthQ3DDP4CfcmyDDyMy1SAkGjqJGRSKnk+rhHE0zq4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=OVWGRyeF;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C01606A332
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 07:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C01606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=OVWGRyeF
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd69954c755so563112a12.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 23:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794985213; x=1795590013; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0V4gHLbmmxLCmFwABtKMRTJRoH0Xzn0d+2gsbwvgOkM=;
        b=OVWGRyeFxxDRpNW7KWJCLbWei4gHffCAidQTaSERnk/N7Ey4ap+vKQB0LEUiBIxmKh
         xPGbw0lCTucgL3/rxvZ5Dy8y1+Y8avdQ+WZ+P8Gr9gr57tOAcMRfjNf5HxHhcIaHxBM4
         NGlrnqsJ1vP8UMeneSTEuJpOlXHqAZrkOG3Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985213; x=1795590013;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V4gHLbmmxLCmFwABtKMRTJRoH0Xzn0d+2gsbwvgOkM=;
        b=ykg3wMW+enJRVFPQ51IyZB4QZhP4zKpNkRIcLP3YE/+a/+WH5kcMVN75TPyapEW7nc
         7HZtPo4CnCG6/e82PpU3B2jg9+V6bCg8T/C6uhLRQhSDNibeCrwRs92tnoSXsjoqylUk
         fwTz3zZe06xV5NCqaHhGympe9FKFyiuZiC8W79ve54BNHgBmzTd1ltHdZ+HoiEMR/92z
         PqKtGpKW+iK9/0HFrngO8Mxj/3j0H8xS3cMigbtEfj1czhrD8vub6mTyb2QjTftDGo5p
         gok3MceWCVJSUhC2xYuWCzF4iCvpQ/mcxZEQdmFjaamBqNSQ8dp3s+iAK8Uea3qJudqG
         fs2A==
X-Forwarded-Encrypted: i=1; AL+hErEceoAaEn92/A7WWCByuFITzbZzna7OrIg8VaFllq+l9D/0PDxysvG9H13rtOj/5tCd9wB+8+348Uo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rypF9/sI7wDVf0GoeVKrrJaqe6ppK2X6xwGOp5TgFGqM7SRvL
	U4gKdI/OpfxBUQ6AarTeKI5dGzZVKyDKXhnrGUecm42ynJmk/+1aPuTCTsv/6H1bIXs=
X-Gm-Gg: AYBFou25eTvlF7FiuGnaKNsLS8R/MbwvUG7Th/VhRx4NFKpEFW/T7QHZ8y/+VXLdx3H
	sh3b0XtLRz0yqLn0xubrzQmw7rwk+wS/kyKhDDMfRTDRNrzTJyRjkJ7Gscq6gEKhIgFADax//no
	XhNA8t+b128Bw3md0WgEq8zaa9uSDZfesuUmpX9ZWIzHLxkrDYqlq0CdkHewFMZd1+iAtQaptYA
	8xHx4rRpH9NoPufDLiKFTUdJMHUQcljReduDSQW0eBANhFfwcUu4DE4r5HQxdL+iIX4q9o1oN15
	/Szfkvh0Q2sNR3t2Izp3kNFdWIm8zudbiWEFuzYHyE7nuyK6aGrGp5jz/mlawuNVUULeUevw42j
	OPvVG+anFXXxHrTBQTldhMx4X1j9eBTI0fTMLNv3Z0ZyOMbLobv1ajYjSymlfN5P6G52atR//7L
	qmAyQJu9GUeTGSw7BrpuWLxe9aghY6c/H5UrxlKMqlDfwFotzhzD1+hmtzQZc/aTd1p9H2lEYTy
	vJaf9sfcU6JF2bxjoHWdPFhWcoZfd1OFYWLQiyElWHnmnnvfs91uxR4ZB6LDy6AS9+6dYrWW1FX
	iHioXYu7wozP7WUGYB65P4z0dMtNotx7LQGzdydJ68OJRc3eaYMTYRCX01g6PnGqrvHQlwXL60L
	ZVRVu/fJpwarDfmn+4Jk91ePxXYsEySZfLmG/wRblpn95xmQUBbaAjG1Wd2zA4dnxO0yDJ4vjm7
	XNfMm+9BVSHbQueb6csY2Qk6V+KpDSaO1OOaXG8pjKHKAziGY9JIFYoy8nbvUo+ocl
X-Received: by 2002:a05:6a20:6a26:b0:3e1:8890:8400 with SMTP id adf61e73a8af0-3fe892fd632mr2082401637.15.1794985213105;
        Tue, 17 Nov 2026 23:00:13 -0800 (PST)
Received: from [172.20.0.2] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3c4bc20asm635004a12.27.2026.11.17.23.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:00:11 -0800 (PST)
Date: Tue, 17 Nov 2026 23:00:06 -0800
From: Chris Down <chris@chrisdown.name>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
	Joerg Roedel <joerg.roedel@amd.com>, Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>, Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 5/7] mm/page_ext: allocate page extensions early for
	SPARSEMEM
In-Reply-To: <3C50E682-848F-4788-9238-923D5E292DEE@linux.dev>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
	<20261117120627.50601-6-songmuchun@bytedance.com>
	<avzsFxVqO27Vf4Db@chrisdown.name>
	<3C50E682-848F-4788-9238-923D5E292DEE@linux.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <av1M9itGiTF1Akqi@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Muchun,

Muchun Song writes:
>Mike's suggestion considerably simplifies the code, and early page_ext is
>only needed by optional debugging and instrumentation users. I would prefer
>to keep this approach.

You're probably right. But can I cheekily suggest something in the middle
perhaps? :-)

Given the zones are already set up before page_ext_alloc() runs, perhaps
you can pass the start of the node's ZONE_MOVABLE as max_addr to
memblock_alloc_try_nid() when the node has one. The general idea is:

     struct zone *movable = &NODE_DATA(nid)->node_zones[ZONE_MOVABLE];
     phys_addr_t max_addr = MEMBLOCK_ALLOC_ACCESSIBLE;

     if (!zone_is_empty(movable))
             max_addr = PFN_PHYS(movable->zone_start_pfn);
     addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
                                   max_addr, nid);
     if (!addr && max_addr != MEMBLOCK_ALLOC_ACCESSIBLE)
             addr = memblock_alloc_try_nid(size, PAGE_SIZE,
                                           __pa(MAX_DMA_ADDRESS),
                                           MEMBLOCK_ALLOC_ACCESSIBLE, nid);

I briefly tried that and it seems to work quite nicely.

But I don't object to it even without that, so feel free to add either way:

Reviewed-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
