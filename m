Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795397438;
	b=pVOCd9JLcWupNcyMESJMLGR+qVLdGLgZG3vxV8eWOPGmNuKcTCTcUwEdNguaIAAck4aL
	 sf4a2iPJVCrbnjOidmYyi6B0UDu87POr8WSoB843y2PANpSGv4tqYs5ZP7BJQftNNbuV+
	 jOe0cBexCsR22XDO/xuZUEUvWKtoBZyS22E65w/A1yTVsu3i7J4cL1VwOAvJWjhd+Djy1
	 VYrNeSnrFRLDrC/QC5i4aVmwS1tw1zdNaTAbzzDJvw9XIH/l14yMMeOC5SuJ7yZ/TKk0w
	 GjhoK0bnsh6HS4h/i0bjvOGnaMqMtAreJabvyfKfExI20ZNvJ0GE0QXsjHugB/nSVgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PHYlamw7fybYjzeLc3iuK4CS+fPI6wiuuTA9v+wgAMM=;
	b=GPIHB56OUcDnvH+VEKyQa4ufteiAqb41xlmDQwvvpK+S1e+mtiafxh7t0L4Hqy958puT
	 3XaO0+P6O3CUqRltMhjLVVAQd+WtoeVeqF1xs3SXnYwzM6wCZQHwQTcYDhrQv+TzEXw6m
	 0ZYxU5eEc3nVD0ff+IePjo+wXv+k8Qs4cHLvXxk9inwyUTheKC0pw8tpzaD4gDSrMoVyw
	 2ccwfeTKSGsY9lD5ePsfTjw1SDJHcFRZUgLxXzWXLJu481Ki195uXWfXU8zM9m/JjDl6B
	 lLHulTGhox7ogP1biRjR7B382bmRMjVQdyXyOfQgvu91s2l4zcl64NeJD4YmHQM7vmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMOdzkga;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C8606A320
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 01:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124C8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMOdzkga
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso14626695e9.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 17:30:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795397436; cv=none;
        d=google.com; s=arc-20260327;
        b=EogTUo+4sMG99T/lpQXtPW8iw/yG79n4jxGQjl9JbQ/atYTnC0rWHqFp+mS63vOaSK
         ezwttzz93eQhtPcNHQf3/tov0UfSV/AeiHnoQySZBRH7qCHH86qJlLLOwiELHBN6oKAt
         HBU4w5KuOyJkYPFJVsmNMBreEhAZym8a+XIaJRZAcTcjfJGcyE0o3fqdt8NL78qf+thA
         DiLpxmkUwjTDqQZ49wCAgQOzU0OYstgFcNu0kPXZQYIYyjMF4xw2ggcX3ulg9r1RLm9g
         X/LrPYdloyyyCa1V9FNnAzc/Gmbn6wM+kmR9dU4x53502QY+wuoKKZh4sLG7kH5FJOao
         67GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PHYlamw7fybYjzeLc3iuK4CS+fPI6wiuuTA9v+wgAMM=;
        fh=sTNM2/mYBgi2lCMHL4hSvkWfjWg2nSZ6bPNN2KkB+io=;
        b=T7hOewHTLBop7LziphrGDqZA6aHRJlVpThA0TQlpIPfRMYniBcYFopaXr3NrybqqIz
         p3LnJkrryWUtm2nNNWtPRMlt08Y9T28Of7CibFIvZgaF4gmtQtqJ/ceGGBNgcVBLt77X
         LCwF9nButHsUxJYb4adJaHMMEYj0QtxSg2ymivwIGtUYCZqZ9B+JouiLzKR2lxKp59/W
         Wn928LvG9q6/yKW8YwJtdVMTgeLeHbLlPKMk9Eq7yTatUVBACKptZT/FOlmGdtzLL3Xx
         v8OvLoDISwMih0jOxrL5uJdyogGIKSMBT6pfTe1AoKbWABQpspxod515d2xBz45qYTJ1
         WnaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795397436; x=1796002236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PHYlamw7fybYjzeLc3iuK4CS+fPI6wiuuTA9v+wgAMM=;
        b=PMOdzkgauSkSu06keInAVbQ1hpbuUbZlTieYOQocRbk2trdC3tbSifWCXpDjQmM5y2
         zTQHo01mJ9VTN/ldIe8a+icbQRaz3c11r9X6o3eJZAWX9yfaDWNMZ/SZZg9foXo+7wYB
         UvWlqTVjYL7uSYFjgTQPjciQfrw1tjn4ArrwFKviG6XrhJrYDszJhmBG3z0epuV8kpax
         PlzK6Wmg8BijSlDvgBM2ViDG8XehWTTJPzc6/4FJG8MYO2J7148gCIrGT4k7KaKPUvXI
         sqr3i+pKrj95bXE3VQCkbyw4dXFA5quyDBFerr9bW3TYzEzZfLeE8GJsVnv/Bbq6WYr0
         ZrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795397436; x=1796002236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHYlamw7fybYjzeLc3iuK4CS+fPI6wiuuTA9v+wgAMM=;
        b=BwAzpIJvCMSejS96yxjH7+/UU6WoeYIFADb3PFTxJJI8s14nUYp7embktUu7myF77u
         aP2lX558ZbXWs3mw9S5D9PovHkBmywtSj5MJ9uGJLZYrFAtnGb8vXRMh4B6JC0Fn95Wi
         HEX7GoRWGXYUEzt/vPWwKqCU/mb6eyLmXoY3cetjDMeMuWu0jT2CBEn5Qvn6ircGKkKx
         DN+41lqlmhG+rKaXmxMGdss+ldb2Be4yOhsgHfIaqB2SoeggwHJSFMvtpYU1aTCQwiCM
         sNh3J3o/rqxQHQSm1nAlOMoj91gtJxIcal7sIuN69DIUVAMsCQN6EFchaWD0vF9FuYSX
         TuXQ==
X-Forwarded-Encrypted: i=1; AL+hErHfhyfqkjv3F9uC1Lbe+1dyyTF9xve4gidUiZ5GTI7j0GkpYh8Hrccmh856O7a8Xdc7f3aGMcaoN7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BNi6h7n88ucXpy4EXUeu+pmSgDoLhFyllzI8UsU9um4O5pk1A
	z1TOVRVVjzZ6HrIVbhJa6JVjgXdgpvNfIx53ZoxaZ7t2gGw0AZYxx9HDw5ShPrh3/0q9fb2LGvZ
	XQhnFQV2Bk3VIf6GRQBc7AXNXqVfPU3s=
X-Gm-Gg: AZFdTZd31RQsqRYP4LUHJ+5PJHsXYeDczcE6/vSjAgg0rsYG3NUrA2uKAXCQxg1p4+W
	Y1a7MF3LsC0G7zX9GlzgXbGImU25p86GJrSV6likl7RPZ+3sGnwdrhq6s7xaxyeNecZHr9d9lpG
	6FMoSbj6pKx+FBJNUqXDywR1B6PuteicLJIAbqcPxeUQHfHCzLSTwFWavKdIQPffOHzEYEZwRUD
	lB3ME68FWxB0JUzVViUqsO0K7j5NCgomozPvStdyVF75PO4P6BIEnfaKorZJ5tlOM4hDZzqcDCg
	N4rSKm6bf1haQ0UZ3PPMw7Rdl9023vCU6FczhB8f7kFpLUSfDC72+AXJpIqCeuyzhQ/0b4xhlZQ
	Pjo6hQu41bk3RjTsXA94A5MmG03QCGkXUQbRNvd3cSZupo8sycN7271nbmppgrbeeefuP+cjwNf
	EhD91orR1rtE4tozSZmch+No35V0xUn9x+mkg1jxJMthyxbYUTWC2RdaWJDk9TBrpZtixfw3jSt
	Q==
X-Received: by 2002:a05:600c:5395:b0:4b1:4017:c4f4 with SMTP id
 5b1f17b1804b1-4bb8880ca2fmr202326895e9.20.1795397435229; Sun, 22 Nov 2026
 17:30:35 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
 <20261119-mglru-fg-v5-17-9eee2fe97a2d@tencent.com> <CAN_Opa9APLNic4cnohrtZ4-HcdoNvSFvnAKiC6nn+C=thbTAAA@mail.gmail.com>
 <awFbU_VGf0hotbyR@KASONG-MC4>
In-Reply-To: <awFbU_VGf0hotbyR@KASONG-MC4>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 23 Nov 2026 09:30:23 +0800
X-Gm-Features: Aa3M54otUxeoT9sHoHYTq2p_UuIGttJQaGd17GdUT_OXTaZ8k51r48Rl1cQl1ww
Message-ID: <CAN_Opa9ppGsKPhh1jmveYDCwHgZtv0Tm38FB2WoAjTtOPMmpmw@mail.gmail.com>
Subject: Re: [PATCH v5 17/17] mm/mglru: make folio_test_workingset() work
 based on folio LRU refs
To: Kairui Song <ryncsn@gmail.com>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
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
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 4:13=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Fri, Nov 20, 2026 at 05:53:36PM +0800, KunWu Chan wrote:
> > On Thu, Nov 19, 2026 at 5:04=E2=80=AFAM Kairui Song via B4 Relay
> > <devnull+kasong.tencent.com@kernel.org> wrote:
> > >
> > > From: Kairui Song <kasong@tencent.com>
> > >
> > > folio_test_workingset() currently tests the PG_workingset bit, which
> > > is only the second lowest access bit of the folio LRU refs count now.
> > > Folios with refs 4 or 5 carry it in the LRU_REFS_MASK field
> > > and no longer have PG_workingset set, so the bit test misses them.
> > >
> > > folio_set_workingset() currently sets the PG_workingset bit with a
> > > plain set_bit(), which also over-promotes folios at a higher refs
> > > count: e.g. a folio at refs 4 is bumped to refs 6, advancing it
> > > toward LRU_REFS_MAX and an earlier generation promotion.
> > >
> > > Move the test into mm_inline.h as an inline helper based on
> > > folio_lru_refs(), checking refs >=3D LRU_REFS_WORKINGSET.  The set
> > > stays a plain PG_workingset bit operation reserved for the
> > > classical LRU: under MGLRU the refs count is maintained by
> > > folio_inc_lru_refs(), and now triggers a debug WARN when called
> > > while MGLRU is fully on (the switching window is exempt, as the
> > > classical paths legitimately run alongside MGLRU then).  The one
> > > PageWorkingset() user in erofs is converted to the folio helper.
> > >
> > > Under the classical LRU the refs count is not maintained, so the
> > > test is equivalent to the PG_workingset bit test, which is the old
> > > behavior.
> > >
> > > Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> > > Signed-off-by: Kairui Song <kasong@tencent.com>
> > > ---
>
> ...
>
> > > +/*
> > > + * For the classical LRU only: with MGLRU the PG_workingset bit is
> > > + * part of the folio refs count maintained by folio_inc_lru_refs(),
> > > + * and a raw set would corrupt it.  The switching window is exempt
> > > + * because the classical paths legitimately run alongside MGLRU then=
.
> > > + */
> > > +static __always_inline void folio_set_workingset(struct folio *folio=
)
> > > +{
> > > +       VM_WARN_ON_ONCE(lru_gen_enabled() && !lru_gen_switching());
> >
> > Could shrink_active_list() still hit this WARN after the switch
> > to MGLRU completes? It can reschedule after isolating folios and
> > reach this setter after lru_switch is cleared.
>
> Hi Kunwu, thanks for the very careful review!
>
> Right I thought a lot about it after your reply, first your concern
> is right, thanks! I should just remove and replace this WARN with
> something else.
>
> And in theory, we should only call this for isolated folio (for CLRU
> it means a folio moving out of active workingset, isolation is always
> the first step), so this helper is fine - except, for the MADV cold
> case, it will call it on for a on-list folio, and will could skew
> the counter and if it raced with switching. Switching is so painful
> I hope we can get rid of it soon :/
>
> But, good thing is it's easy to fix, we just need (part of this belong
> to another patch, a trimmed diff just for reference):
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 4f65867446dc..c936d1fadfbd 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -261,8 +262,9 @@ static inline void __folio_set_lru_refs(struct folio =
*folio, unsigned int refs)
>
>         do {
>                 new_flags =3D old_flags;
> -               VM_WARN_ON_ONCE(lru_get_gen_flags(old_flags) !=3D -1);
>                 lru_set_refs_flags(&new_flags, refs);
> +               if (lru_get_gen_flags(old_flags) !=3D -1)
> +                       break;
>                 if (new_flags =3D=3D old_flags)
>                         break;
>         } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flag=
s));
> @@ -569,16 +571,16 @@ static inline void folio_clear_lru_refs(struct foli=
o *folio)
>   */
>  static __always_inline void folio_set_workingset(struct folio *folio)
>  {
> -       VM_WARN_ON_ONCE(lru_gen_enabled() && !lru_gen_switching());
> -       set_bit(PG_workingset, folio_flags(folio, FOLIO_HEAD_PAGE));
> +       unsigned long flags;
> +
> +       flags =3D set_mask_bits(folio_flags(folio, 0), BIT(PG_workingset)=
,
> +                             BIT(PG_workingset));
> +       VM_WARN_ON_ONCE(lru_get_gen_flags(flags) !=3D -1);
>  }
>
>  static __always_inline
> diff --git a/mm/madvise.c b/mm/madvise.c
> index bbbb729ed647..a73d89a2ecca 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -374,11 +374,12 @@ static void madvise_cold_prep_folio(struct folio *f=
olio)
>          * as a workingset refault, and the referenced bit always needs t=
o
>          * be cleared even for inactive folios. For MGLRU, MADV_COLD clea=
rs
>          * refs in folio_deactivate(); MADV_PAGEOUT handles refs after is=
olation.
>          */
>         if (!lru_gen_enabled()) {
>                 folio_clear_lru_refs(folio);
>                 if (folio_test_active(folio))
> -                       folio_set_workingset(folio);
> +                       __folio_set_lru_refs(folio, LRU_REFS_WORKINGSET);
>         }
>  }

Thanks, Kairui. That covers the shrink_active_list() case I was
worried about. With these changes folded into v5, feel free to
add my tag to 17/17.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
