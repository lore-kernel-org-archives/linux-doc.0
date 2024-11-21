Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33912F3B
	for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 00:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732149232; cv=none; b=uONdyjnaZ5d1/yTlRUjtklj8G0ZA4FzbuTcq23psXTRmFVdIf/AH8sWg7QPJOkE6YR4x+3f/pK5VRoecfg4MVth7TRGb+G1nipeubCCDrzXjdtEpdkpsr6DkG4FTM7/y6UL50npMhzQxT0VdGs50R7aScw1NvajnD8ioEgk005M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732149232; c=relaxed/simple;
	bh=2hIBDyppP+989TTRPQ9tHS6PzGNn5GnwulBsDMjTvLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScYvLm35YD/I03PHHN1gm3B7ErIJdE2V9YhoaxwoMmgKntqNbNL61qoHnbszu9Ft3DTF+TARNybZhJZE3I5l73Y4kT/lbXgdj6T7B1qiEAf8Zu8OB/5y+3sJjF9RO+wdNePuE9pVgDlMWdmLDRL/FeYfrKVu5F2r8MlYyB12sec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OzzDboaO; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OzzDboaO"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4608dddaa35so161381cf.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 16:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732149228; x=1732754028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlniKgym+Q90GvuHd3GoZB7/NP0pryZ3yXdMK0RESg4=;
        b=OzzDboaOJORqBWXpsaT6tus7RJbQSemghgiV3WNGr08tHtJNggF6Gj3pmeQdWvHGxn
         4gIQfz9ubVgk3IqnpM4noiEpyEeBBvXpoYmyOZ1LxF9iSd29V3iaNPXc8vCUaxMYznh2
         FWH0GhjLShSZz4PRuvVM0yHOMk5erQV7GJ3lO+iWUUE5JunEawjgMdcsXuEM1hgieWs1
         YWu4b2gM+Z4RVc1wqjkzx0LQqZiNks2MsIVBeIXmS6g9mX6bGeBbV6PMtA9nw2qHAiab
         wWmpaWYB+L6Lw1WweIsXAb43YYenUylq3dnvyD0aPfbqVdzdt5YKN8fNxj7donJ9kvGh
         O+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732149228; x=1732754028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlniKgym+Q90GvuHd3GoZB7/NP0pryZ3yXdMK0RESg4=;
        b=HBmscShfEkL0u+HvTpC3hctqssF3jKcw6bJmPmXpEzb6JTq+qjyCv/j5/gOvOB9qw2
         FSkgdRPiZvwqOaoJW9Yae9M4QBjj+GHAIgjPMbxazxP6scJFI8fIuHFImme0LbZ/alRM
         Iz6YyyCBTqiYjKankgjpQ/81GN4kRN3edTUWbkIyRMees/czVpRrAswgTaVW4R/VRhyR
         ALChKruHvuJA/Qn75jege+WdPoM6NbCEowpb/XStKzp5vIomj66wjYer/eAkeZJQdDOS
         5H+M7yVsH2NWo1WB5KSJG8yRDNHcfr48A3EqwrmzxHbPpvsZuIZt1d7ScWdNKN9RFncv
         8gEw==
X-Forwarded-Encrypted: i=1; AJvYcCWhyVwASNo8sRrSfBHnaxrIC3xPXpiSG/PMGTn6Mp6/1bHfY4katPsxsmn5wbxKprp95VCpbWHdRtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMtclaEoAXWzk6MbNqS0FPn/8YByPUrbssUuKoSxYp0ByzPdus
	9TpPTDwnRKoa/gBq4L8iL54qTtKp+HHaZXHn8Rdml/5OoW9t8tKXg9ishCmchZ8TVaBLRbgHNeV
	jLV83HnzXVftrMydjjuLY9d63jkYJTRLIC74W
X-Gm-Gg: ASbGncuo1zAoXImtELAkHJFPYUAns9xCY3yAB9N85tR6zUWJWlFAXABUYFz0fyHpClh
	h5DIZShoh37ge4BZzSijdrBRiscc/ajQ=
X-Google-Smtp-Source: AGHT+IFQ/4vehjWSFCMPc5HZk4dt8N+0X4OiwXr6PNMh/c4OX08XmHwTEq8nAVQsyDRLqHOEJlqtef+ZYaSBMLoAvgU=
X-Received: by 2002:ac8:5811:0:b0:461:66ea:ea70 with SMTP id
 d75a77b69052e-465318e24c8mr659041cf.15.1732149228248; Wed, 20 Nov 2024
 16:33:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120000826.335387-1-surenb@google.com> <20241120000826.335387-3-surenb@google.com>
 <zfd7xdkr5dkvvx3caqao3oorh2pxxifhdhwsw2iyxcuzbevo3n@sobu7xhw24vv>
 <CAJuCfpFAh-gw_BVCaEB4+saedVC6aPB7HfyPikvTujyGRLXPwQ@mail.gmail.com> <wnwfgk32wyvx7tzd522ajwk5uixls7iayksrtho6c3dkvgdpek@25yqv3ohljzc>
In-Reply-To: <wnwfgk32wyvx7tzd522ajwk5uixls7iayksrtho6c3dkvgdpek@25yqv3ohljzc>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 20 Nov 2024 16:33:37 -0800
Message-ID: <CAJuCfpGx6LCd7qCOsLc6hm-qMGtyM3ceitYbRdx1yKPHFHT-jQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] mm: move per-vma lock into vm_area_struct
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, minchan@google.com, 
	jannh@google.com, souravpanda@google.com, pasha.tatashin@soleen.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 4:05=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> On Wed, Nov 20, 2024 at 03:44:29PM -0800, Suren Baghdasaryan wrote:
> > On Wed, Nov 20, 2024 at 3:33=E2=80=AFPM Shakeel Butt <shakeel.butt@linu=
x.dev> wrote:
> > >
> > > On Tue, Nov 19, 2024 at 04:08:23PM -0800, Suren Baghdasaryan wrote:
> > > > Back when per-vma locks were introduces, vm_lock was moved out of
> > > > vm_area_struct in [1] because of the performance regression caused =
by
> > > > false cacheline sharing. Recent investigation [2] revealed that the
> > > > regressions is limited to a rather old Broadwell microarchitecture =
and
> > > > even there it can be mitigated by disabling adjacent cacheline
> > > > prefetching, see [3].
> > > > Splitting single logical structure into multiple ones leads to more
> > > > complicated management, extra pointer dereferences and overall less
> > > > maintainable code. When that split-away part is a lock, it complica=
tes
> > > > things even further. With no performance benefits, there are no rea=
sons
> > > > for this split. Merging the vm_lock back into vm_area_struct also a=
llows
> > > > vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> > > > Move vm_lock back into vm_area_struct, aligning it at the cacheline
> > > > boundary and changing the cache to be cacheline-aligned as well.
> > > > With kernel compiled using defconfig, this causes VMA memory consum=
ption
> > > > to grow from 160 (vm_area_struct) + 40 (vm_lock) bytes to 256 bytes=
:
> > > >
> > > >     slabinfo before:
> > > >      <name>           ... <objsize> <objperslab> <pagesperslab> : .=
..
> > > >      vma_lock         ...     40  102    1 : ...
> > > >      vm_area_struct   ...    160   51    2 : ...
> > > >
> > > >     slabinfo after moving vm_lock:
> > > >      <name>           ... <objsize> <objperslab> <pagesperslab> : .=
..
> > > >      vm_area_struct   ...    256   32    2 : ...
> > > >
> > > > Aggregate VMA memory consumption per 1000 VMAs grows from 50 to 64 =
pages,
> > > > which is 5.5MB per 100000 VMAs. Note that the size of this structur=
e is
> > > > dependent on the kernel configuration and typically the original si=
ze is
> > > > higher than 160 bytes. Therefore these calculations are close to th=
e
> > > > worst case scenario. A more realistic vm_area_struct usage before t=
his
> > > > change is:
> > > >
> > > >      <name>           ... <objsize> <objperslab> <pagesperslab> : .=
..
> > > >      vma_lock         ...     40  102    1 : ...
> > > >      vm_area_struct   ...    176   46    2 : ...
> > > >
> > > > Aggregate VMA memory consumption per 1000 VMAs grows from 54 to 64 =
pages,
> > > > which is 3.9MB per 100000 VMAs.
> > > > This memory consumption growth can be addressed later by optimizing=
 the
> > > > vm_lock.
> > > >
> > > > [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@go=
ogle.com/
> > > > [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9=
020/
> > > > [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP=
53cT_kbfP_pR+-2g@mail.gmail.com/
> > > >
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > >
> > > Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> >
> > Thanks!
> >
> > >
> > >
> > > One question below.
> > >
> > > > --- a/include/linux/mm_types.h
> > > > +++ b/include/linux/mm_types.h
> > > > @@ -716,8 +716,6 @@ struct vm_area_struct {
> > > >        * slowpath.
> > > >        */
> > > >       unsigned int vm_lock_seq;
> > > > -     /* Unstable RCU readers are allowed to read this. */
> > > > -     struct vma_lock *vm_lock;
> > > >  #endif
> > > >
> > > >       /*
> > > > @@ -770,6 +768,10 @@ struct vm_area_struct {
> > > >       struct vma_numab_state *numab_state;    /* NUMA Balancing sta=
te */
> > > >  #endif
> > > >       struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> > > > +#ifdef CONFIG_PER_VMA_LOCK
> > > > +     /* Unstable RCU readers are allowed to read this. */
> > > > +     struct vma_lock vm_lock ____cacheline_aligned_in_smp;
> > > > +#endif
> > > >  } __randomize_layout;
> > >
> > > Do we just want 'struct vm_area_struct' to be cacheline aligned or do=
 we
> > > want 'struct vma_lock vm_lock' to be on a separate cacheline as well?
> >
> > We want both to minimize cacheline sharing.
> >
>
> For later, you will need to add a pad after vm_lock as well, so any
> future addition will not share the cacheline with vm_lock. I would do
> something like below. This is a nit and can be done later.
>
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 7654c766cbe2..5cc4fff163a0 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -751,10 +751,12 @@ struct vm_area_struct {
>  #endif
>         struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
>  #ifdef CONFIG_PER_VMA_LOCK
> +       CACHELINE_PADDING(__pad1__);
>         /* Unstable RCU readers are allowed to read this. */
> -       struct vma_lock vm_lock ____cacheline_aligned_in_smp;
> +       struct vma_lock vm_lock;
> +       CACHELINE_PADDING(__pad2__);
>  #endif
> -} __randomize_layout;
> +} __randomize_layout ____cacheline_aligned_in_smp;

I thought SLAB_HWCACHE_ALIGN for vm_area_cachep added in this patch
would have the same result, no?

>
>  #ifdef CONFIG_NUMA
>  #define vma_policy(vma) ((vma)->vm_policy)
