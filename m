Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162639;
	b=rHgSbEHd8lllIvvlzsAZzuOZVKSK/djNT34BvqRq78DeHWdWutavneyqVDBAVjqvQ64j
	 fIdeS8i96zfgYptW7GvENu23r/WZ1RA5zek8dqTbipoF7YjWsx7T3mpNT0sJHq6RWDI8B
	 LY4VQG2zUm3sizLZuNDU+6ZfRbQba3ro57TH3VLhw5rN62OLd1QvYu09c17hS9Qgxih5a
	 1hfUjZgz1Cjm7LoRlLV2xpYzMx5FGqGi/c3SoicrRfEnOU/cQrRJ2TOR0y5QY2lqNhd2G
	 UAmSuDnt5AGynNGgohG9mgGKFRlrqGpRMLfnlr9oeQoXdXWTWzHr6joRM9zX9uQSuZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I9NquCUCJSJuGXe0n1gktrr9r7y4Jk/ICWggLQ59hqA=;
	b=nw0DOXfxXmE5pQWxXI2APw2XFlFtnW/1YwOoqO8WICxHQvdkE0RuTklcfYQB1cXRz0YV
	 Vz8tOqdaVvIBCogcnRcZzYfKUkM6KS8lHysoTj+vNBaG/EGCgV66MgAYHH5aR0qXyLtLK
	 v1fhOgIPn62uLuJ6rUMayzQVGCzIiQ1f/NAwhfaw798l87zOI1oJdCgl+Wfwunt9NRf/A
	 x3XdFI7w1vsxBEayU2njqIGy0if6DYl3P9uq32CXCPK9Xgsn0xJNdK71rSJUvngJVFR9e
	 lFzTcgky3E6F82S0XUtZKwyhuZwjQVgDq5yS38TqFSlH1zQgjvTaMrz9dH1aFB2x8yQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qzyr9V2Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D14C606A33D
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 08:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D14C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qzyr9V2Z
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3513085e9.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 00:17:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162633; cv=none;
        d=google.com; s=arc-20260327;
        b=RN3LESBCMmPqimwG/GkeakM8ExlGbokH+R3gPvHiXrJffCfwhUKGpF6x1xPDqUqjVc
         bYrR/tz7zZwGXG9AEh87ZYBnInqGzdfUREns4k4VlPQk7tFyrTzGLBTC2ynLOzlquhgQ
         reWyFgGGsvLzynmf+GAz7BEw/5FTWB6BtlTAljdwqifsrZsHWdCXbmbr2KtrFo9EIdh1
         vdBig1t39ZPbz0RBFPMC2kLWmTiAGLI6gcRBN8aKFp0GPCDGbYBzMCCJJlwqB0y98HUv
         xVUyo3JQAysSMX4cpNJkFoKzketIx0DbFBN9y6sCaH+2gw0e81GroI3zWhJfGVsinQ1v
         /uEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I9NquCUCJSJuGXe0n1gktrr9r7y4Jk/ICWggLQ59hqA=;
        fh=Y3KebexqO3oAIKUcpNgXVQqE4QFWefSXFaupGLx8kE8=;
        b=qdwrFFJa5ce6HYwjZPWKK2ticxBZHVuH3WWz3/CcswodtBEvt6vPYBiPjfX1hYSjnL
         /NtzhyR2MTdN9dpPh4h6LBN0P1oGYvcRyQi8nonR19e5g8TH82Ohh4jHsGqmE9cGW1SY
         ELVj9TITd3KXvbPiK+8qhlCQUc7KpwHcds8tlaYOv66ahbAeikvWQK809Z4WDxqwvuaG
         aW2g2iSyidHEgaFcn2onhc328rnadn5Jx3AUFUhWu31N0PpbSuQ7ma6CAsOuMj+utW81
         DxBx0f7MiFpbqle95QCj3j00YL9UHKqqxb/R66HbOujMRo7ZIBKm2nkH0Cg7NeyeEtOh
         rBaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162633; x=1795767433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9NquCUCJSJuGXe0n1gktrr9r7y4Jk/ICWggLQ59hqA=;
        b=Qzyr9V2ZUUNAmMCtKFt7ZwiRQuhbO4ihXqXfeYwH+kUPtxrrZnUUi3M9pOrCOUlp4b
         xZC9ddeS7rgMOpmpaaJK04UfLDWEvvKzjPM4KC7W7DRfEJ0IsCdIUL3tlODHZZ6F9YJ5
         TsSQ4HqMX0Q4sGp7PgJCyp4Lpu95hdK7S7i42S3EVAIm5V2NDcQLOZKDLZKiXyDD43Px
         g1a8h1S+RnauOtF4eM8i8OwEdoFX9bILpLf/4oS++dAnRGRygs6qWbyP8H8L0RF1IKt+
         vuwcxO1dWmk14EDODYERIslIKQZopJwo9MixTm1ovAtNEgAgalIRczmkl8qD9fFXZflK
         ZU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162633; x=1795767433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9NquCUCJSJuGXe0n1gktrr9r7y4Jk/ICWggLQ59hqA=;
        b=wdjFukCBJjwm0PGTJF/qwNcfaU7H2mjl0A7xh9xN/ehzomWiTWtDMLetVZq3Vpx3pU
         A282zIx2vc4zxnJND8bXbCcQyu9tE0YGmZXSO+FcPWzF1clX9/WkAoZd6sJTDs3vy+kc
         KCRK5E5rMMZVEB5YmSKv1RHbStV6bw7+ZRE+8agANOMDBHJ3u6eRrof92p5zZVEbaWlJ
         Jl/YOtUxQqJxZ6HK+NbI5/VaESqCkrrz6TgWfYqoS09BURs+cPq6pV1mUJMZPzm0wlpq
         mJGsJI4I2iX8daaZviPgb2f9xz0O097bRilv+qO+s1UF+rTOnoFIx+0MEKuati0Nx0Ch
         lYBQ==
X-Forwarded-Encrypted: i=1; AL+hErEMQwko/yGjl2JX3CTZn6Dt0MT2GC+kUEPl0RG+AO0DrYZyoIX8GhulQdY4vzzAidfJwKaNBP/LYDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vw/zGgd8pWGVQGmlDG3HHhAth4CcgYgMVrY1sX6fWrMqiiFTG
	eNHJqlFpX3YoLJuh8VVnQyJN6sJwDaj3R18AbRxcGcjoFTKu1vM9MRXLn+uQMMPIIYMY0XhKUAJ
	tcjJicYtBlFlssmCIr1xqXnmA2LDS3so=
X-Gm-Gg: AYBFou3Rc3dfbxGqkba5M1WfXU+KzosebUYSmbP0FBKg+EEoFJmcuYU6eMNYL1ML7J4
	C/uFi0K40CBHSXSl+TFn+98w/tleVYW4lM5pUraY8pQLt/HAwyBQnZzeFXF4x1Mn0V7MxclWlMw
	Ih45q1e3z8rOEESkmU50Y6YBB3gx9Nv52BIQmWdoyJ4rdBXJo5Gw/Vzgx6PxZdzKA57vWefou+z
	yPpI0xtThrTlvTMkfs+rGRj4y5KUarocR5NOg+1+Cl+6VfLwlvK7VYfg2+wN68Y56aKJo4zOdtC
	H55ACNGDlBifLnz8uFuKgiOiXCKynnL9fbjS3TdYn9qzPaMEGZ/dFTm+86IfITiWEbWAxiy6m0T
	1tkgZkzMKJeLPJkph7JTOhhzgt+XZwvXxvBOhpS6DJTGsjGOD6OFDaOCxfgDs6+waYQ==
X-Received: by 2002:a05:600c:b8a:b0:4bb:7007:4a5a with SMTP id
 5b1f17b1804b1-4bb88817772mr45942875e9.23.1795162632893; Fri, 20 Nov 2026
 00:17:12 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-7-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-7-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:17:00 +0800
X-Gm-Features: AclHuK87_PiI6KLw_fxUiiW6AWziAjedbgzbNSGoCid8qtKuQuZJuSbue31J1p8
Message-ID: <CAN_Opa_mk5xH5LtV04f=ooQuVatjbEviN6jxkayAatzqkie4qg@mail.gmail.com>
Subject: Re: [PATCH v5 07/17] mm/mglru: make folio lru referenced times count
 a generic API
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
> Pure code shuffle, no behavior change.
>
> Make the folio LRU refs helpers available regardless of CONFIG_LRU_GEN.
> Without MGLRU the extra bits are never set, so they are inert. Move the
> lru_gen_* helpers into the CONFIG_LRU_GEN section.  This prepares for
> unifying the API for checking folio referenced and workingset status.
>
> folio_migrate_lru_refs() now migrates the complete refs count,
> including PG_workingset (bit 1 of the encoding), bitwise identical to
> the direct copy dropped from folio_migrate_flags().
>
> lru_set_refs_flags() skips the nonexistent mask bits when
> LRU_REFS_WIDTH collapses to 0, preserving the two independent flags for
> !CONFIG_LRU_GEN builds.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 55 ++++++++++++++++++++++++-----------------=
------
>  mm/migrate.c              |  2 --
>  2 files changed, 28 insertions(+), 29 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index f38dad1198fc..180db43c3a85 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -184,6 +184,12 @@ static inline int lru_get_gen_flags(unsigned long fl=
ags)
>         return gen;
>  }
>
> +static inline int folio_lru_gen(const struct folio *folio)
> +{
> +       return lru_get_gen_flags(READ_ONCE(*const_folio_flags(folio, 0)))=
;
> +}
> +#endif
> +
>  /**
>   * lru_set_refs_flags - Set the LRU referenced count to folio flags.
>   * @flags: pointer to the folio flags
> @@ -206,7 +212,8 @@ static inline void lru_set_refs_flags(unsigned long *=
flags, unsigned int refs)
>                 *flags |=3D BIT(PG_referenced);
>         if (refs & BIT(1))
>                 *flags |=3D BIT(PG_workingset);
> -       *flags |=3D ((unsigned long)refs >> 2) << LRU_REFS_PGOFF;
> +       if (LRU_REFS_WIDTH)
> +               *flags |=3D ((unsigned long)refs >> 2) << LRU_REFS_PGOFF;
>  }
>
>  /**
> @@ -252,13 +259,31 @@ static inline void folio_set_lru_refs(struct folio =
*folio, unsigned int refs)
>         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flag=
s));
>  }
>
> +#ifdef CONFIG_LRU_GEN
>  void folio_inc_lru_refs(struct folio *folio, unsigned int flags);
> +#else
> +static inline void folio_inc_lru_refs(struct folio *folio, unsigned int =
flags)
> +{
> +       /* Should not be called with !CONFIG_LRU_GEN */
> +       WARN_ON_ONCE(1);
> +}
> +#endif
>
> -static inline int folio_lru_gen(const struct folio *folio)
> +/**
> + * folio_migrate_lru_refs - copy the reference state to a new folio
> + * @new: the destination folio
> + * @old: the source folio
> + *
> + * Transfer the reference state to @new during migration: the MGLRU
> + * refs count, or PG_referenced and PG_workingset (bits 0-1 of the
> + * encoding) for the active/inactive LRU.
> + */
> +static inline void folio_migrate_lru_refs(struct folio *new, const struc=
t folio *old)
>  {
> -       return lru_get_gen_flags(READ_ONCE(*const_folio_flags(folio, 0)))=
;
> +       folio_set_lru_refs(new, folio_lru_refs(old));
>  }
>
> +#ifdef CONFIG_LRU_GEN
>  static inline bool lru_gen_is_old(struct lruvec *lruvec, int type, int g=
en)
>  {
>         unsigned long min_seq =3D READ_ONCE(lruvec->lrugen.min_seq[type])=
;
> @@ -424,20 +449,6 @@ static inline bool lru_gen_del_folio(struct lruvec *=
lruvec, struct folio *folio,
>
>         return true;
>  }
> -
> -/**
> - * folio_migrate_lru_refs - copy the reference state to a new folio
> - * @new: the destination folio
> - * @old: the source folio
> - *
> - * Transfer the reference state to @new during migration: the MGLRU
> - * refs count, including PG_referenced, or just PG_referenced for the
> - * active/inactive LRU.
> - */
> -static inline void folio_migrate_lru_refs(struct folio *new, const struc=
t folio *old)
> -{
> -       folio_set_lru_refs(new, folio_lru_refs(old));
> -}
>  #else /* !CONFIG_LRU_GEN */
>
>  static inline bool lru_gen_enabled(void)
> @@ -470,16 +481,6 @@ static inline bool lru_gen_del_folio(struct lruvec *=
lruvec, struct folio *folio,
>  {
>         return false;
>  }
> -
> -static inline void folio_inc_lru_refs(struct folio *folio, unsigned int =
flags)
> -{
> -}
> -
> -static inline void folio_migrate_lru_refs(struct folio *new, const struc=
t folio *old)
> -{
> -       if (folio_test_referenced(old))
> -               folio_set_referenced(new);
> -}
>  #endif /* CONFIG_LRU_GEN */
>
>  static __always_inline
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 28a8d7734735..c8c49357df87 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -796,8 +796,6 @@ void folio_migrate_flags(struct folio *newfolio, stru=
ct folio *folio)
>                 folio_set_active(newfolio);
>         } else if (folio_test_clear_unevictable(folio))
>                 folio_set_unevictable(newfolio);
> -       if (folio_test_workingset(folio))
> -               folio_set_workingset(newfolio);
>         if (folio_test_checked(folio))
>                 folio_set_checked(newfolio);
>         /*
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
