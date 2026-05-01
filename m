Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FCD3B38A7
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777642954; cv=pass; b=LfCQTmTcOrHD0mfYaK0uf0K0j678xaweMZvFJ11C6JdMAetDqMCKBX9marlU+f7voGHCW5FCgZDMVq/KCcrhIEqXZQ2lo6yhs+cxu8box72QObYDid9eEgDMApejh0H1T4R0wrJOh0L3KKAu3WOPeodR2R2ZY8GpLWqa1L8xfcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777642954; c=relaxed/simple;
	bh=PSwDs4IODrQC7D3GuTnZravigu9zrkmXFt0co3vc4fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8NeHpgmThacrhe7MmipathUVfvDeCQr7K8a0JgHW6oTJ33iketxWGOdpPIQE94PfC31wzGGafIwz8pIaaP0J4QpEORun4EtbZ3llcTMrdpH1bwZcIBHwjca/Y68FLRhw1ubWh92naHElJhH7MlhdtWTu32uFI6xP8dMfhtZi34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQkkL8Sz; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQkkL8Sz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so20112405e9.2
        for <linux-doc@vger.kernel.org>; Fri, 01 May 2026 06:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777642950; cv=none;
        d=google.com; s=arc-20240605;
        b=fzM2bWsUIhEQX9G5AvgfMu2WpDGSqnCk/EmriDIR3Zz90q+uEVNXyIsMnmcVzFahoM
         IFfULy/eqFHdzSmpxRyxheRHCBXXMh3DphjFBGeZfw818idtc46IWZNTVjDZdQsHYQkz
         0TCdw6TPEoiTGh8Z4eaN6u+fQ4uPInhkaNNEoJK3GjQVwnT5VJPvW1rlc6E9yxH7FyYN
         7tvy6hzuTDTtDkCmmJwYHlJdWH2ALydjcspwCGOBDdqj43O2KE73/P7jwzhu75ECyfmH
         u302JRxu5+bzl70BQpQh0BzV23yy5lXgTJQ+/QpeTZfG6k876W8uPYQtmEc/IrV73fcp
         Dg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PSwDs4IODrQC7D3GuTnZravigu9zrkmXFt0co3vc4fo=;
        fh=wLp4b19kG1xFzfccCVORXffk/mwr6wLk1FFQUtmx6MQ=;
        b=SvNR2v9axTUik9A3rXL58p22jwZLZX5sNajbLScuvEsVTCKN6AJxMmI4cLDLdonxzC
         KD2RhSBGov9nUL4W/7tHBdPFNaCLa0oMvRFw1siQKA68Kyay0lFOmlGnDmA3xD8Ylq22
         JsJqnLK6QUX4/URmh830TnJZJErJatgghfsDX92zDWr71l7a0EDqaBh8Sal1wlcLA09Y
         YzOvYh2efCx9w8ZTgc8CNHbybXWF64bfHMUEcrA9Vx6RGRin0oG8Vz6d5krUVIv9CxSX
         C1s+ZHoaDg4n6U4rnfvmcvrpPewcowqtGxowtCLBvFXlr/vZzjd+aFg2sOU4HRACZYXu
         BjiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777642950; x=1778247750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSwDs4IODrQC7D3GuTnZravigu9zrkmXFt0co3vc4fo=;
        b=mQkkL8Szauzxoexgx5ZwnfhukBU+NJR0nUJtrcYhQQKsGpmRMxzppL2qtvQu+yoUEx
         dJ70u88jps0Zm/abP+ldfYKoXxGO7Xh15Ot2q1u3zUfnZTQqnkQ71xwJ2zUTMMMqoqkG
         S5Fw5+ozkBsz/GpKPYf0/BrBSrBsaQn/gTMJMamUF1bImIfChhuP8eAkQG+F39Pzww6q
         opyvrnQ2LOWLpmtUh7DSCnL2AAVSldEBQs1IUiWYRLooAfv6mN5CB+FP0RJWn0OAlqaz
         6LwQG2p00HsWTd0y8WbIVVsLENUsROEK2sMExyQC08kggxFADSBUV0m+zLBaLWRzEawe
         d02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777642950; x=1778247750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSwDs4IODrQC7D3GuTnZravigu9zrkmXFt0co3vc4fo=;
        b=mj5XrhQ97Dwo2rMBvfNc3lnDlRHaztWLhJGPbzPCMWYR2fOLEXatbw6HCV61I1unkG
         jkVm/ev0GtRlABSB5u4mxNwZCUWJasbzflqmGlsfbK5Dz7RA6kJ2cKFQmBd9v894kVMo
         Deo246hC2gMhVhovqfkZi0Owe1MbQpuqhsMwXEkHRE6kCkllFT7VX5FCSSORuvieYIx+
         IGfqm7ZWd2nAcjdpf3cDC8QAqTt0MIPnxJMnLi6KAGFvudtDlAIUX4bQ09i7YLkEiETw
         PNK1LgVRzJ3enJ5AaaTebza07lJ2SRwBNWwXc2p2Hd+1454RzpV4L6mTsl/0Q6wY4r+S
         M5SA==
X-Forwarded-Encrypted: i=1; AFNElJ+w9w9vCz7TZELoTUeaMeChhtoSbPl6SUomritfBUuzdhiHEfqc25i2peBNx6IGTjqEWlOE6lYn00E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3q3he1EN5TLCjjBHNGpvOCRO8F51x+kvRa/XTCFbvjuLO7/Fr
	i05Bz0bbdh4V9eDRqOwlqKkQNyVYsmwU3x6zNNAf7m6cD8lgdosv98CfOcOzxzmAVy+96dJsOeA
	YmSk9KpNk4XBg1jFKvAIZ3YRpEHpuyww=
X-Gm-Gg: AeBDieu7nxw3Tvii1hkNhQURLeeYTpsAFnskm3EW8iKLkdYa7H38T/gtS5rFC6S0dJq
	eVmMMYI/mYKoynR2fEkLbPcBE1GQJIIQP687Pv6WKV5iOfr1eeYIPTwDVTIa6GVusfzKKyj6mz8
	lcfhknYrXn2plV88qza8ySxuQlubQcHE0rGl4Jw5fkYMGKnT9MnrRxQs13ElYaPnYegPKkPGiZk
	gcbjGlwC5EIYyXoPZ6yn8F8EMUod46v56gB1YHsAIaB9UMxU+KE039L9hW4ws5UEdD4bV24YGp1
	baQgXr0r3eOVf5mgRHd2rB41s/IBb12dmrhwC70YMvOGgJO3z5omrTKQW64ArSV4kA==
X-Received: by 2002:a05:600c:470b:b0:48a:6315:da26 with SMTP id
 5b1f17b1804b1-48a8eba3a20mr47321765e9.26.1777642950197; Fri, 01 May 2026
 06:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320192735.748051-1-nphamcs@gmail.com> <aegUoOiUbjUAH5aT@google.com>
 <CAMgjq7C53WRS5oYxO157mX7JxhfoPoi34k+taiKLrMah-b-iRg@mail.gmail.com>
 <aektdlD4npMVThu3@google.com> <CAMgjq7DRrz4Hdy-s4y-C=3BmPt50LKOfdWjjf2mWmCybdRaJ4w@mail.gmail.com>
 <CAO9r8zPvApgxKiVy5NhiWup_m57huF3MTuPvo=iq5kAxjRZC8Q@mail.gmail.com>
 <CAMgjq7AGzBubCkmv7LubBjPLN1DzL472d4zUm+sGxo8ZptMgRw@mail.gmail.com>
 <CAO9r8zO+tm2J0FRC64VKCYOSuKPXX8cQG7C07SwMWKoLiwoV+w@mail.gmail.com>
 <CAMgjq7D1WXUHqAV1yuXvrUmEsE_m_+yx0mBq6teJhipx6mySbA@mail.gmail.com>
 <CAO9r8zMk7xTi-Txmj1+Z9=250fD8HuMQFyT1iwjTW9coLXgqoA@mail.gmail.com>
 <CAMgjq7A4+Sac9-CYkig1LFfEh5rq-4vLka8AXREei_m3svzJ7w@mail.gmail.com>
 <CAO9r8zMv6oYvqXti8dFfQd79Nd_Yge5g-EjjjhsEWj44gwJ-qQ@mail.gmail.com> <CAMgjq7BZpU5K1xHyFiqpsjeFe6CZUouGY_gOGMwbkM2Duq-vGg@mail.gmail.com>
In-Reply-To: <CAMgjq7BZpU5K1xHyFiqpsjeFe6CZUouGY_gOGMwbkM2Duq-vGg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 1 May 2026 14:42:17 +0100
X-Gm-Features: AVHnY4IotFE7AB5jv9yFrevYlVwuS810ESNP8MQdhCBVqE2Ni9WDWtp9VtEH_ac
Message-ID: <CAKEwX=Mg8AWVoiKZixokg4NCOn2-aamtRAaNO4_GGU_h+mbpkQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
To: Kairui Song <ryncsn@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org, 
	Alistair Popple <apopple@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baoquan He <bhe@redhat.com>, Byungchul Park <byungchul@sk.com>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@kernel.org>, 
	Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Lance Yang <lance.yang@linux.dev>, lenb@kernel.org, 
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Brost <matthew.brost@intel.com>, 
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Mariano Pache <npache@redhat.com>, Pavel Machek <pavel@kernel.org>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pedro Falcato <pfalcato@suse.de>, 
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Rakie Kim <rakie.kim@sk.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Suren Baghdasaryan <surenb@google.com>, tglx@kernel.org, 
	Vlastimil Babka <vbabka@suse.cz>, Wei Xu <weixugc@google.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Yuanchu Xie <yuanchu@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Zi Yan <ziy@nvidia.com>, 
	Meta kernel team <kernel-team@meta.com>, Rik van Riel <riel@surriel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 7:46=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Tue, Apr 28, 2026 at 2:23=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wr=
ote:
> >
> > On Fri, Apr 24, 2026 at 12:52=E2=80=AFPM Kairui Song <ryncsn@gmail.com>=
 wrote:
> > >
> > > On Sat, Apr 25, 2026 at 3:12=E2=80=AFAM Yosry Ahmed <yosry@kernel.org=
> wrote
> > > > Why >16 bytes? Do we need anything extra other than the reverse
> > > > mapping? Also why do we need a double lookup?
> > >
> > > You will have to store at least the following info: memcg (2 bytes),
> > > shadow (8 bytes), count (at least 1 bytes), and revert mapping (8
> > > bytes, since you have to address a full virtual swap space). And some
> > > type info is also needed. Part of them can be shrinked but still,
> > > scientifically, merging two layers into one is considered a kind of
> > > optimization.
> > >
> > > You need lookup the virtual layer, then the lower layer for many
> > > decision making, is was discussed before to introduce more cache bit
> > > or things like that and I think that is getting over complex, reminds
> > > me of the slot cache or HAS_CACHE thing...:
> > > https://lore.kernel.org/linux-mm/CAMgjq7DJrtE-jARik849kCufd0qNnZQs7C8=
fcyzVOKE14-O+Dw@mail.gmail.com/
> >
> > I think that's where the disconnect is. You are considering these two
> > separate layers, each with its own metadata. The metadata should only
> > live in one place.
> >
> > If we only have swap tables in the virtual swap layer (with the
> > metadata), backends do not have to carry the metadata. In this case,
> > backends should only have a reverse mapping (if needed), and some
> > internal data structure (e.g. bitmaps) to track usage.
>
> Ah, you are right. This is currently an intermediate state, that
> problem might be gone if we unified everything.

What do you mean here?

>
> > This is difficult to achieve if the virtual swap layer is optional,
> > because then the metadata can live in different places. This is why I
>
> But that's not difficult to achieve at all with an optional layer, and
> actually will be achieved naturally without any design change with the
> RFC I posted. Swap count / cgroup / shadow all stay in the top layer,
> lower layer is "reverse map" only (the undone part though, it will
> require to move the cluster cache from global to device level, which
> is also required for YoungJun's tier or any functional tiering to
> work, we may run into more and more detail issue like this).
>
> Might even be easier that way, it's pretty close to the unified states I =
think.

I feel like you're moving towards the other direction, no? Seems like
you are unifying swap metadata, which is good (vswap will also want to
do this), but the problem is, the lower layer will have to allocate
memory for these metadata too...

Say vswap is optional and runtime enabled. How do you structure a
physical swap device's metadata? Some of the slots might be directly
mapped to PTEs, some might back vswap slots. These two cases require a
two completely different set of metadata: the former needs reference
count, swap cache, swap cgroup etc., whereas the latter only needs
reverse mapping...

I don't think we should mix vswap and non vswap slots in the same
type/address space.
