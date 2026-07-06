Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB649395AF7
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 17:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358690; cv=pass; b=Xf3U8yd2HBzNKSFBO+ji9yjoLrgSEG7pqOXqGu5d7MvTGQjZxva07yn2ffIROO7qDyYmZgE3uFbw+m1oFoHAk48xwaGS3yYhGnzaPvikVuKH1v/ZLUN1CXFjZwacJcMRKuarFAxTVPX4yzmxuL9oYccwX+709jgUwVcPn4FMlls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358690; c=relaxed/simple;
	bh=rDbay5Ipr7W5sQQ/ZFpTACtmvb9dCF9BbFVRNpnaccY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DV9oS6FnxlXicWY+KZfmAR2SAg1GupMNj+mKYlceNKO3dOHwJ2IbQxdTC30+2egCkljkIWYTsjUNfek6Sns36It3EKRqM4W1ObOV2M2XYPzygMw3Hh41Rf3dyUun0GfM7YRw4xzSOg4GUIiE0FjL9kKZyiLFqhNXuU5MwVdlWL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1hJgYUr; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1hJgYUr"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c126b8118afso412605166b.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 10:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783358685; cv=none;
        d=google.com; s=arc-20260327;
        b=jMECXdV1sPB0yd2smlYd3OjDEcM4gA7nVvZh+go6br5gETHDXEKvnnqg8LwyU4QuKi
         2K1pjJ3P8bb2R6UTXChpth5AA8nKY8PqFcvGk+7kvqRffczVS9SOUiS2WJzU4QD0+PYO
         SJyF2ibBm60tR5xZQwwgtbLDRTBNAadR5lmaKIysChrYrm1FC10oktUHs5cHGINtIGwJ
         i5hw0R77onJy5WFmNaNv8OVrKpWc2QcJUU5tY01wz7ks7ZEj3c5zXwL6z8xC7Voq4J4+
         LxQCGk3xpiIlxXI5Lhrpp4fNvw3BI5BrXYBvzciJXzjDM95vNNZYhunaGyiNz4RC+Sri
         j2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XxP53wL2J2oYif5ANu17eapgCY9wfdHwyPogm4z9pjw=;
        fh=lK4Wwh0CbrZtLOnbWKAR0dYVnquWnfV+p6uYnN4W+a0=;
        b=MIElllTGufYXZRcBHVmqlBQIEs4IjvZy56LJfHm24OReoizvmfI4oQ0vkTRA2Ibrck
         9pwr6k3Cvzx9S4XKAovhSR/pZnXKPf6aI3bLJnMuANWwtwqkTXL812LVpq4gYYYDuyUF
         kDCjhw3/Nldj39wPvW6Ml0eWxw8GR0zu7Ux01EIMpu5VJWOmO177Zgy/wXgaCF+gtJgU
         69Y0gAjkTAJnLRoF2tkOmp2Et54M/uNpj0CRjd4WaeI2FUkDMdZ62te/ML2Vt3sDxF7w
         ykN/5oki4hkM1/SinRMJgrZzr764k7bc8kQbGTegGb9qZwrNle1IAJGmzF2f42JEgq+H
         aBzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358685; x=1783963485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxP53wL2J2oYif5ANu17eapgCY9wfdHwyPogm4z9pjw=;
        b=a1hJgYUr1QPPzZjaNkvwUjfys+BlYwMA4PCjvodeKzLQm/LEa05J8KK0BqpOnSMRFI
         s+Tsmk1VXMLsdZjmaSuavA93o9Cz+ejIagalcvRQIlbBQP6iV5BjMJzfF0814Y4ONFN0
         rCYY+VwPdhKWp6KOtoGpB08/8dLKUSMlTUfJ9vLIDO9Vd8ArGL5o7s9tRhlAqZizO1Wf
         Kp3CX1PMQZD5WkY7DIqorfVoFNDANyCZ2u6nLjNrO/YUjXbetiURdzpHNmgV6o3yE6oA
         T320Aiz8KsLOaALKXX5+PD7GDdmWGFRUFqmgGd5+1ujv1ztdOmse6o+ojefSziDCooUc
         nKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358685; x=1783963485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxP53wL2J2oYif5ANu17eapgCY9wfdHwyPogm4z9pjw=;
        b=Ok73ljI+XA0zsshPlGyPLZWiokjm0rOXBOW0a0rKMo9fqCtEkk0JjG90Xu9N4u+V+Z
         Ej02S4coJJhMw0s2H1bDQctXWNkNJk0RHmL9omSqycGH/IuwYOFIPGkQMjE7PgfRWfQh
         dgWfic4Pccb0IJ3V1LLVZdYUp0H8T7iGcuvevADMh8H55DP16eCfoBpLlMxq++FxTS+e
         2USIhPP2y5uOGGMbID1FZo54w1MNsPEcWLT+pWRAjsBWvM1DFKYutHu+Cls+bJq1sa+W
         8FhdscN918EN1I0CnqDN+L3aIT2BsSyQKDG0f0Qfucw7UGuk3jg+y+/uCehCBMdFxECR
         6IvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwaKf149pHFwGdyQ4cOfCaegt7VbS7Oeq3da+fLNoLEaaURFynjNZODproTEmINE4XEiCMvWIv6jk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+Sjq9x/vB7+vwsApKT/Lw1aBkOwNRByiXZpWGvNEr1Xy2ECi
	5wnOm8vIyd9OAkhwkhnzyspec78/5SrOFv7U+zCMXKUc8JJsP3cmTjdf3n5K1bw2NfeqQwoZtVm
	cjwFal6XKEChx3zvLGcM4J3Ua0j0j88A=
X-Gm-Gg: AfdE7cnvS8l/DyoR65V/oeY64bmRsDDmxDEE3xGHr2OuUPzG8pN/14VFtCUAICV2TLz
	Jd36vxhvOUAbafxkWao4vC/7tb9fWS+9FxjYdPT5o4gCl8wWfzxizWdkAfXhd8oHHPc4IeqXVtW
	+4pzUqeBLFAuSh9ITGzY3m28bwNZ7eppp74kAwDabBBehzY1NQV81Flz71FiVmlG7JwtwRMSw6t
	UPymEu3igArUQn0/mCgyZRZ9wiEJ50SBKIZ5u4DgVVV9rpr43E2fXzjxyx2+rFLDoJMZhIKGpR3
	LPjBgzaEKOp95JyVZbTvtSWzU2ufzO8U1DqbmDfh
X-Received: by 2002:a17:907:9511:b0:c11:fb78:4995 with SMTP id
 a640c23a62f3a-c15a692b922mr62990266b.39.1783358684968; Mon, 06 Jul 2026
 10:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-0-a028e8b5fc3d@gmail.com>
 <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-1-a028e8b5fc3d@gmail.com>
In-Reply-To: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-1-a028e8b5fc3d@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 7 Jul 2026 01:24:08 +0800
X-Gm-Features: AVVi8CeLsc9BTwH9hYpNfgnAjsqBY_UguxBev0CFD_zG552dvgLpHsMF9gkFrEo
Message-ID: <CAMgjq7DeWvBszNt0sHcCOft3A48LVJTxLu70F_Ka7=sjii2M8A@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm/swap: colocate page-cluster sysctl with swap readahead
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 10:14=E2=80=AFPM Jianyue Wu <wujianyue000@gmail.com>=
 wrote:
>
> page_cluster and the vm.page-cluster sysctl are only used by swap-in
> readahead in swap_state.c. Move them out of swap.c together with
> swap_readahead_setup(), and make page_cluster static to that file.
>
> Rename swap_setup() while moving it as well. The helper is internal to
> MM and now only sets up swap readahead defaults and its sysctl hook, so
> the more specific name matches its reduced scope.
>
> swap_setup() previously lived in mm/swap.c, which is built
> unconditionally, so the vm.page-cluster sysctl was registered also on
> CONFIG_SWAP=3Dn kernels. swap_readahead_setup() is now a no-op stub when
> CONFIG_SWAP is disabled, so vm.page-cluster is no longer registered
> there. The knob only tunes swap-in readahead and had no effect without
> swap.
>
> Suggested-by: Baoquan He <bhe@redhat.com>
> Suggested-by: Barry Song <baohua@kernel.org>
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> ---
>  include/linux/swap.h |  1 -
>  mm/swap.c            | 36 ------------------------------------
>  mm/swap.h            |  9 +++++++--
>  mm/swap_state.c      | 37 +++++++++++++++++++++++++++++++++++++
>  mm/vmscan.c          |  2 +-
>  5 files changed, 45 insertions(+), 40 deletions(-)
>
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 3f31b6a56788..45656ca9792d 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -340,7 +340,6 @@ extern void lru_add_drain_cpu_zone(struct zone *zone)=
;
>  extern void lru_add_drain_all(void);
>  void folio_deactivate(struct folio *folio);
>  void folio_mark_lazyfree(struct folio *folio);
> -extern void swap_setup(void);
>
>  /* linux/mm/vmscan.c */
>  extern unsigned long zone_reclaimable_pages(struct zone *zone);
> diff --git a/mm/swap.c b/mm/swap.c
> index 58e4eff698cc..b3ea30edbaad 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -43,10 +43,6 @@
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/pagemap.h>
>
> -/* How many pages do we try to swap or page in/out together? As a power =
of 2 */
> -int page_cluster;
> -static const int page_cluster_max =3D 31;
> -
>  struct cpu_fbatches {
>         /*
>          * The following folio batches are grouped together because they =
are protected
> @@ -1176,35 +1172,3 @@ void lru_reparent_memcg(struct mem_cgroup *memcg, =
struct mem_cgroup *parent, int
>                 lruvec_reparent_lru(child_lruvec, parent_lruvec, lru, nid=
);
>  }
>  #endif
> -
> -static const struct ctl_table swap_sysctl_table[] =3D {
> -       {
> -               .procname       =3D "page-cluster",
> -               .data           =3D &page_cluster,
> -               .maxlen         =3D sizeof(int),
> -               .mode           =3D 0644,
> -               .proc_handler   =3D proc_dointvec_minmax,
> -               .extra1         =3D SYSCTL_ZERO,
> -               .extra2         =3D (void *)&page_cluster_max,
> -       }
> -};
> -
> -/*
> - * Perform any setup for the swap system
> - */
> -void __init swap_setup(void)
> -{
> -       unsigned long megs =3D PAGES_TO_MB(totalram_pages());
> -
> -       /* Use a smaller cluster for small-memory machines */
> -       if (megs < 16)
> -               page_cluster =3D 2;
> -       else
> -               page_cluster =3D 3;
> -       /*
> -        * Right now other parts of the system means that we
> -        * _really_ don't want to cluster much more
> -        */
> -
> -       register_sysctl_init("vm", swap_sysctl_table);
> -}
> diff --git a/mm/swap.h b/mm/swap.h
> index 44ab8e1e595b..624ea8ff3d0d 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -8,8 +8,6 @@ struct mempolicy;
>  struct swap_iocb;
>  struct swap_memcg_table;
>
> -extern int page_cluster;
> -
>  #if defined(MAX_POSSIBLE_PHYSMEM_BITS)
>  #define SWAP_CACHE_PFN_BITS (MAX_POSSIBLE_PHYSMEM_BITS - PAGE_SHIFT)
>  #elif defined(MAX_PHYSMEM_BITS)
> @@ -79,6 +77,8 @@ enum swap_cluster_flags {
>  };
>
>  #ifdef CONFIG_SWAP
> +void swap_readahead_setup(void);
> +
>  #include <linux/swapops.h> /* for swp_offset */
>  #include <linux/blk_types.h> /* for bio_end_io_t */
>
> @@ -336,6 +336,11 @@ static inline unsigned int folio_swap_flags(struct f=
olio *folio)
>
>  #else /* CONFIG_SWAP */
>  struct swap_iocb;
> +
> +static inline void swap_readahead_setup(void)
> +{
> +}
> +
>  static inline struct swap_cluster_info *swap_cluster_lock(
>         struct swap_info_struct *si, pgoff_t offset, bool irq)
>  {
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index 6fd6e3415b71..a9f5b944172b 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -22,10 +22,15 @@
>  #include <linux/vmalloc.h>
>  #include <linux/huge_mm.h>
>  #include <linux/shmem_fs.h>
> +#include <linux/sysctl.h>
>  #include "internal.h"
>  #include "swap_table.h"
>  #include "swap.h"
>
> +/* Swap readahead cluster size, as a power of 2 pages. */
> +static int page_cluster;
> +static const int page_cluster_max =3D 31;
> +
>  /*
>   * swapper_space is a fiction, retained to simplify the path through
>   * vmscan's shrink_folio_list.
> @@ -985,6 +990,38 @@ struct folio *swapin_readahead(swp_entry_t entry, gf=
p_t gfp_mask,
>         return folio;
>  }
>
> +static const struct ctl_table swap_readahead_sysctl_table[] =3D {
> +       {
> +               .procname       =3D "page-cluster",
> +               .data           =3D &page_cluster,
> +               .maxlen         =3D sizeof(int),
> +               .mode           =3D 0644,
> +               .proc_handler   =3D proc_dointvec_minmax,
> +               .extra1         =3D SYSCTL_ZERO,
> +               .extra2         =3D (void *)&page_cluster_max,
> +       }
> +};
> +
> +/**
> + * swap_readahead_setup - defaults and sysctl for swap cache readahead c=
lustering
> + */
> +void __init swap_readahead_setup(void)
> +{
> +       unsigned long megs =3D PAGES_TO_MB(totalram_pages());
> +
> +       /* Use a smaller cluster for small-memory machines */
> +       if (megs < 16)
> +               page_cluster =3D 2;
> +       else
> +               page_cluster =3D 3;
> +       /*
> +        * Right now other parts of the system means that we
> +        * _really_ don't want to cluster much more
> +        */
> +
> +       register_sysctl_init("vm", swap_readahead_sysctl_table);
> +}
> +

Thanks, I also think they belong here.

>  #ifdef CONFIG_SYSFS
>  static ssize_t vma_ra_enabled_show(struct kobject *kobj,
>                                      struct kobj_attribute *attr, char *b=
uf)
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index f40cfe9d703b..ae710027d546 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -7646,7 +7646,7 @@ static int __init kswapd_init(void)
>  {
>         int nid;
>
> -       swap_setup();
> +       swap_readahead_setup();

There is already a subsys_initcall(swap_init); in swap_state.c so
perhaps calling this in that init function is even cleaner. And that
init hook runs earlier than kswapd init so totally fine I think.

Reviewed-by: Kairui Song <kasong@tencent.com>
