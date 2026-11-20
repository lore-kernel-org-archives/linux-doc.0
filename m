Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162923;
	b=39DRr3m9421wbdhmOrTzeSf4gSNbqXkVvl7pT10Kz8f4TWbHPTtQesX5KZgTEgppdBaC
	 0tovWMG9KY3tulla1YA+yIeWsnrI2VBIAprDF2PKR9+BQQiPrHH3Hpv3Ql8Dbkk6xMt4p
	 +G4pPDeU9xABYRMYO4yMqJUTe0C+qWOg+cdOrb+6s1ISLLEQ77tKtStDXZhe4b2SBNY+1
	 D8WfJhlYsXyTNRIhmPDh+saIBolvP1umUz455sbaRqjy5AxNTgBQwQaGNRoi30cF2fzzQ
	 KvGteR0qkmXrLmsMxRX5fSdhxh0BJLoSgRRziGql3T3iiG/q0qhVWOhfeGT46fpU8Uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6qaWnWddVt0MJiy+92iRgvW/WkoPo1PC7CtoH61AXG0=;
	b=QVj2C2Y5XKsV++ocFPygv7VOuF30Ai7o0GU74Z0RvP1mpx/biRYbwJoS6Jc6ygEtdqdb
	 KpnYsOaFapbl48idTtYalb8prU85521GINjT7E/JvT4tf11sf8JA+r6fbi9Ck4fqNkvZr
	 jJiBnwDY2cXJPQlH85b6DfBrIrnk4WPnYULGiJMFmtKU+g2Z9Sa4e1ErqaMMZ6KV/NZA0
	 cYT6JNyv9q5pK0DRtwzxt8muIP99B8aQqXGAAXs1MHjqDJk3k6ZNinsFncP60MkN8v+Sx
	 s6Hu2rTSnXD1vj1+TjvolnHHAosLsDvUEe5qa83aGrD+LEO2N+lhscoka5nzQNog9Hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lfmZvxA/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC047606A326
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 08:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC047606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lfmZvxA/
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so910966a12.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 00:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162921; cv=none;
        d=google.com; s=arc-20260327;
        b=FmayNfl90hm0LZMjDSCWqeBSJ8oHT6xHjToKXQoobM52STMylEvtT1mobPnkbki4R8
         GQRMJsTIVDp1pSCemwgZ6FqLnMB6B3X1CGAjRewGxjEbW8tlxk+41wlUuHs2A11rZWWx
         pYQx1jZzyXQq0zEpxNDLg7S31PHPD8ICJJXYzrXPp1QlYidtYGyiWOjAknEqGNuvlGuO
         q6uCjnrUPulMPnD1SxG+pzfqwip3csaGNFhIy4sAQihfd+5WIIt3VPGM2rD0y3V22+wG
         vt7xHJSc4JZMRK2Bio9l97WYg3nEHaYCq2lPiUXSoF3vgJcwGhmGrKAHqucZGTSrupiw
         yCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6qaWnWddVt0MJiy+92iRgvW/WkoPo1PC7CtoH61AXG0=;
        fh=xK3oS7+YulihL5nZS/N7CurszK0HBuLi7ORAgqgTz20=;
        b=luVKeyn639pBz/s3POz/RYR4oA4iUS6I9FpTxQN88MJZ0wvFqhCHiY/7yedWtjHHAh
         5X+Tglh1oDgBzWN1JtE+Qhu3EjPiH2wjFfKGLQu9jaVzy3a/3yVy5qjU6hhqon09U4ox
         IZLeHceXPpYDfyIPpwEhBCMw2HS3L74BjYeRPzW0Pkc1cFAOgvI2VuVKymBx7mbxqEB3
         ok1gPgEIO9TX7R40fxtNCOqCEx4PGtQSffdVdWyLJiS4m7OSyUeKhiGlfMsBqHQzncJD
         59t+oMP+4JNki6Qv/Imq64SNu4vc5t6bVDborq/qlCpqZ/QOSkGhHkwcRndCA8XP/P19
         VzqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162921; x=1795767721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6qaWnWddVt0MJiy+92iRgvW/WkoPo1PC7CtoH61AXG0=;
        b=lfmZvxA/1HGejNGMYWP3y4EqkZ6pBnz7SLZBv3rujos7mJOt7yAdi9yA+9b6S4jk+D
         ipzGPH9AnJr9Lqj/mvk32vCLkbD+rSP/a7NmQ7Dljdvin4dNwDXjQlU7ei+YYomRNWGI
         90F2j7LYpKCgJSjIXyqCm8QOtOLplCl5bbWN7HZWLDXyutGBAlMc1WTKyM1wyO5bhBn9
         46YL8OYmDmto9N+M94yif75del23Y6bMpTINzOjQDDII/YdtZD7ugq1c0AnEhrXdUfnN
         vUohWs7UdgYxVJUj1GtsmBRsCs2g0B/QliBO4iXaaSJ5yPmpynI27gB2rgJm+q24d2SW
         wMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162921; x=1795767721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qaWnWddVt0MJiy+92iRgvW/WkoPo1PC7CtoH61AXG0=;
        b=sCRe2hQ4mlH3VIebwuFnoKHb8tEZctW+BCVZtkxNLXT5P9AylpvjezUFMVp96LQsZf
         zuFqCMi4uHxoJ7B7hJupqeB22xEsUYUGcxzp4H2wNx5neIbAXF6Un1BERg/ik1WkGBP3
         TfPPVStjZ7fkC1vnJaPawMykySyu2m7o8BJZfTB8bUBbK/+9kLDsdjwSTo9lj+TIZPxz
         JUiKC6yXYGlvC9F8EnsuTAgLqREx7J6ikDQfuillJSR9TJx1azdio1d56C7Lae1NYTnA
         F7IWvS0ycZzbF8mtKHiB0ZncJUwK59IqiYxUi+kEGVeWsbOOpBQozCBn1M9w6l89Lgwk
         9wDg==
X-Forwarded-Encrypted: i=1; AL+hErFxDqaqqTlTZC0uaLBIe7FociDh/f6Zg86/ZZyPo0VeTh4ZkPUcO6x5Gn7oyAwyep/3FM5H7kEvW9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZkvhxKtv+m6N5sUgqdrGry+4t3YM+IKiZSgHYHy0el9qErr2J
	/jAdz+2onXi//iRJlXonRj14ImQHaTPyIdhtdSlnQtf0MddMo4b3aQe9SZFlW8+J2/NfXNImOw7
	2sJdZQLYHSZd4yrED/zaa5nu4+L1V60Q=
X-Gm-Gg: AZFdTZfTJCjj5wSFIE6wbiD7+a9/n3D9rl1ymJvKCKCFLnVRZr5+6uEsOt0+swhdxUu
	vRE2J7XHb2rXmMIiXd8w9zDxa4sST0YhblEdOd5tLM9vbK6ccy1d8DlX5Ebg8Z3szNLL4ou+DKS
	l5VuFklclJNH7rHGboUZQPVgthxFRK697aH1ahpjTb5IB5TTgbQcsD8NZIsfmOH0BjHVfAbusym
	+WkpNHSHeUOf6Npw8OtdiDGhbejY9AB/alFY1heh6Yj0gf1XdTA6TMr5IUidMAnuGSVNmbcNgg0
	YmvJSdw8I0XXAmi9cztKSFGI3XwM092WOnNDiz0G5ye/5HpATn+dbFmVfFc2EhEhOattoW8VIjq
	q8Yjz0y4nwpQMVWTuoF5/6KztNTIK9uD4dZ2kK4OWjd0WTuBohQbOgAIINrCDDY0=
X-Received: by 2002:a05:6402:2105:b0:6ba:3738:aa76 with SMTP id
 4fb4d7f45d1cf-6ba37ec713emr1520051a12.28.1795162920798; Fri, 20 Nov 2026
 00:22:00 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-12-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-12-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:21:48 +0800
X-Gm-Features: Aa3M54oR841ct7toroFKb5-FMop-YAlKT3qgtmdkpn6S2_l60VC8mi_ZrcEbsCc
Message-ID: <CAN_Opa8SFEzeu93GpJY7OkOUP5AeB3P9_8MGuhi6JJnBQsA4Vw@mail.gmail.com>
Subject: Re: [PATCH v5 12/17] mm/khugepaged: convert to LRU refs based
 operations for MGLRU
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
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
	Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:03=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> For MGLRU, PG_referenced is only the lowest bit of the folio LRU refs
> count, so folios with nonzero even refs no longer have the bit set.
> folio_pte_referenced() testing the raw bit misses hot folios at
> refs 2, 4 or 6, under-counting the referenced folios of a candidate range
> and aborting otherwise good collapses with SCAN_LACK_REFERENCED_PAGE.
>
> Test the refs count directly when MGLRU is enabled, mirroring the
> smaps conversion.  The classical LRU keeps the plain bit test.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/khugepaged.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 4bbe319ef86f..68f7a30e36be 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -579,7 +579,9 @@ static bool folio_pte_referenced(struct folio *folio,
>                 struct vm_area_struct *vma, unsigned long addr, pte_t pte=
val)
>  {
>         /* The folio was referenced previously ... */
> -       if (folio_test_young(folio) || folio_test_referenced(folio))
> +       if (folio_test_young(folio))
> +               return true;
> +       if (folio_check_lru_refs(folio))
>                 return true;
>         /* ... or the PTE mapping was recently used */
>         return pte_young(pteval) || mmu_notifier_test_young(vma->vm_mm, a=
ddr);
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
