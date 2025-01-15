Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CEC156879
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 05:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736919732; cv=none; b=SP5lm3KJjvWTrQ4fu1nFLpbe9kK/P+KaNiqq8nwilrRbe2UsSqwSVEWkY4K57SxsL0L8/Y2f//Q4DPfUN7yORcdPHfSarwb6rNH0QdqMIXXJuHMdn6z/P2OxcMbXRSB5g4+mhdNj9IgQW4YkqWn3hcFt4Rl5/AY8goycLdqQJs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736919732; c=relaxed/simple;
	bh=oc7jY6Eek7kE0hLi0bocJjtbdkT3rF7pxJQ+kHnKpHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=c1jdsHdQ+QGXgvSSrQUd16EOjC9uA9bTvLAtxRB57WooX9UBS8rywLV8682MAxW/Gtb504k+N7tgMKrk1BnSaswd+XK8dZt8wLB6XXi6+4F3gtYQmzob9CWJPfEEb+XzXgNVuLDeVCRl8aK1atNR6IbjPlUbqlAM/rZmSfL5n1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=28PQc+Tb; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="28PQc+Tb"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4679b5c66d0so416401cf.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 21:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736919729; x=1737524529; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INDxZIy8ig2x86vwomTX1oeSpGJaOUrtZzpM7B6g0Ww=;
        b=28PQc+Tb8BP0VkSE0z4qt5LJ8ivVykfI72bG1FYy431GLV30O5RwJ94989QnbvXJk+
         /hsLHY+5YV+lC9Ys2IMe/Py2vhO0GzQmXYhogls6w1vsmKuFrSqT+pgY9zf9wjYpZWdd
         JTwUSOcs6mQOJoZevqFiN9RWH9sfoeiQV95AYjb5F5ilKpfWJ3PaH13M/G4Vt9MZjYhb
         kt/OkRMLcuVdm/RH9h/WHUteurn+/ID3PrR5iQAcFgNFxAiL3n3QgG+Lm+PGdr7PR7JY
         ywL3R3o7XYmmbTV43JbczenPnVKQDhfdyfbIFnSr8CkwqWAQxTN9KabmVtufluf5/11F
         fXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736919729; x=1737524529;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INDxZIy8ig2x86vwomTX1oeSpGJaOUrtZzpM7B6g0Ww=;
        b=FrpEeRuljii+DiC6OvOgAvHEwAQWZt0HzAoiJcc0cqVP4VTEo7Oxpg8KiL+CTEGZmX
         9pYdDKQC8WMEGTcAXLHXc2x1lcAxlgQv4Kft0QiT//hHIQjHV/EulULqxy0wO0Y7R6s6
         fquc0PxMCTGxVjS4YtE4xr+QlU6WcoX6SZ9ybzY2LBSZ2alj1JoDtoMiFG2xbQgNVefE
         jfwnXskXh1EbIFr5NqwPZ5fZSSsMbLyRHr1oAojLhLFqd42mYxC83zwL3KHIxJmSyiye
         HuOsFtCYhSBVZ8x0HlI4k5GWSTC6rfIRBoLgtIpjvBx/8A9v78oYKY23DR8wL0Z2WtCU
         8qFg==
X-Forwarded-Encrypted: i=1; AJvYcCXF3PSm30wb/Ux28tVwkX41EFm0A1NHA21mjLW6p2QwJJWUmjKtaLJE+WX0ys+42TTntDVGZtUCT+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbnzA+D4ekzyvmCcGK+yzQHPD7FI1KvE/NAPrW0ibtQpg9TMKD
	/jTU4AiMN4JgO9/cGRakNZlXkt20fO677I9ZJmCvXiX/f4K9Q4JCrBgmy/PtTxZLqPVga52AEAT
	WWcXHcTMvFPy3itVzYqQ3/k/X9B8MEu1O7i+Q
X-Gm-Gg: ASbGnctDQiWFPBLPx3Tn2Ml1ZvJSZyrZZo0+GkEmzEgwL0EuwbrQ6N8Hsmurclz6JoR
	BnAp+6a6ESZTfXrjj1HBhucViy0Erw2Uy5u0VyA==
X-Google-Smtp-Source: AGHT+IEcXTyJBvHkLlKs/sVBfVgkkuLF0SqGkSP4zM024KLyxrxnd0CqsuuX/hE66FLO44KoPhCHDhZEq9Qd0dijT+0=
X-Received: by 2002:ac8:5804:0:b0:461:67d8:1f50 with SMTP id
 d75a77b69052e-46df567efe8mr2089301cf.4.1736919729045; Tue, 14 Jan 2025
 21:42:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-17-surenb@google.com>
 <20250115022703.hqbqdqawvqgrfgxb@master> <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
 <zmmoqxelfgnbfdqqcvy25hcte3kku7vrp62ohuxvxo4xsnvpu2@f5kpanslpmnk>
In-Reply-To: <zmmoqxelfgnbfdqqcvy25hcte3kku7vrp62ohuxvxo4xsnvpu2@f5kpanslpmnk>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 14 Jan 2025 21:41:57 -0800
X-Gm-Features: AbW1kvYsJDY7S2hxqYFm1I1NiZIdVTOv9hhFyQkSLwdoo98yRVCmRx9pHKnC1X0
Message-ID: <CAJuCfpGiH9goRPcHS03NnhYBj-vvrfa702ZZiCK5q-MFa-MShQ@mail.gmail.com>
Subject: Re: [PATCH v9 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org, peterz@infradead.org, 
	willy@infradead.org, lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, 
	oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, 
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 7:58=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [250114 22:15]:
> > On Tue, Jan 14, 2025 at 6:27=E2=80=AFPM Wei Yang <richard.weiyang@gmail=
.com> wrote:
> > >
> > > On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrote:
> > >
> > > >diff --git a/kernel/fork.c b/kernel/fork.c
> > > >index 9d9275783cf8..151b40627c14 100644
> > > >--- a/kernel/fork.c
> > > >+++ b/kernel/fork.c
> > > >@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct mm_=
struct *mm)
> > > >       return vma;
> > > > }
> > > >
> > > >+static void vm_area_init_from(const struct vm_area_struct *src,
> > > >+                            struct vm_area_struct *dest)
> > > >+{
> > > >+      dest->vm_mm =3D src->vm_mm;
> > > >+      dest->vm_ops =3D src->vm_ops;
> > > >+      dest->vm_start =3D src->vm_start;
> > > >+      dest->vm_end =3D src->vm_end;
> > > >+      dest->anon_vma =3D src->anon_vma;
> > > >+      dest->vm_pgoff =3D src->vm_pgoff;
> > > >+      dest->vm_file =3D src->vm_file;
> > > >+      dest->vm_private_data =3D src->vm_private_data;
> > > >+      vm_flags_init(dest, src->vm_flags);
> > > >+      memcpy(&dest->vm_page_prot, &src->vm_page_prot,
> > > >+             sizeof(dest->vm_page_prot));
> > > >+      /*
> > > >+       * src->shared.rb may be modified concurrently when called fr=
om
> > > >+       * dup_mmap(), but the clone will reinitialize it.
> > > >+       */
> > > >+      data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->sh=
ared)));
> > > >+      memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
> > > >+             sizeof(dest->vm_userfaultfd_ctx));
> > > >+#ifdef CONFIG_ANON_VMA_NAME
> > > >+      dest->anon_name =3D src->anon_name;
> > > >+#endif
> > > >+#ifdef CONFIG_SWAP
> > > >+      memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
> > > >+             sizeof(dest->swap_readahead_info));
> > > >+#endif
> > > >+#ifndef CONFIG_MMU
> > > >+      dest->vm_region =3D src->vm_region;
> > > >+#endif
> > > >+#ifdef CONFIG_NUMA
> > > >+      dest->vm_policy =3D src->vm_policy;
> > > >+#endif
> > > >+}
> > >
> > > Would this be difficult to maintain? We should make sure not miss or =
overwrite
> > > anything.
> >
> > Yeah, it is less maintainable than a simple memcpy() but I did not
> > find a better alternative. I added a warning above the struct
> > vm_area_struct definition to update this function every time we change
> > that structure. Not sure if there is anything else I can do to help
> > with this.
>
> Here's a horrible idea.. if we put the ref count at the end or start of
> the struct, we could set the ref count to zero and copy the other area
> in one mmecpy().
>
> Even worse idea, we could use a pointer_of like macro to get the position
> of the ref count in the vma struct, set the ref count to zero and
> carefully copy the other two parts in two memcpy() operations.

I implemented this approach in v3 of this patchset here:
https://lore.kernel.org/all/20241117080931.600731-5-surenb@google.com/
like this:

#define VMA_BEFORE_LOCK offsetof(struct vm_area_struct, vm_lock)
#define VMA_LOCK_END(vma) \
        (((void *)(vma)) + offsetofend(struct vm_area_struct, vm_lock))
#define VMA_AFTER_LOCK \
        (sizeof(struct vm_area_struct) - offsetofend(struct
vm_area_struct, vm_lock))

static inline void vma_copy(struct vm_area_struct *new, struct
vm_area_struct *orig)
{
        /* Preserve vma->vm_lock */
        data_race(memcpy(new, orig, VMA_BEFORE_LOCK));
        data_race(memcpy(VMA_LOCK_END(new), VMA_LOCK_END(orig),
VMA_AFTER_LOCK));
}

If this looks more maintainable I can revive it.
Maybe introduce a more generic function to copy any structure
excluding a specific field and use it like this:

copy_struct_except(new, orig, struct vm_area_struct, vm_refcnt);

Would that be better?

>
> Feel free to disregard these ideas as it is late here and I'm having
> fun thinking up bad ways to make this "more" maintainable.
>
> Either of these would make updating the struct easier, but very painful
> to debug when it goes wrong (or reading the function).
>
> Thanks,
> Liam
