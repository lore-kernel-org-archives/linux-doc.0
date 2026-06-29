Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15582773D3
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 18:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782758260; cv=pass; b=hMtqWZj8ntqBWufumd99jCM/982Zg+Uzz2u4XfBkIHhXP0LBcAir9NU+tMaBCKESHYjgmlaT472IRGXNc0mQLt9I7E3g7yQ1qkf8lwZtALkQe5pkpdwUBhV9ow14UY5jmY3PLqXlLGw4c/TqDuNmySu6xwe9YQSd/7gS7ovDdLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782758260; c=relaxed/simple;
	bh=8aAWH9rSKkLqi+1sE6zKTPYetQDRKFAsL6S7Z65BNdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDrDL6VsUYl3tN7G3HkEPb0LXDceqenUqomDgVl41Rg3l4zRjgldPdMVDs3ZYrkAVnn05heSAu4u9jLCfqSPN6IXJCNwq5x1wSE8JQS/469Y/6wLUk4O2x/7NBLykKiYvn+wAAgyaApiNSX2O8HaHplPjbaiNUS6vwL/A/hYJok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5Fp93nT; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5Fp93nT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b29be0d6so9994435e9.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 11:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782758257; cv=none;
        d=google.com; s=arc-20260327;
        b=BLoxbHE+dfGlBwrKahrgOm8D2/3QeT9CZpe/LZFzz4dXmHL8MdqOQFuDjmFGe1K0+1
         w7ZEISTXt5umGsyP/Lrydq4GI9xqUoJrFP4Tva5ZU6xYR8l9g7Zge0+DlcX45FKjIdev
         JnCAh9dKWYgtPukgfJ9XPWfTmW3+DHc3fNVLV3swSQbPoYZoJji+DFxkR467M2TIkezA
         dwaCYVt4ShBtNOiECo3evfke8tRwFKGyojrmzJzZfv+YrBLejVm3/6ULaGGveYdfsWbB
         COvNIkeU+ZjRf4SZyZQZ+qtdiYhE54WMuN94vm9lkeqmO24uevl6z7tX5nMOpd+KaHH7
         nTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=66IdtV4A4O3twwyEenTNgYY676iFrQKRg0yaSc+sXIk=;
        fh=7JR9czDgoVl6xaTTwsJt6VKXz1JV9KXF6ZaZxJwbSMg=;
        b=lWO12JDd9lNZh8tVdbePcLnsVIzwsdl4qirz+mTu5RyMz4Q3+uR/ODB5jMyhfP+z7/
         Zj2rJmo2OF424axFepLZxr5g9zP4eOg/uhhf59cngRHgubknQldKROOxIiJWJ8etxKhZ
         bcAuTdBqnZ+xuIbkok6IdN0+XkJnBW3gdp1iPz2fXf0s7Y/hRxxVPlm6Lc0MdxXqM587
         8Om77aTlFGMb2Hn8XYlyAXgjiO4tQeexjyw9Eib0EVV8sLxj15j3zSdmMuBMdVPpj5/y
         Lq631Wkbcp6yXFwEiVbQePoHaWKYgr8pQmZO0iuc7rjKtW2cznk2Rx636SNwefODenTF
         FH1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782758257; x=1783363057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66IdtV4A4O3twwyEenTNgYY676iFrQKRg0yaSc+sXIk=;
        b=U5Fp93nTXSbWZZCX2vfq+8hUv0N+r81FKZYkh4BVQtSTh+9asUjllfKaBOnSbste5H
         LcGUKugFN7YVsczAoPr73GXhXH7TwNUjpz9+1gBJca9w3D4DYgqmzzZeA30UDDN8hDV0
         AmdPxp1P6JZnjyvIu2QsLjNx0nDEZnL7ySTvHJE3SH9uuuPoB55iq+wAkj4hSAKhW+nT
         +DaM0sQisepBX609REXRWmwh6KNEzyFdkEB/2fwELanP4/WqtOlNqEvYAYnu9ooLL39r
         ybSn8GFPwUBxqC5wfk0A/cs8agheZEZXw8AMoyVDcJxk7XmOyPPFl0+S57ZsuVLPOoPM
         T2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782758257; x=1783363057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=66IdtV4A4O3twwyEenTNgYY676iFrQKRg0yaSc+sXIk=;
        b=YJHCYBe7EfWEopyId3OffytYiNESn0B97EO63Q7UJgTuKP1DLgakwRWm03Tl8OXtHF
         FFX5A+wX7JJG8RmCjUFbhLNjvl7wKK9rRH/8OxvqB+Rzs3VE4yYqCygRwMyfPw0gSbxm
         yIUy2EX3D1Lf2cYrNqRjmi87n2SFHPVtUmDIsGNtP6sVza2I4hr6JPJ4o9KfcGiXmvvP
         3ZTyao685ZUG8cuON7Rh9O8tjZ88DP8+vz117gTyHNT/D4jK2usSeUrX/pSt58iZ5Rad
         xLNg/fzhEwhDXfeWeXlXotFjfzzLMgMUBYaU5hvP5+pYIkdqSi3t93izXl/BFscSFVWy
         GFrw==
X-Forwarded-Encrypted: i=1; AFNElJ9yk/pdD95Djpj7shDsVtiI7anD1UpcgqvWjrAqJkah3NDHrwNKqm75dUaERAokiY9pZz/LeMZwh9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvYDdBf4GaUO3e3tPEzSSKo6iW+NXVYxWRkOBdAYJB3IBkBvIs
	aapsprLXfQw8EjvZ/98JvteQeGG246lZe4skiziQFJZDPgLju9WEfkYBjnUHBRrqEHp2uK03Gy/
	J1CS6gBMM6CAPwtkXDLDNTciBtoEPFRE=
X-Gm-Gg: AfdE7cklT3fhpz2f+AWi3uGcE+S0pZipuv2nf28wedX57g3LIVBbfsdDViqAiC+wQxt
	9S3eE+HJnL88OFzJShHFckhVLKhr7Ey08TAwvVh9/VhOMvy22UsgRt+5BxtxcIWCw/yi3Yd3Wn2
	HnojCG2oVIggV/sOX6y/jgnSNvSS6C18lsHGs06Y/kOPldRA2dnGuBOFvOzf4XORQIuVKsR6MSS
	dEVHDyVEPqop0mobJ8hAVQpf59xkwUuhaTP6zsaARD77GIz63Z37l4ZSvNlFKaQ+mx4ur2ndmPf
	ZjHStBl4uBiAT0SgUAO/hGBmaXEd
X-Received: by 2002:a05:600c:524e:b0:48f:e230:29f5 with SMTP id
 5b1f17b1804b1-493b8ce540fmr4782905e9.16.1782758257412; Mon, 29 Jun 2026
 11:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629112032.20423-1-jiahao.kernel@gmail.com> <20260629112032.20423-2-jiahao.kernel@gmail.com>
In-Reply-To: <20260629112032.20423-2-jiahao.kernel@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 29 Jun 2026 11:37:24 -0700
X-Gm-Features: AVVi8CeUNnnZ1b5gr34nY8C8rkHWBFp3tMR1RyjfkvKK-T1UYPS0l8SmSsuAXg0
Message-ID: <CAKEwX=MniM-4-aV17aH3UiDd_Xd2RH743fFZaxEnYX9qvnokeA@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] mm/zswap: Fix global shrinker when memory cgroup
 is disabled
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 4:20=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
> From: Hao Jia <jiahao1@lixiang.com>
>
> When memory cgroup is disabled, mem_cgroup_iter() always returns NULL.
> Therefore, the global shrinker shrink_worker() always takes the !memcg
> branch. After MAX_RECLAIM_RETRIES empty walks, the worker simply gives up=
,
> so it fails to write back anything.
>
> Therefore, when memory cgroup is disabled, fall through with the !memcg
> branch and shrink the root memcg directly. Stop the loop once
> shrink_memcg() reports -ENOENT, since the root LRU is the only target and
> -ENOENT means it has been exhausted.
>
> Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
> Cc: stable@vger.kernel.org
> Reported-by: Yosry Ahmed <yosry@kernel.org>
> Closes: https://lore.kernel.org/all/CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeL=
c=3DeyTPKPVQgX4g@mail.gmail.com
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>

Ah good catch.



> ---
>  mm/zswap.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 761cd699e0a3..0f8f04f22888 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1356,7 +1356,12 @@ static void shrink_worker(struct work_struct *w)
>                 } while (memcg && !mem_cgroup_tryget_online(memcg));
>                 spin_unlock(&zswap_shrink_lock);
>
> -               if (!memcg) {
> +               /*
> +                * Reaching a NULL memcg means a full hierarchy pass comp=
leted.
> +                * Exclude the memcg-disabled case, where it is always NU=
LL, and
> +                * fall through to shrink the root LRU directly.
> +                */
> +               if (!memcg && !mem_cgroup_disabled()) {
>                         /*
>                          * Continue shrinking without incrementing failur=
es if
>                          * we found candidate memcgs in the last tree wal=
k.

nit: I wonder if we can just merge this comment with the new comment
you just added.

> @@ -1378,8 +1383,15 @@ static void shrink_worker(struct work_struct *w)
>                  * with pages in zswap. Skip this without incrementing at=
tempts
>                  * and failures.
>                  */
> -               if (ret =3D=3D -ENOENT)
> +               if (ret =3D=3D -ENOENT) {
> +                       /*
> +                        * With memcg disabled the root LRU is the only t=
arget, so
> +                        * we should abort if it has no writeback-candida=
te pages.
> +                        */
> +                       if (mem_cgroup_disabled())
> +                               break;

Hmm do we need to do this? Consider a system with cgroup enabled but
with just one cgroup (root?). The behavior would just be trying that
cgroup for MAX_RECLAIM_RETRIES failure attempts, correct?

In that case, we don't need to do this check, and we would get the
same behavior. The loop would terminate after MAX_RECLAIM_RETRIES :)

Could you fact-check me? :)
