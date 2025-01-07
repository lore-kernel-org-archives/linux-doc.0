Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC07A1E3780
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 18:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736275890; cv=none; b=ILhFQ7FN9+M8fBQNjCsegbPBj6nCFy0KsGw0knk/e3tmIbcCQN/sVhHtn3AIkwTWNFPS0py68POnN6Au87BbV3TmzKVOH9DDKdVjZr56OVM0R/aE1IsCeFONwsUH5VDGWhjg0vcp5t+NBedlEyuLu6X0wrN0SfjyhZ7DMNjmpVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736275890; c=relaxed/simple;
	bh=jkghxLGiHyUshv2MgUDBF4bCNwaIMw8OePw2ImjoSuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBy+qVy2dBDj4w+R7exrNVDuLY0fEAo99MYzMQ8UcgXmAauSh7Jm89F+/z9i6RDYiBes1TIrkZNcbpOE0+czYYU0JDvvyTw1LXqRG5Jk9iaKMkE4UBXdN/2GUdL2NyGlkKn1Of0+DGnz69AR1Fo3etVBrPRNqbVj5sW0PnvA6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nuTzIhvj; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nuTzIhvj"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4679b5c66d0so19151cf.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 10:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736275886; x=1736880686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPh2gKS/v4VjzRQCsLemWsvX/hSIorRAHAy4XmYPBPU=;
        b=nuTzIhvj3SDEKINfEfsRBu6xR7cQLJZgzkj7aC4dJ8sfpTukpadf0zoIoPc4Y8+wr7
         dJTdIYuYSMZiHBswpKs+WZWyJ7eE416oSh/L0oLRzfAXcgRJH+MghoYHYbtTB7UIjTVG
         ClPWmVcA80CW5NPs2/AmNMuLfa2q2ruFRhX8S9S/j3//qvYNC1fO1AeB60IArJ1B0oVe
         o0SNU9H3wGBst25PXLKBHjYuT/i91tu/giNqz+YpFC6yrNSeEikCalax5/wuRbNMrZml
         pluPKWl5SymiJqFfbHx0HayYk5vYutsJVeGjhh5R4Ugq1gj95xpfZpiymTEPu2XfR492
         DmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736275886; x=1736880686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPh2gKS/v4VjzRQCsLemWsvX/hSIorRAHAy4XmYPBPU=;
        b=r5HIqryv76ymRnNX3lZNmwknXoueWgiji4CLDPZAhGu4W3DGEzQrSOy8y+Rkm5fLxj
         ZqOMcrNu8JovvFLhFF+1BqLgUb5W6CWtgutOPD/9nmnODp/3+S226VGU4OM+YPRX4ZIe
         yF3dFObsKUzzLe78jm5GkxlKX59XFHoNxqDmv1u3CttUxI7fJ0Ta7wadYpi49777yp4i
         9xf42O8fhImEjxsvduXcNJYkzvyg3mJTbHk95/w9xUcLfuXFL9WZ6s8Iw1ZNWprA+1dx
         U35IhqVGSnPqVxFvPOkpYsB8FZtaCpIHosUEjcFr/VeE/sP7Rj/lZK9Nb1orExKBGwIR
         uucA==
X-Forwarded-Encrypted: i=1; AJvYcCVvgBHcvEpS2Y6wUq9HioDT2RqwV6wtgs36E9k6jk57mKZst0zOmfcj5Mbbq2OCZ46frHgZR39Undk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9njgqfOtV5MFwXoYmP8wETpqmsx2UnBqnmZx+yfSdGDpqZrjd
	M0HiEBLt1C48MUD+M4BfDe7pY2aZV6uoLK88KYgmnh6WJyFjnvGRZ8VMBNqIlOoSIB603/PwHyj
	EOq2qLe48sBdXWBgBh64BNKElErk7ZJ2jRZYY
X-Gm-Gg: ASbGncv4YgOlK7e1sCVbgq8aKitE8eiFgpnfaShaOa024qEfmlBBoS+3BP/D1IM14FJ
	4eRBPqq6aw3jMovYr1i7cMmVFnVynCC7hNiOXtZUPQ3hKc8j8SvqU2g8MnEIWGzM3tfy1
X-Google-Smtp-Source: AGHT+IGvMHw6R55/7RPunW0bn5d1AcmQMp94GlSumE0j3nd2FkOFABupMFvz0IO2VbC/lpg+oAQLe5CNCvnHOkf1vRA=
X-Received: by 2002:a05:622a:ca:b0:466:a3ed:bde7 with SMTP id
 d75a77b69052e-46c70bd562bmr18791cf.6.1736275885451; Tue, 07 Jan 2025 10:51:25
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-11-surenb@google.com>
 <0d36fd53-b817-4bbd-ae38-af094bd301df@suse.cz> <CAJuCfpH63RQiSoxyXTjrU7Fe1VyKsFrK+KqQdRCXFSf01DqO1g@mail.gmail.com>
In-Reply-To: <CAJuCfpH63RQiSoxyXTjrU7Fe1VyKsFrK+KqQdRCXFSf01DqO1g@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 7 Jan 2025 10:51:14 -0800
X-Gm-Features: AbW1kvZ3qxEhcdILrDHwREO3rKuUtsZyNZvMA-zGpm4yXwrVECVYk0kyTIRjG2Y
Message-ID: <CAJuCfpH56vVJ5YxAAUt9pL+7s2a8RecOBiiGcZstyJan+GEAaA@mail.gmail.com>
Subject: Re: [PATCH v7 10/17] mm: uninline the main body of vma_start_write()
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 9:45=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Tue, Jan 7, 2025 at 9:35=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> w=
rote:
> >
> > On 12/26/24 18:07, Suren Baghdasaryan wrote:
> > > vma_start_write() is used in many places and will grow in size very s=
oon.
> > > It is not used in performance critical paths and uninlining it should
> > > limit the future code size growth.
> > > No functional changes.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >
> > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> >
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -6328,6 +6328,20 @@ struct vm_area_struct *lock_mm_and_find_vma(st=
ruct mm_struct *mm,
> > >  #endif
> > >
> > >  #ifdef CONFIG_PER_VMA_LOCK
> > > +void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_l=
ock_seq)
> > > +{
> > > +     down_write(&vma->vm_lock.lock);
> > > +     /*
> > > +      * We should use WRITE_ONCE() here because we can have concurre=
nt reads
> > > +      * from the early lockless pessimistic check in vma_start_read(=
).
> > > +      * We don't really care about the correctness of that early che=
ck, but
> > > +      * we should use WRITE_ONCE() for cleanliness and to keep KCSAN=
 happy.
> > > +      */
> > > +     WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
> > > +     up_write(&vma->vm_lock.lock);
> > > +}
> > > +EXPORT_SYMBOL_GPL(__vma_start_write);
> >
> > Do any modules need it? If not we shouldn't export.
>
> I'm pretty sure I added it because of the allmodconfig build failure
> but let me rerun it and see which module was using it.

Yeah, when building allmodconfig without this export I get:

ERROR: modpost: "__vma_start_write" [fs/ext4/ext4.ko] undefined!
ERROR: modpost: "__vma_start_write" [fs/cramfs/cramfs.ko] undefined!
ERROR: modpost: "__vma_start_write" [fs/fuse/fuse.ko] undefined!
ERROR: modpost: "__vma_start_write" [fs/orangefs/orangefs.ko] undefined!
ERROR: modpost: "__vma_start_write" [fs/xfs/xfs.ko] undefined!
ERROR: modpost: "__vma_start_write" [fs/erofs/erofs.ko] undefined!
ERROR: modpost: "__vma_start_write" [drivers/video/fbdev/core/fb.ko] undefi=
ned!
ERROR: modpost: "__vma_start_write" [drivers/acpi/pfr_telemetry.ko] undefin=
ed!
ERROR: modpost: "__vma_start_write" [drivers/dma/idxd/idxd.ko] undefined!
ERROR: modpost: "__vma_start_write" [drivers/xen/xen-gntdev.ko] undefined!


>
> >
> > >  /*
> > >   * Lookup and lock a VMA under RCU protection. Returned VMA is guara=
nteed to be
> > >   * stable and not isolated. If the VMA is not found or is being modi=
fied the
> >
