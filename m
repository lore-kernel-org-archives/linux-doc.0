Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2457C226546
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624878; cv=none; b=PlaHbsFF2vwqdf5l8xWrT7NfHxK8O+WnIF1LKHe751sYX4KSeFdvn3qx2Mta3K4vQPHuSF0e61xTIQdkKklYrw/tu0By7LNT9zg4lW6QXRQyMeykWP+3C7vHm+01p0JRcIgqKDPvBQm/YBTUVkIdGT11MyFTgLNJuQ/ba71mTpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624878; c=relaxed/simple;
	bh=U0m6c8ag4xJMgmbdK4ZoBpye7EtL3A7nYCII/1GafRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCe96ReOQ0JjvUBPxpsbuOL6mALgE9dvvobUclmf4kTGeWnapt70bYt1cvGxlC/4ZezhD94pQjBseMJ/f3Uy0J3DCSig0RupXiKw6eB0WxSlzWWolfN+gI517fTVQAmFU81SLxRi+caORSMZlqdYkEiLDAZTfbrxUV3H8IGpZTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=inI3TG88; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="inI3TG88"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467abce2ef9so319411cf.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 08:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734624876; x=1735229676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiO9T20KQAI3oLUsq4Umbe63MieYhptlGuTuM8WkdOM=;
        b=inI3TG88fYew9xh/gCiBrKG/9nZEkXzYJ/ccxObz4G5+bLo9g7cToe66PpkeOHDwrK
         DUfz8CndaNM3tRK4+yyB2WLrB9jFZqrELnX5koZ5HDTefuMxGQ49ekcfLX7pgYRqCDvn
         UUwch/JFbz71yegr613ro2haD9X1q6qcPVI/enol0jv0ElGjBEitFiyi4sEBBv44iiE4
         CcJLw7yH4VKac7S3Pz/qyQoqsU8zPPjfEYo6ds6h5AqOBl0WlPmDGKfbe8/ajtAHOIrr
         I7PlzwcZYwqPOo/Hku/WU7MqxIKeEqA61JxWhcH8/Vngaf0IN6GGSH7tvlTUXTiB1Gvn
         y5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734624876; x=1735229676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiO9T20KQAI3oLUsq4Umbe63MieYhptlGuTuM8WkdOM=;
        b=tsw/NaCo0WJkroLkJ8XXHuP5aft72Cee6BxsoeLlcT5/dktWP5luIpe/WF+zuQ+TBx
         6d4nJs4UTFU1J2BC14EofPUdNDhRdV40U/v44+7NYb1VhTlOlD4f+bfGlLE/93bg8SbF
         6SdRV8jnYm1q8ntfcXiqvxlVj+ckI/3D7UdpXZd5K9WRB9jj5ctsh/bHCuqwlJMweF2U
         f1qhPsSFx7j/UN6R5L3E2e1YB6FniQ+gQoT+fsokK246hn2XWxjC9PrqVqUuUKSro8rY
         WZvFJ4XyfooxHJhZBOC/3QvGx1zAYPuMQrO/V2nv22c2trzJiNSKGHEKpBpgRY6L0aB0
         2OHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyrBJqiIL5fRgDIMpTLkU9Bg29Y9VgqNGFMtuvB7pcxfT7YlyLDKd449sSlXTmQiZfal1Sl0WZBVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ5ViEfo7WQQTIPmMD9jhb4WoPUPUi9FTzhdOZR3lw2JysHgJH
	UnOah6mr/jq37iWw9wdgg2QxIG45xgWhJhITAjXjilABjFPEsQ+w12ZsW5ULfl/WxeNbFIhE8eR
	uPnbEFuWAOvjytBgdOz4Yr2+STx1oIHPZkLW9
X-Gm-Gg: ASbGncshfP/Zu+Hdv8F4J7Zm1w+MTXUErOuhyez/i0fV3LHFQoUdRTHDRB/cOL+Iy+2
	VEqked1EaFrUPTjktUrTwl/z7WTeeEz1LXSnS5A==
X-Google-Smtp-Source: AGHT+IEsMRlH6v6Lz/in+BfakjEnu5qz3Akw3EqKVImVcmfzugXt6fQ734q4f8TcVBrh0DnHRYCrLtDIxLKhu7sX2rU=
X-Received: by 2002:ac8:5f87:0:b0:466:97d6:b245 with SMTP id
 d75a77b69052e-46a3ba6786dmr4014381cf.22.1734624875665; Thu, 19 Dec 2024
 08:14:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net> <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
 <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com> <20241219091334.GC26551@noisy.programming.kicks-ass.net>
In-Reply-To: <20241219091334.GC26551@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 19 Dec 2024 08:14:24 -0800
Message-ID: <CAJuCfpFSJLhkv4o6ZKQKDWKsg2OKYa9kwRLERJkF=B+nzoujCQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org, willy@infradead.org, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
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

On Thu, Dec 19, 2024 at 1:13=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Dec 18, 2024 at 01:53:17PM -0800, Suren Baghdasaryan wrote:
>
> > Ah, ok I see now. I completely misunderstood what for_each_vma_range()
> > was doing.
> >
> > Then I think vma_start_write() should remain inside
> > vms_gather_munmap_vmas() and all vmas in mas_detach should be
>
> No, it must not. You really are not modifying anything yet (except the
> split, which we've already noted mark write themselves).
>
> > write-locked, even the ones we are not modifying. Otherwise what would
> > prevent the race I mentioned before?
> >
> > __mmap_region
> >     __mmap_prepare
> >         vms_gather_munmap_vmas // adds vmas to be unmapped into mas_det=
ach,
> >                                                       // some locked
> > by __split_vma(), some not locked
> >
> >                                      lock_vma_under_rcu()
> >                                          vma =3D mas_walk // finds
> > unlocked vma also in mas_detach
> >                                          vma_start_read(vma) //
> > succeeds since vma is not locked
> >                                          // vma->detached, vm_start,
> > vm_end checks pass
> >                                      // vma is successfully read-locked
> >
> >        vms_clean_up_area(mas_detach)
> >             vms_clear_ptes
> >                                      // steps on a cleared PTE
>
> So here we have the added complexity that the vma is not unhooked at
> all. Is there anything that would prevent a concurrent gup_fast() from
> doing the same -- touch a cleared PTE?
>
> AFAICT two threads, one doing overlapping mmap() and the other doing
> gup_fast() can result in exactly this scenario.
>
> If we don't care about the GUP case, when I'm thinking we should not
> care about the lockless RCU case either.
>
> >     __mmap_new_vma
> >         vma_set_range // installs new vma in the range
> >     __mmap_complete
> >         vms_complete_munmap_vmas // vmas are write-locked and detached
> > but it's too late
>
> But at this point that old vma really is unhooked, and the
> vma_write_start() here will ensure readers are gone and it will clear
> PTEs *again*.

So, to summarize, you want vma_start_write() and vma_mark_detached()
to be done when we are removing the vma from the tree, right?
Something like:

vma_start_write()
vma_iter_store()
vma_mark_detached()

And the race I described is not a real problem since the vma is still
in the tree, so gup_fast() does exactly that and will simply reinstall
the ptes.

>
>
