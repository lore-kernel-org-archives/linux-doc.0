Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B4D45DF60
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254021; cv=none; b=ORFkjw0pXxHxu06I6nb83bT1xbdBiSLrP4BuSikkQYdTR9ltJ6PR56o1W20Zpp42xOD/lwc4UAcCucFMafCExqKF2KHyfFknQE43U9ttGPSQSBGsaxf35fkf6bw3XgBp0N3Yp/5okyjcrODrXJnEdt8QshI+Tv4Oj/Sis/7dkc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254021; c=relaxed/simple;
	bh=cLVrmLVnhZVdAC6iHFmP+p4jaHzD1JR/i3JlrdW7hwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9wvrkp/wnClUPxQiazeqGpYU7LqggOX6VykYFHdiCgjiC2OD1EqQhwoiwTpVlikD0CDlzZ9hkAs8GYGge1HhGj3bJPxaIG90owbn+LgvFXC5jnXzCf+F90G4GnKi2gpV2+UX24hpf0mKywNk4wCLLVH5o4QOFm76W71b7v2pfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fy/5mDHO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy/5mDHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D52C1F00ACF
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 15:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785254020;
	bh=iVWKWXWp2o5oguf9HQN9RBLTt3LptAl4yCTE8p8gHSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Fy/5mDHO4xjwvtptQQIrg3rcpbEvXl0bMZtldcBXePysyTwuqvePmK3S9auaC0OhG
	 LWEDDurQH1PZIoZYlyGP6B3MVkJC9+vXu1eHr8gpLMQ5Em2vVSY/hA7zzujuUtVvbD
	 V+KJZ5mYw5ihuODbz9Pq6rZvnT34KZSSv6ZGd5kL6Xu3l6AsK9BGM/EzB9EeRdFvBB
	 WcoJQ9AjPtoI8HFo3/43uTPvBij5Fm1pFJVaxAkgCSu8bNl8sES8o1drRAqGfGpqQR
	 1rNEqwnZaJrk8yfH2d1qIp9fjvoYWkoPxKqX4+0tFWbJfVDTua8t2iOY9RDJJ1n4kG
	 pj6Xz5M6IIy8A==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69ffbd2a277so3663897a12.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 08:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RplvkKkpbxxA62AtLvkkoWPYKCOMzFgBusUwW88iFKc1JcI9PJioOl3PzGWpERCtI/c98FHTvy0jps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWFs1g3yVa3QFTOdnPBNUeUsDf1EovpJq9kGjkjOy4RRthBnbO
	fWQeO8UDsiM++PnEhn55wu3yeWR6+1zitovJPODGJc/DuSdvnT8bG4yWtAbQ8Zw5l/3aBBCrqzK
	Djp0WshGCZ1PjQ5bDtfCcCWtd3b0GIGA=
X-Received: by 2002:a17:906:6a1e:b0:c16:4df6:176b with SMTP id
 a640c23a62f3a-c1f71daeeb9mr146358666b.20.1785254019295; Tue, 28 Jul 2026
 08:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com> <amF7_GB5Rl6OJmt4@cmpxchg.org>
 <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
 <amIdU1lFxqxTI3Gc@cmpxchg.org> <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
 <d8de419d-0077-c47c-a5f1-37c229a853ed@gmail.com> <CAO9r8zNq3bRN+mumA5tcdizStpgoqTc++FYuGjvL8spbv4Q8YQ@mail.gmail.com>
 <CAKEwX=MG0F1+my1krUiOrHCn-Lypq2gq-g8Rv07Mz7sC=YEKaw@mail.gmail.com>
 <CAO9r8zOH93mfdjHq+Ljm7X+ykZS_rjzAvp9OBCzo+uyTbM1fDQ@mail.gmail.com>
 <amO-hwo8OGV5Goz0@cmpxchg.org> <CAO9r8zMgVmgQET+PUGexAgNqCZavA2YoTTXKSbWWoUv=A=ytSQ@mail.gmail.com>
 <f60fe501-7605-64dd-0572-77f7f3060f35@gmail.com> <CAO9r8zMBWA7nxM24VXQT00CVEZwFpMFNe73FFdPSZw2y=J-0HA@mail.gmail.com>
 <7bf9384b-2999-f14e-f23c-0df93168c20b@gmail.com> <CAKEwX=MObv_nCfRUTwa1HDxZEdoYLWgkp2K1s7+P+REB+v41RQ@mail.gmail.com>
In-Reply-To: <CAKEwX=MObv_nCfRUTwa1HDxZEdoYLWgkp2K1s7+P+REB+v41RQ@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 28 Jul 2026 08:53:26 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPHpm5JUfqPTCUmfCrOEXQ0_pdRtnjyeprHTQs1v42JPg@mail.gmail.com>
X-Gm-Features: AUfX_mzrHy756kSPKSZdq7uRWifdFcXmJv-8lTaL4BDwb7PDfFzhTlAXBZozxjw
Message-ID: <CAO9r8zPHpm5JUfqPTCUmfCrOEXQ0_pdRtnjyeprHTQs1v42JPg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Nhat Pham <nphamcs@gmail.com>
Cc: Hao Jia <jiahao.kernel@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	akpm@linux-foundation.org, tj@kernel.org, shakeel.butt@linux.dev, 
	mhocko@kernel.org, mkoutny@suse.com, chengming.zhou@linux.dev, 
	muchun.song@linux.dev, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 8:52=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Tue, Jul 28, 2026 at 4:22=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com>=
 wrote:
> >
> >
> > On 2026/7/28 00:18, Yosry Ahmed wrote:
> > Apologies=E2=80=94there was a flaw in my previous test setup. I had con=
figured
> > zswap.max=3D320M alongside max_pool_percent=3D1. Since the global zswap=
 pool
> > capacity was roughly 314M (< 320M), the global pool limit was actually
> > being hit before the cgroup zswap.max limit. Both limits were likely
> > interleaving throughout the run, making the results difficult to analyz=
e.

Thanks for running the numbers again, these do look better!

> >
> > Re-running with **zswap.max=3D280M** yields results that align with
> > expectations:
> >
> > Test Case: zmax280 stress-4 pool1%
> >                              baseline        batch-all32      batch-all=
64
> >    shrink_worker wakeups            0                0                0
> >    shrink_memcg calls         698,990           57,187           29,649
> >    written_back               655,570          865,131          883,508
> >    store succeeded          1,054,928        1,124,990        1,190,608
> >    store rejected             229,722           22,642           11,659
> >    store reject rate             ~17%              ~1%              ~0%
> >    reject_reclaim_fail            110           15,454           12,985
> >    pswpout                    885,437          888,027          895,478
> >    pswpin                   2,035,415        1,305,341        1,384,751
> >    zswpout                  1,054,928        1,124,990        1,190,608
> >    zswpin                     280,675          162,684          158,556
> >
> > To isolate the cgroup zswap limit, I also tested with
> > max_pool_percent=3D50 (which should behave similarly to the zswap.max=
=3D280M
> > case above, bounded strictly by cgroup zswap.max):
> >
> > Test Case: zmax320 stress-4 pool50%
> >                             baseline        batch-all32      batch-all6=
4
> >    shrink_worker wakeups            0                0                0
> >    shrink_memcg calls         687,608           54,002           28,116
> >    written_back               639,176          846,663          862,347
> >    store succeeded            992,816        1,208,123        1,213,286
> >    store rejected             231,431           20,425           10,915
> >    store reject rate             ~18%              ~1%              ~0%
> >    pswpout                    870,745          867,360          873,553
> >    pswpin                   1,707,823        1,216,814        1,378,381
> >    zswpout                    992,816        1,208,123        1,213,286
> >    zswpin                     250,220          210,791          185,716
> >
> >
> > Finally, here is the dataset for zswap.max=3D320M and max_pool_percent=
=3D1
> > with a single stress-ng worker (stress-1), which also looks consistent
> > with your expectations:
> >
> > Test Case: zmax320 stress-1 pool1%
> >                            baseline        batch-all32      batch-all64
> >    shrink_worker wakeups        9,279              980              557
> >    shrink_memcg calls      14,247,647        2,638,751        1,465,915
> >    written_back                 7,702          439,809          482,809
> >    store succeeded            329,603          531,224          566,150
> >    store rejected             883,945          517,578          482,644
> >    store reject rate             ~73%             ~49%             ~46%
> >    pswpout                    891,647          957,388          965,453
> >    pswpin                     692,255          628,246          582,781
> >    zswpout                    329,603          531,224          566,150
> >    zswpin                     248,871                3            7,872
>
> Shall we just go with SWAP_CLUSTER_MAX per Johannes' suggestion then?
> 32 works the best here FWIW, but seems like it's all relatively good
> (as long as it's not 1).

Yeah I think so, the less magic macros the better.

>
> (I wonder if this works well with your proactive reclaimer too but we
> shall see).
