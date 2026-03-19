Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF24B31A542
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 18:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945455; cv=pass; b=I+qOkN04ACtrmr3T0nYGbG9Zgyl7jACXr0eH/T42gFP2T5YLI0w99DkUMLeJm8IpWkS97fbL5jpyAMWD5puokalQEwpP4kPUoIgaa5o0iq/4ueTAevMqfYGehXTAa2jEpe5M3P21u5AnkSruHcqanTpoM6685I0hCEd0es39uvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945455; c=relaxed/simple;
	bh=Ljd1nDUnqT7HjpseLLlArUsMFAua4xKP9JZ0zvMVBtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bY4FAX2pOMXVdzdE0jMllopS8LSlscHMtRuHjbqMDCAi29cAfay431YZ/OaDzvQXVzJkaO838I0uOaKK7jn50AZH4GTmtxPiiYzhPxeUGhC2/jaJjHKOTjElpTMLjNAhQS3qIBRcxJbzmRp1hK3D7mEfHt6+Hz1l98T1qE/ESgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvSG/1SJ; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvSG/1SJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4327790c4e9so718562f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 11:37:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773945451; cv=none;
        d=google.com; s=arc-20240605;
        b=QhT7zJYIk5WLFfBGBuXaRbjDcXGsQj1zG794KxXa+qdqEqbhSw1zte5hfHUvUvdYQt
         6ipdO982RBv3YnT5JUBwjQj+vYj6ulwlLoCZgjVuYi1xtsUUa2zzYDdiT10jqneSDiQ2
         XorU8uSxHLz3fLetrIlKO6wyNMFF6EZPwLcRq4ilkPggVGPSakeaVnBATsHn27O7el6H
         r4vZwS7Ruai3GVd9pII2I7bFfu9WfOeSYaT4aHoFmF9l/z7guzD3bzexpmmIPfOWpYHU
         AEto7VfUaWSPv5CZPQt/riNydZ4NMt/ZMX+oY2zwjLDAicziOHL9J9DpS8IAaVjvcbhH
         3/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frA7u7Xc3APzc2EM7Lp+OpzxNxJLgzQFv8DZjhDK9GY=;
        fh=pc5ToUcFTPKT+p6U62ywOp9RMiqztzYxrrfRPd+XXQ4=;
        b=ey7svlA1h7SJkX1qLcgqagYJAuDwWFp2SsSnM/Ad7U14xgfjxc5QUdpKnxBwzRD+Ws
         ChbLnfyiXixW1YrAieHRY0pFs5nxEJ6vMZPpaTf3WoRHPquTDrnKvOnmtdkwxGuCk8MD
         6NFpdZg5TpMzOgVuod+fjqR8DhLrNFsDuGFJe7r0B9uTbnpTM52fGQMIYOs5GgNaXEE3
         dd9O8acBN+vqeI9D26djog9JgwXSvorHUMQwWRMAoy9YP1RHCs9NiPYwfK6NexCsvaL/
         AsYD9ddQBSbAyJ01Z/L3Zlid86Sfi3TTUefoy6tA7OIAaphL4OwbWYMZ+OOZHXhI5W4z
         q1+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945451; x=1774550251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frA7u7Xc3APzc2EM7Lp+OpzxNxJLgzQFv8DZjhDK9GY=;
        b=gvSG/1SJ6SqTkBbQiLzGcjeUi/b8T6RuyxthouoknB9X5HjwTnyCOqJkos2GEyxwC2
         O5A/j2ocmdwv6LLSD5jGmu41aG+ZUfAt/S7SsqCacRSRx2kSkecsLq9JdkCnV5tPrRzV
         JL315xliybXOb9XI68uVMZAN508touHpDjz3J9JFdhagqagqY7o+RhFlOiAEeSVexIrc
         IAa3u+d73+ohPvvIyU1EsCfXwRl9L4A7x8kS5581txCKQ3UiIMcL2PDWuQw2zEOt/Pwj
         q8gAihaIMbfh7X6ZVX0IkJ2gfKEU+mWpOakEv2dNkIvbXI/0zMG+pL9pZCCpQt7o6twd
         uM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945451; x=1774550251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=frA7u7Xc3APzc2EM7Lp+OpzxNxJLgzQFv8DZjhDK9GY=;
        b=pJ1aiBooX9Z4+5WtO2giOudIUkeTLtK6VMU8nG8AlrNykPFzoTHi36DkvsdFALfFxl
         vKY1sHe3ePyLhP+N0VZcRJYBMZnIoft8KyoqniC5ixi0d7AmsEHgtJR30PFpjBsKV/99
         w9cxA+Nm1bzYUdi2UQ+QpPHL/CVZrAxjhnl0MB0IVpYkeRN2/inNHt2e3vco5NwO0fEP
         8csJyzIt1upcTQiRZcIZoVHYNJQ5SMTlK/vbHIwTme4ZtqEn9t92Nx4PghAc/4H//Pyt
         GEAfVFXgAPdw8lJhsOqvKbGzjrvhWOqGXkwL2n9YPneKys1CJVAYsrxUjxSDmVslv5BK
         iSaA==
X-Forwarded-Encrypted: i=1; AJvYcCW9TpdS4g10+/wr1eZyV4mC8Bf1OMuza+1OxWKspwNwoD22TJI3PfnugUS5oLrFMHO6FrfShLgsPiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGRwv6uGEko75qmXgiYJAhKkli2PjyACUuM4Pa8fhpVFYvb5l7
	9ceu4RXgA5MVX8JnC1kEXxZTBpOiYnuUTVtJjN+0tACIy7XVSmhSPF21+HU6tuGPLOdjy4r70ye
	WTeo6a/nQUqIdV3KLjTJYujmiMRRnkrY=
X-Gm-Gg: ATEYQzyHI66fTJ4xsBDHR4XpZJf8qyDUWd6CdQ5VFwjetRRtvAoJ8VlxKY3jUz8f1Qp
	1gTsmjHkKWOwAdINKXypR2dsFW77n2xMhbVtU7/eqzO/WNbjjhD/C+1lXrNta77oD03hfoVlaxn
	Q/2GLhqz4XfyY8qSovdIO4mzT6Ln/+p1wmC360Xa2o9uyqAaA88ej0wKTpfJ35UY+pDIIDUzJZz
	WrJwrkqh3y2gRxD+9L91W/a05pZtXBh+soCdQSUDjQCQbIdnL9b9bMo2hqccxcOq+jBFelORU5e
	McQi+yeRWpRGEq5yfKPm7TLllDamTxTfL/nL6zQ=
X-Received: by 2002:a05:6000:3113:b0:43b:5003:e300 with SMTP id
 ffacd0b85a97d-43b642814fbmr636579f8f.43.1773945450700; Thu, 19 Mar 2026
 11:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318222953.441758-1-nphamcs@gmail.com> <20260318222953.441758-10-nphamcs@gmail.com>
 <20260319075621.GR3738010@noisy.programming.kicks-ass.net>
In-Reply-To: <20260319075621.GR3738010@noisy.programming.kicks-ass.net>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 19 Mar 2026 11:37:19 -0700
X-Gm-Features: AaiRm50Q6KPbZbD6bEq0DQLWi-DLG4OekR5us80lL4mbKl_agLxOnXc4Kgcmx4Q
Message-ID: <CAKEwX=MUrLtZAcmwqBau5GLnWQrjL7A_4tYrdZ4TQQaE+hsVkA@mail.gmail.com>
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

On Thu, Mar 19, 2026 at 12:56=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Wed, Mar 18, 2026 at 03:29:40PM -0700, Nhat Pham wrote:
> > diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> > index 62cd7b35a29c9..85cb45022e796 100644
> > --- a/include/linux/cpuhotplug.h
> > +++ b/include/linux/cpuhotplug.h
> > @@ -86,6 +86,7 @@ enum cpuhp_state {
> >       CPUHP_FS_BUFF_DEAD,
> >       CPUHP_PRINTK_DEAD,
> >       CPUHP_MM_MEMCQ_DEAD,
> > +     CPUHP_MM_VSWAP_DEAD,
> >       CPUHP_PERCPU_CNT_DEAD,
> >       CPUHP_RADIX_DEAD,
> >       CPUHP_PAGE_ALLOC,
>
> > +static int vswap_cpu_dead(unsigned int cpu)
> > +{
> > +     struct vswap_cluster *cluster;
> > +     int order;
> > +
> > +     rcu_read_lock();
>
> nit:
>         guard(rcu)();
>
> > +     for (order =3D 0; order < SWAP_NR_ORDERS; order++) {
> > +             cluster =3D per_cpu(percpu_vswap_cluster.clusters[order],=
 cpu);
> > +             if (cluster) {
> > +                     per_cpu(percpu_vswap_cluster.clusters[order], cpu=
) =3D NULL;
> > +                     spin_lock(&cluster->lock);
>
> This breaks on PREEMPT_RT as this is ran with IRQs disabled. This must
> be a raw_spinlock_t.
>
> > +                     cluster->cached =3D false;
> > +                     if (refcount_dec_and_test(&cluster->refcnt))
> > +                             vswap_cluster_free(cluster);
>
> And this... below.
>
> > +                     spin_unlock(&cluster->lock);
> > +             }
> > +     }
> > +     rcu_read_unlock();
> > +
> > +     return 0;
> > +}
>
> > +static void vswap_cluster_free(struct vswap_cluster *cluster)
> > +{
> > +     VM_WARN_ON(cluster->count || cluster->cached);
> > +     VM_WARN_ON(!spin_is_locked(&cluster->lock));
>
> This is terrible, please use:
>
>         lockdep_assert_held(&cluster->lock);
>
> > +     xa_lock(&vswap_cluster_map);
>
> This is again broken, this cannot be from a DEAD callback with IRQs
> disabled.
>
> > +     list_del_init(&cluster->list);
> > +     __xa_erase(&vswap_cluster_map, cluster->id);
>
> Strictly speaking this can end up in xas_alloc(), which is again, not
> allowed in a DEAD callback.

I see. I'll take a look at this. Thanks for pointing this out, Peter!
