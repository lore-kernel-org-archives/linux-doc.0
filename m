Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE64189910
	for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 22:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732315431; cv=none; b=tQFydMg25fjcCHl9HAV6cV+LVJgxUMFqPXt7kB50bmvXsB1qNwvb3q5f5xSLoDKy/uNkJQyobDWwAvQGS7CGpK7hsAy8DH9Ufa9UUeucwXnLwkpWg8N3TW9qgdB2ilbB3iBgWaLk33jxGTyWCzTA0iODZFcbmLi7pRZDze2dtIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732315431; c=relaxed/simple;
	bh=lqYVRUzCRXOYJL1sSEZW/Z88jOYbq8aQSd8shbMACzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qUg7zaTg5wnGmx8pA2I0/5ebfkpkk7xX3k2hCdBSHwxDVrkwQ/zEN4bxz7bXC2RtKU4CLlkWDENXn/vskPJ+Vgibo9ImwU/cGath7P4YK38pFS+Q7kvZUbbaCoWpYyfbXN5mgSvu31COqgLHzWfgd7Ue673tO3bKc1hYuKRwWio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nyCRRyr3; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nyCRRyr3"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-460969c49f2so23051cf.0
        for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 14:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732315428; x=1732920228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHORz47FiSIR9q+W9ZVN0yQsYQ1UBFTTA/DlKq9Xp9g=;
        b=nyCRRyr3XWU64ifabsNfHZodQ0LJh71vDdkK2dHTYr9OM+pkbMS1FhlzrUUMeVYOOM
         LulhcUSWqtYqeYbmEi+AR9DdIuNTDtTY5tQHAkaTO2YlxKXzoIK9caktAF0kxxLHMvTr
         pF9pYEZygXUWz7V3TynBlzwyiCQfWLRoHwjqlU6Gxmv7nDypStulpMfJAuPQT6Bzd3cM
         oIK68gPTytee+yYNbLS83QRhuIcWPU46uZCS7jFP8sv3lnr1rTvBIDRSuVA8/GUZPnPD
         9XNXXkDbFmepMRQuCnN+0FoiWxkuIEr+86iaWqtpT7iQCudons9W5k5GBB7V+gXQw/YQ
         Gzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315428; x=1732920228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHORz47FiSIR9q+W9ZVN0yQsYQ1UBFTTA/DlKq9Xp9g=;
        b=rGG8IACSqngmD1EygC7kUKjNHgNF9gUIFRvuUBXJDW+pz5ROjEkfOG1q4LPoE5XbCE
         paEROKp/jdiZyKjOI81oM8D50dFvVFEljQ4uFA50Dnw24MhCyZYt59HQznZewyqrUblk
         6bYKUbQiwqAXeb4AgiobVVohwYjtdb/sTGLT2VBm/SzzbhddGQSVixwBeXHoDsIY/ExK
         Z4d6d2xQyOBatjY/OQAOtUXrsrUEc4TZcbEDx+j6npr6rmaLxtxTPh1/KiSx4HD7FtdX
         HFB3lGX2tS3bbYOcfYJKhktlPHD01z2c6g5quyY1DUag6h/BlaUd7ijLY9dyvIsJOssB
         vwDg==
X-Forwarded-Encrypted: i=1; AJvYcCWdCrGQoQSgARVl7/C9RWDlHC8i7PYvgwd1zHZhnqPhKngKJL3qGKV7XDXZbIqki1rHz1rXIH2IqlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAijqRgRfNYTSyceT7zFJTettVk7WIhAzTnOqNjKSuakUvco4P
	SjOpkeK6JC/NykrMmEznsN6ovk99sOnxN+7BQ06ESPvskYnNplUg4qStzLU97YBCqB+qVabtCuy
	m2Ez/oO/yzc8sM305MoCOZVNEGqsqdwvbqw8s
X-Gm-Gg: ASbGncvUMwOsujv8CWEzhRhTQy1mhFzew7L4vwewqR7/gis5lFHI75puT2ftlR1iuWY
	v/bSVZxMvddNLBhdGsW757w/rbK0PmdE=
X-Google-Smtp-Source: AGHT+IEFX7LWkW1c39d4ISGOpA0oNTEkNboBSr8vIIy/woFz0x8Q9YCXC3T5nxjXIL6abvvQKd+D6KUVCI48zqhhqtY=
X-Received: by 2002:a05:622a:8c6:b0:460:b4e3:49e with SMTP id
 d75a77b69052e-46673dacb95mr259451cf.9.1732315428171; Fri, 22 Nov 2024
 14:43:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120000826.335387-1-surenb@google.com> <20241120000826.335387-5-surenb@google.com>
 <Zz1nRyMnIaCa0TL5@casper.infradead.org> <CAJuCfpFO3Hj+7f10e0Pnvf0U7-dHeYgvjK+4AFD8V=kmG4JA=w@mail.gmail.com>
In-Reply-To: <CAJuCfpFO3Hj+7f10e0Pnvf0U7-dHeYgvjK+4AFD8V=kmG4JA=w@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 22 Nov 2024 14:43:37 -0800
Message-ID: <CAJuCfpEuLR8a2jrV4pUQL7emzjSrFa5JHC75PCBdLWRSL0SmmQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 10:37=E2=80=AFPM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Tue, Nov 19, 2024 at 8:36=E2=80=AFPM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > On Tue, Nov 19, 2024 at 04:08:25PM -0800, Suren Baghdasaryan wrote:
> > > +static inline void vma_clear(struct vm_area_struct *vma)
> > > +{
> > > +     /* Preserve vma->vm_lock */
> > > +     memset(vma, 0, VMA_BEFORE_LOCK);
> > > +     memset(VMA_LOCK_END(vma), 0, VMA_AFTER_LOCK);
> > > +}
> >
> > This isn't how you're supposed to handle constructors.  You've fixed
> > the immediate problem rather than writing the code in the intended styl=
e.
>
> Yeah, I don't like this myself but the only alternative I can think of
> is to set the struct members individually.
>
> >
> > > +static void vm_area_ctor(void *data)
> > > +{
> > > +     vma_lock_init(data);
> > > +}
> >
> > After the ctor has run, the object should be in the same state as
> > it is after it's freed.  If you want to memset the entire thing
> > then you can do it in the ctor.  But there should be no need to
> > do it in vma_init().
>
> IIUC, your suggestion is to memset() the vma and initialize vm_lock
> inside the ctor. Then when it's time to free the vma, we reset all
> members except vm_lock before freeing the vma. As you mention later,
> members like anon_vma_chain, which are already clear, also won't need
> to be reset at this point. Am I understanding your proposal correctly?
>
> BTW, if so, then vma_copy() will have to also copy vma members individual=
ly.
>
> >
> > And there's lots of things you can move from vma_init() to the ctor.
> > For example, at free time, anon_vma_chain should be an empty list.
> > So if you init it in the ctor, you can avoid doing it in vma_init().
>
> True.
>
> > I'd suggest that vma_numab_state_free() should be the place which
> > sets vma->numab_state to NULL and we can delete vma_numab_state_init()
> > entirely.
>
> Sounds good to me.

I took a stab at it and the result does not look pretty...
Couple notes:
- vma_init() is used in other places to initialize VMAs allocated on
the stack, so I left it alone for such cases. VMAs like that are not
allocated from vm_area_cachep, can't be reused anyway, therefore we
can override their vm_lock.
- Since vma_init() has to stay, we can't retire vma_numab_state_init()
because it's used in vma_init().
- I think resetting members before freeing might not be such a good
idea because after resetting the object might not be reused at all.

Now, the main point:
I moved initializations of several members into ctor but even with
that the code looks roughly like this:

static void vm_area_ctor(void *data)
{
    struct vm_area_struct *vma =3D (struct vm_area_struct *)data;

    vma->detached =3D true;
    INIT_LIST_HEAD(&vma->anon_vma_chain);
    vma_lock_init(vma);
}

struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
{
    struct vm_area_struct *vma;

    vma =3D kmem_cache_alloc(vm_area_cachep, GFP_KERNEL);
    if (!vma)
        return NULL;

    vma->vm_mm =3D mm;
    vma->vm_ops =3D &vma_dummy_vm_ops;
    vma->vm_start =3D 0;
    vma->vm_end =3D 0;
    memset(&vma->vm_page_prot, 0, sizeof(vma->vm_page_prot));
    vm_flags_init(vma, 0);
    vma_numab_state_init(vma);
    memset(&vma->shared, 0, sizeof(vma->shared));
    vma->anon_vma =3D NULL;
    vma->vm_pgoff =3D 0;
    vma->vm_file =3D NULL;
    vma->vm_private_data =3D NULL;
    memset(&vma->vm_userfaultfd_ctx, 0, sizeof(vma->vm_userfaultfd_ctx));
#ifdef CONFIG_ANON_VMA_NAME
    vma->anon_name =3D NULL;
#endif
#ifdef CONFIG_SWAP
    atomic_long_set(&vma->swap_readahead_info, 0);
#endif
#ifndef CONFIG_MMU
    vma->vm_region =3D NULL;
#endif
#ifdef CONFIG_NUMA
    vma->vm_policy =3D NULL;
#endif
#ifdef CONFIG_NUMA_BALANCING
    vma->numab_state =3D NULL;
#endif
    return vma;
}

I can of course add helper functions and get rid of the #ifdef's but still.=
..

Matthew, want to double check if this looks like the solution you were
proposing or am I completely off the target?

>
> Please confirm if I correctly got your idea and I'll update this patch.
> Thanks for the feedback!
>
> >
