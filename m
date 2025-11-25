Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13801257854
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 10:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764065033; cv=none; b=dx/T0mDH+rNmfugbAFWuvzZ3dzfS6nO1thCTP5ViGiGqDlA7MJoJX6yw39JpgvDNf6dTqqmol/0fBWLmXWTvTEnVoD978wVOv33OYCeoozo6LNeWZ2tknP90cvWb7omO3g9d0pj151iPgaTbEqlZjyNpAMSQGbOYHiHMOs+RdaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764065033; c=relaxed/simple;
	bh=Ynwt/PGQ1dl73sOWY1UrpUl+HJY5t5F/5BD+jLiu4iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnY+sAcsMUQDs43Bb4tsIGkoWPnY0peU0P0NM/DUeeu1jF3v2NL6AGNUKn6OZlIh9tFmCttIgpJhdRSilrIbZOqcCKZfIw9hPbq5mXsydmCWP+AXnOddbaDes75FU1X1HCARLJsnWLpsGI8VwpODApOzIoKnZO/N5s7ApzZoHv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BJu6c0N/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BJu6c0N/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779a4fb9bfso49155e9.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 02:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764065030; x=1764669830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nVd5wHAvhsygYJktl9YNIl657UM2lLl+mprE++5Um5Q=;
        b=BJu6c0N/kRlOHsK1wQzw2Gf5CPNmINjUYiqQ/OVZjBvx+UhBSpexiH4hqHQWpxVWNb
         BsUlFc8nLMrcystmlDaTNbdAJaw5bitC3PAVDOyuCdhA/J6val8iSkpCiK3l/tLc7EgQ
         yj04ptFN9n4XSlCh8XbLz4g+gZSGSTLg7qOs3wADo9rzUwVhUTBP3JPf4t5eDEgSpjWT
         6lzuHIa4hjFj8RVbpCqUdDt7EIUDjp8vayoMy32m9bZsXBnl8ICMg3noaIyPtTvpV5Ac
         ctpqadj9Gkq3njB88FEJO59C0K/oDlY+OyEfOVMRs9KPhI04MttRRIBYwZ6MvRbnZPdC
         EDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764065030; x=1764669830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVd5wHAvhsygYJktl9YNIl657UM2lLl+mprE++5Um5Q=;
        b=lQ7w1iMSG88E4qmhcKbVBWJ2Jzntv7kzI365vLYm15tvq7qyBrxosqRelcwVzESHna
         vFtb0IckYepThTAdCdV4rI8DAvIQSBULR/03XNIYcxueql5hOXvOXxs1Bmb9k9TDV3sh
         lSHz+cwBfBchAcSFcaS+joeaN76p99Fnfu8KsPbd74TGf+69VICEfhBxYQMp3nqm+w+Z
         VB9BIY2IXM9zVkiY/Z4/sFfMKsv++yq2uG8QNe6oW1Q6hEPTWUZFK3lyiwq8+yaJvIKT
         ImQ+25HOgG0ZhCJ3R4rAKvYe0VcgGPsP2U/iDEz7DLHC1SyjQkeYYJeYGDvCmVzVXnZq
         9q/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPVLR5mttF2Tqw/cTDfVcPi1ZV46PdnGFnqDnX+MoEMct86lSv2TTDstPd/Sub0vCSCTYe9F0tW3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzufYWPU6gBNoDqopBxfbSvQQBUYha8G1/ME1QHM0wvuVBAAk6+
	jAwi8aXgON+4Q6ML/Wimp4CXr6MBIMa/+rc2tfSgzYtDw0XwHZfNQxwCtg9WzaHJ1g==
X-Gm-Gg: ASbGnctC1u2ximt/twFFXzjU7Q8ft7z1XK95ursJ9Gx2OgIYsXJ5NMuIOlNVbSRWV6p
	20XjxC2THdEnhz6wA8e/QAATbsthSFTQ8IW9O0QnbyKrUN6y7YlCAUr2EC5+QXE78gdaUNYmRYV
	o6iNQIbOwgVUSvAoHTYcSp1sOpdZB3bUpx1VeTnZqxvkNLe/h9E6AlHqd7YqPmn42UbT2dgogcU
	Visj+UZ1RK0hgV6w+l3DNlOoNtfujIB8yMxrgaAe8V8fDu2dKBZ8CAJno1fieYEkl2ackubdUdi
	liYJBkL+/Qik9xvTWyXrJ+gGVcHbLPU3N9nasGAZ+n84/2e2hFQzUWqF7uFBO75Dxuk7hg1ed8a
	8EriHRQkEyk+0H9ce3QTqXIUSvIci0EK6qrO7/bk1F7GYD+WA6dJb518cAKKSkFP5fS7OVwmR9e
	ogyv0PWsMQwyDcWju5d1eWshBUBHcIh3Di0LhgOPMvBc7QucWf/A==
X-Google-Smtp-Source: AGHT+IHGtSW4ZFPm5Ld3MnDEYsj1B4+fTprfbo1S10kQvVjHYAXxPLPTfSswDS2c4HSt3WgH56Nz+A==
X-Received: by 2002:a05:600c:8901:b0:477:772e:9b76 with SMTP id 5b1f17b1804b1-479068ef80fmr299385e9.7.1764065030179;
        Tue, 25 Nov 2025 02:03:50 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e574sm33316474f8f.3.2025.11.25.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 02:03:49 -0800 (PST)
Date: Tue, 25 Nov 2025 10:03:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com
Subject: Re: [PATCH v3 3/4] drivers/iommu-debug-pagealloc: Track IOMMU pages
Message-ID: <aSV_Ap1RynBULiZM@google.com>
References: <20251124200811.2942432-1-smostafa@google.com>
 <20251124200811.2942432-4-smostafa@google.com>
 <ae535698-33fc-42a1-8a5a-ed8dd192f697@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae535698-33fc-42a1-8a5a-ed8dd192f697@linux.intel.com>

On Tue, Nov 25, 2025 at 03:54:56PM +0800, Baolu Lu wrote:
> On 11/25/25 04:08, Mostafa Saleh wrote:
> >   void __iommu_debug_unmap_end(struct iommu_domain *domain,
> >   			     unsigned long iova, size_t size,
> >   			     size_t unmapped)
> >   {
> > +	if (unmapped == size)
> > +		return;
> > +
> > +	/*
> > +	 * If unmap failed, re-increment the refcount, but if it unmapped
> > +	 * larger size, decrement the extra part.
> > +	 */
> > +	if (unmapped < size)
> > +		__iommu_debug_update_iova(domain, iova + unmapped,
> > +					  size - unmapped, true);
> > +	else
> > +		__iommu_debug_update_iova(domain, iova + size,
> > +					  unmapped - size, false);
> 
> In any case, could the 'else' branch become a real operation?
> 
> In the __iommu_unmap():
> 
>         /*
>          * Keep iterating until we either unmap 'size' bytes (or more)
>          * or we hit an area that isn't mapped.
>          */
>         while (unmapped < size) {
>                 size_t pgsize, count;
> 
>                 pgsize = iommu_pgsize(domain, iova, iova, size - unmapped,
> &count);
>                 unmapped_page = ops->unmap_pages(domain, iova, pgsize,
> count, iotlb_gather);
>                 if (!unmapped_page)
>                         break;
> 
>                 pr_debug("unmapped: iova 0x%lx size 0x%zx\n",
>                          iova, unmapped_page);
> 
>                 iova += unmapped_page;
>                 unmapped += unmapped_page;
>         }
> 
> The comments say that it is possible to unmap more bytes than 'size',
> but isn't it a bug if this helper unmaps more than the caller desired?

I was wondering also why the core API allows that, I couldn't find
useful information from "git blame". But I vaguely remember that some
IOMMUs can't split blocks so they unmap the whole block when a smaller
size is requested.

Thanks,
Mostafa

> 
> Thanks,
> baolu
