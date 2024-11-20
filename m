Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB24158DC6
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 06:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732084671; cv=none; b=jwRjuztwKZC89xgpIH14DcTAHqhpcvkBabpYSxjll3qsIMjQKzFPGtwL2lj1WVRt0QqcHbXXs+UN+Lg/DAMY3y/tVBrq0gBT7Bjllk+6XL0m9KZp1aKd9VwKx4dSISWujDm8HVfy6OwYqrV1xDJJYTvgkvLx/sZanlNT3veW694=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732084671; c=relaxed/simple;
	bh=bNqVRYONXINW30ljhJmbYoefJAAq9tPUUJFrPE5KjX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWFHTWhxXl6dkRdBf9oVK2N2oeheJsO3EjUgrxJW3BX2o+fltWBNOCiwJRbuDwFZRMobQqd0ajvXJiUnBVphxGNTcfmCwCM+J/KAN+kz0kuYHSgsk1pzFklWsTxIsfYlApjQP90+g5Rh8oYVL5Q3RGNSe7ga+9wzaEpxNrhKPhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nqCrA6ON; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nqCrA6ON"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4635b03a3cdso398401cf.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 22:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732084669; x=1732689469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twOFcafBA8zbtRCLGHiLepRQE+KfwEfxqM6TFZTLEH8=;
        b=nqCrA6ONLvFiZ3OMWNJG62eN07eyxHcvc/KVGra4Ur3Ng2UyHU64aHLIzLb1seO/Pt
         Bi8wac/MpZxFTTLzObyVrLthIATfjFbx0kZsag6GZu1nmVrxS8PRCSE0ACWhjDhVIpcO
         0iU2V88WCZiTRlfW4ezS1oAY2ts+wBvQzxHQa8GZK+HUZEpsJGAZu9HJ5Sm3AazJGkU8
         CiWjSC+f16XKGz2EQva/GKERNkMeDvMKQ3SdXuLTCVNcNw63wEzVb1krV3GqUqnS+1BM
         50Txxah8rmA+TZTIzWrcY8lJpDXeUhA6C/SYcJFC3b7a2u/dXrWkAHI4B5LBE1mlND0g
         G4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732084669; x=1732689469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twOFcafBA8zbtRCLGHiLepRQE+KfwEfxqM6TFZTLEH8=;
        b=c6aMRBIZxfDx1Vlq9QiM1C2ORewuu3mdQKY7di98DtCRjXoT7p1zF7buR4gbwmpnMp
         g3aezCtWMA68Jxw/2ipdj2aSDxWghA3TEVmYn9HTtaEU3daKW6EOz0LmOhLVBQl7lQxV
         CtKCqWSvHw+PpsUxI7k0avgCNfkNur99Rjbvc8lGP3Qg1AbLD0Y5aKPbcylUYn5SgbyK
         lwbGvjEosb2EJeeoTFq2RaSZ0+0Z0PhSkUYgcA7P+ekI1+9YjZBPi0DcWNFtRIe6tbf2
         7nLZHaL4chb68h+t9cj/Rl1VBcIZLu56x/Z65OMj0uFJv3HQpp1k7WF6fXq8Hxzb93S4
         0DEA==
X-Forwarded-Encrypted: i=1; AJvYcCVlq1CSJbtAH0U4KDv+SoGSWfgyd9yiFaKibfif774cBdTjZoEpsEcVureyutdp6gVNn8Hz1tfSlcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCXIGqf3WLxjobLT3GHvdFkjMCc2eloQZ/4u1wabLu2UAV8uhX
	+OpPMcyhtBoVfUmLtlZJVINjcCKyJI5BaIGW/H8u+gKhCiamoVXJ8e0BGEsTiUcNVZtscA3pWgF
	iwWsUcUgc4/ApZvHu0b1KJGjuxcPCyzJYqjqL
X-Gm-Gg: ASbGncucOzJtVBiVMUuzrxtVHFnUjJyKISdqSx6Rwev3/HSaqAGP+VNKQTHjV4pklFG
	j2JfeTUoJ1SbXq4bfu9fs9+FoloqP+Z4=
X-Google-Smtp-Source: AGHT+IHJlWHMudI2smz0xt8RkruDOEJTR5wc3FLspHJfaWPzdFAukEcueD4KFTtcCkdjIYKkMcCiriZYSOiRiPlUNfA=
X-Received: by 2002:ac8:5856:0:b0:461:32e9:c5f1 with SMTP id
 d75a77b69052e-464268e9273mr2284921cf.10.1732084668507; Tue, 19 Nov 2024
 22:37:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120000826.335387-1-surenb@google.com> <20241120000826.335387-5-surenb@google.com>
 <Zz1nRyMnIaCa0TL5@casper.infradead.org>
In-Reply-To: <Zz1nRyMnIaCa0TL5@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 19 Nov 2024 22:37:37 -0800
Message-ID: <CAJuCfpFO3Hj+7f10e0Pnvf0U7-dHeYgvjK+4AFD8V=kmG4JA=w@mail.gmail.com>
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

On Tue, Nov 19, 2024 at 8:36=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Tue, Nov 19, 2024 at 04:08:25PM -0800, Suren Baghdasaryan wrote:
> > +static inline void vma_clear(struct vm_area_struct *vma)
> > +{
> > +     /* Preserve vma->vm_lock */
> > +     memset(vma, 0, VMA_BEFORE_LOCK);
> > +     memset(VMA_LOCK_END(vma), 0, VMA_AFTER_LOCK);
> > +}
>
> This isn't how you're supposed to handle constructors.  You've fixed
> the immediate problem rather than writing the code in the intended style.

Yeah, I don't like this myself but the only alternative I can think of
is to set the struct members individually.

>
> > +static void vm_area_ctor(void *data)
> > +{
> > +     vma_lock_init(data);
> > +}
>
> After the ctor has run, the object should be in the same state as
> it is after it's freed.  If you want to memset the entire thing
> then you can do it in the ctor.  But there should be no need to
> do it in vma_init().

IIUC, your suggestion is to memset() the vma and initialize vm_lock
inside the ctor. Then when it's time to free the vma, we reset all
members except vm_lock before freeing the vma. As you mention later,
members like anon_vma_chain, which are already clear, also won't need
to be reset at this point. Am I understanding your proposal correctly?

BTW, if so, then vma_copy() will have to also copy vma members individually=
.

>
> And there's lots of things you can move from vma_init() to the ctor.
> For example, at free time, anon_vma_chain should be an empty list.
> So if you init it in the ctor, you can avoid doing it in vma_init().

True.

> I'd suggest that vma_numab_state_free() should be the place which
> sets vma->numab_state to NULL and we can delete vma_numab_state_init()
> entirely.

Sounds good to me.

Please confirm if I correctly got your idea and I'll update this patch.
Thanks for the feedback!

>
