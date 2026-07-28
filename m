Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F9533DEF9
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253958; cv=pass; b=i3RpSqCISFj/iUes6EIrzP9JJnNjp19LKgaNeZaLn5+W7ilqzx8VMcPjGgrnndSNegerPdEzpqXB7G2XGMW57WK0tYq3XUp3S4A1fzSNCuqMg6+lNGGmax5kVbB1IkXenv36qzCCpzqDjTMFKyNmSdYqv5fDZK4tq73ppPx/cww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253958; c=relaxed/simple;
	bh=7hxx+A6lRlyMu6Y8H0SLQ+W0kIJgamfgrsSGTYGRDYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1+RvH0udA44nTJwr1pxPbJM2h5dgFf0X6LoiGUgyQqQT5+Yv1GhycxlJ5f2rjsV8t7VEmoGVujs2ROhJIAx4Osa8pyNwkN2rq4SDYtNCeOD5GB/azkW6tAQji4LBMskAj55FeBIznWclGSXMhd4vKwIT9WTgNdjA5/qWLopspU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=reFRYlKr; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="reFRYlKr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954aff6088so36041615e9.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 08:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785253953; cv=none;
        d=google.com; s=arc-20260327;
        b=M6RRYRU4RYl18l86nJnnCwE9Zhinzyu5pYuEYWpk4vhsm8MKL9bLSD2+bUVZmarr4B
         TCj2o8yuWy2f4ZjjpzKoyeRRUsHH9seds4jqEMCPdvcN/5OQ6z6jGPiIkeMHNgg9xJFk
         xu1OSHaeW7i8VeA47S7RhsA1rdOXcq3FyT6EN54PVYH+TSahQNsGnv6fMWwV4JxZ+ocd
         9P7kATbHlGf8HLWLFgoRBr60tunyBBbjiQ+55to/q8kG4P8a3NiKwoBawktoRwTGlaUF
         DWLXtz2CXKhZ4lXTKQNGpU06hbRfNj5x+eAIaxUEa2RVrYZDn94pIMaqtWJiBF5xfr5X
         kZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wN2G7lz6Mpypum8G17oa0ZLQ38+GsCLTOJI2elJXgNM=;
        fh=Hs2hElRGMvymivADW8BpQG1kQhecIk0LQa0gdoviKbE=;
        b=NL0i8FcAis4gRpfqyjR0xEkYZis+u6ccLxqfGs/tLcNO06n70qbcdDnvn5/UFB4ozy
         IcCkkagz1AtT5eTKFuZ1xgv7V4ffL0OQr4Zo8/gX5deo8WrKch1QhzWzF+yE4q0Cvdt+
         XYLokiKHAeVpzYOHrNkob4GUqfPB6/7/BZoODBtF7iadTHM1hiPUWkgbnEr/cgTijtLo
         gyrZik4Xd7lVjO/XrZEB6e8YB9T9/u2rOfYfNJGzCnMA5nrn1nNkZzK3DKRSTyoEypoZ
         VrUwues+FcJES6wu8u98k1QNcemEm6mTZ//Je35KcUpfKyX6tQ3yEOdcTH0NAyqLW6av
         j/WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253953; x=1785858753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wN2G7lz6Mpypum8G17oa0ZLQ38+GsCLTOJI2elJXgNM=;
        b=reFRYlKrBge+a/3zn4P/caKnzSiw4CIvh+A7v7hRTAcDzmbwy4cT4T80KIGfMOJRnH
         0xZREjaxzjTPiI3wmjARrslUzYsM+Pw4I989WapS1AMRxRJCnhQjsycfTxgtASYTB71b
         XS826ELLpncA1Xi6X59n+R/CkeVpcE1tSVaBFJFtN+Q8P2n11tsWpEX71RDrgOspsHd0
         GA1wvvHp1OsvbXBaz2RCsepk1lYSKuoyASVkxGPb/8pCTLinfDbQUHRktczy72kwD1DA
         siSa5axQHpPmQfMKfs2KNGT37k+uc8HlcsZdOKB+NYIjoQu1g+wcfRPLS2q/Cb0rF5rV
         oSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253953; x=1785858753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wN2G7lz6Mpypum8G17oa0ZLQ38+GsCLTOJI2elJXgNM=;
        b=UlnIEf1X0UrKT13PGf6DB7S6aGEELsc4opp16G1CbZ0aM0xJZ1+d4CbSH1pMXv1im3
         szER59APc/PKmuvXg02RD8xZhM2tMSbwH3tbK2fQNH67SvFgXRFWgw5/p9YFQsxmpDwp
         1YSz7vTBu3qs5+Ic+76Fr4Y1f+J+h9w1LMfRjchJIk6ku509bJRvvVN0GUr0GJIeIYeC
         sFknGk+NfUImBYwLIhPWTKqrbXkMTYBGsip/npUB7Tntz3RbNd/QZVpPU/1+CLh8uyMc
         72lZFynhywBv5bbtCv1xyz8ShyN6Cl+dSCdNVbxWXvRejgKj6EEB2SDQUG1BNdyGxRfL
         mMBg==
X-Forwarded-Encrypted: i=1; AHgh+RqOkxv7CG8xgXPNzrEJuBpOwJzWsd0vW8G7WCn0RG9LgVqP0uk66iW/6HPB2Tzmg5PrDSTkuSjUAm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz32zIAIcjzWkkOEL624XKH0zOXtPDS4YM2ReyQ1Gtre/tG4ujc
	R1CiFcHQo2H+odwjLptAdlqt/uRangmqsykOr4sJLzw2dArFyspx06b1Qj5YQ9w3xZgL5bV5Mrk
	GoHHeLkuAu1qpeMbCw5kJBL87z9RPrfE=
X-Gm-Gg: AR+sD11hL1b3By2frSmeZauFw6AcxPbyzx37XWtgwI6haBoDjgORJ0Jqss13KB1LfkX
	v/vCtM7N9zGXc+DMxeaa8GW91et3YZXzH07XDryuHp9wnbC5EosAwctk6u5hcrgA+/Nz1VVe0iw
	rhs1TKhvyS+0XZaNb5rvj7morynPmRsYFfmev+hBw6qUYYhAQQaV1DSHqNCK7mcnAtRdvkIc6vX
	OBmG9qSRbFeXJPbZvhByh6ql7oJGNyVcDlVulpYLnhgm3InAy/DREN+ifgDy5lqr8DENLlkFPLz
	mLg5jUi2dYatlqS5hw==
X-Received: by 2002:a05:600c:5397:b0:495:7505:cf1c with SMTP id
 5b1f17b1804b1-496c6582ac5mr33435375e9.28.1785253953161; Tue, 28 Jul 2026
 08:52:33 -0700 (PDT)
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
 <7bf9384b-2999-f14e-f23c-0df93168c20b@gmail.com>
In-Reply-To: <7bf9384b-2999-f14e-f23c-0df93168c20b@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 28 Jul 2026 08:52:21 -0700
X-Gm-Features: AUfX_mylr_CmpdKtioYg-BSNQdMzZqObAnINeR7fFIGQIDfPAIPOo9aOIcIXh18
Message-ID: <CAKEwX=MObv_nCfRUTwa1HDxZEdoYLWgkp2K1s7+P+REB+v41RQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, akpm@linux-foundation.org, 
	tj@kernel.org, shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 4:22=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
>
> On 2026/7/28 00:18, Yosry Ahmed wrote:
> Apologies=E2=80=94there was a flaw in my previous test setup. I had confi=
gured
> zswap.max=3D320M alongside max_pool_percent=3D1. Since the global zswap p=
ool
> capacity was roughly 314M (< 320M), the global pool limit was actually
> being hit before the cgroup zswap.max limit. Both limits were likely
> interleaving throughout the run, making the results difficult to analyze.
>
> Re-running with **zswap.max=3D280M** yields results that align with
> expectations:
>
> Test Case: zmax280 stress-4 pool1%
>                              baseline        batch-all32      batch-all64
>    shrink_worker wakeups            0                0                0
>    shrink_memcg calls         698,990           57,187           29,649
>    written_back               655,570          865,131          883,508
>    store succeeded          1,054,928        1,124,990        1,190,608
>    store rejected             229,722           22,642           11,659
>    store reject rate             ~17%              ~1%              ~0%
>    reject_reclaim_fail            110           15,454           12,985
>    pswpout                    885,437          888,027          895,478
>    pswpin                   2,035,415        1,305,341        1,384,751
>    zswpout                  1,054,928        1,124,990        1,190,608
>    zswpin                     280,675          162,684          158,556
>
> To isolate the cgroup zswap limit, I also tested with
> max_pool_percent=3D50 (which should behave similarly to the zswap.max=3D2=
80M
> case above, bounded strictly by cgroup zswap.max):
>
> Test Case: zmax320 stress-4 pool50%
>                             baseline        batch-all32      batch-all64
>    shrink_worker wakeups            0                0                0
>    shrink_memcg calls         687,608           54,002           28,116
>    written_back               639,176          846,663          862,347
>    store succeeded            992,816        1,208,123        1,213,286
>    store rejected             231,431           20,425           10,915
>    store reject rate             ~18%              ~1%              ~0%
>    pswpout                    870,745          867,360          873,553
>    pswpin                   1,707,823        1,216,814        1,378,381
>    zswpout                    992,816        1,208,123        1,213,286
>    zswpin                     250,220          210,791          185,716
>
>
> Finally, here is the dataset for zswap.max=3D320M and max_pool_percent=3D=
1
> with a single stress-ng worker (stress-1), which also looks consistent
> with your expectations:
>
> Test Case: zmax320 stress-1 pool1%
>                            baseline        batch-all32      batch-all64
>    shrink_worker wakeups        9,279              980              557
>    shrink_memcg calls      14,247,647        2,638,751        1,465,915
>    written_back                 7,702          439,809          482,809
>    store succeeded            329,603          531,224          566,150
>    store rejected             883,945          517,578          482,644
>    store reject rate             ~73%             ~49%             ~46%
>    pswpout                    891,647          957,388          965,453
>    pswpin                     692,255          628,246          582,781
>    zswpout                    329,603          531,224          566,150
>    zswpin                     248,871                3            7,872

Shall we just go with SWAP_CLUSTER_MAX per Johannes' suggestion then?
32 works the best here FWIW, but seems like it's all relatively good
(as long as it's not 1).

(I wonder if this works well with your proactive reclaimer too but we
shall see).
