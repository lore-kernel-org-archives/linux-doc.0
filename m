Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162856;
	b=xjka02dfVVoUczj3knksCTubOoAlEK6MTXSrElTv6ZwWKFGNYwCz1psIgnNzo27q+wK9
	 qznIcrsdeM/+wB0e0lzrgBug+pozK1GDU56pv9YJ8oEi6F8eim9pSr2zeNDegu7XiJ0ft
	 55ZgKNnDPVw4UuOd/bycVmRxHm/hssBprzkXIdT6ES/acwQEeQ7+zq2xw4fXLYv5yXu+c
	 +UB7iRVvMht5dACHLGsqDu9UR3pZxWrrubyB1l6RPVayY/n0ZXvDKW/znOkLsZQvlLTHJ
	 fA0Lwg+fa5K5VWoa8dyGpcZ4+Wh50CaGH93ta7+yV09quvOsNffhTC/zePMAaWn6ByA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dg/jopXxk1E9Yu4E4faWsNPyyS6g9t3vWRabNCt8U08=;
	b=YYF8oSB88XUVG91JCk5z/ZFKJLnrC8e+3qD0crLrM3kPD94SHzh3piHe4pIoc5CU1SSk
	 xOBNguvwX0Xo3WaawJrj5zor/bZysQvkH5KWS/EUjtsiQZs62wk8fQnMEHOrntEaIfPgK
	 Dz7ULbrwF9X3jEmj5hVEdO/NhTtFVcPDmVdZbceO69HqfKaDxVZFxP7iXRo7bOV+m3tUb
	 ba2MgVAzO8GknG2W1t0/6VWuI5KKY0Zd3PZM/pkvOtMdfiIq/Ic8Fwt97syWDz6oh334m
	 83d9kBeMIRvcfs72odwuosJTTjEISRdAhy8iSs4fgnLwMYH6TOL7gSV/nGm3nb1WJdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="az5K/zBC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7918B606A337
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 08:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7918B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=az5K/zBC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso6350285e9.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 00:20:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162853; cv=none;
        d=google.com; s=arc-20260327;
        b=EWtek61PsO96jjTfL989KGhH2Hfxu9YDej2nSc42WpwLiLscSyfu1feVbQ21TVBMdz
         lLyIU6qouvhSwEGMNSro/E77vMO6HIpzotm8hsaClveKICK0Edq24IOcIlc1kUWRpWE/
         j+AbrlAhLH3gLe/jHw//bZdaQ60gz3BsCm5LA0hzl057GCEBU7Uubw2IcFZTKgUVGebB
         JqAHXaWwY9I1cLRTuz2ENkAFWR9OcsM8feTtRw5VOrGbTIs/OOkg2U/EsVuh8jmYgXN6
         9jqzUdUP42gWEQo4XwA2MPVUVWjBgSQX9UMyAe444Od+IIwLKvYFi6/RcO9loDCsYjni
         R4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dg/jopXxk1E9Yu4E4faWsNPyyS6g9t3vWRabNCt8U08=;
        fh=MIpKcHuR9DlFxpT9EskrS+3DkeGCiAXwo60Y8ah0Unw=;
        b=ZdxT3XShlui8bnD5zgRszzbnNt/BGphc81z3no7f3HksqBctHu7c9NbzkrGeW0ddG+
         rQ4AeIAeAUG4vYMeyF+ymUVxZo/Csi3c9uh+sll6Oml5965L5GHXfzTo8zt4Wian29HF
         KaqrBLoU+4BXt5R8biAInpSEJMg6JNGPTJACTZ+U+IrdKtZ9fSjZb2KGekucYLMk3TPP
         sa50ygMUV2hyYCOcDlc0291LHdWmjW1WrNEchkQHOkOlAvQRxrmc1qTmGOYldmY2hKhl
         bt9MfNoouf7dBbEE8QCrX4JEYyPwDogPqIK43q7Lt59pfCFL9wHuS1RnPn0g/Lme6NKk
         Qcbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162853; x=1795767653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dg/jopXxk1E9Yu4E4faWsNPyyS6g9t3vWRabNCt8U08=;
        b=az5K/zBC/ipw8cIpvmCDPlExgbekQXMk9qeMOJUnBI+k8OIm+upU3lWB5F3aimivlR
         Krs9xUXrh5x53XpmnQpV/WNTdyfT6Peo7lHnb/nfdG/gSpwcmGgZZ1Repz+zSnYK/LHK
         6t3lmTZaxSQyuh/+taCFNFEaJXVzU8/8H3Lc4VgFq6pZfA4gwblZhrwDJFiGFmQsU46/
         5gJ8r5zfwfUMnRK5XDwj8hkl+Gkr2QOvSGSaPDH8BreuWc1UuGznUFoBT/MVnPuynuKU
         8Z32GKM8dbM2mf84q9Tqh7GjbLuM0KN35VghcDZo4ASn200L30eD7YHtTj77Pjg36dmO
         fw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162853; x=1795767653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg/jopXxk1E9Yu4E4faWsNPyyS6g9t3vWRabNCt8U08=;
        b=yPpTrye1Y+vRmopxbrWJZWw4S9khJrQfEi18Mi1HAGRpBdIiCoJ93fj304XSrpKXxi
         0lwHiqP+aGQXQ8qlr1qsvCO//PCnedaqTz00l3iX4MgSmVGiWV57QDR5frgo2HDUkZbR
         rDHL3NL9TXI08FLGr0YtqENc32LDdl0WKTKUUAVK+FYz8AH5jy/kLYqkl/Lh4g6Vfxf/
         KGKBBLUM/mKSmHRVnimnQvvvrIEhF6SzwPOcQ0sbkHecPZi207ghOCvEAFze261vxVYS
         +Kmr4yDTXPXAWIViT+nE5FNe4Wg0shcU93NWt43NH6QbT6LrPrn3HwpXijJ+qLhgV4oU
         T+sg==
X-Forwarded-Encrypted: i=1; AL+hErGeVt5QS8sBlPm1WxGw4TMMYC9fuTdm/lVVqnFQs294rA2qDjYzMjdTYFuJCzyxNR6wNZ7mcOXzqiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kmc9JmknlK06fkpP5RPGzcNqqLcW/2LryBXKEExbJAbQjrn5e
	AAEXVyoANB1l/ZNjk2RErUP0XR8IsucbhUva+gVdLgIgcuLAbrkaG70FmiUK8kBl3F+yU2SBdYz
	Ww/J8lfjw4++5OixeVf8RmK3xqXnd9Ao=
X-Gm-Gg: AYBFou0/Ohw9CyKRblUoy6gqx5LgTV3ovZW0OiHngCSSdmG4iKIiHbPWApzk4IquCJ3
	kmTcTkznvnkjmtNnxCGx93RuGN1kJ+vB5NJvew6/gKqlnMouRSCYZeZkNDDMjk7LE8xVSDDSzK2
	kpaGpAPCs63Ihudn4srwJW8L7HK7eW5AYNuSYZnLXB0zvTK5SDLtuD7Fx9Pe0yXAc4sbtBhYQxa
	hfyGszel48QkEYvZydWja8GjI9mdArGK9Jgc/X56NxGmdjnWcPcJxYsU5fMZDDSRd2JFHz4u/Qu
	n73ryARfhPpAB8H7q/ThNpm0uW+bhXii2gnUpy1ynIZTl8gFaFyAIUDRNMgWqdlSpIysxLRdIME
	VWzrMjGkEz3jAcKNFPYCNNdzBrabcR+oGqiExBgi6NZ3JsEYhHsAhwcqL75rjofX543Z/zULfl4
	cd6krXJW28
X-Received: by 2002:a05:600c:5303:b0:4a2:1655:87db with SMTP id
 5b1f17b1804b1-4bb88785d2fmr48529755e9.0.1795162852274; Fri, 20 Nov 2026
 00:20:52 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-9-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-9-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:20:40 +0800
X-Gm-Features: AclHuK--KpLypcFnORd8WwLwhQcGdUQKeMSvpl7k7o-cD-MnrCJ80Uob7th_vPU
Message-ID: <CAN_Opa9CuEB4NiE_+c=033ziMxqo243Ev3JB0_ctgk27kD-GsQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/17] mm/mglru, gup: mark folios referenced via a fast helper
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
> Introduce folio_inc_lru_refs_fast(): raise refs from 0 to
> LRU_REFS_REFERENCED via cmpxchg, or just set PG_referenced for the
> classical LRU as before. No counter update or promotion is needed,
> nonzero refs are left unchanged.
>
> This helper only aims to be fast, it exists so the gup fast path can
> stay a fast path. The new helper doesn't account refs above
> LRU_REFS_REFERENCED but that's fine for now as GUP never used that
> or anything similar for CLRU either.
>
> Convert the gup fast-path sites. No behavior change for classical LRU.
> There isn't any regression for MGLRU either.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 25 +++++++++++++++++++++++++
>  mm/gup.c                  |  6 +++---
>  2 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index b15c3618a1f2..3323a3c7336b 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -483,6 +483,31 @@ static inline bool lru_gen_del_folio(struct lruvec *=
lruvec, struct folio *folio,
>  }
>  #endif /* CONFIG_LRU_GEN */
>
> +/**
> + * folio_inc_lru_refs_fast - Bump folio refs count without promotion.
> + * @folio: the folio
> + *
> + * Raise refs from 0 to LRU_REFS_REFERENCED and leave hotter folios
> + * untouched. For the classical LRU, a plain PG_referenced set.
> + */
> +static __always_inline void folio_inc_lru_refs_fast(struct folio *folio)
> +{
> +       unsigned long new_flags, old_flags;
> +
> +       if (!lru_gen_enabled()) {
> +               folio_set_referenced(folio);
> +               return;
> +       }
> +
> +       old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> +       do {
> +               if (lru_get_refs_flags(old_flags))
> +                       break;
> +               new_flags =3D old_flags;
> +               lru_set_refs_flags(&new_flags, LRU_REFS_REFERENCED);
> +       } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flag=
s));
> +}
> +
>  static __always_inline
>  void lruvec_add_folio(struct lruvec *lruvec, struct folio *folio)
>  {
> diff --git a/mm/gup.c b/mm/gup.c
> index 2b405cce2ca5..596e62954659 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2911,7 +2911,7 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, =
pmd_t *pmdp,
>                         gup_put_folio(folio, 1, flags);
>                         goto pte_unmap;
>                 }
> -               folio_set_referenced(folio);
> +               folio_inc_lru_refs_fast(folio);
>                 pages[nr_pages] =3D page;
>                 nr_pages++;
>         } while (ptep++, addr +=3D PAGE_SIZE, addr !=3D end);
> @@ -2980,7 +2980,7 @@ static unsigned long gup_fast_pmd_leaf(pmd_t orig, =
pmd_t *pmdp,
>
>         for (i =3D 0; i < nr_pages; i++)
>                 *(pages++) =3D page++;
> -       folio_set_referenced(folio);
> +       folio_inc_lru_refs_fast(folio);
>         return nr_pages;
>  }
>
> @@ -3022,7 +3022,7 @@ static unsigned long gup_fast_pud_leaf(pud_t orig, =
pud_t *pudp,
>
>         for (i =3D 0; i < nr_pages; i++)
>                 *(pages++) =3D page++;
> -       folio_set_referenced(folio);
> +       folio_inc_lru_refs_fast(folio);
>         return nr_pages;
>  }
>
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
