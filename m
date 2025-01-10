Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71563211285
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 16:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736525270; cv=none; b=l5HN6OtUJuaeasklKG+XBUkU45U2txZtBbxSo9ZEHf7riBND809iscHKI92QQOhzbBJoYHbCzIXI74qLcXkHrOxafjISHR1Gi/1uX+b3+sslEG4In5nST/AyP+knZAS2BZsvKk5MiWFkU8TveObnQX590CigF7XgQQRTU1Kd9Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736525270; c=relaxed/simple;
	bh=NKf2LPf0ciHOld1ocX8LGjDxsiohmNp0UCGHWl1dHBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ws2quEcbflSXDHVdxqy5J08pI90jSlAz1XfW7pqCEntUvwU74LTAxOd9OM5icYQoC/+megAJ5kTSdtAioFOoHngNSJvUZM3hsn+e0JhYMDS1+CRaClT46BSA3zvELVi/ARcIGXp6Kp4z5aoGiikz0/M0qWdwuLxljMSsBgUVIvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C3RMCilW; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C3RMCilW"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4678c9310afso229121cf.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 08:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736525267; x=1737130067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuoSwo768mhftGn+VFoye9hxmZUgc0ATyWlHTOv+ogE=;
        b=C3RMCilWCzUS1Qm26bvazBSfuA26U3RzxsKaDPpE3R9H3NuKksW/7xfrHN+MeuZS/h
         kbw35UCnsYrB4hxipMtJtYIF7a8lo7p2OxPP4VLbT894VgSa0uim+Ynxy5krozpd+xQG
         kUlMZQ9vRMPYU6FmrtlAAMrJZa18wzdxTEhSANP8M/2cGQH6+++bWn4GV+zBxhz8SdUk
         AkfplaODTHrLdFJaufuYvyupOWHnJmJAn5fbi4/8kdv4KlNqvexiDd4y3TVDF47EKg1Z
         YeBvvWuY1duMKWXwHncYVQccdEGYbR0MuCyGRVVl2WBk9/lZi2ExRizQ5G5GHawnBaES
         6eaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736525267; x=1737130067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuoSwo768mhftGn+VFoye9hxmZUgc0ATyWlHTOv+ogE=;
        b=FVS/51St4Xob7gKJ2P9nuc0uDCVfabl9NCMUUBkEQF9jTxlDu48TnTBouKSSjmu6B5
         wqKeo3H3M4Bm3YcyY/24IcB35jvbiYQ+W1PAVFonw0DW4fRTlXmAzc+gvlBtaZUURIo5
         Y4eaEvUPTM6aftzr8/EcAogM4OoSluzvAyHhg3xt7aFN4w5GJtui7yTULqcHicPb9QvW
         TuOJYKzCpIeOsu2CWL908tiyXY/xhl+GWEKF8nYWBAgpgK3Mf4ZkwAQFnNbVKABCbUZs
         RUCnOGIiJD88mKzzOR6GxnpLeB0bSeaF5e3Lvu+I3C4TbdW1Yv5F72tgOUzdWO4XT7+0
         g4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX+nKGuoY/jqcsiOV2vIqckpjkvAGaNu7+xOBk8WSknJlu4AvmNefsU7HyQW/H6cCCkZyCsCYdeKEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDic7S2V3S+tllN/9QEGviKSuJRidaCxSbjBqUKmssNcPeMeGi
	1xjU951skvwTzS/eEqiS8QJs3bE8TOXZmxKxts1Fj3qcDK0Oa+a3USrG2AN7Dp9htb8/s6L0YSQ
	HwCZjZudrCiTuAnMzL5qCKq5jVnxGbTOb2BAh
X-Gm-Gg: ASbGncsdGOzwAes28s2pIMutO3h8SKZ6Trnn0V9lknm58zDs2UIC+C4+e7UdvTEDd2W
	xsl1lT/HjZG9uXycaWjeY/suZsTtpHRY3wcrxZA==
X-Google-Smtp-Source: AGHT+IHyV4k57UNejKjA2zCtXjcsUG+QSokEacjoANRn6PhX8p2751CgLfYsK6JB8hsH48QMqMho8xCXtXiibZlXmAI=
X-Received: by 2002:ac8:5f0b:0:b0:467:84a1:df08 with SMTP id
 d75a77b69052e-46c89df3ccamr2973981cf.23.1736525267100; Fri, 10 Jan 2025
 08:07:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <20250109023025.2242447-16-surenb@google.com>
 <41ebce1a-9cc0-471e-ac20-25efea9a933a@suse.cz>
In-Reply-To: <41ebce1a-9cc0-471e-ac20-25efea9a933a@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 08:07:36 -0800
X-Gm-Features: AbW1kvbgpZuPEdva_E5IThJS2jJBJJsAW198oHHkkeTkV2QlMmxg9161lihYxSk
Message-ID: <CAJuCfpFhphgecjyWFv6fPmx_3+3wDF9wtDHxZS3tohiEAMLuag@mail.gmail.com>
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

On Fri, Jan 10, 2025 at 7:31=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
> > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> > object reuse before RCU grace period is over will be detected by
> > lock_vma_under_rcu().
> > Current checks are sufficient as long as vma is detached before it is
> > freed. The only place this is not currently happening is in exit_mmap()=
.
> > Add the missing vma_mark_detached() in exit_mmap().
> > Another issue which might trick lock_vma_under_rcu() during vma reuse
> > is vm_area_dup(), which copies the entire content of the vma into a new
> > one, overriding new vma's vm_refcnt and temporarily making it appear as
> > attached. This might trick a racing lock_vma_under_rcu() to operate on
> > a reused vma if it found the vma before it got reused. To prevent this
> > situation, we should ensure that vm_refcnt stays at detached state (0)
> > when it is copied and advances to attached state only after it is added
> > into the vma tree. Introduce vma_copy() which preserves new vma's
> > vm_refcnt and use it in vm_area_dup(). Since all vmas are in detached
> > state with no current readers when they are freed, lock_vma_under_rcu()
> > will not be able to take vm_refcnt after vma got detached even if vma
> > is reused.
> > Finally, make vm_area_cachep SLAB_TYPESAFE_BY_RCU. This will facilitate
> > vm_area_struct reuse and will minimize the number of call_rcu() calls.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
> You could also drop the reset_refcnt parameter of vma_lock_init() now,
> as the usage in vm_area_dup() should now be just setting 0 over 0. Maybe
> a VM_WARN_ON if it's not 0 already?

Yeah, that's a good idea. Will do.

> And a comment in vm_area_struct definition to consider vma_copy() when
> adding any new field?

Sure, will add.

>
> > +     /*
> > +      * src->shared.rb may be modified concurrently, but the clone
> > +      * will be reinitialized.
> > +      */
> > +     data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shared=
)));
>
> The comment makes it sound as if we didn't need to do it at all? But I
> didn't verify. If we do need it in some cases (i.e. the just allocated
> vma might have garbage from previous lifetime, but src is well defined
> and it's a case where it's not reinitialized afterwards) maybe the
> comment should say? Or if it's either reinitialized later or zeroes at
> src, we could memset() the zeroes instead of memcpying them, etc.

I see vm_area_dup() being used in dup_mmap() and I think this comment
is about this usage in case the src vma changes from under us.
However, vm_area_dup() is also used when we simply duplicate an
existing vma while holding an mmap_write_lock, like in __split_vma().
In these cases there is no possibility of a race and copied value
should hold. Maybe I should amend this comment like this:

/*
 * src->shared.rb may be modified concurrently when called from dup_mmap(),
 * but the clone will reinitialize it.
 */

WDYT?

>
>
