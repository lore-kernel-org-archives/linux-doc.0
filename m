Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A4D1BC07A
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738233811; cv=none; b=OT5fplWo9ZfgE4jje3+jHoRs61TrS33e2F6L6WlHQq3HbqSlnecuCGnce0BD9LqfERoGxWSFB6l8xPuMNEp/3Kw9wPMm0npkX3aVMXNhQwwEDRCFA0aq7y5gIN7AEayouXVcUi3iEZLaLFXyc6lNBCmDq2YHwJfMkQIu9KhovfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738233811; c=relaxed/simple;
	bh=g2bAZawSISwgzIjiOuElMEK0L/Ot0Slp1ZngGvSlIYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AS199zdNKHTDj7g6wEsefgT8MbihgUeaEN/HAYx77aJIsdWSK3n314auDdjIo87JQKHa+aDTS1xn+Q8/1aaZNxu1ds1BcZQaRlry1hluTem0JHPalxlNZ18oMmYOJJx4c/CcTIXyItVFgGwRxn2kCnyXDpl8AYYSgBN2w860PU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=DaU4I1WM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="DaU4I1WM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso4154005e9.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 02:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738233808; x=1738838608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8o779/JKhHVNvMt9ae+MuGgQ6geVG8dZfqUZQIwBdU=;
        b=DaU4I1WMMbRbhWMPw9qH/9i6BlZeCjIOGvLsd2AUAwzcxOCOjkYV+Jyi/WP+KZFXa6
         VNArTQSTSkKuWc2aQKZkyYDumrFMCbyXn0jGBG5lrHxPWvG4eVmK7dN+1eCwBAgJSCXc
         dQWWsrXwjqjgw1yGmzcPqxVxNyryruVZDkTxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738233808; x=1738838608;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8o779/JKhHVNvMt9ae+MuGgQ6geVG8dZfqUZQIwBdU=;
        b=jTovPh0HsVwxjIGBC4BLxdyyKHtYFSTRqomfDMzu0yzRXIyn9an/veO4kfBIIOSI0Z
         Ahy9sbOJMmZLz8wT1sd64u37qwcGhpve5xFDVr9gqpF4Vx0hlrHa1faJxYR3c8/I2tU/
         r9gQat78uolHspEVHJStaXBnpyrgTgM144JNO98rpMiqcQ4M23xsGDBp4rRXzIF/whPR
         BGWVSk0fDQ1NQ684IvLD1+leCtcc34jllaZsIS5CT8kTvsBsXD8o3R/9vPgeb1Hi3zT8
         CDtf0qlepNcYCT0Xo7U0mM6J9+zloNT+sVHjm/E0urD92eOynDwp31Rt6pgQpa8uu1c8
         Qgyg==
X-Forwarded-Encrypted: i=1; AJvYcCX8WL8b5+8F6SwnmmOnLHtkZo5GssYfy9weNPa40e+QUKK5I6avh2U5LKwEj07PA+PkhS4e0gvOsMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRolRh6MwVRAuc0XiEQgswcGpZbzyyJs5gc2vI5t+Wku9RiTIw
	nnPOhD3Y/Kj3RUkMr8qgd6In9UlpmouzfdyELAmm0eUR5OM5fPp9SIb21NS6cy0=
X-Gm-Gg: ASbGncuRB8rM1G4ckPM9oOBcGzYhIWHtaCr+uat0y9+JU913MwDgk0tO+SlfCCOCAX2
	Mo5BexCTUnyw5On3lLXTrszzdBzMqIlgQ9zTXcGVjRx29YekRUy8CXDvB1ZJIdq5xx29r1lxdH5
	xeQsvxwdS/st//5mNyi+AkBd6ZDiYYhTXMmoVWj8GEnewERZIHEMhwmGWVerqTsMyTiDyZH5W+t
	EVdYJBROtFdSMx9g3j01QQnltQfOybarGyRAlfjH4JYNcY/6W/kNbIRIUjchYI3o0De9w48Gxaz
	AQZq8eplEO/7Xt0XJ3ypWLiJ+SM=
X-Google-Smtp-Source: AGHT+IHoUvHshAGTRaYOTGv2HbproKUGTWM5vAaGbhLqj8z8OheIfWyoMmWPJMekjx89GDC8VcDxDQ==
X-Received: by 2002:a05:600c:c87:b0:434:f1e9:afb3 with SMTP id 5b1f17b1804b1-438e0d879fdmr29012205e9.3.1738233808211;
        Thu, 30 Jan 2025 02:43:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b579dsm1584246f8f.78.2025.01.30.02.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 02:43:27 -0800 (PST)
Date: Thu, 30 Jan 2025 11:43:25 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
Message-ID: <Z5tXzV0vcKJg_wuM@phenom.ffwll.local>
Mail-Followup-To: Alistair Popple <apopple@nvidia.com>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-5-david@redhat.com>
 <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 11:27:37AM +1100, Alistair Popple wrote:
> On Wed, Jan 29, 2025 at 12:58:02PM +0100, David Hildenbrand wrote:
> > Let's document how this function is to be used, and why the requirement
> > for the folio lock might maybe be dropped in the future.
> 
> Sorry, only just catching up on your other thread. The folio lock was to ensure
> the GPU got a chance to make forward progress by mapping the page. Without it
> the CPU could immediately invalidate the entry before the GPU had a chance to
> retry the fault.
> 
> Obviously performance wise having such thrashing is terrible, so should
> really be avoided by userspace, but the lock at least allowed such programs
> to complete.

Imo this is not a legit use-case. If userspace concurrently (instead of
clearly alternating) uses the same 4k page for gpu atomics and on the cpu,
it just gets to keep the fallout.

Plus there's no guarantee that we hold the folio_lock long enough for the
gpu to actually complete the atomic, so this isn't even really helping
with forward progress even if this somehow would be a legit usecase.

But this is also why thp is potentially an issue, because if thp
constantly creates pmd entries that potentially causes false sharing and
we do have thrashing that shouldn't happen.
-Sima

> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >  mm/memory.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 46956994aaff..caaae8df11a9 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -718,6 +718,31 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
> >  }
> >  #endif
> >  
> > +/**
> > + * restore_exclusive_pte - Restore a device-exclusive entry
> > + * @vma: VMA covering @address
> > + * @folio: the mapped folio
> > + * @page: the mapped folio page
> > + * @address: the virtual address
> > + * @ptep: PTE pointer into the locked page table mapping the folio page
> > + * @orig_pte: PTE value at @ptep
> > + *
> > + * Restore a device-exclusive non-swap entry to an ordinary present PTE.
> > + *
> > + * The folio and the page table must be locked, and MMU notifiers must have
> > + * been called to invalidate any (exclusive) device mappings. In case of
> > + * fork(), MMU_NOTIFY_PROTECTION_PAGE is triggered, and in case of a page
> > + * fault MMU_NOTIFY_EXCLUSIVE is triggered.
> > + *
> > + * Locking the folio makes sure that anybody who just converted the PTE to
> > + * a device-private entry can map it into the device, before unlocking it; so
> > + * the folio lock prevents concurrent conversion to device-exclusive.
> 
> I don't quite follow this - a concurrent conversion would already fail
> because the GUP in make_device_exclusive_range() would most likely cause
> an unexpected reference during the migration. And if a migration entry
> has already been installed for the device private PTE conversion then
> make_device_exclusive_range() will skip it as a non-present entry anyway.
> 
> However s/device-private/device-exclusive/ makes sense - the intent was to allow
> the device to map it before a call to restore_exclusive_pte() (ie. a CPU fault)
> could convert it back to a normal PTE.
> 
> > + * TODO: the folio lock does not protect against all cases of concurrent
> > + * page table modifications (e.g., MADV_DONTNEED, mprotect), so device drivers
> > + * must already use MMU notifiers to sync against any concurrent changes
> 
> Right. It's expected drivers are using MMU notifiers to keep page tables in
> sync, same as for hmm_range_fault().
> 
> > + * Maybe the requirement for the folio lock can be dropped in the future.
> > + */
> >  static void restore_exclusive_pte(struct vm_area_struct *vma,
> >  		struct folio *folio, struct page *page, unsigned long address,
> >  		pte_t *ptep, pte_t orig_pte)
> > -- 
> > 2.48.1
> > 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
