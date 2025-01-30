Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9331BBBFD
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 16:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738253437; cv=none; b=VhF3gqafk5bJsTKH5SNUPFFf8s11K3SofMbKYy4LSDWwDh2KpRKfzWuP6RXKWncRBGnWCmlW2pDGySQkVFufUZflTD8H8MCM+fDYVdAK7ojB1b1u8aiUXnYGD4vEbsD8bQCesAKTtbKNszgrVAW1LvtOy5m0rbwXkyDzjK7kXz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738253437; c=relaxed/simple;
	bh=zj4foHOwFAp2Jv/OUb3q8yJEBOkNJirbcL33sYXTw1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5PAIMKAW38b2+pRFN5CFYs84QhFq9PaDzJB+2ulEMGpohOusDyW9oZdf048SXcPk5YeYRBmNQMKx/nlw477EjuY1cKfweYSaLXEKIO0CE3pszTGlQRvcqsH61qV6l+YFTNyq+5bu1KlRkZylNbPGJg63g5KKseXeFhCf9s1rSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=VCCQ5q63; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="VCCQ5q63"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436281c8a38so7472615e9.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 08:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738253433; x=1738858233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aR4Ll0dxJFmtTXN5GjVVUyw5AIaU7JwbYHSEFoNZYE=;
        b=VCCQ5q63kCkLkKzqHEMJGxubEdNxCEq8p1PNvaPJ3NsBnV5XTcgDZ3OzfNG1SNZ5ct
         1m9E1xB52Hx/iI7qO5o2XKIvP4jSb4WXk/RdMabZzGMPMxvox6XFy0lEptZzeuwFS6W9
         HvhE/0J8ngOzx0kpZoCoT1mproL0pGz302OwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738253433; x=1738858233;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+aR4Ll0dxJFmtTXN5GjVVUyw5AIaU7JwbYHSEFoNZYE=;
        b=ccEwz2vwQymKfe3x6YEaIAdo+wNcLW1+Pxiz+p8OjXWJNGaxD4iZtjKOPmPLl2QBjY
         6eTdW+IB23hAa+Byomap4pnvokG6MAzyfCrX/2UdZ39n6mnnlXXsK0+15gXZrB7jtLgV
         DttyIBFICbemmE6SX6yjSUh+axG212gORsxN7BHkJ0FQ2rrqwxsInnZDhxdapU8tZaS8
         qckyy0bBUW4DR1IHYGH3fK5mNUFLgkHTKoQXIB/LNWIlH/pWJHbsITO/4HvA6LteJ36L
         +g0nRGd+/P4yM/fos/yfSJRATNoTG4mbbo2Yv5c5ZPXwER4tknh2xoUt3QYadi5mg7Cd
         kTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSkKEdamtNQwgmc2AFzq/6FkH6Qbga/amsstDjWwFMxVTDkeyBEBoO1ALQVZjVdQTM8XrRhc8+m2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp+dlEZmd84p50TVZDB4Se+V1h6PBnovs6n+e0qhBfnW0qEl6w
	Q7wM+AWml+U5jhauQJ8DEBqe2SHMTwuqGhYH5fShfm2Reh6teBeJhJenMw16Bo0=
X-Gm-Gg: ASbGnct/kVtxTT5yBgknRYqp0CFkXiCHjA08UHfPtW92/VYK4WgjCCldNg5pPeet8Ew
	TqLSZBiPHUG67QqBxRSxMSfkLqo+ldcXeeb5/IYyUGHK3hFacaaF6gUPMgJtrfDDyFDzq4gvGhu
	TW0aSWUifpLJcMrX2z2/wBhGT2e4lYypTV+8yetMwMdvy/sL+cHbxMSkvo+L+CCaaBtTOarNy34
	DNEtfgHjIJV4FHiiBmy82AigL/ccIF+5YudiB0/bs3KOpH6mu/p+o1APwjU5e0/q6u73S7hufYD
	zp2GeljRWN1C7SPXM4P9Y45ObkA=
X-Google-Smtp-Source: AGHT+IHVd4DfU6AaL1PQgWpWv09mvfBE8UJUdITJOwxWpPybeOC1smy7UyEu+/Ad7rIxi3xBtlBrvg==
X-Received: by 2002:a05:600c:5486:b0:433:c76d:d57e with SMTP id 5b1f17b1804b1-438dc3a40d3mr81383795e9.5.1738253432989;
        Thu, 30 Jan 2025 08:10:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc1315esm62266005e9.6.2025.01.30.08.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:10:32 -0800 (PST)
Date: Thu, 30 Jan 2025 17:10:30 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
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
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v1 08/12] mm/rmap: handle device-exclusive entries
 correctly in try_to_unmap_one()
Message-ID: <Z5ukdq6LG2dQKaPU@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
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
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-9-david@redhat.com>
 <Z5tQL60SNNGCkfQR@phenom.ffwll.local>
 <59feb709-dadc-4d19-857e-49320cca3d98@redhat.com>
 <Z5t5RKFwl34vpqU4@phenom.ffwll.local>
 <20250130140832.GM5556@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130140832.GM5556@nvidia.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 10:08:32AM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 30, 2025 at 02:06:12PM +0100, Simona Vetter wrote:
> > On Thu, Jan 30, 2025 at 12:08:42PM +0100, David Hildenbrand wrote:
> > > On 30.01.25 11:10, Simona Vetter wrote:
> > > > On Wed, Jan 29, 2025 at 12:54:06PM +0100, David Hildenbrand wrote:
> > > > > Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
> > > > > we can return with a device-exclusive entry from page_vma_mapped_walk().
> > > > > 
> > > > > try_to_unmap_one() is not prepared for that, so teach it about these
> > > > > non-present nonswap PTEs.
> > > > > 
> > > > > Before that, could we also have triggered this case with device-private
> > > > > entries? Unlikely.
> > > > 
> > > > Just quick comment on this, I'm still pondering all the other aspects.
> > > > 
> > > > device-private memory is entirely owned by the driver, the core mm isn't
> > > > supposed to touch these beyond migrating it back to system memory in
> > > > do_swap_page. Plus using rmap when the driver asks for invalidating
> > > > mappings as needed.
> > > > 
> > > > So no lru, thp, migration or anything initiated by core mm should ever
> > > > happen on these device private pages. If it does, it'd be a bug.
> > > 
> > > I was not 100% sure about HWPoison handling, that's why I added that
> > > comment. In other regards I agree: reclaim etc. does not apply.
> > 
> > So maybe I'm just entirely lost, but unless you have a coherent
> > interconnect I don't think hwpoisin should get involved with device
> > private memory? And for a coherent interconnect it's just device memory,
> > which isn't treated very special.
> 
> I'm not sure it is meaningful, but in principle a driver could keep
> track of the poisoned private memory using that struct page
> bit. Perhaps in that sense it is more of a driver private flag than
> something the core MM would touch.
> 
> If you have a coherent interconnect then you should not be using
> device private.

Yes on both, that's what I meant.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
