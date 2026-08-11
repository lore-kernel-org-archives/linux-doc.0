Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723123358AD
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 17:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468688; cv=pass; b=iM+UOugVsnePwLcGWxWbEI6JRYZc6iejTolcDelKN8p6Ef+1u59/21u/CfqzgIN37w1OzeKPEAOCeVwT/EVItoGbpzIA8LYn02OECs0/ABL1QaXd3uN41d8ZzxbmSW7LmPZttjn+tX9ivLzmJ46jgb/yMNeBonY14XQuhS9wwOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468688; c=relaxed/simple;
	bh=mCw4EcdCBFDHSFVDpulqFfKL6PaPg9wrcOVbtLUExCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQ9Jjjgx2Iz4ZNL3B6+pyKbppOch+Wz0E+VYeg2TFDwsHbs3iNOo+JTuF9EGZlAlQog0QVgYCFnp3zRiegzW1UcQYedybitwFCvBRIv5FED4R8e/1ztDheudR2+eWImh3FseCXsq1r2KqBG5LRkFrOD0T/MLYgfayIT3SzXR+Ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2q2jRVq; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2q2jRVq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so232435e9.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 10:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786468685; cv=none;
        d=google.com; s=arc-20260327;
        b=A3GJat0cU6CBTLoWnxMf+QgocD2HSO6EElDhVSearp+XNIUDToe95Y9j7lWxVFxf9j
         C+E1UNPreGGqGFRmiunt+fs+kZVlvarte1QHxqLMjbnI6xuO9BWN/xxW/bP8S/2Y1KqV
         uM7lJCM+HGg/3FjyF8OaSm1P9zuqUPJaHhLaGClLK+F1mAo3B5r6HIYB7gC8PWMcGkDm
         aGuPh5+g75kKBc/crdBx8HD1QAW/+c6rwT+56gKVYkxMSEfn/uyRJKKj/Od+hgZZr2YC
         fAUgsFkOA62/YZ2Syl6vwNsuuyIRpLcssPjN1GI3WY4K916vToJzpk2akN3R6AJX6Ck8
         ZquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1lMjqfyM2pcqzkOWtKU+Em6fjGGxptW037mrJGCaz8=;
        fh=F43JAXjxEPX/iFmFJkOC0icWdXMW7iRivTuZ2UVjWR8=;
        b=GWdAzYDahqjAcCjFxBk5jAJ8QEDAkVzHxFMl4DFRldIJ27oyv1B7DORsAuXOnGoHpe
         kVBdJHWBchDzOOUs7V+BGIJiFWEJnOA9vaZotGIsnYfhEpke6Gk+OAndBJUp7w6Lu5Q1
         wp8Lw84qsM9MHKXPk/1X0V7XaP57XKUs0Tmxji6ihfic6AUBhVUyqxjx/b3NYk0d5ADi
         EEzMjOPkDxZqR2lSvecinkdfLq0tn+Txoega32fS3JpvEGo1NMQEA+aKPlIdWW7MTobW
         +LfV9m9Ywa+atqbyuigi+UpczTcU8V2mrTviXZR8M4ezRCklCeEpY9qEjGBMpYhpFy1q
         R5vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786468685; x=1787073485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1lMjqfyM2pcqzkOWtKU+Em6fjGGxptW037mrJGCaz8=;
        b=G2q2jRVq42dn48MrWGkGN3334xkaAh5dnLN98YznKNr4HRmHHQwQ015XyOrJswXooH
         fJ8xDx2pkdmFayJ/C5w3+sO86xqdXIGy73A55ukY1NC5OfRqbZa5jy6AgUkG1mNruSnF
         SyW4TdMClojdtKcN0lb9OnDACku2Exz+Zh9h6H/7TI3Bh6xtui1hbNT9oNyTQEpNv8fo
         PcL7CJCWBaAyRUWhlSB3SjYMc9Eq6ws3TyWzFRAbx9cPZ9qt+goFV3/qOttp4cP9tG/P
         tPplN0anwwM7JJ5eVof5wAZDpGoOVR367KoyT7m0/qyYI/4Z2vkSAhwONk1Byn2QFuzx
         124Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786468685; x=1787073485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1lMjqfyM2pcqzkOWtKU+Em6fjGGxptW037mrJGCaz8=;
        b=DS02G2ECMWc4ph59zG7r/7iMugMQSBDjHLyd4Rvq7dFk9eK/oPTRNry2/e+jWT6O8B
         w3lIoMyWeUMhiYYO2BUOdDw75Ak3C/41SQ+5VFpojFeuRl5jOHeieKtdbDnyaFni4j1n
         ecVi72EcsCfBO2Vf0ug+uBid/x9wpQhciy2LjnR6RztePniBrnnXQ/c4J9Efty9nXSdK
         tjQJWLCeURIKcndFBYkUhWBTDupJIiGEaZB3+8M8fLbAI8BdJVcRlTVb3zzii3B7AnQP
         7Kg97jFVEI7MF0HsdM1WvipFAY4tUDSqF2A1HKytHMCV8T7j1Ua4bGgTIc+Ere3zvUGN
         3ShA==
X-Forwarded-Encrypted: i=1; AHgh+RrE7s6GxI5wGZL+ghzPfJCZceAx/fDNgh5uiRHVgagnAehfdejps2tTJqzzRqE6dve/IDueNREjAV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0HyplAxvhY7U2OQ7KLyCENU+3KuP2E+h1/j3IHbbkzNwvLOLM
	TXXUfp5NTx8d+tHK4ecU8oDLF2QZnZVPoseWcdcbPgbNisGFS7eCyniygQmG9WWh+vVie+IFr9X
	AmQNRM0x5f7PsAyy5RxgrwneF3uJMsLA=
X-Gm-Gg: AR+sD122RC6M+761V4t9qkoOPEp3dt3tZyM1kALmRGnrCMJie5VPqrSGOyyaudheghL
	IUvGF0JBBLPn4YV83RvoaxP44u/6kV2nMy5qu25BGH3Z0lD4oqLHjxHpijD4KqR9fS1pt9MCT5W
	HPVgO/0pGBax1pOK5TguVnNvSC2/j6CIonVyTybnGnWBnHDlUc+TRX5pEQKgpOb3eimAXH5od49
	HADD6gxyhdRhnbMZ682N1fKFtQ8fM5YMlmjZucSwf0o7GayYUqPLPu/q9niPzdGHwKBtkLTK8/y
	5agILp1P54/72ouq2kvzxm+NKeXsjfaPhuJulcRGWsBNEpaQrUE/LqLXA30SlqK9ZSdXD3hlFuI
	2
X-Received: by 2002:a05:600c:4593:b0:495:5858:8101 with SMTP id
 5b1f17b1804b1-4997846ac04mr68274895e9.15.1786468684401; Tue, 11 Aug 2026
 10:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806184254.3790858-1-nphamcs@gmail.com> <20260806184254.3790858-11-nphamcs@gmail.com>
 <20260806191958.44F881F000E9@smtp.kernel.org>
In-Reply-To: <20260806191958.44F881F000E9@smtp.kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 11 Aug 2026 10:17:51 -0700
X-Gm-Features: AUfX_myfSmM-We7RZK14vgJtCA25PP9imNWJ2f-4bhH6ulFBjzqzSD-QM8ww2hc
Message-ID: <CAKEwX=NB9LiX6t=MrkB7TgB31XK3FpLxFEb2_mSsY2mD-+NpFA@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] mm, swap: defer memcg_table allocation for
 physical swap clusters
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, hannes@cmpxchg.org, tj@kernel.org, 
	Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Meta kernel team <kernel-team@meta.com>, Nhat Pham <nphamcs@gmail.com>, 
	linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 12:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

Hmm seems like this is not sent to the list. I'll just cc the response
to my original sent list...

>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] Deferring `memcg_table` allocation to `alloc_swap_scan_clust=
er` under `local_lock` using `GFP_ATOMIC` causes an infinite loop under mem=
ory pressure and violates allocation constraints.
> --
>
> > +#ifdef CONFIG_MEMCG
> > +             /*
> > +              * Lazy-allocate memcg_table on the first direct-use slot=
 of a
> > +              * physical cluster.
> > +              */
> > +             if (IS_ENABLED(CONFIG_VSWAP) && folio &&
> > +                 !folio_test_swapcache(folio) && !mem_cgroup_disabled(=
) &&
> > +                 !ci->memcg_table) {
> > +                     ci->memcg_table =3D kzalloc_obj(*ci->memcg_table,
> > +                                                   GFP_ATOMIC | __GFP_=
NOWARN);
> > +                     if (!ci->memcg_table)
> > +                             goto out;
> > +             }
> > +#endif
>
> [Severity: Critical]
> Does this error path create an infinite loop under memory pressure?
>
> If the GFP_ATOMIC allocation fails, we jump to the out label, which calls
> relocate_cluster() and puts the unmodified cluster back on the list,
> returning 0.
>
> When called via this path:
>
> cluster_alloc_swap_entry()
>   alloc_swap_scan_list(..., scan_all =3D true)
>     do {
>         ci =3D isolate_lock_cluster(si, list);
>         found =3D alloc_swap_scan_cluster(si, ci, ...);
>         if (found)
>             break;
>     } while (scan_all);
>
> Won't alloc_swap_scan_list() continuously dequeue the exact same cluster
> and fail the allocation indefinitely, since the cluster is never consumed
> or discarded?

Oh nice catch! It's a a bit of a rare construction. You need:

1. Vswap enabled.

2. The physical swap clusters start out backing vswap entries.

3. Then we use these same cluster to directly map to PTEs, bypassing
vswap. This usually means vswap allocation fails (rare), or is disabled
during runtime (rare).

4. The deferred memcg_table (1KB per cluster IIRC) allocation must fail.

Technically possible, but does not seem very likely, so I'll just do
the minimum to not infinite-loop here: i.e if memcg_table allocation
fails, just propagate that information up the call stack and
short-circuit the list scan.

We can add complexity (dropping the lock and retry allocation)
if the rate of allocation failure is high enough in this case (which I
doubt).

>
> Additionally, alloc_swap_scan_cluster() runs with preemption disabled und=
er
> a local_lock. Does using GFP_ATOMIC here risk lock recursion? GFP_ATOMIC
> includes __GFP_KSWAPD_RECLAIM, which wakes kswapd and can take scheduler
> locks while preemption is disabled.

I don't think this is correct.
