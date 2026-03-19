Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1193148DC
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 19:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773948386; cv=pass; b=lineiw50f6+kP86IN/EE3qurQM4KWMk5MkuzJIjpxrNSrPxNNDk8i5TJr0UbHpvuA8cAb4ttVKqOE1M91HASWtxsxIwxrrAD02fL0Zyq1d3PEaF6dp4xMV36V9SnGJvaNCk0vg1cWyH4aAs5dx1a5BUwKZeusPpz/XZMmEovplo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773948386; c=relaxed/simple;
	bh=SMnbKcM0hUtzaR1GU2NyR71o3cgHMSUw0IGV8L9jlGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnxdtTTIkqNk3ACXi0BPSVMhSvzJLvNZuhqtSh1qaS0f0JRWjOT7+RHOj86g2F5fLpDjU0scKVTkAHN/J56vTLsKURwiCqQeLCvh8austjnr0u8oNakrpqqa3bVt8kBQi/uzmBK3Csg6dX1pUPEKX8v5ZjYS4mx9qFCzkKLWiN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azlytz9z; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azlytz9z"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so950624f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 12:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773948384; cv=none;
        d=google.com; s=arc-20240605;
        b=DyfB0Ojy2TORM3NiMnGK8zWbm9uhAUv3YJAaTbBu27Q/7rL1LRP5QWLBHRfqf0qmMR
         NnEkK1guL1iXQDhILyYiymZp7NkM4nmudQ3u+8wpd5qw2h2zBf40tQ9YafsrLolF7V6K
         btltx6634jkM0MLg1ZrmHbqSYIX/aDdf0oiwowJt2RvTZYVJmOknLbHCKgpjrCpIIiWA
         hmoFhULbEKk30/WPi1wH4uAn1zSDgDgFfmjzawxJVZSoRu+k2ZaC4pvhIG0l0xPlIpbB
         uRwaRoOmpdDnMfRBKVXR3ltxQurqL6pfOUCd0/ueRyb+Bc/hbBxEUTWXjyASUF6zcGDg
         9dbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=STbYRptw5mPVfwcJPai4/18g1DT8t9j5hz3bTmCzNvY=;
        fh=kkVdXpuqJH6uo3+/AzWBYY6ibci2n0UHkZyll91Uds8=;
        b=CR1WYdDGtVYlpUKu4x78a+NOw3CfLs5HGyH2PBaSRLVZJ7GrNY9AWv/VL7eqknA/bV
         3JZpKYK9mzl9DpSrZM4EdHFZ5156C8rY/RfpPKMQvP4LC8tIM6x+EF1U5MLHRs6DqbM1
         MgvLKcHIFrrhYbbAfB5gTPNuEoWB1fXyV8AttK7bzY4S+6vkGx732Vl7e2vPaJgtKr/5
         gd0oq4f9IBG3p8wrKzDCPP9Y61EmA+ZIeYWA9tpJ3hsANLgIGeK/xhkCzLm3KdQvRSpm
         N5C0Arrw3JKEDVBqSVW5x64KZe4r97xPSe5uJzHlPw4ScMJJc0YWH7pL8ZY4kc+3b83b
         3aXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773948384; x=1774553184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STbYRptw5mPVfwcJPai4/18g1DT8t9j5hz3bTmCzNvY=;
        b=azlytz9z55giRucLwQBXJnvDsmJgVV+BvIS/FGWSJecbPojKY/ZcQUn8Rj5aDVJgAY
         ZDGLwxyrsNJRRvBEemL15yO608Lxdy+Nn3m/HCX5r5CoXt94c1cmaxTt0chgxeLh+kpZ
         Q6wXw3mIBrdITdVVJR0h0e9y6ZNROAXvyh97dhS4HQzW1CNnx5/GidRn5KSN+zSKa4nK
         39iah9St5FqmEIIOH4831/3EUu+so+c4qqNe5hI57VDjFpuUNicWJA36I9nCcr3hS1u6
         oYSts+zQ17grXi2ECuJQmVIuBz3x51EzlsDTrejuSFq3C1zt4NEl1z5GQ417Vr+A7ohV
         BohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773948384; x=1774553184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=STbYRptw5mPVfwcJPai4/18g1DT8t9j5hz3bTmCzNvY=;
        b=Y2uuC7tlKXrKXhx/UJriu8pnfxPPAuN0zq2tc0Em79SlbDvJgWVVSGHWvC7ePVuOvX
         NOCWZvzkZLg2WsEqDFhrcnV46cBPLGEZr4Q+R0ZxIg0kbU1qjwJB67s8B8tvlE+gHPUS
         c/b87FtfVB76IADGfoljsxp3Is4lKGavfFBuCx9cXCsePasu8l+3SpaMhSyr5ePVyRzk
         g6cDvgGwqzjFRN4f3E8zQxAwlOSWePZSXHGUEBXHFe4yragdyarb1w6wd3VI1o+2jn7g
         zJ+nWhNmgDbuCMieO8Mgp+l9Kys355xXDe+so3kmHc6MLmwJdW2GYyRh/sm1NSFd+hfj
         EmSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2fwFgtskk52Wy5GPQRhH8s9y85fPGBPBbMp0rz8G8JMHIMX5hC7ZNXhHCpLbARLLSQFaAWxV5Q8g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/L37lEUZmche5jPhR1dzZxjVrDtrJLUoWYNQnMW4Ylo0qrvZM
	ZGP2z6cFa1cQluKQZj3wJNYrfUqIByfuwO7sbuibNqwUCbteJs4IB5MLxtgp6sIftCW6rokkLI5
	593Z7Jjx8RkC+74z8swlxX5XgG+YVJuE=
X-Gm-Gg: ATEYQzyBpi5yy+qN8h5MDfB0dryGguKWGwu4/3ToempqIjP8a1upEJv8GSQja3/0lC7
	VQtwFTMQlmhyNjOF5Hq45iWVYoaBsPnbr51zfn2qwZu42xW93WLBrw+De9jlBoFrOVAgEeoqpem
	nWO4D+DbeLGvhfo7+3Y1goIQbs05Dti2exJSU8GL3zriAzKUo9Ky9q46iaErvmNqus/5qlYM6NB
	Rhhr047QgEtheY4E3o3A5nn3rp94GCQeRyh87cDkX/LeyOjfsaQjuFlZLk8BdoVrfi009aI9A/Q
	cZAeHFWFi6xUxEk5joHHMwnAM0gfNuc4XF3Spcga/V8v5A5uAA==
X-Received: by 2002:a5d:590e:0:b0:43b:4352:1bd8 with SMTP id
 ffacd0b85a97d-43b6428ba33mr631337f8f.53.1773948383714; Thu, 19 Mar 2026
 12:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318222953.441758-1-nphamcs@gmail.com> <20260318222953.441758-10-nphamcs@gmail.com>
 <20260319075621.GR3738010@noisy.programming.kicks-ass.net> <CAKEwX=MUrLtZAcmwqBau5GLnWQrjL7A_4tYrdZ4TQQaE+hsVkA@mail.gmail.com>
In-Reply-To: <CAKEwX=MUrLtZAcmwqBau5GLnWQrjL7A_4tYrdZ4TQQaE+hsVkA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 19 Mar 2026 12:26:11 -0700
X-Gm-Features: AaiRm529wWFONjiD2biQuzKZu-r4Xpu1F03-qQuQMU-V-fDEyZaMmWMBQx2xjec
Message-ID: <CAKEwX=Mp3=E_nVhFFvdyKWjHtdp6TB=edp9-x4OajZp6MPRwrA@mail.gmail.com>
Subject: Re: [PATCH v4 09/21] mm: swap: allocate a virtual swap slot for each
 swapped out page
To: Peter Zijlstra <peterz@infradead.org>
Cc: kasong@tencent.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	apopple@nvidia.com, axelrasmussen@google.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, bhe@redhat.com, byungchul@sk.com, 
	cgroups@vger.kernel.org, chengming.zhou@linux.dev, chrisl@kernel.org, 
	corbet@lwn.net, david@kernel.org, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jannh@google.com, 
	joshua.hahnjy@gmail.com, lance.yang@linux.dev, lenb@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, matthew.brost@intel.com, 
	mhocko@suse.com, muchun.song@linux.dev, npache@redhat.com, pavel@kernel.org, 
	peterx@redhat.com, pfalcato@suse.de, rafael@kernel.org, rakie.kim@sk.com, 
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com, 
	shakeel.butt@linux.dev, shikemeng@huaweicloud.com, surenb@google.com, 
	tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 11:37=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Thu, Mar 19, 2026 at 12:56=E2=80=AFAM Peter Zijlstra <peterz@infradead=
.org> wrote:
> >
> > On Wed, Mar 18, 2026 at 03:29:40PM -0700, Nhat Pham wrote:
> > > diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> > > index 62cd7b35a29c9..85cb45022e796 100644
> > > --- a/include/linux/cpuhotplug.h
> > > +++ b/include/linux/cpuhotplug.h
> > > @@ -86,6 +86,7 @@ enum cpuhp_state {
> > >       CPUHP_FS_BUFF_DEAD,
> > >       CPUHP_PRINTK_DEAD,
> > >       CPUHP_MM_MEMCQ_DEAD,
> > > +     CPUHP_MM_VSWAP_DEAD,
> > >       CPUHP_PERCPU_CNT_DEAD,
> > >       CPUHP_RADIX_DEAD,
> > >       CPUHP_PAGE_ALLOC,
> >
> > > +static int vswap_cpu_dead(unsigned int cpu)
> > > +{
> > > +     struct vswap_cluster *cluster;
> > > +     int order;
> > > +
> > > +     rcu_read_lock();
> >
> > nit:
> >         guard(rcu)();
> >
> > > +     for (order =3D 0; order < SWAP_NR_ORDERS; order++) {
> > > +             cluster =3D per_cpu(percpu_vswap_cluster.clusters[order=
], cpu);
> > > +             if (cluster) {
> > > +                     per_cpu(percpu_vswap_cluster.clusters[order], c=
pu) =3D NULL;
> > > +                     spin_lock(&cluster->lock);
> >
> > This breaks on PREEMPT_RT as this is ran with IRQs disabled. This must
> > be a raw_spinlock_t.
> >
> > > +                     cluster->cached =3D false;
> > > +                     if (refcount_dec_and_test(&cluster->refcnt))
> > > +                             vswap_cluster_free(cluster);
> >
> > And this... below.
> >
> > > +                     spin_unlock(&cluster->lock);
> > > +             }
> > > +     }
> > > +     rcu_read_unlock();
> > > +
> > > +     return 0;
> > > +}
> >
> > > +static void vswap_cluster_free(struct vswap_cluster *cluster)
> > > +{
> > > +     VM_WARN_ON(cluster->count || cluster->cached);
> > > +     VM_WARN_ON(!spin_is_locked(&cluster->lock));
> >
> > This is terrible, please use:
> >
> >         lockdep_assert_held(&cluster->lock);
> >
> > > +     xa_lock(&vswap_cluster_map);
> >
> > This is again broken, this cannot be from a DEAD callback with IRQs
> > disabled.
> >
> > > +     list_del_init(&cluster->list);
> > > +     __xa_erase(&vswap_cluster_map, cluster->id);
> >
> > Strictly speaking this can end up in xas_alloc(), which is again, not
> > allowed in a DEAD callback.
>
> I see. I'll take a look at this. Thanks for pointing this out, Peter!

Hmm seems like we can just defer-free on the cpu_dead path, and that
should be safe?

Right now, if a cluster is cached on a CPU, we know that it's not
cached on any other CPU, and it's not on any other partial lists.
Maybe can call_rcu() here to defer-free it. Hopefully cpu dead is rare
enough of an event that we dont have a backlog of free deferrals :)

The other alternative is workqueue (with some careful rcu handling in
the free callback), but that seems unnecessary.
