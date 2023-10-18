Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BA246620
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 23:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jwvCiUBS"
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481F7114
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 16:25:16 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-991c786369cso1182238166b.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 16:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697671514; x=1698276314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6OMMJzrM/r2QS69Np81LPWdTT/4PTGNitohtEO8snE=;
        b=jwvCiUBSCWRNkc8wgOUTYcTlhDf++g0fneizrponvy/EF+KqB3XG9FY0upuwnBzUz7
         TQwE6sY40GZropMM6B26pJ9Eg3vWsQEZFXFkM2xOnLK3N7qUJe1MMlqgD6MLga6xHJvR
         g/UYhi7jofKgFugTP1fPxkESgzn+ec0Uf8kZF/fpay7k7fe5IIJCBMqL/5Xnv18QeGzN
         dc0AYyh+EXRDtNDYDZ1kYnLoi96xubkKdw4AdlYbX1EYnmBvfFzrAIU5fYLAgQ6mj/Nq
         WTrFFfgxcJ5O/XcSc/8W+1Fi1F6Usmm6plC7x1bc7OwItVkQbwQeuUZ3b7B91ZEFxblc
         Jxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697671514; x=1698276314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6OMMJzrM/r2QS69Np81LPWdTT/4PTGNitohtEO8snE=;
        b=SNFSl6IUDscVjtR/hcsJVeIVhEcR9jMMRAmfyaTLTY0bP9qj96Kuds0b+2cbWcRCf9
         TNh6AuxpkH6snEeDdaInRnZ5m6yFge4xutkdfwtpOmn5XnGhqnUfO8fc6fPD2YhCmqen
         S//B8Spiyk5FzXmja/WrOfRkotYxWnby5arnUiawR704tjfofUsQI0z2UrjKbciSFa22
         jnrYjCTJ1IKlCaMGR1vDXuiEcEewRJEH+1IFt8RfblOL6+xVtAsyQ8xEWWUjj6tYmbUN
         h5kc/apumqN+FGh36xrh/ipUN478CCuJj9iPZdEpagHQ5fEYW7mR0jQ/hT9npR6UlhE0
         G4OA==
X-Gm-Message-State: AOJu0Yzfgq7LQx60gVtziB8/CJRKXZGrB2LhaZ5Fb7jN40MMnUkySYFD
	9RwJjAWtyk6BN39cXMJIyAzP9LWqi+7TTHrCg0u2Kw==
X-Google-Smtp-Source: AGHT+IE+y7pOC7NjtyakaWbo9IfAWBZkUfM0P9ELvDGljkKBEfeMFmh8nYhFAgK2lWPGdLiHJT2IPkLHz3eNaWWPWXU=
X-Received: by 2002:a17:906:dc91:b0:9bf:5df1:38d2 with SMTP id
 cs17-20020a170906dc9100b009bf5df138d2mr445791ejc.3.1697671514379; Wed, 18 Oct
 2023 16:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017232152.2605440-1-nphamcs@gmail.com> <20231017232152.2605440-4-nphamcs@gmail.com>
In-Reply-To: <20231017232152.2605440-4-nphamcs@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 18 Oct 2023 16:24:38 -0700
Message-ID: <CAJD7tkbz1d-E-q0MphD=676-ftp-bmOOCFgVxq5mRKgbgGLuYA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mm: memcg: add per-memcg zswap writeback stat
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com, 
	muchun.song@linux.dev, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 4:21=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> From: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
>
> Since zswap now writes back pages from memcg-specific LRUs, we now need a
> new stat to show writebacks count for each memcg.
>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  include/linux/memcontrol.h |  2 ++
>  mm/memcontrol.c            | 15 +++++++++++++++
>  mm/zswap.c                 |  3 +++
>  3 files changed, 20 insertions(+)
>
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 3de10fabea0f..7868b1e00bf5 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -38,6 +38,7 @@ enum memcg_stat_item {
>         MEMCG_KMEM,
>         MEMCG_ZSWAP_B,
>         MEMCG_ZSWAPPED,
> +       MEMCG_ZSWAP_WB,
>         MEMCG_NR_STAT,
>  };
>
> @@ -1884,6 +1885,7 @@ static inline void count_objcg_event(struct obj_cgr=
oup *objcg,
>  bool obj_cgroup_may_zswap(struct obj_cgroup *objcg);
>  void obj_cgroup_charge_zswap(struct obj_cgroup *objcg, size_t size);
>  void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size);
> +void obj_cgroup_report_zswap_wb(struct obj_cgroup *objcg);
>  #else
>  static inline bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
>  {
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 1bde67b29287..a9118871e5a6 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -1505,6 +1505,7 @@ static const struct memory_stat memory_stats[] =3D =
{
>  #if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
>         { "zswap",                      MEMCG_ZSWAP_B                   }=
,
>         { "zswapped",                   MEMCG_ZSWAPPED                  }=
,
> +       { "zswap_wb",                   MEMCG_ZSWAP_WB                  }=
,

zswap_writeback would be more consistent with file_writeback below.

Taking a step back, this is not really a "state". We increment it by 1
every time and never decrement it. Sounds awfully similar to events :)

You can also use count_objcg_event() directly and avoid the need for
obj_cgroup_report_zswap_wb() below.

>  #endif
>         { "file_mapped",                NR_FILE_MAPPED                  }=
,
>         { "file_dirty",                 NR_FILE_DIRTY                   }=
,
> @@ -1541,6 +1542,7 @@ static int memcg_page_state_unit(int item)
>         switch (item) {
>         case MEMCG_PERCPU_B:
>         case MEMCG_ZSWAP_B:
> +       case MEMCG_ZSWAP_WB:
>         case NR_SLAB_RECLAIMABLE_B:
>         case NR_SLAB_UNRECLAIMABLE_B:
>         case WORKINGSET_REFAULT_ANON:
> @@ -7861,6 +7863,19 @@ void obj_cgroup_uncharge_zswap(struct obj_cgroup *=
objcg, size_t size)
>         rcu_read_unlock();
>  }
>
> +void obj_cgroup_report_zswap_wb(struct obj_cgroup *objcg)
> +{
> +       struct mem_cgroup *memcg;
> +
> +       if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
> +               return;
> +
> +       rcu_read_lock();
> +       memcg =3D obj_cgroup_memcg(objcg);
> +       mod_memcg_state(memcg, MEMCG_ZSWAP_WB, 1);
> +       rcu_read_unlock();
> +}
> +
>  static u64 zswap_current_read(struct cgroup_subsys_state *css,
>                               struct cftype *cft)
>  {
> diff --git a/mm/zswap.c b/mm/zswap.c
> index d2989ad11814..15485427e3fa 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -704,6 +704,9 @@ static enum lru_status shrink_memcg_cb(struct list_he=
ad *item, struct list_lru_o
>         }
>         zswap_written_back_pages++;
>
> +       if (entry->objcg)
> +               obj_cgroup_report_zswap_wb(entry->objcg);
> +
>         /*
>          * Writeback started successfully, the page now belongs to the
>          * swapcache. Drop the entry from zswap - unless invalidate alrea=
dy
> --
> 2.34.1
