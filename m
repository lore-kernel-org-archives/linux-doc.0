Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEBE1D88DB
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 13:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738242228; cv=none; b=f1qyHRrF/Nbxk67kCOhlTU81VRU3TIm947fR/NixE8dOp/UzQ9ecLoFtgQqAAN19PLHgamZhSbJ8nqPlId9orVSyYfqEgAsQEEyh8bJgCn/uJGLhO/t4dTn86Vi//Zv5s9rb1ZXljtoDSIUZdzxtcEyRFQeg2xo95HK5v9+rH+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738242228; c=relaxed/simple;
	bh=Q0IClGwGeXOCP4wz1cN8vV6y4slDvQ+Xep2Xuk7NITI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEAwFtVuQ/qBUkPqpyih5sAg1VYfZxmUY3rIe+f+2YCUAAhsHXyV5bexFBRYwx6KyYNr7c30H6n4Uv//xtFMfVN4MSjcKjWeVEfHUgpjfgxii1dvOAKe+k1POZsnwlGAHHCFYHeleOSDew4EF84edkJxxzy1NZv/CgN69/ZzDVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=FqTWl1C6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="FqTWl1C6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385e3621518so425829f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 05:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738242225; x=1738847025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgiRf9jbTncFOwmj3rTY5I84Nfx6SDCI8aA3yE1P2kU=;
        b=FqTWl1C6L89cQWejZQodC7l7wJWIolsg6FJ0tViKCjcmL7c9dUgIvSnlQ31BmRxyZE
         HXWkRU/NOAmwjVKfSJLrFs97V3Jt2SWgaGSnfEaQqg4xqaXxHHBD89luvVhbnQ7cR0MO
         XPoZ82NWkdKHZyBgxFu79mSs9/Z4J5JERydvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738242225; x=1738847025;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UgiRf9jbTncFOwmj3rTY5I84Nfx6SDCI8aA3yE1P2kU=;
        b=gKHRC8giF3bkppCNdzIQVT7WGQNs8aUKufm0fSFYbvGAQacPgZaG5BcuthCIK4jCQ2
         t53i7IVPt56JFQCqVKVycNx29NYNnRxXp47UN6ZWwgoPv5OLVVG9eBCP92onXmm0hN8+
         sEQxHtjd98LBgkXnTaSQPrem6/jddqbuJNy5hTQ4g305h4uYOt38SKUAjjjPq6B/zleu
         T5kl7aE6mz4vXi69UykG2PpPTrgtHXRj9o5R38bKwvZqhTKCsOIjw/1eZYO99nFGN1Ki
         UvSClTvR49/uXPijsDbGMHMlofiuDZRfJKzquUXsB9O3R7uQW4YaGQjLoFJz4yJ/BFRO
         qXXw==
X-Forwarded-Encrypted: i=1; AJvYcCXhoAP/kwRQUTHm5X2DHitjiFKRuJMXOn20/w+p/GSZUFxPsrJXvHrpTi1QD7KtOuE0LlLxggU5/K4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFpzbLarr3VCpVlsmMqGIYEfZ4FOQTpUoe8geILlkL246Dkd4G
	Mvc6UHIp9vmfGXofKmxTrk5HhD0vq904bR3AZIJGYKOgWc9s8PXQuyXYLfgqins=
X-Gm-Gg: ASbGncs9WkTugVv+JS3GESFYOGovD6zCx7hj8Dr+WAPEZqtFTtWTHwR/Jmg9bR/KYHA
	Rqkq/prbF3gMbj+HM4tuETqOMHm99GzLgxSLoJ0e+AJ5dwwGzWR7pj15QU1j/Mt0vnChP3kVdxA
	Qix+0wHT7fOZe5PA6Y4Lmf644VJjBKtxVQcLZr4tzSCmou8WzqdUb5GYES0BHZkskLcOHX57G2E
	83/fK5OkljdF3nAfYbclpccIsqFMiLhJHm73OeeWUhdby7oGkMhGc9JjN8qOBon92inuriiix2A
	3phYZxktof1hT4Ie6TtCc8W7BIU=
X-Google-Smtp-Source: AGHT+IHJ4PQVE5HpkzCPzrNWq8zl2Gl6Pk4aDkS8eqlkDUfbDlT8A12K1IbiCiXTus+F/gF8+q2ayQ==
X-Received: by 2002:a5d:64ad:0:b0:38b:ecec:8576 with SMTP id ffacd0b85a97d-38c5167b5bfmr7295312f8f.0.1738242225257;
        Thu, 30 Jan 2025 05:03:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc1317fsm59239255e9.8.2025.01.30.05.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:03:44 -0800 (PST)
Date: Thu, 30 Jan 2025 14:03:42 +0100
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
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Message-ID: <Z5t4rrkRiOsRY2jH@phenom.ffwll.local>
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
 <20250129115411.2077152-6-david@redhat.com>
 <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
 <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 10:58:51AM +0100, David Hildenbrand wrote:
> On 30.01.25 10:51, Simona Vetter wrote:
> > On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
> > > Let's do it just like mprotect write-upgrade or during NUMA-hinting
> > > faults on PROT_NONE PTEs: detect if the PTE can be writable by using
> > > can_change_pte_writable().
> > > 
> > > Set the PTE only dirty if the folio is dirty: we might not
> > > necessarily have a write access, and setting the PTE writable doesn't
> > > require setting the PTE dirty.
> > 
> > Not sure whether there's much difference in practice, since a device
> > exclusive access means a write, so the folio better be dirty (unless we
> > aborted halfway through). But then I couldn't find the code in nouveau to
> > do that, so now I'm confused.
> 
> That confused me as well. Requiring the PTE to be writable does not imply
> that it is dirty.
> 
> So something must either set the PTE or the folio dirty.

Yeah I'm not finding that something.

> ( In practice, most anonymous folios are dirty most of the time ... )

And yup that's why I think it hasn't blown up yet.

> If we assume that "device-exclusive entries" are always dirty, then it
> doesn't make sense to set the folio dirty when creating device-exclusive
> entries. We'd always have to set the PTE dirty when restoring the exclusive
> pte.

I do agree with your change, I think it's correct to put this
responsibility onto drivers. It's just that nouveau seems to not be
entirely correct.

And thinking about this I have vague memories that I've discussed the case
of the missing folio_set_dirty in noveau hmm code before, maybe with
Alistair. But quick search in archives didn't turn up anything.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
