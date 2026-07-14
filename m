Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BA74D90CC
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047956; cv=none; b=j+so/Rx8I7hzmUr79EuOMB9k/aEob9gJ+4RCVuox0M6Xuzl8VqvHhT68EgzFFFQxSL5pePqznR9C504Ytz2bZGLv4WUPPgI4fw8EVdTuHqUhf3AbhMYOBmz7m38Qdbh9sPJKBlKxc8Y/Hhn5hgmGYADDe4ofVzLmxaoR8tlsLYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047956; c=relaxed/simple;
	bh=NqUKjeHmP2e5jPIlYwcL77DeZL8TDztFypI8FUZJxIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Adrxs38rmW6nEptgeRlD/SHuo86Y3iNdZFjNvrgSYgrg59eFWVDC2xSVJMa7TJKBCQxxls/QHYyTC7SZ10QMZYsJo5Zk1+2xGeuoqBBV6ygo/rYb0fGJFe4kQGJjiEbt6htcE/hhSORM2NDo618HFhnG3fyWe0HCzxmS2WgkpzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SmIUNbMA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmIUNbMA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 352811F00A3D
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 16:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784047955;
	bh=usA+eQuBbKhAqy88p0ZuKIybdHIRo+5vum9+Gy90cfg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SmIUNbMAJzdBFOb3EWIgHmlPEA5j/tNmFEZ0gYzEaWiPJ5c4HC+/DpjnVJtlmNpDK
	 oWrGY4/dJhMj3n2dYiExdG9KhJgwGt1e5yY+EMeUY/bcFPzOsZDvCylc5utcXkRgGM
	 qHFLzGKkfE33hk9OE7a4UoB0R2VqTWD/kBusmtMI5hSzdrsBPtPdeUr2B39jAKPXjA
	 0qawgP+ALUdqCL/leGVMfACUimr8Whfw5uU7W4ECJ+QYdQSzPuvMxMyt5WyuqjiyrX
	 vZo2jiCLFyXtBLszYAl/7FuE7WmiaCmdPRiKh/JkgyoC2f1iyScAbnkSXhDkfjbv1V
	 Dkq9aWbSFWfoA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15b1da6b82so143198166b.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 09:52:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ85oDNgNP3zq3LTI1FdK0idsxgh/zeSiYg5bHT6YKKuMReL0vfangYkoCyhphbb5383uFoZOa5cwNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/3tqMOvisO4nfCGW/HD40pkxBoMGN82PbP69lb8c95SRV24w
	++qrYDUVOlHynczC88GeixejI+NVfZ8IY4nTHwKQLroh0QT9MbwI8ORdYrR7nlTDd3U011sUyMR
	P5RmAxgyXbyW4AXlqO9WbMrbhYO66mTg=
X-Received: by 2002:a17:907:c22:b0:c16:2d90:6878 with SMTP id
 a640c23a62f3a-c162d908032mr596876966b.34.1784047953804; Tue, 14 Jul 2026
 09:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714081510.16895-1-jiahao.kernel@gmail.com> <20260714081510.16895-3-jiahao.kernel@gmail.com>
In-Reply-To: <20260714081510.16895-3-jiahao.kernel@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 14 Jul 2026 09:52:22 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNiT63LUHx8X5i_aboX1UWuGkcFf+p9ch-pekURUuDdXg@mail.gmail.com>
X-Gm-Features: AUfX_myNiNK6fU_5CvtOxp6oCLEnI38Xv-YxdAfG34np1jpXrEds4Me9pLBjBDQ
Message-ID: <CAO9r8zNiT63LUHx8X5i_aboX1UWuGkcFf+p9ch-pekURUuDdXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 1:15=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
> From: Hao Jia <jiahao1@lixiang.com>
>
> Currently, shrink_memcg() writes back at most one entry per-node during
> its traversal. This makes shrink_worker() inefficient, as it must
> repeatedly re-enter shrink_memcg() to make any substantial progress.

Please also mention the case about writeback being slow to keep up
with refaults in some cases, leading to zswap store failures and pages
skipping zswap and going directly to disk, which is an LRU inversion.

>
> To address this, extend shrink_memcg() and rewrite its LRU iteration logi=
c
> to support batch writeback. Introduce the nr_to_scan parameter to bound h=
ow
> many pages are scanned per call. This enables batch writeback in the
> shrink_worker() path, while maintaining a low scan budget in the
> zswap_store() path.
>
> Additionally, to prepare for future proactive writeback, update the retur=
n
> value semantics of shrink_memcg(): a positive value now represents the
> actual number of compressed bytes written back, 0 indicates that candidat=
es
> existed but no writeback succeeded, and a negative value represents an
> error code.

This part should be dropped for now, and added with the proactive
writeback, as it's currently unused AFAICT. Removing
zswap_shrink_walk_arg will simplify the patch and make it focused on
the batching part.

>
> Test Setup:
> Total memory: 32 GB.
> zswap settings: max_pool_percent=3D1, accept_threshold_percent=3D50,
> shrinker_enabled=3DN.
> Allocate 512MB of anonymous pages and fill them with random data (to avoi=
d
> compression), then use cgroup memory.reclaim to force a large amount of
> anonymous pages into zswap. At an interval of 2ms, allocate a 4K anonymou=
s
> page where the first 4 bytes are random numbers and the rest are zeros, a=
nd
> then trigger a reclamation of this 4K anonymous page through cgroup
> memory.reclaim. When the pool threshold is reached, shrink_memcg() will
> be triggered.
>
> The test data after running for 120s is as follows:
>                            Baseline         Patched
> shrink_worker wakeups          5363             85
> shrink_memcg calls       11,345,012        188,264
> written_back                  40214          40275
>
> Conclusion:
> Under the same workload and run duration, the patched kernel shows a
> significant reduction in both shrink_worker wakeups and shrink_memcg call=
s.

Please also include data from the case where zswap store failures are
observed and pages go to disk, and compare before and after this
patch. I think that part is also really important.

>
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
> ---
>  mm/zswap.c | 89 ++++++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 69 insertions(+), 20 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 3d697a1a5365..6d492762957a 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -160,6 +160,11 @@ struct zswap_pool {
>         char tfm_name[CRYPTO_MAX_ALG_NAME];
>  };
>
> +struct zswap_shrink_walk_arg {
> +       unsigned long bytes_written;
> +       bool encountered_page_in_swapcache;
> +};
> +
>  /* Global LRU lists shared by all zswap pools. */
>  static struct list_lru zswap_list_lru;
>
> @@ -1089,8 +1094,9 @@ static enum lru_status shrink_memcg_cb(struct list_=
head *item, struct list_lru_o
>                                        void *arg)
>  {
>         struct zswap_entry *entry =3D container_of(item, struct zswap_ent=
ry, lru);
> -       bool *encountered_page_in_swapcache =3D (bool *)arg;
> +       struct zswap_shrink_walk_arg *walk_arg =3D arg;
>         swp_entry_t swpentry;
> +       unsigned int length;
>         enum lru_status ret =3D LRU_REMOVED_RETRY;
>         int writeback_result;
>
> @@ -1133,10 +1139,11 @@ static enum lru_status shrink_memcg_cb(struct lis=
t_head *item, struct list_lru_o
>
>         /*
>          * Once the lru lock is dropped, the entry might get freed. The
> -        * swpentry is copied to the stack, and entry isn't deref'd again
> -        * until the entry is verified to still be alive in the tree.
> +        * needed fields are copied to the stack, and entry isn't deref'd
> +        * again until it is verified to still be alive in the tree.
>          */
>         swpentry =3D entry->swpentry;
> +       length =3D entry->length;
>
>         /*
>          * It's safe to drop the lock here because we return either
> @@ -1155,12 +1162,13 @@ static enum lru_status shrink_memcg_cb(struct lis=
t_head *item, struct list_lru_o
>                  * into the warmer region. We should terminate shrinking =
(if we're in the dynamic
>                  * shrinker context).
>                  */
> -               if (writeback_result =3D=3D -EEXIST && encountered_page_i=
n_swapcache) {
> +               if (writeback_result =3D=3D -EEXIST) {
>                         ret =3D LRU_STOP;
> -                       *encountered_page_in_swapcache =3D true;
> +                       walk_arg->encountered_page_in_swapcache =3D true;
>                 }
>         } else {
>                 zswap_written_back_pages++;
> +               walk_arg->bytes_written +=3D length;
>         }
>
>         return ret;
> @@ -1169,8 +1177,11 @@ static enum lru_status shrink_memcg_cb(struct list=
_head *item, struct list_lru_o
>  static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
>                 struct shrink_control *sc)
>  {
> +       struct zswap_shrink_walk_arg walk_arg =3D {
> +               .bytes_written =3D 0,
> +               .encountered_page_in_swapcache =3D false,
> +       };
>         unsigned long shrink_ret;
> -       bool encountered_page_in_swapcache =3D false;
>
>         if (!zswap_shrinker_enabled ||
>                         !mem_cgroup_zswap_writeback_enabled(sc->memcg)) {
> @@ -1179,9 +1190,9 @@ static unsigned long zswap_shrinker_scan(struct shr=
inker *shrinker,
>         }
>
>         shrink_ret =3D list_lru_shrink_walk(&zswap_list_lru, sc, &shrink_=
memcg_cb,
> -               &encountered_page_in_swapcache);
> +               &walk_arg);
>
> -       if (encountered_page_in_swapcache)
> +       if (walk_arg.encountered_page_in_swapcache)
>                 return SHRINK_STOP;
>
>         return shrink_ret ? shrink_ret : SHRINK_STOP;
> @@ -1275,9 +1286,31 @@ static struct shrinker *zswap_alloc_shrinker(void)
>         return shrinker;
>  }
>
> -static int shrink_memcg(struct mem_cgroup *memcg)
> +#define NR_ZSWAP_WB_BATCH      64UL
> +
> +/*
> + * Scan up to @nr_to_scan pages across the per-node zswap LRUs of @memcg
> + * and write back the reclaimable ones.
> + *
> + * Since the second-chance algorithm rotates referenced entries to the
> + * LRU tail, the per-node scan is capped at the current LRU length so
> + * each entry is scanned at most once per call. It is up to the caller
> + * to handle retries, deciding whether to scan another memcg to complete
> + * the full iteration, or to rescan the current memcg to drain its zswap
> + * entries.
> + *
> + * Return: The number of compressed bytes written back (>=3D 0), or -ENO=
ENT
> + * if @memcg has writeback disabled, is a zombie cgroup, or has empty
> + * zswap LRUs.
> + */
> +static long shrink_memcg(struct mem_cgroup *memcg, unsigned long nr_to_s=
can)
>  {
> -       int nid, shrunk =3D 0, scanned =3D 0;
> +       struct zswap_shrink_walk_arg walk_arg =3D {
> +               .bytes_written =3D 0,
> +               .encountered_page_in_swapcache =3D false,
> +       };
> +       unsigned long nr_remaining =3D nr_to_scan;
> +       int nid;
>
>         if (!mem_cgroup_zswap_writeback_enabled(memcg))
>                 return -ENOENT;
> @@ -1290,24 +1323,40 @@ static int shrink_memcg(struct mem_cgroup *memcg)
>                 return -ENOENT;
>
>         for_each_node_state(nid, N_NORMAL_MEMORY) {
> -               unsigned long nr_to_walk =3D 1;
> +               unsigned long nr_to_walk;
>
> -               shrunk +=3D list_lru_walk_one(&zswap_list_lru, nid, memcg=
,
> -                                           &shrink_memcg_cb, NULL, &nr_t=
o_walk);
> -               scanned +=3D 1 - nr_to_walk;
> +               /*
> +                * Cap the scan at per-node LRU length so each entry is s=
canned
> +                * at most once per call.
> +                */
> +               nr_to_walk =3D min(nr_remaining,
> +                                list_lru_count_one(&zswap_list_lru, nid,=
 memcg));
> +               if (!nr_to_walk)
> +                       continue;
> +
> +               nr_remaining -=3D nr_to_walk;
> +               list_lru_walk_one(&zswap_list_lru, nid, memcg, &shrink_me=
mcg_cb,
> +                                 &walk_arg, &nr_to_walk);
> +               /* Return the unused share of the budget to the pool. */
> +               nr_remaining +=3D nr_to_walk;
> +
> +               if (!nr_remaining)
> +                       break;
>         }
>
> -       if (!scanned)
> +       /* Nothing was scanned: every LRU under @memcg was empty. */
> +       if (nr_remaining =3D=3D nr_to_scan)
>                 return -ENOENT;
>
> -       return shrunk ? 0 : -EAGAIN;
> +       return walk_arg.bytes_written;
>  }
>
>  static void shrink_worker(struct work_struct *w)
>  {
>         struct mem_cgroup *memcg;
> -       int ret, failures =3D 0, attempts =3D 0;
> +       int failures =3D 0, attempts =3D 0;
>         unsigned long thr;
> +       long ret;
>
>         /* Reclaim down to the accept threshold */
>         thr =3D zswap_accept_thr_pages();
> @@ -1369,7 +1418,7 @@ static void shrink_worker(struct work_struct *w)
>                         goto resched;
>                 }
>
> -               ret =3D shrink_memcg(memcg);
> +               ret =3D shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
>                 /* drop the extra reference */
>                 mem_cgroup_put(memcg);
>
> @@ -1383,7 +1432,7 @@ static void shrink_worker(struct work_struct *w)
>                         continue;
>                 ++attempts;
>
> -               if (ret && ++failures =3D=3D MAX_RECLAIM_RETRIES)
> +               if (ret <=3D 0 && ++failures =3D=3D MAX_RECLAIM_RETRIES)
>                         break;
>  resched:
>                 cond_resched();
> @@ -1493,7 +1542,7 @@ bool zswap_store(struct folio *folio)
>         objcg =3D get_obj_cgroup_from_folio(folio);
>         if (objcg && !obj_cgroup_may_zswap(objcg)) {
>                 memcg =3D get_mem_cgroup_from_objcg(objcg);
> -               if (shrink_memcg(memcg)) {
> +               if (shrink_memcg(memcg, 1) <=3D 0) {
>                         mem_cgroup_put(memcg);
>                         goto put_objcg;
>                 }
> --
> 2.34.1
>
