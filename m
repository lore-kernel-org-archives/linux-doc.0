Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A49026281
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738242026; cv=none; b=Uq3E6XTl0e3mfhOr9g1hhTHWE9l7R6wyWYGbMkgryA2OTRY+NVt5Lr/8rdLiXWJUICYNQscuaT9u6ieA1aEWmB9j4FVZlUskk7WI6K7CkfTSFprLOnDxg6S3NAWJKYty9BrRxtpg454t/2Wrr9gEaFxUrg8TNfh3pE1C2Je+UjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738242026; c=relaxed/simple;
	bh=9otkl0t4ZKJA5aPENgIvM3CXzDR0ZypaALTLpy5Nllc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVGovohopT/JvhJ47EpGK+gkM9kUxYYvlSJ5rgiLBhW9foiue01wzG/hsezVU9Xk7fLOhRqsR1cdipQQUQM6ezTNLuN4082gRrI/CMphWrIHOmj0O/7gHEekWuc0P3ZEflG3j4GG4y0oVvH54bCUNzY/I6pYndJJpWjfrPtjFwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Kd/1Nz4F; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Kd/1Nz4F"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso615360f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 05:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738242023; x=1738846823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWEfvcfTsN7T0tilikMhQJMX7DbMz278YnuholCTh1k=;
        b=Kd/1Nz4FvW13J0pgqtNCmp2K/pu6Sxksc+2bU88LmgELawRhKtP2azx+q6PmhMRW1X
         efyp0BrKc5hWPCLhqcJDKrxE90JaIWOwjUVkYfLxLOQq0fI68CRqmXLCGozUxzIUKLcO
         n8gY0kQw0U9SI0u6yYViIk4vEPkG6s6Ci6Urg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738242023; x=1738846823;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PWEfvcfTsN7T0tilikMhQJMX7DbMz278YnuholCTh1k=;
        b=l/eYNpapw2p5XPOS9gUz35ysvk/41dZ7rlksjKzwvb0HQn7olFXKAsEnGnLBxGnvJ2
         zaWfwWKGy8F6HzYmsyXjiDPwqgADWwVCz3nKUYa779Zm74MHhbb/Bmc0ICPX06KUIu8z
         XSm9X4Eaj+VeHCPNUY0obEBj2qyCXbFMyCdfyNSkb+hNDhe3qkyKRSS4foqugFBkYVEw
         +8gev0VccMiIhNAjfbn2DHtcKkQtcmuoGbEf+0XRL8/MYDCgehU0mCiGsrsOlR5oLrns
         HYa/kKWpP9enNTdY9jce5R3wi32LdckEp1FKPYHSXfs+H9eyrbEkxTMtdwHTfZVMqCyH
         VwYg==
X-Forwarded-Encrypted: i=1; AJvYcCVgP6OAMIBQbfUIRUeOxfDWe4wPwFtNffoyifpDToGWr1j/rqQsoEUFJEfgnc3WhsvW58QcC5WjGjg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5CdPr8QYrtpcewXjoYRGJsPGe5jG2xiEqHYoJUPLVEab01uWK
	BsqyVwOMg1MX9PMYGRSQGZhNjsGKcj1cOK5NeF7ARTnL1U7IYpIgku4nOwpuN4A=
X-Gm-Gg: ASbGncu2tGEAx7roAG3NN6hOoWKNWUGcCrgnulFmPm6v0Rl6UvdqGvT4p6+wBiNW/Su
	6/PnoKuN5euyESG/o4a6EwSfjStcmR1O50q0e5z7017+GsO8OuvWjiG/rsKAoKd1VZy6HZONnJP
	klT1hKuZSn9vCrCD2NJdMyeHBAqoYGsD5S/+E9FavYO9yfZj/WIJOuese1xeztkBgTDvs7muAll
	Y2dMhsROeg0Gi3FDmdyGn3lCzFQXny7ILGEXbk0uwBYJ75Imc/f8BX7+P2UVY1yzD/icKKzBqhK
	CwNDcCd1DQz36I2OBQbzT+6sw28=
X-Google-Smtp-Source: AGHT+IG/nMuUBD3KzbbfR2aeV/qZxqQT5Q4oWBw/1zX9VuChXzIPGd76LlGfkfl60EN6WAkMb4jFOQ==
X-Received: by 2002:a5d:5986:0:b0:385:ec6e:e87a with SMTP id ffacd0b85a97d-38c520904ebmr6377248f8f.43.1738242022392;
        Thu, 30 Jan 2025 05:00:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b59f6sm1937111f8f.69.2025.01.30.05.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:00:21 -0800 (PST)
Date: Thu, 30 Jan 2025 14:00:19 +0100
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
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive()
 using folio_walk instead of rmap walk
Message-ID: <Z5t34-0K9FJKVQe6@phenom.ffwll.local>
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
 <20250129115411.2077152-5-david@redhat.com>
 <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
 <Z5tI-cOSyzdLjoe_@phenom.ffwll.local>
 <54a55ff7-38c8-42c2-886f-d6d1985072a9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54a55ff7-38c8-42c2-886f-d6d1985072a9@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 10:47:29AM +0100, David Hildenbrand wrote:
> On 30.01.25 10:40, Simona Vetter wrote:
> > On Thu, Jan 30, 2025 at 05:11:49PM +1100, Alistair Popple wrote:
> > > On Wed, Jan 29, 2025 at 12:54:02PM +0100, David Hildenbrand wrote:
> > > > We require a writable PTE and only support anonymous folio: we can only
> > > > have exactly one PTE pointing at that page, which we can just lookup
> > > > using a folio walk, avoiding the rmap walk and the anon VMA lock.
> > > > 
> > > > So let's stop doing an rmap walk and perform a folio walk instead, so we
> > > > can easily just modify a single PTE and avoid relying on rmap/mapcounts.
> > > > 
> > > > We now effectively work on a single PTE instead of multiple PTEs of
> > > > a large folio, allowing for conversion of individual PTEs from
> > > > non-exclusive to device-exclusive -- note that the other way always
> > > > worked on single PTEs.
> > > > 
> > > > We can drop the MMU_NOTIFY_EXCLUSIVE MMU notifier call and document why
> > > > that is not required: GUP will already take care of the
> > > > MMU_NOTIFY_EXCLUSIVE call if required (there is already a device-exclusive
> > > > entry) when not finding a present PTE and having to trigger a fault and
> > > > ending up in remove_device_exclusive_entry().
> > > 
> > > I will have to look at this a bit more closely tomorrow but this doesn't seem
> > > right to me. We may be transitioning from a present PTE (ie. a writable
> > > anonymous mapping) to a non-present PTE (ie. a device-exclusive entry) and
> > > therefore any secondary processors (eg. other GPUs, iommus, etc.) will need to
> > > update their copies of the PTE. So I think the notifier call is needed.
> > 
> > I guess this is a question of semantics we want, for multiple gpus do we
> > require that device-exclusive also excludes other gpus or not. I'm leaning
> > towards agreeing with you here.
> 
> See my reply, it's also relevant for non-device, such as KVM. So it's the
> right thing to do.

Yeah sounds good.

> > > > Note that the PTE is
> > > > always writable, and we can always create a writable-device-exclusive
> > > > entry.
> > > > 
> > > > With this change, device-exclusive is fully compatible with THPs /
> > > > large folios. We still require PMD-sized THPs to get PTE-mapped, and
> > > > supporting PMD-mapped THP (without the PTE-remapping) is a different
> > > > endeavour that might not be worth it at this point.
> > 
> > I'm not sure we actually want hugepages for device exclusive, since it has
> > an impact on what's allowed and what not. If we only ever do 4k entries
> > then userspace can assume that as long atomics are separated by a 4k page
> > there's no issue when both the gpu and cpu hammer on them. If we try to
> > keep thp entries then suddenly a workload that worked before will result
> > in endless ping-pong between gpu and cpu because the separate atomic
> > counters (or whatever) now all sit in the same 2m page.
> 
> Agreed. And the conversion + mapping into the device gets trickier.
> 
> > 
> > So going with thp might result in userspace having to spread out atomics
> > even more, which is just wasting memory and not saving any tlb entries
> > since often you don't need that many.
> > 
> > tldr; I think not supporting thp entries for device exclusive is a
> > feature, not a bug.
> 
> So, you agree with my "different endeavour that might not be worth it"
> statement?

Yes.

Well I think we should go further and clearly document that we
intentionally return split pages. Because it's part of the uapi contract
with users of all this.

And if someone needs pmd entries for performance or whatever, we need two
things:

a) userspace must mmap that memory as hugepage memory, to clearly signal
the promise that atomics are split up on hugepage sizes and not just page
size

b) we need to extend make_device_exclusive and drivers to handle the
hugetlb folio case

I think thp is simply not going to work here, it's impossible (without
potentially causing fault storms) to figure out what userspace might want.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
