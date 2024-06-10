Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7C847A60
	for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 20:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718051284; cv=none; b=GTZ/RYUeSHMhxXtn/pvTI5YZrYC1YO4cL4znfLxlTVVaizq7JGND4qT9deTzFZO5UJQC7xWCosecimi7dlf5Ve0sqmfs7LdU4HlwFbwZG1JrAXYMlAnrku4jMQL2BIGcBHnrCxGHFzQB/R94QqvHyGicnq5axYq4Op/X/zNjPWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718051284; c=relaxed/simple;
	bh=QLun0ZmSJonCAnqt5EQS+rf8Lz10qIaVszRa5dv+Xy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WvtaJkGo+418pj94FLtyJHLr0cNnLHFLCIO4w3+YU9phJANFAggERSFMc60KyE8X60pAa8DV6+elRXAxxcuXgoV+ivE1DS3NJHzATy6DWSf2zGt9hVUmNXg1FK6i3BdznsaqBTVK1dzAUFH9Nh/z+juzBYbqzORrMUbHr0qWKzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U3i7pCwa; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U3i7pCwa"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a6f176c5c10so35111866b.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 13:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718051281; x=1718656081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmaAu+iZsuEjEiEeynNp1R7+/jNy6Qzg+Lrp5NYV5lE=;
        b=U3i7pCwaO11vdr3llWGTfyNsseYGp70qQSiIFKzj5pGUKTv3PMK8ieH+QEjfklorf4
         rpnwpBOS62PvvoE4d41pAHsBdXy2DFsrVaZFKOC99WtwxRG3eNn/aoI2V7r4fIDTq/OO
         S07SiMfRyoH4RCyAFufxbANdGGPlxhUkBNHnfEahyHdBv4F4pIeXW3qv18kffa2dqE1T
         TlyC5Y2p7MCiKd0EtTWvX9Nw0KV1kS4OZsPTgy7+jHQyQScsvFdLwY4pOeCFPjx0wDgA
         mC/KByH6wBMIs99mpolRUqNZyPOxMivA1xDlNy2j1+PK2p7cpeto1xg+HYh4kCA5iTU4
         4e6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718051281; x=1718656081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmaAu+iZsuEjEiEeynNp1R7+/jNy6Qzg+Lrp5NYV5lE=;
        b=g5GmvDWeWYiMHrF4dfYlescyP1j5uAQc2woaXpJGPN5+Dmy0E8jfi1QQ1VoeHxgpwT
         pHdqsQtl7zuhoadIAZEQFiv184afb0byHtM9qLfymmoN1LqZGiyaFSLDoR7eDlb6R4St
         qcmL6hxodyi5rVMjSVG3JYaUBE/QBIdM3NSTkCXhlaahXhiVOYeHqTG6NWuBveBruZlz
         IGSCqF/ZhjlrS2ocmgP3HA5kV/HqzdvJ3lnQ9CN0JAN+tGOiva3PhSD2Rom3/fKMLfEk
         qsgcvEMZSGo344joG/tacwnoQpcpJzCGoivjfa28zDKFQS4NbTGyyLfnNiDNVISWbn6D
         THgA==
X-Forwarded-Encrypted: i=1; AJvYcCW8QBnfNsZ4kultUwsmbI+8QZvbhK6S5Qtqrxcbgi8MWXCUhnVN3uch2OImLIPnT8W2URTYop3Y5/tjWhdpSWIKNdb8jBCiUgng
X-Gm-Message-State: AOJu0YxNwuXiNQIOmsoQ8QLdSdC0mBm6wFmvg8RTyk/dpKcCohm/XmRr
	FfOvgY5XYY+JLtf16Z0KxUKSZ3GZEj5QICbEdWnyXNsGpwrirahe4dqdOgemTAdLjVdw+kXGaml
	5WmktL6Wy/DkAq7Ps+lETUs/Pv2+8tcWz/p81
X-Google-Smtp-Source: AGHT+IGXSvDrAADj9Pf8Xu53OIXItT5TQK5ibDqDLkBUNlFNRj/gYFiO9Qxz2XUO3Ze11843IeDDNQqVlc+Qa3ui1pw=
X-Received: by 2002:a17:906:89a:b0:a6f:1fc0:3fc0 with SMTP id
 a640c23a62f3a-a6f1fc04524mr225232566b.6.1718051280487; Mon, 10 Jun 2024
 13:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240608155316.451600-1-flintglass@gmail.com> <20240608155316.451600-3-flintglass@gmail.com>
In-Reply-To: <20240608155316.451600-3-flintglass@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 10 Jun 2024 13:27:22 -0700
Message-ID: <CAJD7tkZAkzUfbXY3C0QOGqCyjQZeiuGzkZac4hmogOoh=yoZsw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] mm: zswap: fix global shrinker error handling logic
To: Takero Funaki <flintglass@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 8, 2024 at 8:53=E2=80=AFAM Takero Funaki <flintglass@gmail.com>=
 wrote:
>
> This patch fixes zswap global shrinker that did not shrink zpool as
> expected.
>
> The issue it addresses is that `shrink_worker()` did not distinguish
> between unexpected errors and expected error codes that should be
> skipped, such as when there is no stored page in a memcg. This led to
> the shrinking process being aborted on the expected error codes.
>
> The shrinker should ignore these cases and skip to the next memcg.
> However,  skipping all memcgs presents another problem. To address this,
> this patch tracks progress while walking the memcg tree and checks for
> progress once the tree walk is completed.
>
> To handle the empty memcg case, the helper function `shrink_memcg()` is
> modified to check if the memcg is empty and then return -ENOENT.
>
> Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
> Signed-off-by: Takero Funaki <flintglass@gmail.com>
> ---
>  mm/zswap.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index d720a42069b6..1a90f434f247 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1393,7 +1393,7 @@ static struct shrinker *zswap_alloc_shrinker(void)
>
>  static int shrink_memcg(struct mem_cgroup *memcg)
>  {
> -       int nid, shrunk =3D 0;
> +       int nid, shrunk =3D 0, stored =3D 0;
>
>         if (!mem_cgroup_zswap_writeback_enabled(memcg))
>                 return -EINVAL;
> @@ -1408,9 +1408,16 @@ static int shrink_memcg(struct mem_cgroup *memcg)
>         for_each_node_state(nid, N_NORMAL_MEMORY) {
>                 unsigned long nr_to_walk =3D 1;
>
> +               if (!list_lru_count_one(&zswap_list_lru, nid, memcg))
> +                       continue;
> +               ++stored;
>                 shrunk +=3D list_lru_walk_one(&zswap_list_lru, nid, memcg=
,
>                                             &shrink_memcg_cb, NULL, &nr_t=
o_walk);
>         }
> +
> +       if (!stored)
> +               return -ENOENT;
> +

Can't we just check nr_to_walk here and return -ENOENT if it remains as 1?

Something like:

if (nr_to_walk)
    return -ENOENT;
if (!shrunk)
    return -EAGAIN;
return 0;

>         return shrunk ? 0 : -EAGAIN;
>  }
>
> @@ -1418,12 +1425,18 @@ static void shrink_worker(struct work_struct *w)
>  {
>         struct mem_cgroup *memcg =3D NULL;
>         struct mem_cgroup *next_memcg;
> -       int ret, failures =3D 0;
> +       int ret, failures =3D 0, progress;
>         unsigned long thr;
>
>         /* Reclaim down to the accept threshold */
>         thr =3D zswap_accept_thr_pages();
>
> +       /*
> +        * We might start from the last memcg.
> +        * That is not a failure.
> +        */
> +       progress =3D 1;
> +
>         /* global reclaim will select cgroup in a round-robin fashion.
>          *
>          * We save iteration cursor memcg into zswap_next_shrink,
> @@ -1461,9 +1474,12 @@ static void shrink_worker(struct work_struct *w)
>                  */
>                 if (!memcg) {
>                         spin_unlock(&zswap_shrink_lock);
> -                       if (++failures =3D=3D MAX_RECLAIM_RETRIES)
> +
> +                       /* tree walk completed but no progress */
> +                       if (!progress && ++failures =3D=3D MAX_RECLAIM_RE=
TRIES)
>                                 break;

It seems like we may keep iterating the entire hierarchy a lot of
times as long as we are making any type of progress. This doesn't seem
right.

>
> +                       progress =3D 0;
>                         goto resched;
>                 }
>
> @@ -1493,10 +1509,15 @@ static void shrink_worker(struct work_struct *w)
>                 /* drop the extra reference */
>                 mem_cgroup_put(memcg);
>
> -               if (ret =3D=3D -EINVAL)
> -                       break;
> +               /* not a writeback candidate memcg */
> +               if (ret =3D=3D -EINVAL || ret =3D=3D -ENOENT)
> +                       continue;
> +

We should probably return -ENOENT for memcg with writeback disabled as well=
.

>                 if (ret && ++failures =3D=3D MAX_RECLAIM_RETRIES)
>                         break;
> +
> +               ++progress;
> +               /* reschedule as we performed some IO */
>  resched:
>                 cond_resched();
>         } while (zswap_total_pages() > thr);
> --
> 2.43.0
>
