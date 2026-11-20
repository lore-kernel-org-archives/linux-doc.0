Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795157379;
	b=t15ANNhP5wHaJ2sZVC+3i3Y0M9urrYUZA+u/YdyQ+8LKp5L6zG2Ed6WrwyJjzl9y0DMI
	 abKQI2ZzLNuDO7R+Hsl0QEqViQSiVKgnsHBIxU3HAvebignw0m2In+ygxJDGGiabz6EVu
	 S5En947dG7E3WuESeAHsHTo5Q/YBiJ7s5BtJVOtub7BYeVFiKk83Toq+kcnkMOrQ8aDnw
	 p+yzsxfRzeCQcKSfQ60BSmRgbnqT5u7mcCoon/ud9rO6F9w1+pSwSNKX8Ge84bfFlEvIa
	 IyOdjEZcGAANVZA5dGOfhtt0rr3L0fX0XpSbtv9fWVxM7CX9M/J8tqdhKB00HVvvIZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=82jQgJ5EVrQ2a7459gmbGwx0yatt6MbCteDy+T0Kbcc=;
	b=J5H3+wUEX2iy8B6lyEnrWs8vHEkOGc2Lm+FeHmg0fdo51Ttj1rSj+NJpKgcc6+YC5+f0
	 JsRK4DW88A+7Y7enOn0fSkOo0WHcgYiFlZVBFy/6HD4SRPYDpJhHPhrRrmZJU0ef0QEKq
	 x9TifRYJqUeGPbEOFFqps4r00gLPGRTA+y6wQgHTJxYTGknNkZZALgI6M4RZZ0VkpoGUZ
	 AE9O+QbOp6plUokQHxGkmlCXE20GnO8mBg05xohewZvp9uFJWGX0Pew5+G2jQ4S8DqYTP
	 qHUoF0TXud4op2LaNGa/63QAmHZzScmjwPNuQFhhGozSEo35caay3k2Gh2BfbS0g8kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxuiz41v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D84B606A325
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 06:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D84B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kxuiz41v
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so4668925e9.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 22:49:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795157378; cv=none;
        d=google.com; s=arc-20260327;
        b=XRIDS51Y2woU6Ry99b9dc05/68aq+dpX6Np0CQ6+HA22KXOpv+DCNMaSETJEHuVJJ9
         PrGbg+l9DYj5qYLZU3vndIA9ChCaYzd3eoFDQC30u9J3gEXrXyJc309Ats2qxw8j4yai
         carN/+8ssT2x8csaU525pVD4croEYAbOWj643x7YIKDDiRSJEsJL48uc/qj83QVSWHva
         rxjoKMGRT15KdL0IK3e9HbY48w2JONgUlZxaxhAk4nTyAyX0lgOy2hCxNIT3VvGHif30
         s1j9iCIx2Ra54lvd13OHKGMai/4MyAAKuZ8bO8OvEeSajFkYvuIgSWweVKlE388lG5zj
         /66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=82jQgJ5EVrQ2a7459gmbGwx0yatt6MbCteDy+T0Kbcc=;
        fh=DSCRke22LhwxKs5HfL/9eHiHx58XJJweqFCvcg57W/U=;
        b=ZbgDUwGhmrJIVlQq9XQAjr4tOg1sEekcyFWyMmNrf0CcAp1UZWtVq2/2WB2Ya6B8tb
         uPFRd9gq94HOU8TuobJ2oWiRz9xeT5rUp9bsZxIm5fHSFCRCvUwyVxghBnGGk0C30VMC
         cbeGYIwdGn/ZkWBChrbIyyi58bkFv6SsyTZqHqhu3ljMs8Tpjo0RdygZV4sBrYApueHI
         GQ6VUzHMVzi7iujT7Fkx+FcT7gQun7Y/9qLMEiDddA/YdECjBUROIM+BKcoCeNXRMxYK
         1OK8meEb0yoLKZ3weGhVcB+8hQicPkt/P6nrJdR5w9y7bvPskjPqTYYW+dTsoQKag/Ux
         vIDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795157378; x=1795762178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=82jQgJ5EVrQ2a7459gmbGwx0yatt6MbCteDy+T0Kbcc=;
        b=kxuiz41vwmj3mVrVneWY8bgVRZV278TQrnwZ8wcFraur08aDRPlwEGAyBmhyWew1N8
         zATRsw093bzfloFu8qEo+eJtQv1AcoFzgfxgkalFVKKk6Z63DiykmMRdANWFXc39A2u5
         sd8PahmEGR7TIib6jFVqj7ATijE7x1biAcotmNvP3tT6WRhgnSbZMu7MlDDrQHe4AiqL
         ZuAcGdXINwPh5kzRN8oAz8yahRdW2cQBWZSCcU/LnHW3TpqQJ899J2g8J1XxIRehzk/c
         KFmlYHIb+pTSzideveDEjx4aIjSf13TbrpfAeDeNu2XcA42W6pOQQ+wUYDAjiGTDXeOf
         2h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157378; x=1795762178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82jQgJ5EVrQ2a7459gmbGwx0yatt6MbCteDy+T0Kbcc=;
        b=slGm2OGy4kHPH/HPBTNkkgBUjCtmHlHHCOskfC1/ZXEwFdeO2E3hN6qDyInkWDA6ZW
         EJWPP4xbFIn8QdkfMXg0FDo5wJiutA0klUwlw0LthQvCy1XTsGiKVVUeMuoHIwL7AOV3
         bhzBSKKwz6v/gXDlc0qo3+ztn3bf7k0DzUPKKp6ez4yBHQX6WeZLPnQFMmyA0yLZnDBq
         yXhWRINCvUK2a+tFBMVw2syLIZ3TXszQJ+4YU7U2AFQUv1UrkF5jOfPSS6HhzuZemHW7
         UvgsKnc7aorH7VkMoFZCv3HVjpLycmKv3ZY6MxduO2JPSKVtcq4gXbZHCOrGoXlCf+wQ
         +Upg==
X-Forwarded-Encrypted: i=1; AL+hErFKerkopk7EkrhOCuhD19BEV1gvMA81Zaxy+pG28VI/JAhb7d3scHYslZTKOYzg7QvQHFHw5YtXzdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YpvCPCA93JMvoSQ8Gl1r9aqDNAJwO9KYDEEvffgkbCAPfn6zx
	FlDIeXJ5ylzGiL4GQ5NeSKz6AtlEV45TTk4ONXNRvxg176SCPWpe79M1tcGv4rFn1jWCqza0UVY
	ixl04P2tTctAc+f3rnv3GjdzBePNX83A=
X-Gm-Gg: AYBFou13XTbLIf6PtLAaEKbmlXWzsBnkSa1Acy5mBa6HQDY3bnM62xum9Ub8q/tNTOq
	TcQ2jy2+EjQLxrQbRStlijiM0Zscgk6LwdpnZfjngGypbKqwakpGZK1GYDOD9IxtWG4xbgUYKLb
	OUH4str/5s1/pIfRI5quvBFJjrp5KQxFz/RX+Owrb3/9MqHAak2n/VlULCvmnUaXy11BGfI6oSs
	QLb4y4jHgiQRgSi7N5VFflAyroyWQR1QmBMN4cWN0sCcRKMPLatXHRzUztGcWb6+Bh1QE5W9YSI
	tcFNCB+SCUp3mbwTjTVZZximwxIQVQWBGW3q0CQ1UuGWv12ryOKsKXXfgKd5qM6+LxSrfY/mIH3
	NjkPLu8f0Jv0yGSnRMooGAIXNJtLvl1mR2teWU6dj1qeUjtsMKNoH4Tos6wJogGYRWw==
X-Received: by 2002:a05:600c:37c6:b0:4bb:7033:c938 with SMTP id
 5b1f17b1804b1-4bb888147b7mr42207885e9.14.1795157377099; Thu, 19 Nov 2026
 22:49:37 -0800 (PST)
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
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 14:49:23 +0800
X-Gm-Features: Aa3M54qOc1yY5SxJT7UDbDpxwpV9EzYxtLGhUe-eTcqoOXQmzD9xaaxO1UoM8Dw
Message-ID: <CAN_Opa_4DSrhb=nOKFEP2eV-WVaFpehpS1-o_PTO1cibJ8doUQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/17] mm/mglru: make generation page counters atomic
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
> No feature change, convert them to atomic so we can update them without
> holding the LRU lock. A temporary underflow is fine: readers clamp a
> negative value to zero, and the counters only need to be eventually
> consistent.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h |  6 ++----
>  include/linux/mmzone.h    |  2 +-
>  mm/vmscan.c               | 26 +++++++++++++-------------
>  mm/vmscan.h               |  2 +-
>  4 files changed, 17 insertions(+), 19 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 2edb9beef6d3..46beded51c7d 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -265,11 +265,9 @@ static inline void lru_gen_update_size(struct lruvec=
 *lruvec, struct folio *foli
>         VM_WARN_ON_ONCE(old_gen =3D=3D -1 && new_gen =3D=3D -1);
>
>         if (old_gen >=3D 0)
> -               WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
> -                          lrugen->nr_pages[old_gen][type][zone] - delta)=
;
> +               atomic_long_sub(delta, &lrugen->nr_pages[old_gen][type][z=
one]);
>         if (new_gen >=3D 0)
> -               WRITE_ONCE(lrugen->nr_pages[new_gen][type][zone],
> -                          lrugen->nr_pages[new_gen][type][zone] + delta)=
;
> +               atomic_long_add(delta, &lrugen->nr_pages[new_gen][type][z=
one]);
>
>         /* addition */
>         if (old_gen < 0) {
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index c161d563ce8f..4c4aad95b0b6 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -554,7 +554,7 @@ struct lru_gen_folio {
>         /* the multi-gen LRU lists, lazily sorted on eviction */
>         struct list_head folios[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES]=
;
>         /* the multi-gen LRU sizes, eventually consistent */
> -       long nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
> +       atomic_long_t nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
>         /* the exponential moving average of refaulted */
>         unsigned long avg_refaulted[ANON_AND_FILE][MAX_NR_TIERS];
>         /* the exponential moving average of evicted+protected */
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index fe1fe1439c7c..8d14831cdf83 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3350,8 +3350,7 @@ static void reset_batch_size(struct lru_gen_mm_walk=
 *walk)
>                         continue;
>
>                 walk->nr_pages[gen][type][zone] =3D 0;
> -               WRITE_ONCE(lrugen->nr_pages[gen][type][zone],
> -                          lrugen->nr_pages[gen][type][zone] + delta);
> +               atomic_long_add(delta, &lrugen->nr_pages[gen][type][zone]=
);
>
>                 if (lru_gen_is_active(lruvec, gen))
>                         lru +=3D LRU_ACTIVE;
> @@ -3971,11 +3970,8 @@ static bool inc_min_seq(struct lruvec *lruvec, int=
 type, int swappiness)
>                                 break;
>                 }
>                 flush_lru_batch(head, &batch_end, target_list);
> -
> -               WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
> -                          lrugen->nr_pages[old_gen][type][zone] - delta)=
;
> -               WRITE_ONCE(lrugen->nr_pages[target_gen][type][zone],
> -                          lrugen->nr_pages[target_gen][type][zone] + del=
ta);
> +               atomic_long_sub(delta, &lrugen->nr_pages[old_gen][type][z=
one]);
> +               atomic_long_add(delta, &lrugen->nr_pages[target_gen][type=
][zone]);
>                 if (!remaining)
>                         return false;
>         }
> @@ -4093,8 +4089,8 @@ static bool inc_max_seq(struct lruvec *lruvec, unsi=
gned long seq, int swappiness
>         for (type =3D 0; type < ANON_AND_FILE; type++) {
>                 for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
>                         enum lru_list lru =3D type * LRU_INACTIVE_FILE;
> -                       long delta =3D lrugen->nr_pages[prev][type][zone]=
 -
> -                                    lrugen->nr_pages[next][type][zone];
> +                       long delta =3D atomic_long_read(&lrugen->nr_pages=
[prev][type][zone]) -
> +                                    atomic_long_read(&lrugen->nr_pages[n=
ext][type][zone]);
>
>                         if (!delta)
>                                 continue;
> @@ -4625,8 +4621,13 @@ static void __lru_gen_reparent_memcg(struct lruvec=
 *child_lruvec, struct lruvec
>         child_lrugen =3D &child_lruvec->lrugen;
>         parent_lrugen =3D &parent_lruvec->lrugen;
>
> +       /*
> +        * The child is offline and the lockless updaters, which hold
> +        * rcu_read_lock() over the update, avoid racing with reparenting=
,
> +        * so the read/set/add operations below are safe.
> +        */
>         for (gen =3D 0; gen < MAX_NR_GENS; gen++) {
> -               long nr_pages =3D child_lrugen->nr_pages[gen][type][zone]=
;
> +               long nr_pages =3D atomic_long_read(&child_lrugen->nr_page=
s[gen][type][zone]);
>                 int child_lru_active =3D lru_gen_is_active(child_lruvec, =
gen) ? LRU_ACTIVE : 0;
>                 int parent_lru_active =3D lru_gen_is_active(parent_lruvec=
, gen) ? LRU_ACTIVE : 0;
>
> @@ -4634,9 +4635,8 @@ static void __lru_gen_reparent_memcg(struct lruvec =
*child_lruvec, struct lruvec
>                 list_splice_tail_init(&child_lrugen->folios[gen][type][zo=
ne],
>                                       &parent_lrugen->folios[gen][type][z=
one]);
>
> -               WRITE_ONCE(child_lrugen->nr_pages[gen][type][zone], 0);
> -               WRITE_ONCE(parent_lrugen->nr_pages[gen][type][zone],
> -                          parent_lrugen->nr_pages[gen][type][zone] + nr_=
pages);
> +               atomic_long_set(&child_lrugen->nr_pages[gen][type][zone],=
 0);
> +               atomic_long_add(nr_pages, &parent_lrugen->nr_pages[gen][t=
ype][zone]);
>
>                 if (lru_gen_is_active(child_lruvec, gen) !=3D lru_gen_is_=
active(parent_lruvec, gen)) {
>                         __update_lru_size(child_lruvec, lru + child_lru_a=
ctive, zone, -nr_pages);
> diff --git a/mm/vmscan.h b/mm/vmscan.h
> index c2cea36289f3..6551f0a6691a 100644
> --- a/mm/vmscan.h
> +++ b/mm/vmscan.h
> @@ -126,7 +126,7 @@ static inline unsigned long lruvec_gen_size(struct lr=
u_gen_folio *lrugen,
>         unsigned long size =3D 0;
>
>         for (int zone =3D 0; zone < max_zone; zone++)
> -               size +=3D max(READ_ONCE(lrugen->nr_pages[gen][type][zone]=
), 0L);
> +               size +=3D max(atomic_long_read(&lrugen->nr_pages[gen][typ=
e][zone]), 0L);
>
>         return size;
>  }
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
