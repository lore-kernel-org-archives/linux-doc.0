Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163787;
	b=OuS6i0W+j+Tm89miMfb7Lh8k2JtjXI63AVGiT9WzZLmyJkrVO3b+0soiIrid0doN9+Uz
	 fTEradGx7I7xH4Vnf4wHPvPg/XdS9Q6feigDX1R5+lS4EhVPf1J7yc6LmLGhUkSYLG8Kg
	 Zh0QgMJkC1Cw9yZXqyT2FHzO5MRxs6dKMhvhftZXA5heZJeQmyGrl3boY/Efpm8hMMDEa
	 i2DkisXFWm+373Se2OgmuEWIy1rcYjUz14KGn7BcUtVmbhaXPDoUykPCTkWoEd6+e3G8w
	 GZRmCfe+CxnAl58EdZ4tNIXrrrBPme+A8nqIBNJG4v0RBs9DZnTwdoak8BJKETR8iiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3PBPgn34gFSzs0WFCPqDxaDrqwWGqL5ASuJDkNQ3rM0=;
	b=CSlv2QXzIryMKfjuvijLkYFyJt5th2BedhChye8yR/Xki65ycUZ2AhG7RPQB8QSd08Dz
	 +FO0JTJHNa0zk5/56RUSzcRK6A8+f2We+YHFM+RVoeNW8zryddSf/71D4TG+hZFVFlva6
	 NLqQn+nqW8Zibv+B8zFKv7n8xOswXSv32flBGdIe42br+y04H19ex8888dY4pqUY2Kyt0
	 K0/3xSRdJ3fe+OlLEOg5szjQ9Ai4yxW1+LE/ChT0fYzDl7yZ4DCKBhJJjkfL9bzoXFo2x
	 ERwqzB/wCsa/ZWCdem+h+HRRexnncbncDx8QV12YZKonuxv7EUKCTlb7FnjuUsW5Rjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ImBMdazn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25F9606A320
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 08:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25F9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ImBMdazn
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so804393a12.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 00:36:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163785; cv=none;
        d=google.com; s=arc-20260327;
        b=UbUc088hm3x8fnJ5l8LNuP9Y82bJrTOmQRjgMlypgXjtBxB/2a69iZzLvj2Unp9sJw
         6Ixyl5PINQ6Zctyu83IQuuCelFcNl5udMQC+dqJDAwDw/w4xIKBLEoKYU7drpw0ouVmU
         0oqOcyH9WO9He4llxf+L4iLY8ueFwns9NFHGNui7rGh00bmN9NitDwkJeYTqPyYnBt/t
         e4kw8ldVNa5fPwS39I7BhUxrPasfkKtFc6Rke1+JbEclkVg7aFFn4UDnodFFqTv2xSNm
         GguEI2zyhPz6AaHC0O4Bo85/InxuHkuvposGoN2cwW42Rem2OyN95v84W2hkSlQdaVIV
         grcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3PBPgn34gFSzs0WFCPqDxaDrqwWGqL5ASuJDkNQ3rM0=;
        fh=0DwqksQx0NWp/t9RyqhwtoqbF9Fm/QN1TTCsOD6BOjw=;
        b=HX4/fJknHqJgypoco9dAMIZoelFbuZZJISP2Xgs2DQnfMRLdJMB6xtzo0ke4KsL/yg
         LFqLyUVGpiwaN9Te8GQOHOAYsa8kqmaRCb04gtsGjcUbSrCMMZG+iAkas58Klibrty10
         QU0hiGF79MvPg2Wud/9V8jDgvKKC6VACQ1x1PNaHzkJg0GPAVFHFIN5SC7nH9ZYKPeUz
         GK+Cd1xpGu5P/jKEtZ1JE301yTOirV55AjcROxFPFISWcMWc5BVZxOYH3eL/aD5kgg0D
         emhkT80IatPC/FBNtxzEnalihLv09ds9ZHRtvhX5NP+ynzQJ8+SJpVZbiryjtTdNV+QB
         m2sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795163785; x=1795768585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PBPgn34gFSzs0WFCPqDxaDrqwWGqL5ASuJDkNQ3rM0=;
        b=ImBMdaznztdlFHVgcK3gAMDyyV0pcNV7fvYhgBW3KV+noAu2vzpbNhdEvct/3ocLVI
         lUwNtGAJOm8lKtewZ2mFrPYC7XxbTwFfJJQdPxXRENuA2KJjo7pGWQG3UDBfWccSGGcK
         96aqvTSLdBcrlnSk+YdVHvfAfvd+C0oQrQlnxb+dWeGHfKaxawFiYKDiYo9M+Dc3acB2
         VbfAz/6ecV5RU3JVc9LppKR8ykF2xQ4KrB95a4d8v6yleQ9sG15xD6vmnFmZvcJEsGg5
         PdCoE8pOeNlGAZ9T+txgl533cKpUJIkxuG2K/GiQASzc5wF41xFNnvyafs+tLegcyFTl
         wU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163785; x=1795768585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PBPgn34gFSzs0WFCPqDxaDrqwWGqL5ASuJDkNQ3rM0=;
        b=guVBCg8U5q9AqVbZZ3u+7vOFm6a6pkOKge9YQo4fXC02XaIUqnOw2xLh1EM/VquFqK
         eCo9v84WmBphZ9hgNzRIrNSHR+R46ZvfWEcPZMAOe9gHGipPE4zDdbSqtBgrWn4iASBU
         kgQp9DQEY0FVtV/T4/PqMnz6Ycq0PqlIs6n8ntKas1S7xRstj+NEWSn6rN5tJ99xT3SA
         wrjn2AT/9zrysFz6CGxj0lkVQkyi0UagFdSGHNdznQIAZZn7H5tYdrRegUdenG/6Js06
         87AY+ZuETbnj05sce7HL87NQnOQc4c4jTurgIod9XUW1p4B9ubOZKybLFjMVat3f8Dyt
         zPMw==
X-Forwarded-Encrypted: i=1; AL+hErHZgb9HlUqhN598PsWXZfUtvNpWdvpWhjD4grs7uLx70MyLs9LQvQ26hhPAPL5/UBZ4jueaCRRFlXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qFb/1cEsoBUWth8Sz2uHdsS8H03v6yXwyOl0ARcSC0OtRTcYN
	P8ogWueNj/Dv/NHlFsbcAryvfxYVLaP40IHYoUHt5RWeBrUvjq9DLdmXW3S4FqU/qXnyf7L+nWO
	4a9+BkVsKrNtDzHZeDCkN09Ot2IYpPn8=
X-Gm-Gg: AZFdTZcZMoJNxPAhr4JqR91oG4GGlwqe/y4hH6xqT0e78i5hguI7yYElv7/OxruX+gh
	/cU61NhmrPYMBnwWwZ/oC8V/GIFm1Et3mmAIm1gb0FgLUzdqUM4ysnlFNbp8q52ABkdxDJt7fWk
	9gtaCBz3gZhI88z9UH/+E7xGApxSxax/sVe8HaNmEh7BOnuZPc+erdcnEN11Eb2eVzqSSAr9oSe
	RNulkU/8GlLOYlo1IpoXZKvYMcw8wKPDbIRV2dR/fItzGFOGb2VWu3jAxK9VldkehWBDBLLzCRH
	wwjFgpIlyWcaWtScxsqTWpN3eM1LapBO4hCNEtpVXgbgdIE4NbOb0WnfIxvGHparSI0XPQPcV5v
	xrFEi0JTMlTNGL5WLOvHWONFmBWe66tRyZTrLdPabTWU+/u34+m43EYZYOoGJn9cD6Q==
X-Received: by 2002:a05:6402:1512:b0:6ba:12e2:46f2 with SMTP id
 4fb4d7f45d1cf-6ba37d18d2emr1237841a12.8.1795163784752; Fri, 20 Nov 2026
 00:36:24 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-14-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-14-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:36:11 +0800
X-Gm-Features: AclHuK9a_uzFGbOjQzRBvuGpHT7FEd2GEgizUKayktzr9rLjRf8PKuN-UHaqZ64
Message-ID: <CAN_Opa9qsHLGSPUjUJB5rCfD8T_zE8R1YpipcmYCqv3tGYuO1Q@mail.gmail.com>
Subject: Re: [PATCH v5 14/17] mm/huge_memory: mark folio as accessed more
 accurately on split
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
> The behavior of updating the folio's access info isn't consistent for
> huge mapping splitting or ordinary unmapping. The page table's young
> flag has to be translated into folio's access info.
>
> Right now it only checks and sets the folio's referenced flag, which isn'=
t
> enough since folio flag updates on access have their own rules. Ordinary
> unmapping (zapping) calls folio_mark_accessed(), and it also checks
> if the VMA has recency to avoid false updates.
>
> So first just use the right helper here to be more consistent. Keep
> accounting the young PTE as a cache access, sticking to the current
> behavior.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/huge_memory.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 0d589be136d2..1a415a6704be 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3104,8 +3104,8 @@ static void __split_huge_pud_locked(struct vm_area_=
struct *vma, pud_t *pud,
>
>         if (!folio_test_dirty(folio) && pud_dirty(old_pud))
>                 folio_mark_dirty(folio);
> -       if (!folio_test_referenced(folio) && pud_young(old_pud))
> -               folio_set_referenced(folio);
> +       if (pud_young(old_pud) && vma_has_recency(vma))
> +               folio_mark_accessed(folio);
>         folio_remove_rmap_pud(folio, page, vma);
>         add_mm_counter(vma->vm_mm, mm_counter_file(folio),
>                 -HPAGE_PUD_NR);
> @@ -3227,8 +3227,8 @@ static void __split_huge_pmd_locked(struct vm_area_=
struct *vma, pmd_t *pmd,
>                         folio =3D page_folio(page);
>                         if (!folio_test_dirty(folio) && pmd_dirty(old_pmd=
))
>                                 folio_mark_dirty(folio);
> -                       if (!folio_test_referenced(folio) && pmd_young(ol=
d_pmd))
> -                               folio_set_referenced(folio);
> +                       if (pmd_young(old_pmd) && vma_has_recency(vma))
> +                               folio_mark_accessed(folio);
>                         folio_remove_rmap_pmd(folio, page, vma);
>                         add_mm_counter(mm, mm_counter_file(folio), -HPAGE=
_PMD_NR);
>                         folio_put(folio);
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
