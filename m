Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E47E37EFF0
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 19:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529306; cv=pass; b=oz/qXKhm3ccrEUf6Aa/ZlVV2MxQNYU+vP82PVuzBPqfiayPzgmEBCEar+8DZqTxY8HFzSkBu894ReTxZo6AkhVgzZZg9U9B9aIELim/cIw3GiyyjgB226x+2dGCNOILia8DX+ja5pw3DF1al6Ei1vJLKXCPzMgHL6axBIP76Cys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529306; c=relaxed/simple;
	bh=OR8yyipJ9O4RJUTelOjhogfDT0juzOkkFJACSZPniZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2fLQHBnPxNArjnFl8QS1mh4Tc7EySkduVROVq9SPJQLT42fahkrn6AyxCVE01rAZXo+ri6zQFu5ntetsLEfMx264ONQ7qRj2E+BxRWtbAkHaERxC9SgMV0MiDnlgC3k7yOqiGFNkKF/R5kTgDB+soWFCczc9Son8tYBhCfwywk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeKocPaL; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeKocPaL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so56325895e9.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 12:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778529302; cv=none;
        d=google.com; s=arc-20240605;
        b=gjOrU3BHHTjCCAjVVWnP47OeZ7Kb9FgBQkgKh63B1Bilrnq0xNuDqUptVied90VqMS
         uaH88sbBL/9Xpl2gklLVpFq0a8GqYlWAWUwCDOmw4ftAdDdc9RWClf/ceFYfUIBJActO
         YPOofu1tlgOy3Ggp/kMxX9GCUm/FJyl71wSCNzOjrhRQB+SPyrgHwuCoylFu9N6LvxJQ
         lwYx+aoy9zEaQmKVO+PB5apEGaLKwVeRSE6Bi5r9RF7WnE/tl2iIJooSr3zTf/v/zkeB
         RMVFDb/Ta5jT/GlkBP0ZBm/KlfZzbuVxSAJ9Fnp8XetwHaQs4auedtT36NIUwpYAwmGN
         TZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i7Wb8FVSSb9fnvT6S6aZiv4w+DGoN/cjPv8shYHV1nQ=;
        fh=0Es9fobtUCC3Qd6PioU2TxSkrW+WGOsHwCILLDFYRhs=;
        b=dx+JZKO61pMJonyyO1pU174xDnphcMlXs9IBhYeYcWS8U3Q3o9YnHSybdJjSnTHGm6
         M+qE1nENeyMOkSmHT2IbHqm4q5ixzg3W1/0pQvKlk9/v4d+DTdNna7YxwH7PJH5NrPTf
         KaG0EoQqYzqeEiI5GSwRJ03E5p7H2mYQSO7/eI/IfeDaYcIXuAdDyS7YGRe+eTeiPhGd
         e1Tvue6nk2ZMsYnkPWXi7VUv6yNOFlbhPHPhVjfI6CL2TLhD5XthWD0e7gX+8sQeN+xA
         kPakCMt9SXQniM4bL9RCgI2GkJNZhdMaZk6yakeTzQPAa3bOZbopJpSzrNCA6iT1r+kU
         kaEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778529302; x=1779134102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7Wb8FVSSb9fnvT6S6aZiv4w+DGoN/cjPv8shYHV1nQ=;
        b=CeKocPaLEIpSVqSueKt8H84eXmwtv8RhcMr0J6jVE3s2TS8+/ScEingp98QivcPsKq
         kD1dHmqMvr228Ww6M4Urc3cyfNFT9If0xn7xRQbTQVyqS/MjsNOTGyh54bKvoy7DhUbV
         wFvxLnnTZHla6+SDUHFjHa0taFeF5u5KJZv0PRRIwvzYMDdQgkOk1NhdolkNJlWcBWiz
         w42WoSwwUt3YFTfGrkxT8RovFNqlb6z2jABh9QQi9qL6sKnydscw9YAgKgA8AowcwKSX
         4vloRRQyFlcq8du+Ewnr4H13yPqWDik6iw+bIvJhkzyDo8ya6D8J9RvYDyFJvFavSfTR
         GIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778529302; x=1779134102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i7Wb8FVSSb9fnvT6S6aZiv4w+DGoN/cjPv8shYHV1nQ=;
        b=HN0bfy9jA9VwLR3Xp305YTSW/QoF2iQePd/LQvd/j60dPdFOEi2koysupP6tlOJDO8
         SHNNT6GQePZdbXHLHOApNUM58Nhoyj1D5nBt4RlOL1VIHCZNFbXqy8SqXnUo5Z7GFXdp
         41brttXFMiSI7kNh30YM3SoxabZa2/vpdw6CuqnpPDMeaWau/bIUErf+q4CVZdzlHRhW
         ah3acZSfkUz5vgsVBpY2TbJJQsZi6ll1LqUvAxjkIxRHknyWkeFsVgXNojFatN1sa7k9
         JWLkZ9r2Z6w8WK1eiZz9x/d/Y0Iw0fW2OSOwrqg7M8pq3vfr/BwYICbj5kOXDMagwwlv
         Z8aw==
X-Forwarded-Encrypted: i=1; AFNElJ8564IkLttJl/Dm1WZ6nYJTdxEOKIbW++2WvdkfRHuxwEc0Qze7UJC3eHBonqvqgawLDiSr8djUuy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzUs3PoyOenF31FWIHandWwJhkwZVBgDQFiOMY+ILBkzcATT8Y
	JECZHDhPdS37+6V2EZomyB6cTaleMixmwzOuLkuNW0fK5z+kmju/Ef72e4wzFi0Xj5YOLsVg1pe
	ITyia/x28+RuYVYZrl5Y4oiKW3kjXBv0=
X-Gm-Gg: Acq92OFOhl9PllM0EGh/tCtb6GWjCVNe9qki3aQE2hml4eSVO/BdDp2P0Qbuset7OzR
	f6PA5J36o38j9SYfEzMp1SB3tjTNSCqjAiW9XpGF7lc5Qvv3w+xm/GKCxyEhp/a6nPPCtNbRZdN
	ljZKkPXh7EBRCItes/zntgVEmkGUYUVkxaZ0oDQEWsMpy8TiDuBBQ4NDLk9GiLGYz9w8sjpyzWK
	YaLoJj3U3M6KEwS/7hE2HlFJTR80SVs0lTKbMTD8V9mEO3qidStippmJLde7r0gywNfOSJS1X45
	XJqNpWxm876cwxdBHiaBFPYipbs0ZoyTYfr7dbU=
X-Received: by 2002:a05:600c:35d6:b0:489:1ff1:74d3 with SMTP id
 5b1f17b1804b1-48e707033f0mr185372725e9.20.1778529302289; Mon, 11 May 2026
 12:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511105149.75584-1-jiahao.kernel@gmail.com> <20260511105149.75584-3-jiahao.kernel@gmail.com>
In-Reply-To: <20260511105149.75584-3-jiahao.kernel@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 11 May 2026 12:54:48 -0700
X-Gm-Features: AVHnY4KxTofzGA29WdApz7TAGVVFv1pib_PN6weIqMmJZRLUqnjNkT8S2YWonGY
Message-ID: <CAKEwX=PW2+EN41ANutv4cv+iM+JpwV5V+NSp5ukAt0M6fbHFLg@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 3:52=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
> From: Hao Jia <jiahao1@lixiang.com>
>
> Zswap currently writes back pages to backing swap devices reactively,
> triggered either by memory pressure via the shrinker or by the pool
> reaching its size limit. This reactive approach offers no precise
> control over when writeback happens, which can disturb latency-sensitive
> workloads, and it cannot direct writeback at a specific memory cgroup.
> However, there are scenarios where users might want to proactively
> write back cold pages from zswap to the backing swap device, for
> example, to free up memory for other applications or to prepare for
> upcoming memory-intensive workloads.
>
> Therefore, implement a proactive writeback mechanism for zswap by
> adding a new cgroup interface file memory.zswap.proactive_writeback
> within the memory controller.
>
> Users can trigger writeback by writing to this file with the following
> parameters:
> - max=3D<bytes>: The maximum amount of memory to write back (optional,
>   default: unlimited).
> - <age>: The minimum age of the pages to write back. Only pages that
>   have been in zswap for at least this duration will be written back.
>
> Example usage:
>   # Write back pages older than 1 hour (3600 seconds), max 10MB
>   echo "max=3D10M 3600" > memory.zswap.proactive_writeback
>
> The implementation consists of:
> 1. Add store_time to struct zswap_entry to record when each entry was
>    inserted into zswap, used for proactive writeback age comparison.
> 2. Introduce struct zswap_shrink_walk_arg, passed as the cb_arg to
>    list_lru_walk_one() in both the shrinker and proactive paths. It
>    carries the per-invocation cutoff_time and proactive flag down to
>    shrink_memcg_cb(), and propagates the encountered_page_in_swapcache
>    out-signal from the callback back to the caller.
> 3. Modify the callback function shrink_memcg_cb() to proactively
>    writeback zswap_entries that meet the time threshold.
> 4. Add zswap_proactive_writeback() as the proactive writeback driver:
>    a per-node batched list_lru_walk_one() loop bounded by the
>    writeback budget.
>
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst |  24 ++++
>  include/linux/zswap.h                   |   8 ++
>  mm/memcontrol.c                         |  76 ++++++++++
>  mm/zswap.c                              | 176 ++++++++++++++++++++++--
>  4 files changed, 276 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admi=
n-guide/cgroup-v2.rst
> index 6efd0095ed99..05b664b3b3e8 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1908,6 +1908,30 @@ The following nested keys are defined.
>         This setting has no effect if zswap is disabled, and swapping
>         is allowed unless memory.swap.max is set to 0.
>
> +  memory.zswap.proactive_writeback
> +       A write-only nested-keyed file which exists in non-root cgroups.
> +
> +       This interface allows proactive writeback of pages from the zswap
> +       pool to the backing swap device. This is useful to offload cold
> +       pages from the zswap pool to the slower swap device. It is only
> +       available if zswap writeback is enabled.
> +
> +       Users can trigger writeback by writing to this file with the foll=
owing
> +       parameters:
> +
> +       - "max=3D<bytes>" : Optional. The maximum amount of data to write=
 back.
> +         (default: unlimited). Please note that the kernel can over or u=
nder
> +         writeback this value.
> +
> +       - "<age>" : Required. The minimum age of the pages to write back
> +         (in seconds). Only pages that have been in the zswap pool for a=
t
> +         least this amount of time will be written back.
> +
> +       Example::
> +
> +         # Write back pages older than 1 hour (3600 seconds), max 10MB
> +         echo "max=3D10M 3600" > memory.zswap.proactive_writeback
> +
>    memory.pressure
>         A read-only nested-keyed file.
>
> diff --git a/include/linux/zswap.h b/include/linux/zswap.h
> index efa6b551217e..7a51b4f95017 100644
> --- a/include/linux/zswap.h
> +++ b/include/linux/zswap.h
> @@ -44,6 +44,8 @@ void zswap_lruvec_state_init(struct lruvec *lruvec);
>  void zswap_folio_swapin(struct folio *folio);
>  bool zswap_is_enabled(void);
>  bool zswap_never_enabled(void);
> +int zswap_proactive_writeback(struct mem_cgroup *root, unsigned long nr_=
max_writeback,
> +                             ktime_t cutoff);
>  #else
>
>  struct zswap_lruvec_state {};
> @@ -78,6 +80,12 @@ static inline bool zswap_never_enabled(void)
>         return true;
>  }
>
> +static inline int zswap_proactive_writeback(struct mem_cgroup *root,
> +                                           unsigned long nr_max_writebac=
k, ktime_t cutoff)
> +{
> +       return 0;
> +}
> +
>  #endif
>
>  #endif /* _LINUX_ZSWAP_H */
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 409c41359dc8..ba7f7b1954a8 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -70,6 +70,7 @@
>  #include "memcontrol-v1.h"
>
>  #include <linux/uaccess.h>
> +#include <linux/parser.h>
>
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/memcg.h>
> @@ -5891,6 +5892,76 @@ static ssize_t zswap_writeback_write(struct kernfs=
_open_file *of,
>         return nbytes;
>  }
>
> +enum {
> +       ZSWAP_WRITEBACK_MAX,
> +       ZSWAP_WRITEBACK_AGE,
> +       ZSWAP_WRITEBACK_ERR,
> +};
> +
> +static const match_table_t zswap_writeback_tokens =3D {
> +       { ZSWAP_WRITEBACK_MAX, "max=3D%s" },
> +       { ZSWAP_WRITEBACK_AGE, "%u" },
> +       { ZSWAP_WRITEBACK_ERR, NULL },
> +};
> +
> +static ssize_t zswap_proactive_writeback_write(struct kernfs_open_file *=
of,
> +                                              char *buf, size_t nbytes,
> +                                              loff_t off)
> +{
> +       struct mem_cgroup *memcg =3D mem_cgroup_from_css(of_css(of));
> +       unsigned long nr_max_writeback =3D ULONG_MAX;
> +       substring_t args[MAX_OPT_ARGS];
> +       unsigned int age_sec;
> +       bool age_set =3D false;
> +       ktime_t cutoff_time;
> +       char *token, *end;
> +       int err;
> +
> +       if (!mem_cgroup_zswap_writeback_enabled(memcg))
> +               return -EINVAL;
> +
> +       buf =3D strstrip(buf);
> +
> +       while ((token =3D strsep(&buf, " ")) !=3D NULL) {
> +               if (!strlen(token))
> +                       continue;
> +
> +               switch (match_token(token, zswap_writeback_tokens, args))=
 {
> +               case ZSWAP_WRITEBACK_MAX:
> +                       nr_max_writeback =3D memparse(args[0].from, &end)=
;
> +                       if (*end !=3D '\0')
> +                               return -EINVAL;
> +                       nr_max_writeback >>=3D PAGE_SHIFT;
> +                       break;
> +               case ZSWAP_WRITEBACK_AGE:
> +                       if (age_set)
> +                               return -EINVAL;
> +
> +                       if (match_uint(&args[0], &age_sec))
> +                               return -EINVAL;
> +                       age_set =3D true;
> +                       break;
> +               default:
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       if (!age_set || !age_sec || !nr_max_writeback)
> +               return -EINVAL;
> +
> +       cutoff_time =3D ktime_sub(ktime_get_boottime(),
> +                               ns_to_ktime((u64)age_sec * NSEC_PER_SEC))=
;
> +       /* age_sec >=3D uptime: no entry can be that old, skip the walk. =
*/
> +       if (ktime_to_ns(cutoff_time) <=3D 0)
> +               return nbytes;
> +
> +       err =3D zswap_proactive_writeback(memcg, nr_max_writeback, cutoff=
_time);
> +       if (err)
> +               return err;
> +
> +       return nbytes;
> +}
> +
>  static struct cftype zswap_files[] =3D {
>         {
>                 .name =3D "zswap.current",
> @@ -5908,6 +5979,11 @@ static struct cftype zswap_files[] =3D {
>                 .seq_show =3D zswap_writeback_show,
>                 .write =3D zswap_writeback_write,
>         },
> +       {
> +               .name =3D "zswap.proactive_writeback",
> +               .flags =3D CFTYPE_NOT_ON_ROOT,
> +               .write =3D zswap_proactive_writeback_write,
> +       },
>         { }     /* terminate */
>  };
>  #endif /* CONFIG_ZSWAP */
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 19538d6f169a..1173ac6836fa 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -36,6 +36,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/list_lru.h>
>  #include <linux/zsmalloc.h>
> +#include <linux/timekeeping.h>
>
>  #include "swap.h"
>  #include "internal.h"
> @@ -160,6 +161,12 @@ struct zswap_pool {
>         char tfm_name[CRYPTO_MAX_ALG_NAME];
>  };
>
> +struct zswap_shrink_walk_arg {
> +       ktime_t cutoff_time;
> +       bool proactive;
> +       bool encountered_page_in_swapcache;
> +};
> +
>  /* Global LRU lists shared by all zswap pools. */
>  static struct list_lru zswap_list_lru;
>
> @@ -183,6 +190,7 @@ static struct shrinker *zswap_shrinker;
>   * handle - zsmalloc allocation handle that stores the compressed page d=
ata
>   * objcg - the obj_cgroup that the compressed memory is charged to
>   * lru - handle to the pool's lru used to evict pages.
> + * store_time - Time when the entry was stored, for proactive writeback.
>   */
>  struct zswap_entry {
>         swp_entry_t swpentry;
> @@ -192,6 +200,7 @@ struct zswap_entry {
>         unsigned long handle;
>         struct obj_cgroup *objcg;
>         struct list_head lru;
> +       ktime_t store_time;

On the implementation side - will this blow up struct zswap_entry
memory footprint? If so, can you guard this behind a CONFIG option, if
we are to go this route?
