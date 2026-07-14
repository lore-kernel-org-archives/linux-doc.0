Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABF34DA54B
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047994; cv=none; b=j6hH99cWRlUK6tDQDGU8R531BGFvCB9Uqe02ny5IAE/Z2yB7CznDmufYVHKPfGNdFH0XWgXNQcWZDl8HLdsSHSGbNsU/aV9M4K3q2SEMYzuw06/OvXO/jE6g+cL3EjxKOTgoS7CwCHY3HOw8GLX7Lkec/il+WCAyUMNKzSdnpnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047994; c=relaxed/simple;
	bh=UynP7waHvnVv90IW7+Ff+tGm6Qvp6W0MRtKVTBQnnXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+zwgCaAWb+WqVmv8L+i85ATzUKxANg1WPP24VyuiWT6OIZTAEzALyLXsE15gh/fdRVtA7DwuvcUqQ/Ut8TTe7jxNo8NLwPdfVgUEeohxCCxeastHFCtKyHoGUbJj8Lxpk5N3fEaqyctDLVAVFsxWfyN3SeCk7ziyHWaL8hVuTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8C2R35o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8C2R35o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12B11F0155A
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784047992;
	bh=0GuTTRWvyCne6K/TMPuZlWhgMIx0adVHAqSG19V+XXw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W8C2R35o/I1X5fPhJO9ImuwUaHrliG8WoQRrIrsHHP4d1xxjszyvgMZi2CiFMypDn
	 uoN3tI+ojAif5C21kFnBwncWcXpTiI7KPsUfIgW6T108T0FTvUlrkqToyUX1LH+q6m
	 Wbbt2qPDYd76RKnyIBH+ReHj+2xasBqZAkwiH1tBsHjEO3oysgzORSsjibaQJH4zGq
	 LxM8U53HTEsaopQ+3EIXviGDjsK6JFEHg+x/w/+24Tw2g68cYfSCabaVhWzhSzr0tQ
	 168cUo75DXafH+UqJ/UJdHSvxrCoNu+ToDYsf4RhSx2v+HLQu2zSJftwhhRfkP0CXB
	 hnajdki9ChO7w==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15e2dab83eso194393466b.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 09:53:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrlmeRgKA3LAlPW/Zl26FXLZ3ANbjrZ+/jwvBPmxTIuUyTz6E5LCo7XQQgu2ncBjtMcxUJgoP/t1U4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzlNQruy2A1VczPpOfiGUDq6NiP31Qg63zZbICxFP1KagEItqo
	IALWJOgDpJaXkC0faE/+YYt0vp3EGqJB2AHV3BZUrRpXJ0uchEU7IhVkWYHoku8mWH0r/lGWSuq
	ywIbyuI4O1qqW1b6hfBQUU8iFqTA3gKU=
X-Received: by 2002:a17:906:f5a1:b0:c16:12ff:dc8b with SMTP id
 a640c23a62f3a-c161f3b58ecmr712408966b.54.1784047991521; Tue, 14 Jul 2026
 09:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714081510.16895-1-jiahao.kernel@gmail.com> <20260714081510.16895-2-jiahao.kernel@gmail.com>
In-Reply-To: <20260714081510.16895-2-jiahao.kernel@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 14 Jul 2026 09:52:59 -0700
X-Gmail-Original-Message-ID: <CAO9r8zM5nzDqNcx5UoDgGexvR6jf8MmJV9SomM4AS7n-rZ2o5Q@mail.gmail.com>
X-Gm-Features: AUfX_myK2ScSuKb9Od0WSe9xHl83YPOH--7pRL1A1D1eWAOU3YMEEFq2p0-lNTY
Message-ID: <CAO9r8zM5nzDqNcx5UoDgGexvR6jf8MmJV9SomM4AS7n-rZ2o5Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/zswap: Fix global shrinker when memory cgroup is disabled
To: Hao Jia <jiahao.kernel@gmail.com>, akpm@linux-foundation.org
Cc: tj@kernel.org, hannes@cmpxchg.org, shakeel.butt@linux.dev, 
	mhocko@kernel.org, mkoutny@suse.com, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 1:15=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
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
> branch and shrink the root memcg directly.
>
> With memcg disabled, shrink_memcg() only returns -ENOENT when the root
> LRU is empty, which means the total pages are already below thr. The
> loop then safely bails out via the zswap_total_pages() <=3D thr check.
> For any other return value from shrink_memcg(), the loop is guaranteed
> to terminate, either after MAX_RECLAIM_RETRIES failures or once the
> threshold is met.
>
> Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
> Cc: stable@vger.kernel.org
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Acked-by: Nhat Pham <nphamcs@gmail.com>
> Acked-by: Yosry Ahmed <yosry@kernel.org>
> Reported-by: Yosry Ahmed <yosry@kernel.org>
> Closes: https://lore.kernel.org/all/CAO9r8zPVzMKFbCixxD-qgtRrkFxWVrHiZZeL=
c=3DeyTPKPVQgX4g@mail.gmail.com
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>

Patch 2 doesn't really depend on this one, right?

If that's the case I think this can (and should be) picked up
separately as a hotfix. Andrew, WDYT?

> ---
>  mm/zswap.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index b5a17ea20237..3d697a1a5365 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1356,11 +1356,12 @@ static void shrink_worker(struct work_struct *w)
>                 } while (memcg && !mem_cgroup_tryget_online(memcg));
>                 spin_unlock(&zswap_shrink_lock);
>
> -               if (!memcg) {
> -                       /*
> -                        * Continue shrinking without incrementing failur=
es if
> -                        * we found candidate memcgs in the last tree wal=
k.
> -                        */
> +               /*
> +                * A NULL memcg ends a full hierarchy pass (except when m=
emcg is
> +                * disabled, where it is always NULL: fall through to the=
 root LRU).
> +                * Count a failure only if the last pass found no candida=
tes.
> +                */
> +               if (!memcg && !mem_cgroup_disabled()) {
>                         if (!attempts && ++failures =3D=3D MAX_RECLAIM_RE=
TRIES)
>                                 break;
>
> --
> 2.34.1
>
