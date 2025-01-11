Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BEC4689
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 03:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736566680; cv=none; b=vAl9e5sRK6H5FmFwFo17XHG9p3YYFawK0X6OC3FtMXCnf2pTOOs3eq8L48uN/23i20zDTGogO3XUUcO7UBMe/IJndSRs73CmMfYUducAwKxozI59LJOuGBbt50/h1NAz52tvaUFxU5ejyFsVCl4nrUOLmSueGl2dLlWZw1iSV3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736566680; c=relaxed/simple;
	bh=q3e1ohHCGIcm/4fFsVCiNWTjyUfMCEgZCeu3q2/wIVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZZ60kbZdUgI3J3H/1sdxF2JyG7Fn2ZFnuqeNrMH9s7U3xlm/JaF+8KDp7acMOTlUYAGeHQ0cm/5/pvnxRd4l3Rbq35LE27E55R6LeaY95xWs9tk8cuXS0E6Z321r3u54tYF5nnUg6sIxTN4j8swvTu0YlVQ4MuSMPLjJQpESFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZQ3/rpZa; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZQ3/rpZa"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4678c9310afso105801cf.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 19:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736566677; x=1737171477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjCNJifdnaYvSi1H/hMETBLfTiB5LfDbMbI0O7SYEXw=;
        b=ZQ3/rpZacgauqr7kWYlVysmW5VBB+n40h/n4SjKvHD+HTX3hB6FerIeAb1nRaE9fEN
         5eBH/MldVudf+QJuI0BrBj6yrH06kZGAdk8LWQwNgbWRTxkCg+nJ1Gosc7WJ57oZlWjc
         QRl1+u8qUGtRQS2hEnWDDDE2CBAvJ/U2sy8VVEUniwJY7PZMqJ7mGZediaIeDiBIyVft
         q2iyBf2FuxLLksxbPHyz9Odz/R0GoTEE3jReiqKaExOHIyOAMzQsAo9y2ZBpghFR0kMF
         X7wc+6EKnZWDwyEuVB9+i9XW7pw5FuYriI53KQSDYJCzjLE0yAjxvs48fNJTTcLZynYU
         ty8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736566677; x=1737171477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjCNJifdnaYvSi1H/hMETBLfTiB5LfDbMbI0O7SYEXw=;
        b=fZneluHj0ainlviaDoQ3n0OvHQtiREJG6DKs10nKOaCqmNaFelGbJEyyeXlEaG9rhc
         70FK3r/q/HqiCVT+EnoxodwqW3+p44ksy1DlmpMFajsHOn6/36VX8LBiasLTeWE1qqWp
         I3REvdwbx0TDVOTKOOOmElGSPJoIu3hb8SORqBszjYi9RwXQ7Oa2yrxiZpUd38505yWy
         4rOm5XOpm+kiqRuSnOhRmospJn9JImrXTTMzI3PLdMOgUreOqmZvrZ/7xlBOMfRWQooO
         v1HIRgCHe3KJQeZdrO9Xn7rYmpQ4W6F1R4u2Ny0+KXxXToJCUs28xAiT1lfYFY8jF7JP
         3AfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPvqifF+PojsjlDcd4IsrNb0TsVZjT8e/1WTUFMDRwQDdgnRkkeRYbp3Pwps+BLEjxs4AHdmFpUBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjwma/ziNlxyIg9HsUhtDWW2MPCWH/1dKx00x/sDH6tCUsfHK8
	Q+y1OoIQHmyvz9RE77pBjS/lhJgf118t0aFRmNRQ2VWca9JunEsLPC6uOyCuUDhB7eMeP1bB4Ut
	YGPfNAxx57gKRoFhL1ZW07dDQeohWhWDNM9gv
X-Gm-Gg: ASbGncupznOO7SvcpHgqpCsRkNsVu1gLxouSYxe1yu8hpjHnTQYSBwNNjrYrr5puVfy
	7ZVY1n6j89yhzJ3r6X10XJEZkzvnmZNeodUbV66AoZaT6izQRCAB1/a4GRBVVt582x0vi
X-Google-Smtp-Source: AGHT+IGLyqgJQvquEkjx2CpcGrG6fCsPbHEiuikqAXFIL/tAAzxHeh2iJ8qWzA3jd+rl4Cj1/HNIGhOyQa4PVfwnuQM=
X-Received: by 2002:ac8:5dcb:0:b0:460:463d:78dd with SMTP id
 d75a77b69052e-46c87e0774bmr6072891cf.4.1736566677375; Fri, 10 Jan 2025
 19:37:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <20250109023025.2242447-16-surenb@google.com>
 <41ebce1a-9cc0-471e-ac20-25efea9a933a@suse.cz> <CAJuCfpFhphgecjyWFv6fPmx_3+3wDF9wtDHxZS3tohiEAMLuag@mail.gmail.com>
In-Reply-To: <CAJuCfpFhphgecjyWFv6fPmx_3+3wDF9wtDHxZS3tohiEAMLuag@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 19:37:46 -0800
X-Gm-Features: AbW1kvYfbkvGmBZBVy4z_mtv76DnzMFiEmUC36kvKBERuiI_7frFWhcsZc7ZwvA
Message-ID: <CAJuCfpGLjZxXBDF0KECn4UWpvg4sitPkRtZdgN3cdhXjDEGr=w@mail.gmail.com>
Subject: Re: [PATCH v8 15/16] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 8:07=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Fri, Jan 10, 2025 at 7:31=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> =
wrote:
> >
> > On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
> > > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> > > object reuse before RCU grace period is over will be detected by
> > > lock_vma_under_rcu().
> > > Current checks are sufficient as long as vma is detached before it is
> > > freed. The only place this is not currently happening is in exit_mmap=
().
> > > Add the missing vma_mark_detached() in exit_mmap().
> > > Another issue which might trick lock_vma_under_rcu() during vma reuse
> > > is vm_area_dup(), which copies the entire content of the vma into a n=
ew
> > > one, overriding new vma's vm_refcnt and temporarily making it appear =
as
> > > attached. This might trick a racing lock_vma_under_rcu() to operate o=
n
> > > a reused vma if it found the vma before it got reused. To prevent thi=
s
> > > situation, we should ensure that vm_refcnt stays at detached state (0=
)
> > > when it is copied and advances to attached state only after it is add=
ed
> > > into the vma tree. Introduce vma_copy() which preserves new vma's
> > > vm_refcnt and use it in vm_area_dup(). Since all vmas are in detached
> > > state with no current readers when they are freed, lock_vma_under_rcu=
()
> > > will not be able to take vm_refcnt after vma got detached even if vma
> > > is reused.
> > > Finally, make vm_area_cachep SLAB_TYPESAFE_BY_RCU. This will facilita=
te
> > > vm_area_struct reuse and will minimize the number of call_rcu() calls=
.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >
> > Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> >
> > You could also drop the reset_refcnt parameter of vma_lock_init() now,
> > as the usage in vm_area_dup() should now be just setting 0 over 0. Mayb=
e
> > a VM_WARN_ON if it's not 0 already?
>
> Yeah, that's a good idea. Will do.

Ugh, once I made this change, the newly added VM_WARN_ON() immediately
triggered because vm_area_dup() does not memset(0) the entire vma and
kmem_cache_alloc(vm_area_cachep) does not always return a reused vma.
I could add a vm_area_cachep constructor to always initialize
vm_refcnt to 0 but that would lead to more changes. I think I'll keep
reset_refcnt for now and will add vm_area_cachep constructor as a
follow-up optimization after this patchset is merged.

>
> > And a comment in vm_area_struct definition to consider vma_copy() when
> > adding any new field?
>
> Sure, will add.
>
> >
> > > +     /*
> > > +      * src->shared.rb may be modified concurrently, but the clone
> > > +      * will be reinitialized.
> > > +      */
> > > +     data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shar=
ed)));
> >
> > The comment makes it sound as if we didn't need to do it at all? But I
> > didn't verify. If we do need it in some cases (i.e. the just allocated
> > vma might have garbage from previous lifetime, but src is well defined
> > and it's a case where it's not reinitialized afterwards) maybe the
> > comment should say? Or if it's either reinitialized later or zeroes at
> > src, we could memset() the zeroes instead of memcpying them, etc.
>
> I see vm_area_dup() being used in dup_mmap() and I think this comment
> is about this usage in case the src vma changes from under us.
> However, vm_area_dup() is also used when we simply duplicate an
> existing vma while holding an mmap_write_lock, like in __split_vma().
> In these cases there is no possibility of a race and copied value
> should hold. Maybe I should amend this comment like this:
>
> /*
>  * src->shared.rb may be modified concurrently when called from dup_mmap(=
),
>  * but the clone will reinitialize it.
>  */
>
> WDYT?
>
> >
> >
