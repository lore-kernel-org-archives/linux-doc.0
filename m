Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A527483
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 13:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738242379; cv=none; b=oyvDigfTCdg95crcWv6UYZ6pn+fhP0AcZeiOuTZoGXczWMGM7Q+/MDNpbhFo9mI0HQ6I11tuEuE5eowh8lFsmkujStUD44+BxZ0QvCPyPs9QNyGsDECO8oldw3x+ma6XZ1mITTEXarBiLZvNSXowfM0LVPseYCsTgouHfOPSxlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738242379; c=relaxed/simple;
	bh=Kj+RR/b0EkCekDDyYB/w6N9qVcR2qGeppMtsTs0nfR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCgsw3uFlgd6R3GRyCss0uKVD8/VzqtW3xsefzpJAPl3nwpseD3CGQKXZtSnMztn641qB5YJE6re9HnS7gIWOufSmD/fDEG+3T1tJbNdUTVxf9Ylae6T1prLZYirjq0P9HzTw0oal6f0Q8Ul1drGBoU4rtUufYEUPTiF7VUYqIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=aS8Az4lZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="aS8Az4lZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43621d27adeso5196915e9.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 05:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738242377; x=1738847177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMLrHVPMGtCZMZmW7MbuXycbMRtIlRW9hXfQuZWmFaE=;
        b=aS8Az4lZ45a4FaeOo17uzAqae1YSGaG9UPwbaN+5YIsNMcH4P5kQpBNAk5lYRBscNZ
         nv0gqLwlE8V4G4CL7bUTUepYpZIxAmoU7iHtlQ7CKr0vUB275DQ3kBsJCOIXm+cXgEhe
         irLn99rk/SxIpkr0187fbDemzMMCa2vX2Tsyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738242377; x=1738847177;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BMLrHVPMGtCZMZmW7MbuXycbMRtIlRW9hXfQuZWmFaE=;
        b=ZoGhH4eiKiS4Ihjv2BScpwDj+U4wbLHFnz2O1j4brwwonDnKvx28GH+Aw152WflN9x
         GYGDBZHQOWGYa01lq2JznJjKMtkQRNt0h1GcCPnFFfxZw0E60W5GU3qEJtMa9UhcN6DE
         czlCSB2tneUb+THKZF1KdNV4lim9esObS0ir37AeWeeH/WtenK0BIFWcNR/Di8dxTpRQ
         eSQ/MWZOHMXULLQCKgvGSLSAKYa0vfu/T712cmvVyICuq5MySmwGdAvIbYGN5vCpe3Tz
         cuyvc3cpX5y80+5rFg1B0MHSaeVBMKr64985Pjdofch8Ary33OYuJqStdq5wgKTCz/Lr
         zI+A==
X-Forwarded-Encrypted: i=1; AJvYcCW7lr/+fDZLIyTgOhyCsfM5ppVqGST9yZ7hXTMeaalC4ESaDacTzjag/mEfifbnU9RXEUCpiFfE6Fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZGhC/a1scFSN8T6F5afGJF391GfH7hpUQePx+YjypLA4bLSq
	yLTwEIj8uL4NKIHjkpVtuwjJLc4uy5g/pmTkRwQf9GoZfxRKxJ7Fd7C1M5ypr8I=
X-Gm-Gg: ASbGncvFVCZRmxujKmAxxAoF8RMoVFx3Zq+ycp57NSwIxSaOBZDnkdpc7yY7jxnkoqx
	bGWp3Y4/oetVOtI/WyLPG4pO94msKDlH74/foWxP7+O2wIZvr/95vtjkyFBzmXhXsYNTLf/AE9P
	6lclogiaSdyg1Vkvektzk8BVpq+oQOsNTPDksMqGQYA5oVbq5+zz+SmHHlgzDuq6ptw1YAnl/bS
	c2yku1Kikeohbb5BfJyR6LGswHUiSWaGVRHlWg92kqU01qeAwv1F+6CCjhk+NAttUt9GD3QIZ3O
	79OwH/XGGmeC+WkY2hrISPz0/u4=
X-Google-Smtp-Source: AGHT+IGdMrUCvgalAZZCC4jhBxGguMB5GBKImgNsdpvgeFH4FSRc46sdOKhU5wXZRU0tkFgExsNzeQ==
X-Received: by 2002:a05:600c:4fd6:b0:434:f1d5:1453 with SMTP id 5b1f17b1804b1-438dc34cc47mr71572785e9.0.1738242375772;
        Thu, 30 Jan 2025 05:06:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c125f77sm1959273f8f.56.2025.01.30.05.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:06:15 -0800 (PST)
Date: Thu, 30 Jan 2025 14:06:12 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
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
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 08/12] mm/rmap: handle device-exclusive entries
 correctly in try_to_unmap_one()
Message-ID: <Z5t5RKFwl34vpqU4@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
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
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-9-david@redhat.com>
 <Z5tQL60SNNGCkfQR@phenom.ffwll.local>
 <59feb709-dadc-4d19-857e-49320cca3d98@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59feb709-dadc-4d19-857e-49320cca3d98@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 12:08:42PM +0100, David Hildenbrand wrote:
> On 30.01.25 11:10, Simona Vetter wrote:
> > On Wed, Jan 29, 2025 at 12:54:06PM +0100, David Hildenbrand wrote:
> > > Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
> > > we can return with a device-exclusive entry from page_vma_mapped_walk().
> > > 
> > > try_to_unmap_one() is not prepared for that, so teach it about these
> > > non-present nonswap PTEs.
> > > 
> > > Before that, could we also have triggered this case with device-private
> > > entries? Unlikely.
> > 
> > Just quick comment on this, I'm still pondering all the other aspects.
> > 
> > device-private memory is entirely owned by the driver, the core mm isn't
> > supposed to touch these beyond migrating it back to system memory in
> > do_swap_page. Plus using rmap when the driver asks for invalidating
> > mappings as needed.
> > 
> > So no lru, thp, migration or anything initiated by core mm should ever
> > happen on these device private pages. If it does, it'd be a bug.
> 
> I was not 100% sure about HWPoison handling, that's why I added that
> comment. In other regards I agree: reclaim etc. does not apply.

So maybe I'm just entirely lost, but unless you have a coherent
interconnect I don't think hwpoisin should get involved with device
private memory? And for a coherent interconnect it's just device memory,
which isn't treated very special.

Also to clarify, I meant this as a general comment for all subsequent
patches that have the same paragraph.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
