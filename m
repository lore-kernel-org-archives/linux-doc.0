Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117478;
	b=V15fP21dW/hl7oTJiQ4+zQF0u4EePck+KNsEgIWmL71/VK7VdTlJsbow4ThxsVwxzMoh
	 P0RcRe+erD1LnZCGiJFHJ30BgsD/Xfqf/s56YxZMKPCnBIYaKSED56J0exGXlfoJ/cdn9
	 2iXYT2pjFAgsly34TCi+ax9SLOhXqQbsx8d/tiIgHU5ttWTEZ6crzvwEPwzEcaph+sDui
	 Er4vOw2uSIdB7ZQ09lWdR4lUHgzAuQ/qm1SJjIdUGiX136s95vNoem/JasliA6Ox90GG1
	 5m7cjlBPqjV1O3J0WdUFN7R1TA8wx1ZogtXAEQvoUZyzmvB/ENfv6rbps97xdWhyp5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117478;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YKyrivJzo+Mben9cmzx8JhnXyAay12IuEg5j9gR3E6E=;
	b=XlPJa+iGDRSNWJeZVDxdSFUiwr/26CzYVs9FDNDhS9E/bvuzp4HA52zth3UYLvkuYhTe
	 xafDjeclERtRKr9YEAaF5Ayh9q1sahUakeOUNjFy02yxBz+w5kdaFIpfPlB5L7xMqa9C+
	 KIkdI/hou0GRmNWmDvy7hWwSQBCHEQIY27nDNnPN7RVBCV3/X1CMPz5SajuDsmEBWBKJg
	 uIOz1cuznFp8ZJGVHkfH554gzaTPbApH21Z4urSXbPsudJKe4pSn+OZ1wrZsoDKKCeBiQ
	 ml/ptCXEQEtsuYm2TicuQVf4kn7wEYpA/2J8PCayKUDevV4CrBMswWCfUW7yzn8MSdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VYT5UxV9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38313606A336
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 19:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VYT5UxV9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D4C1F000C9
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 19:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117478;
	bh=YKyrivJzo+Mben9cmzx8JhnXyAay12IuEg5j9gR3E6E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VYT5UxV9dN+i3zJxAoQ8miiBtqQbPBOELIeJMtelU4FWbjV7eXta8HQ01uZEdh4EQ
	 hepC1bPs5K2YTakyR0GvxcH8SJC66O4nsxb1MTcfJIzVjuO9C87mHIsJn6IaJkei4Y
	 fUmECLfL7BU9CF+Jan88vX/IweN6vpAmlfKjwqVCaPbMp2zLmNfkoy/TXDYu3GhjSy
	 64Hz1b25H8HYOoMu5QOUSrFNCWZKpR8KZo2YTM/hM7PCb7XYkm9JlciKJW7Hwpqc+7
	 igrLVO4T6N6cXC44KzjusVQT2kIUare5neNQjft/xuCtjKBi5jTxbHm/UNr88aopXl
	 /q+DTwC6w7OeA==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9497a167a6aso159280385a.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 11:44:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGM6kta99g1RSJbh2ytZyof+z836fOyOSAQlzVlLVFc5o7R4HPazIylda7iBEs+9vd7iql+Z1U+uBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a91tXBiaa23DzeGBF4jIuqGhw+SZilByhglao2N0JeD4iv4cb
	Wdi7nmpcYYjLRlkQXpfe6oWWLTJspONY1po0q5Z3eg5vRa38F9AJSrb8h7/SgzIsjlIuWIajtsV
	3DsQ3YmqrcxKdiAREq2DduNDFYwkT3Ec=
X-Received: by 2002:a05:620a:261d:b0:93e:c12d:4ec7 with SMTP id
 af79cd13be357-949b3841debmr323824085a.39.1795117477060; Thu, 19 Nov 2026
 11:44:37 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-3-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-3-9eee2fe97a2d@tencent.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 20 Nov 2026 03:44:24 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xXdPsnHFX6SUff_1vbsEmGCHdZcXAmOumiN8EMar+KAA@mail.gmail.com>
X-Gm-Features: AclHuK_KKF5P4wFEq4Ot8gOVbDoJlPrF_Qs2r1floMy82S2ahYTVnc8-alAnTWA
Message-ID: <CAGsJ_4xXdPsnHFX6SUff_1vbsEmGCHdZcXAmOumiN8EMar+KAA@mail.gmail.com>
Subject: Re: [PATCH v5 03/17] mm/mglru: make generation page counters atomic
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Kairui Song <ryncsn@gmail.com>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:03=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
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

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  include/linux/mm_inline.h |  6 ++----
>  include/linux/mmzone.h    |  2 +-
>  mm/vmscan.c               | 26 +++++++++++++-------------
>  mm/vmscan.h               |  2 +-
>  4 files changed, 17 insertions(+), 19 deletions(-)
