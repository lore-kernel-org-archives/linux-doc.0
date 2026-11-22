Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353296;
	b=OB11Ae/g1Hkf+or+ojc4YmhD+/Ha8ojdv0yXK2DZAiJS9hU4W2WrUykXY0nmWmAzwwKo
	 y39NOgvf0NcQ/i3m+1GPQm8mlAK06dKXCNwghKalC9RhHWG/xn6qB5+ZE3XwwD4w35hlk
	 r4SFflwjIKTNlVjX/AslgYrq5Odnc7sILy4IMnr5SvVK2wcXid5V8JVLCwKjMyhU76LYz
	 8S1Jjho9Vh8LtR2TiYH17ijQyBxgvn5Ozo3nHWcmVLSnljTsE/psUYO65fb3wYAEmxh9o
	 oFmDWSFpg9UlsQFIPtQbTD9BCUE00iWvxgknPHeLENSQa/r6NTPU3WcIu8c0am2NFcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=8hD87ixJaXl21lUSGIciEwnoJt3nWlHx7X6q/vGOsOE=;
	b=OMV9ClLeS+/fAADTt4ysRA7r9vQdBBY3qIlOJHBhkHmdGPowFcrsIGrYvM+gt8JdKDqQ
	 bc16rfGLJ2kiWHIv9PjB0Pv4zYuq/aLFPBMzL+qJ3DBAs7wm/guRRAo+wRd4ltO/j7248
	 DnB0ovPhOFSQH3S8OzQzeQ97kuEtWvkWS2h8wQpSS5yjrFdzYqN5fKHTTS7QGTnPi7C/J
	 /3gWRT8EbVbRyZHeY6qRCf4XEsOdxQA49aqw1gYX66VMKcQKLI2b/TVI0LBQ6178THRra
	 +6AFcA3euG/a0799GnaEucTY6BFh4XwdHvF9AO//eT1Nee0Djnuv2DxiMxH5bOK1ivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dNi8/X4g";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A6606A32C
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 13:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 336A6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNi8/X4g
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b244fb7fffso2283406c88.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 05:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353295; x=1795958095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8hD87ixJaXl21lUSGIciEwnoJt3nWlHx7X6q/vGOsOE=;
        b=dNi8/X4glj8za8CHUyUTtNzOlgHGHp6QMd10zTC/TQr7AJjZerl6rqDTwp102Lewup
         1ittEsw7RgVIgBsb6DZbCBvqPrbP5YJmX2/qbh82cibbbdWMRNzmYbGy4kpHz9mLdno9
         q8/1br+pv9KTFDXwytSa4WMYQNsbFDN1S6OQCFA2oUgrZS+XuGDF+2uv4kg1KaVLvojN
         8hvHwbnsgHffAHWp8ZPzoZqqIa6lDM0aKKvgLF9n7EIZwdtKzrLa9QEJc8P7eZqhakHV
         z1Aq/zCMe2Uz5NUyUYu79/IRakePzC5KTLXUBsl2yc3GG7faXgOKuYxOPWFab5XvOZMi
         Npbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353295; x=1795958095;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hD87ixJaXl21lUSGIciEwnoJt3nWlHx7X6q/vGOsOE=;
        b=ou2Ofx1FZpVSsxbuIUFxuOR/SJvAa2AYlTQKKeXqIIcW71Ll73TbxbtCZdNBWjgXYs
         N2lWDN6YydbJuIk4VIJZu7RrxE/7Wb2m+KglHaE5H2whNNt+zDFC+TSWqCheSNWoyqRX
         PDP1pCRonMkzfZ55JxClH+YCd8byzwChoRaDpy5f3NWVyACAD13l81DYG4QXqaW4J/VF
         VsvFGLTZ+vNsVwPiaQ/VvCnHqiPJDh3/lVIjFXK/Beac3wILN/A5O3yu67IgmsQyvGAk
         YaHyIrTRzswQlV/PoNDDfnV5ie1EE32sXMPaQY82P84xnskcSm/H0bvnS9plJVRFamqj
         8hcA==
X-Forwarded-Encrypted: i=1; AL+hErEBCL6eDfX3gHnIGDvu22cdfcfrftLctu49Nx+wH3GcSDoW7dIhQLuJiGGbclAbATpbdEuN+bZVO6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EK6FlKhW/Cmr6PRGPwDCKuCoZd1xJe2i9D3Z7fUmigEwz2Qtr
	Xp5EnZ6rDE+pMJ/jB3eaxNDJxZnwzTCqAGfG4WFTvv8xTvyMYqm+k3e/oq0iXyWIkGY=
X-Gm-Gg: AZFdTZe9wprVUs9RSSb4v597XTred/pZuxMGbCrXe/HRKsTPkagiz5uHdJsI3a2wvkI
	bL/Ke99bFRL2y3aW8DzwcrjBPvXLoLA01G3ZyRobTSDTPSEZAqhxsnl1h4TkRDqe0QIMrRMBx/i
	W4SgukdZ/7dzzLJZSiR4UJPlnnBGPKdGgrqXqGAQhFIhr1CdHiaP6nj3xLPkpse16VUqjeS+F63
	Jr/T/KktHirJQocH+9k6AtU1zC1pVu+gZIdkQXUJ+5wEnXyTY1m/IEgMiUh4FaPHbjQCZ+Oyu4+
	ebDbSsIG/Ms+BMNONavpLEQ4YKWNOq4uYJ4lnc315YXIMlG3ezIyWnvVD2utCjn+9hO6FNIbkjR
	8e0yAhTkhrl1u4ev93ZjDPE4Jim2jQBrPuOVRhOnWCFwlfalpUNz3EMFulTGHbxgnzidvYSUrfQ
	wgQIeqaiSdG6YLgLdlADCiAJ2FSRJtJsLjbQxH0Zh/QLKII/VkMphmEs8I0/Ja7YQUticiAd9Xb
	Ge302He7e0NkVgxk6WZarcMpH7TbmzJAxOew6zkWFcE2RRYOGgVGbYBMJ8YhmXNoAwcQFIQq9TT
	ygs0UuIFDDAOiQm1FlG4DCkpmxIiIzMRDkdC1jd3LDfXcMlVKLUNBiOE6qE/aMM8UlHc
X-Received: by 2002:a05:701b:2215:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b5568b3154mr8671867c88.23.1795353295194;
        Sun, 22 Nov 2026 05:14:55 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm20797941c88.8.2026.11.22.05.14.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 05:14:54 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Chris Li <chrisl@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Youngjun Park <youngjun.park@lge.com>,
	Zi Yan <ziy@nvidia.com>,
	Gregory Price <gourry@gourry.net>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	SJ Park <sj@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Yu Zhao <yuzhao@google.com>,
	Vernon Yang <vernon2gm@gmail.com>,
	Zicheng Wang <wangzicheng@honor.com>,
	Chen Ridong <chenridong@xiaomi.com>,
	Tal Zussman <tz2294@columbia.edu>,
	Kairui Song <ryncsn@gmail.com>,
	Xiang Liu <liuxiang.277@bytedance.com>,
	Ehab Ababneh <ehab.ababneh@intel.com>,
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Hui Zhu <hui.zhu@linux.dev>,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 03/17] mm/mglru: make generation page counters atomic
Date: Sun, 22 Nov 2026 21:14:27 +0800
Message-ID: <20261122131433.72335-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119-mglru-fg-v5-3-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-3-9eee2fe97a2d@tencent.com>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 19 Nov 2026 05:03:35 +0800 Kairui Song <kasong@tencent.com> wrote:
> From: Kairui Song <kasong@tencent.com>
>
> No feature change, convert them to atomic so we can update them without
> holding the LRU lock. A temporary underflow is fine: readers clamp a
> negative value to zero, and the counters only need to be eventually
> consistent.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

LGTM,

Reviewed-by: Lian Wang <lianux.mm@gmail.com>

> ---
>  include/linux/mm_inline.h |  6 ++----
>  include/linux/mmzone.h    |  2 +-
>  mm/vmscan.c               | 26 +++++++++++++-------------
>  mm/vmscan.h               |  2 +-
>  4 files changed, 17 insertions(+), 19 deletions(-)
