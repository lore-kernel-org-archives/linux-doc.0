Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AE81E883E
	for <linux-doc@vger.kernel.org>; Fri, 31 Jan 2025 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343165; cv=none; b=oE04Ac3gMkFCpSVtP1B0KYgRhFVKTN/OzxQ1XWlsIoxTye1OiSnj6jeSvsrcoOloJYRKyBgvuAO4QcnXAqTA5EwCKv4va4qDpXUKSFA338NbXYtqFwbDPJZpevzDS5mTbIPnrV7TMg9bV99WLtirGnzMmsGpou5z46de8L3llLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343165; c=relaxed/simple;
	bh=eVYz0IAaPzlS9RjP5Ytk3MNZyadk1DKbSwYK1N+sVWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hn13RQiZRWUgMPRWDXwMw+PebuFzcuuU9AQO8vNWqA9YRDj8IRgxtTz+GFfD7YVuHboZtEE7JKBeN/rnmC/lAoMxcr/Bo8dFfY1sE5+qvN3IOVB8P5mDIQr72oOSG1PQdTaybXXPHR6uNkpxctCECzir0f1DaZJdlMnOU0k/QUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=XKmSuL+q; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="XKmSuL+q"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso14321495e9.1
        for <linux-doc@vger.kernel.org>; Fri, 31 Jan 2025 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738343161; x=1738947961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+G4waO4iWi5ppsP27MVzR5EHmBlY2mxPNF1CuedbFM=;
        b=XKmSuL+qms2JniBDZOBCpTcsUQ28XCqYHNEGDSOb1dwm40H4slaWxiRyys+mD4N2oT
         Olh/CVhy8RbSOVK/YTIt+ZzWaC9ZnDZTZVBkGr2bl/k38Rn9NSl01KYcQJTugnmWmodz
         NQ2jPoKa/APZ/UzFdgsWdtGEGu293+rXHsrbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738343161; x=1738947961;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+G4waO4iWi5ppsP27MVzR5EHmBlY2mxPNF1CuedbFM=;
        b=Wn3zWsBP3RKSCVsozAetG4GyWBX/IDnrzYFJ/j5OkOovTAqONFX/o6JQ5FyBZg3pID
         Qbt9erPZxqVsuKDyk9fX2AMFw2cU87+SpTmMg+42QoxxOotF2KX8UZCSZmgsk8Reyd8k
         NSWSEtQ8Afd8ED0GcJBpw+gKv4dW+NPEGm40Q/IjD408LnLqQ/3N+DIwq908WoGFO67k
         w5uKi+RaXBlqqWuCFZ+KPPoK1Xxtvpn6E/EpTROntq5zgnPwPNz+H727O4VTtfttNVPU
         XeRcRwRzWI0one0z52QfjYqnBz3cQcmKvmJgE7V2meVEWjrpmwAXBP2qsvkDZRrGvESF
         LCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJmRuwntFOGerW32y7fDxDkl8oKtRWZk+Pqp3YfHWgBlvRsqEdQp+PhfwSPHp3B9y+r6Bt2N0iad8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4rfdbVnaZzD5vVrTu8L+bwiWBXC0NEt1ZulxDbPEFKqDT7Bt
	VaP7F4XOLakJTYi8J6/DiZlCKJOqplRFtXsdR5I6++iZEEesOdsOOyVyhbrhLmo=
X-Gm-Gg: ASbGnctRoSCk7AVGnQufI6Bhttth4LPGDjX3j5y85xWI2q5/cGBsdSTRrpSPzx2ehmf
	OqyyAaW4zuJA9Sv5Be3mUo+aPo9eyG75hFKg8vxWNmAoXCfOmmIn1PxU8dR0sZ7ofEDxLNFHz7J
	yK5a5zhCQizFoXQxBRxkGgjBP+rMeU6aV+Mx+QZqQf88lWkSyCq+oZVt+Ug5B9ljdAkbIebz27y
	G+9EA4Vz08MNvgTEKfzYyR1dMLsGhgFT4rrO3Y3ejlRU+LhJi96KPhizLL3Y43QvkGLuYzh73JC
	LA/AK3tr7QB885wYFSr6bmmpuww=
X-Google-Smtp-Source: AGHT+IHqJ7SXWObwA7TE2hNt8h99Mz+Rh4lA4VBEyCv4JI/V7wPQqHQuFCcfla/1mLYWhuuiSze4/A==
X-Received: by 2002:a05:600c:83c6:b0:434:f2af:6e74 with SMTP id 5b1f17b1804b1-438e170e7b5mr73728995e9.15.1738343161267;
        Fri, 31 Jan 2025 09:06:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23e5e53sm60120095e9.17.2025.01.31.09.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:06:00 -0800 (PST)
Date: Fri, 31 Jan 2025 18:05:58 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Message-ID: <Z50C9tyZC_wQS6Ux@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
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
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-6-david@redhat.com>
 <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
 <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
 <Z5t4rrkRiOsRY2jH@phenom.ffwll.local>
 <z7s7xb2ftv5hqg3uzjqkou6enguleazwwehxbi5zulbkar2aej@zlbdh2kdewdn>
 <d552cc03-b7af-44be-bcaf-13da720a2226@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d552cc03-b7af-44be-bcaf-13da720a2226@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Fri, Jan 31, 2025 at 11:55:55AM +0100, David Hildenbrand wrote:
> On 31.01.25 00:06, Alistair Popple wrote:
> > On Thu, Jan 30, 2025 at 02:03:42PM +0100, Simona Vetter wrote:
> > > On Thu, Jan 30, 2025 at 10:58:51AM +0100, David Hildenbrand wrote:
> > > > On 30.01.25 10:51, Simona Vetter wrote:
> > > > > On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
> > > > > > Let's do it just like mprotect write-upgrade or during NUMA-hinting
> > > > > > faults on PROT_NONE PTEs: detect if the PTE can be writable by using
> > > > > > can_change_pte_writable().
> > > > > > 
> > > > > > Set the PTE only dirty if the folio is dirty: we might not
> > > > > > necessarily have a write access, and setting the PTE writable doesn't
> > > > > > require setting the PTE dirty.
> > > > > 
> > > > > Not sure whether there's much difference in practice, since a device
> > > > > exclusive access means a write, so the folio better be dirty (unless we
> > > > > aborted halfway through). But then I couldn't find the code in nouveau to
> > > > > do that, so now I'm confused.
> > > > 
> > > > That confused me as well. Requiring the PTE to be writable does not imply
> > > > that it is dirty.
> > > > 
> > > > So something must either set the PTE or the folio dirty.
> > > 
> > > Yeah I'm not finding that something.
> > > 
> > > > ( In practice, most anonymous folios are dirty most of the time ... )
> > > 
> > > And yup that's why I think it hasn't blown up yet.
> > > 
> > > > If we assume that "device-exclusive entries" are always dirty, then it
> > > > doesn't make sense to set the folio dirty when creating device-exclusive
> > > > entries. We'd always have to set the PTE dirty when restoring the exclusive
> > > > pte.
> > > 
> > > I do agree with your change, I think it's correct to put this
> > > responsibility onto drivers. It's just that nouveau seems to not be
> > > entirely correct.
> > 
> > Yeah, agree it should be a driver responsibility but also can't see how nouveau
> > is correct there either. I might see if I can get it to blow up...
> 
> (in context of the rmap walkers) The question is, how do we consider
> device-exclusive entries:
> 
> (1) dirty? Not from a CPU perspective.
> (2) referenced? Not from a CPU perspective.
> 
> If the answer is always "no" to all questions, then memory notifiers must
> handle it, because we'd be answering the question from the CPU point of
> view.
> 
> If the answer is always "yes", there is a problem: we can only make it
> clean/young by converting it to an ordinary PTE first (requiring MMU
> notifiers etc.), which makes it quite nasty.
> 
> Mixed answers are not possible, because we don't know just from staring at
> the entry.

I think it's the gpu's (or whatever is using it) responsibility to update
folio state while it has ptes pointing at memory. Whether that's
device-exclusive system memory or device-private migrated memory. Anything
else doesn't make sense to me conceptually.

And I don't think we can just blindly assume even for device-exclusive
mappings that they will be dirty when we convert them back to a real pte,
because we might have raced trying to set up the gpu mapping and restarted
before we even put the pte into place. Or maybe someone was real quick at
writing it back after the gpu already dropped it's pte.

I guess maybe some clear documentation in all these functions
(make_device_exclusive, hmm_range_fault, migration helpers) that it's the
drivers job to dirty pages correctly would help?

But nouveau definitely does not look very correct here, pretty sure on
that.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
