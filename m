Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184226;
	b=b9tUDdNITVAhUGG3i0T6MEbG6WMRsbC8S62YnoRLRcmUfVhu3rw35BV23//AFNGs+w7j
	 T8xAewt9azFr7IErlxEkxFIZixx8B29nRNhIswgioo2tVAsTIYs4PFG5TnOcBCwEiyunN
	 +c5SKpqvKlxvDFeelA0hgcu8LNDyf9yz+LK5DhdMEbgYkw4WdyDFGIx6W7sTbUjPSbRZj
	 RvoQVjThUV4acEvmPWkLDS2BjJ4s7TNjeLoSZXBNU8AbMhFbyTSK8oVwVhmja2HgrWRAz
	 2v3wdhST1XxDqrLIs8m7HYLKNPxX0RImPmlQbDvWE6oy90pio4fQVshzrvHqgtQWb9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9PEXPx1f1v6I2CjAMNLRcdHwCcztH0pJkRVk37TqP40=;
	b=pz4nde+epfcqpA5O3LbtXpyTViUnOK1Dw8YGje9zLdemCSxcD+ookqVZd63gMexDY3GK
	 aRU+irePxmGAgULiF2oryd0jnmfQa2bA3Io4j+nCu757TSe99+YZ5tU6uUfFiuznWY5y6
	 Y2jxQbnrL0iK70geON/5OYW5USa2+6ppu1F7f5q+w69f4Wv9OAF/uaIIBsfQftcLHpbcd
	 Fo3gurlx5eJyHcUOFwnW/J6tf06UjDdC05hdFzEDh7VhuvaqhOp5LVU86vOfHM8eO6+An
	 H0KevI3c3wcWVSC+U4IUiEIJ62Q3onYr1nUi7wfpEMUcCly8mGCSZUYGcF8v9FlOIrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgz+LzV+;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6DE606A322
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 10:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D6DE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgz+LzV+
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso350699a12.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184225; x=1793789025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9PEXPx1f1v6I2CjAMNLRcdHwCcztH0pJkRVk37TqP40=;
        b=tgz+LzV+dwEKJDmG74Pr1aGCyv4LebV50v6CwuWqxRNOW1XFP43YJgPlVeyyQEpAbL
         tIIYI7wazhn0HNcl0IUX4DJq9T6YHUoFt6RRDHwg53aoTtO0IJ1FYfEJhU/PNP86qd0R
         WYW49tX9/ZiemyGoOxBVfnXeYMlgVxABNxm+Kk3mvVAacSLf00/NyUglTB6/XGZuXYzN
         aFfS0AHdEtecypjIRHhZXOhJ6S2IXn/YPNmnjKWriJyGuQetBs2f6QRt2VqMC1EPCq2d
         i1YKLh8ssu/KZV+bsxOysgUfq0eiOMkfNCn7AuCzPtEdA4blRTX00rwMC1PuZubvmtQw
         Cy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184225; x=1793789025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PEXPx1f1v6I2CjAMNLRcdHwCcztH0pJkRVk37TqP40=;
        b=tWWxCnWs/aH/yCQikSC3SkNCm2jpSEwatkiCgFhP5s2Rt/PRzX7hoGpSD39z9MJ69X
         yhnWnIY90KWZ/6IjYsYdBlvditEvnv6mQ6DrARDHzCyjpJsPpbR/W8SCp9iPzcaj34ZR
         ravGfVbXKJE9vGITqCjsIg+Yr+/eSjFyp4XprybZCbJnd/08f9ogPInYGA7gkHJwAvkp
         utVCP5JqiXagYvX6PHORkUlaZuRDjDoVLrm9yux3MgSjulAo+zH3dRuxrJYMkXk3J7JH
         GQagvEJUFFJ/Q6UstBLEG7vOD0+aIpnKDv2a3ATIagPCuRXy+zE1eaLmUUiDpcC6HPJf
         F5CA==
X-Forwarded-Encrypted: i=1; AKwUvBzISxHTa3PBwwxJGvx5hH+zg4VGfemvlbQ+t7p9bH9VL9etAjAQ3mADyQubUj5xkK6wTFDHs+IhvW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYWls1Mijn4We8PQMYCrcUEYRfWoMP2c2PdGpnom3Czn+1YDX+
	ZbcxBt3xwVCAab/bq7SAS4B438aY/g+u+wLh43r9GmBVLHjhvMkCdexd
X-Gm-Gg: AYBFou0GRlbv5AvI/DE3UfrVdbnHhV5FA4iFs2KCFORpxyDM0jIermQTKv42lwWb3uM
	pwJSONk5yHteaIGvGftY2UEk21gI/IkSNjux8mK8BJG8dpG2l0b3mUSNXOn+SCOTP9liSbco2OH
	e85+ke31rMXNa71xipuIviMDAbzCg/iIewNdrBWy4YGoVgpsldXiScF9IlZWCsg2lT8FMbxj+eW
	A2VwetNe9bkNC5Nc00fPi2XjL7jwWSXB0fuLu39fvH2c+dNMbsym6wJF2I2mXOhwHySoot5/1OT
	FjpsNIW/0DjYA/tEGF9U4D1EQWf/7D+kGxSWM8376jYNHzgDM7Jkg7NYJXYm9FjHuJVoY/UYFj4
	RAjgdKQIesqWydRHa1mIXosZKplIz2edS5CtqWWccl2aELWm6XyILG/LukGbQ4k7wc0cE1PsmvF
	Ee8Jpn1I1+hVOVl179Kk9WbMSUumw3TySUej+/iGgEgs6rPmRXZ0SmG1ZspdFlj391T/p9C5Rb7
	8+0RDuZxhPlL7j1+2RgR0YqXxw4ia8AnMuIUanToUv09JAR3DH1zfWssupX1fec2Hu5XynA3HxV
	hHmuzl7K4b0mAY63I1tZBP0Cj0XkVnSp1QBH4P4vr7zTLqoR1U00apMBOdkBpnrupzZZHTWT
X-Received: by 2002:a17:902:ec8f:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2eb003e9b1bmr20590075ad.45.1793184224783;
        Wed, 28 Oct 2026 03:43:44 -0700 (PDT)
Received: from KASONG-MC4 ([114.246.239.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c34c27sm19889165ad.50.2026.10.28.03.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:43:44 -0700 (PDT)
Date: Wed, 28 Oct 2026 18:43:34 +0800
From: Kairui Song <ryncsn@gmail.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: roman.gushchin@linux.dev, muchun.song@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/mglru: stop rotating offlined memcgs to the old
 generation
Message-ID: <auHMXBwnwuRwHLmo@KASONG-MC4>
References: <20261028010611.3929937-1-tjmercier@google.com>
 <20261028010611.3929937-3-tjmercier@google.com>
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
In-Reply-To: <20261028010611.3929937-3-tjmercier@google.com>

On Tue, Oct 27, 2026 at 06:06:06PM +0800, T.J. Mercier wrote:
> lru_gen_offline_memcg() moves an offlining memcg to the head of the old
> generation of the memcg LRU (MEMCG_LRU_OLD), so that global reclaim
> visits it first and evicts the folios it left behind.
> 
> Since commit f1cf8d2f36dc ("mm: memcontrol: eliminate the problem of
> dying memory cgroup for LRU folios"), those folios are reparented to the
> parent before lru_gen_offline_memcg() runs, and nothing can be added
> back to the offlined memcg's lruvec afterwards. Putting an empty
> offlined memcg at the head of the old generation no longer serves any
> purpose and only delays reclaim from the memcgs that still have memory
> due to additional shrink_many() iteration.
> 
> Remove lru_gen_offline_memcg(), so that an offlined memcg is rotated
> like any other memcg below the reclaimable size threshold until
> lru_gen_release_memcg() takes it off the memcg LRU. MEMCG_LRU_OLD has no
> other user, so remove the op and update the memcg LRU comment as well.
> 
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  Documentation/mm/multigen_lru.rst |  4 +---
>  include/linux/mmzone.h            | 14 +++-----------
>  mm/memcontrol.c                   |  1 -
>  mm/vmscan.c                       | 20 +-------------------
>  4 files changed, 5 insertions(+), 34 deletions(-)
> 

...

> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 636152d8c94d..45a2c1021f4f 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4538,7 +4538,6 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw, unsigned int nr)
>  enum {
>  	MEMCG_LRU_NOP,
>  	MEMCG_LRU_TAIL,
> -	MEMCG_LRU_OLD,
>  	MEMCG_LRU_YOUNG,
>  };

I think there could be other usage of this LRU_OLD macro, but indeed
offline is the only user currently, removing it is cleaner.

And everything looks good to me, thanks!

Reviewed-by: Kairui Song <kasong@tencent.com>
