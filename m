Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162830;
	b=ZnEXWHP7oMk2zPu6g3cqO5txAAOVNlQs5hqN+/Tg+GEaTcnxpj55bmFX458TCocnA/yb
	 HYH6u2GYtTwytjgud8fmlJ8dddMY/Y7UtoN8Uz/UPzaXWEgt1Gfz6YwcnHA30iQF3GZfE
	 lFhKyiG0O3pIB1MwEdEyPzDUSXaWyqYAUAs1UeCpQrMHCVaAMHSpHWzoNuQ/VSNy6mRKE
	 2wIU6LMvWjnqMiOoO2k4qwVTHMQ6fB1xMTtDqpM3KmQ2Luk5FXeucqD+zI0PEoq+ljxLe
	 9Igc0mo183zDtlX3Q+BbLH9NGrpFfzn/o9uH42OEi1xnHlQ+o0SuGFfBQibT0cfQvYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ud3dyyf/JEY/R/2fhpQWVjOi5aq4aTlLAjlkAINyk4c=;
	b=t8XR7SQnGwJpca+3fwjM18Ic0U0hwvGERvzcgc+bbioVW0JxKNQjOF+4/7NUVKa9GnvK
	 8Nehtq8/RnTAeaMDdnZvNE8zjZ9stC3FB6P3EIuaOhzctgFbjpb/pILN6iZ34Lu/HXLyM
	 qV+wcHJ9DL3lpeH9Nzg9pSyxcbwUnpqHIY7uYgYGQaQiZrjuJznQ5ByOSkVv/l96vEhfv
	 MRi25Qa/iVgJTmaBeLXxY2ntdcUS0Ndjw4aBNH8AmHk6uD/9KNqGaVkwaSWT3saAqOcpF
	 2AAZkC2xj4GYvqRUiHHuy8un7AS8q2B7dPdcpXrUfDFRfljIYfkJYxOQnrcUaH2hazQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8HoSI7f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C1560A2603
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 08:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C1560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8HoSI7f
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so13624225e9.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 00:20:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162827; cv=none;
        d=google.com; s=arc-20260327;
        b=UbWa4W+izNuuOBw6YocINQEh491sKyoXUy/gy0LovqsHagDWyMI8uFO5sb2ccTVBxZ
         KZifIc33c++zsBHUcXma4slm0CkX46eBYuqdKk8kIiuoAXzwxGOGyWWlx6Dg1K8DVgOR
         3w8StUj/S4YtoZoXl3ih0qVJmiRhITWg0eNP+21d/qbr9688erGciqYMknAWR4ItosNH
         XkhBGZtpw0NYQ+HDHpSCyk9MmzZkdbHwkaL1mRn7cOZvtvET70zqjHK8rY2o+iNyLOnw
         3qlGEQ8qTTHoe094QeCp+Ih7cTjIBoL5j4hwumbO6NzYNHQCuHZJZNs77UcA2yYDMJFz
         x++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ud3dyyf/JEY/R/2fhpQWVjOi5aq4aTlLAjlkAINyk4c=;
        fh=l1C4DmpXV8cYcuzl8sV8V8H6CqMc48d14RdiAnQohyU=;
        b=hEDM9oKPyey2mQx2NNIoj4l7C7X5P1U89Q+iu05/FfbYDQp+4OdDc59sWXfJvVEXiq
         Au78+JSqdn2NHG8ko4RzLhmij5pQE7I3h2Jw4ZmbHvhOwex8i2eSoxDdag7OTr5uMj3A
         6hVaSsk8MEZnj/H8NBi/y0h18Xp6+0j/jsA2aoy/mz6t0x+MguI1MBZoxw+asHK+/DjM
         UGuTioXeXQjFybQOvehB4gN37uw/7JqS/2WJkxYz1/40G4vdzOFM2AUrCw4MjnAGoSu5
         6qPLGmKaERF/QfpPgtLROpJeUSokbGOUsqVU3j0YZDNaKLZZ4yergcO0A4j1GzwanlLD
         M+7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162827; x=1795767627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ud3dyyf/JEY/R/2fhpQWVjOi5aq4aTlLAjlkAINyk4c=;
        b=C8HoSI7fmzQqSFOXS31oD3FBLkxhz9Ruego3Dv1D3lPfU8LERi3bOVkE94w0HiSOnz
         Q2sQUYXxgTh1jIlulfxC2RSVcBvHlWBQKOOb+VVwD5MG9/Yyy00BbNSEb2o1LmJpvot7
         glPZJ3rY1I6sFhRlA46IqU/mdSBy0EjvpwkbzcydC4keBozMmPNXwgutpB3w9VEsM6JC
         bUwQaYX4lLQ9QMptax4kLlFUTcVxcQt7Fq/9pLSffdHgGQJyMGgTUbyYNVSPUJ7SGQ3d
         okHWgDdJ7gT5RIroMQ7jmBqmfPmkubd3C6mnFeXTYA7xoL7nxmXZC0bx1qeKCAN47EjL
         OKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162827; x=1795767627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud3dyyf/JEY/R/2fhpQWVjOi5aq4aTlLAjlkAINyk4c=;
        b=t4rGY8a11XFUMa3pdpU7dhIKg1w5mXVG9l1iMDsCrW4bJyreBppQwRb1n+h8a8WzYL
         w012vrAT11PXRKzTPQeHz0psoDV0NZduebUup7h3a04i6dYEhYUQzaCOFDdJ0lOrVJRC
         QuSv40tpKoNqNVtmVxhL6iPD/Y0yjkrTvlJzuP+UTIY6iZup1no0JH5GETCiXV9DdL2h
         S5ySHlEEP5cCLIS06we5jrC2DfWUfPGu94VVieeQcfoohGNtsaGngVk+jFip1nMQ3KjH
         eObMFfZJv/LvL90cpVU3cnNCEDZXAj/BLSk/v5YMtxw4Ie4R1oUuSCU6BB1Nh4ON+hJX
         5fog==
X-Forwarded-Encrypted: i=1; AL+hErFWcd2tvNcZ4zWDyyhGQ0/NmFNWWnShPHBeFFP+hpKTtMeN2TbWOv5ieKWi6xmiGLhS+XdYyDm7WmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kBw3IA7KuiwPPX9ixCsipgJKd0Ca4pPDgttNef4bmVDhplO4K
	Ajwgn4YiU3W0O+LTDilL6yqfeXKHExqDtuQzYXEt92MMuDKnZc1/TyYEFX+fUldbpF5QwagXpUI
	8YP+c+rYGher3hWgvhcLaJ7+5oRt6zak=
X-Gm-Gg: AYBFou22tFvBwMqurYMvBSm0dQ/SrOkOyZzCG5ajfuYI665szrG7eBV3NcvpsL/sX+l
	EqsJku/xufJyddD+5fONCIzT9fQ3u6waLYMo/eu6t/EyRn/DY0yfdeIlTEQos9n7qdijamXM7QF
	PPQOJzAN+LWQvZJGZBr10pnZH/aMOXoMsqE6GRuCyfdyEPKMTGjtTN8/FmFNg9kpZ1h2wIze5gx
	k2dUw6syTOUn8MzVbLTABsIZQB8R9934f+djxmeaWhp8Gr9HfpHAXsTD3k/fT8TH/lSPlj9fzn9
	WyBbaZHqFWlRPp7HJjrGzxbAQuB2+s0MUbiVTD19QbUAbbRKGTwloW+bcmU7eeUl0fqP4CPTvoG
	9QIBH3CX9M2t5QRtEdgSXSYn5aIM2cOaPV7eG28VdmP9SHDdDB3GY8yVlsGFBPCes
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id
 5b1f17b1804b1-4bb887fc396mr47908935e9.3.1795162826538; Fri, 20 Nov 2026
 00:20:26 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-8-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-8-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:20:12 +0800
X-Gm-Features: AclHuK_oxtudcnoh95U_WO0vrwwpF-uDqqiNW6HAKd9dIMedRC4HEEVfEGFR52A
Message-ID: <CAN_Opa_3vb54=6pMeRfzBpTmXG0Bfprhjw8H1mzA8NZ4c51U-Q@mail.gmail.com>
Subject: Re: [PATCH v5 08/17] mm/mglru: move add/del LRU size accounting out
 of lru_gen_update_size()
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
> Pure code shuffle, no behavior change.  lru_gen_update_size() now only
> updates the per-generation counters plus the promotion move; the
> addition and deletion active/inactive accounting move to
> lru_gen_add_folio() and lru_gen_del_folio(), which know the generation
> and can apply the active-window test directly.
>
> The unevictable case is untouched: unevictable folios never enter
> lru_gen_add_folio() and keep being accounted by lruvec_add_folio() as
> before.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 180db43c3a85..b15c3618a1f2 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -322,21 +322,9 @@ static inline void lru_gen_update_size(struct lruvec=
 *lruvec, struct folio *foli
>         if (new_gen >=3D 0)
>                 atomic_long_add(delta, &lrugen->nr_pages[new_gen][type][z=
one]);
>
> -       /* addition */
> -       if (old_gen < 0) {
> -               if (lru_gen_is_active(lruvec, new_gen))
> -                       lru +=3D LRU_ACTIVE;
> -               __update_lru_size(lruvec, lru, zone, delta);
> +       /* return now if not a promotion */
> +       if (old_gen < 0 || new_gen < 0)
>                 return;
> -       }
> -
> -       /* deletion */
> -       if (new_gen < 0) {
> -               if (lru_gen_is_active(lruvec, old_gen))
> -                       lru +=3D LRU_ACTIVE;
> -               __update_lru_size(lruvec, lru, zone, -delta);
> -               return;
> -       }
>
>         /* promotion */
>         if (!lru_gen_is_active(lruvec, old_gen) && lru_gen_is_active(lruv=
ec, new_gen)) {
> @@ -391,6 +379,8 @@ static inline bool __lru_gen_add_folio(struct lruvec =
*lruvec, struct folio *foli
>         int gen =3D folio_lru_gen(folio);
>         int type =3D folio_is_file_lru(folio);
>         int zone =3D folio_zonenum(folio);
> +       int delta =3D folio_nr_pages(folio);
> +       enum lru_list lru =3D type * LRU_INACTIVE_FILE;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>
>         BUILD_BUG_ON(BIT(LRU_GEN_WIDTH - 1) !=3D MAX_NR_GENS);
> @@ -408,6 +398,10 @@ static inline bool __lru_gen_add_folio(struct lruvec=
 *lruvec, struct folio *foli
>         set_mask_bits(folio_flags(folio, 0), LRU_GEN_MASK | BIT(PG_active=
), flags);
>
>         lru_gen_update_size(lruvec, folio, -1, gen);
> +       if (lru_gen_is_active(lruvec, gen))
> +               lru +=3D LRU_ACTIVE;
> +       __update_lru_size(lruvec, lru, zone, delta);
> +
>         /* for folio_rotate_reclaimable() */
>         if (reclaiming)
>                 list_add_tail(&folio->lru, &lrugen->folios[gen][type][zon=
e]);
> @@ -432,6 +426,9 @@ static inline bool lru_gen_del_folio(struct lruvec *l=
ruvec, struct folio *folio,
>  {
>         unsigned long flags;
>         int gen =3D folio_lru_gen(folio);
> +       int zone =3D folio_zonenum(folio);
> +       int delta =3D folio_nr_pages(folio);
> +       enum lru_list lru =3D folio_is_file_lru(folio) * LRU_INACTIVE_FIL=
E;
>
>         if (gen < 0)
>                 return false;
> @@ -445,6 +442,9 @@ static inline bool lru_gen_del_folio(struct lruvec *l=
ruvec, struct folio *folio,
>         gen =3D ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
>
>         lru_gen_update_size(lruvec, folio, gen, -1);
> +       if (lru_gen_is_active(lruvec, gen))
> +               lru +=3D LRU_ACTIVE;
> +       __update_lru_size(lruvec, lru, zone, -delta);
>         list_del(&folio->lru);
>
>         return true;
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
