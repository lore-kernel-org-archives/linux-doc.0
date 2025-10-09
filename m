Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2550B824BD
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 06:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759990468; cv=none; b=W5oO3hcL4RBadaEXw0joxIEBuBaPrQtIHmogCytx4ZqkQg/DYDSINvnnSl3heAUbv+FtwnSMiOiw3Hv0xreqZvad9geAnu3iiEMAHhYABvRS8FZAZhDd4uIA7fVcS3b8ba6Y45l/i6Pn0hedr5FwlK82b5Fw/OEvOFdE1A/w7WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759990468; c=relaxed/simple;
	bh=+P+32VjyQia2/VMl6L8i5ps1XTSWuqyuULRXQ89ZNT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dX5gao+kal3xlBzlI9EUBRDf4mWtQ78p7EwIEQQzkaePbg4PJodIIrHeIj4xd5yIo0GtgdMccCC4G/n/57+UM9+tTkqdl8ZTh3dhGJvV2cgi1fcudzaVye9qMDg9lru7+oegM+Xi62X5nrJBafE323xxkpNtWbi6bWTlcNMdS+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fM3y8tM2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fM3y8tM2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso87883266b.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 23:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759990464; x=1760595264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tY+RxY77Pgjb4Q3Ych7maYZ2J/C8zV6CQKxbmiyQ6H8=;
        b=fM3y8tM2rrya4xxuvNo9HiIaGOcOn9yhd/DFLSkkYp3LfPAoBLow7MhwGC2KUawJr+
         i1pbP7cmft5nNrFDwxZkBATGNCG8DQmJmEpMOqv6QAYGrcPlM2AFSZzaEtYuigjKNFqg
         +0u/4VqEgD6gr/mD63BJKdDMOpV1APZiHgTyc2Bj7Dto9QuomZGxsxYx5/Cp3+zz46KY
         XyK2bxs7ynpMrujBICbDiXgR9aQHPUWhdV0GVJWcwJgDE0qlA8tFse0bFz6vjAk0Cwm3
         886lZJLJ/NBNnaPXxoghpGUFQluNdm8owgwPnTxgGFXMkUMjOsVIds8b+/YuW/uyW8mK
         O2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759990464; x=1760595264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tY+RxY77Pgjb4Q3Ych7maYZ2J/C8zV6CQKxbmiyQ6H8=;
        b=gxzONpxaD4WUyoZ8uqo+X9LW07foiMfN/4LF+Jt2wR+OfuBwaL1x7w2L1tvsYIm9oF
         De1HiuLDNgtIhr5Ih3paz3Hv7qTo0GtDyF1KIPyk5J8mLJ1p9MQGJ6qnPJPaM1EAOkt5
         QI6D1EA/6ZKFIuWdNPQDg/FxhPR/8XyQ/5nmZ8ed77ZjtjiwVMG2DI9wWVAd/sWxQzY2
         ZR2zp+uf1gaYs/WvdjrCbgv2ki1Bf1stCZlTobM9+YnvsFOST+7y+8zPP9D2Vtv2Xx+a
         xZ9Mw7Fm3oOWQhNT3eUttSm3PiwTNdvvaf3YdOgW7rv1kiAY4WpFWGExCMaNZrPUkzXA
         L+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNrROsTYK7XfarUGbpbYUi5qwbcjrm3Ws+uPuEBR2uWeDOi67cy7iQpRSkchpiV3wk4Ia2KGV2ziA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhgmjY9edQv+OBLWXL+2CNKvKnU1HLgcH/m38rU2U2CGgrgXAv
	gzXSt8o/lGB036zdWZRGERyh9+Eq9Ekg3TyMPGf+DUIfMhAOU+cB2REh6WwbcxWe5oA=
X-Gm-Gg: ASbGnctubVYdYcyytqEKaColDQL9gaBpWvZw9l0nJeaCC4WJqneS1IztNy0z9aW2aES
	HZuEdvQBi99lIWv14TO+PwZDefCnWFa6DMbQWnP1RixwibLlb1FGV/slbxwabNAuloHoUtamD/J
	X3lwg5a5owGRS/fXYWls2jKO6+jd5vuj8AJEo0E5XIt7eE2nyWwHPGZ0VvjXMDdF/91sM0tv0o4
	dtzr6j++JHYZHNzhqBGNf3rrAmywHEfUoqcRRFhX1GF5rUXsAOIhlA0MW1pTZp9D/L8a6ue1Pbi
	Wr4SH9/Hdx2u6VZTqh1wwhgKsnfB6iWKtRfYiDrWIhnUpIR3OwHOvapg+oyg+yPzWOxzH51mw4Q
	HsDdbl2cW1389f5aCRCrIX+GbAd4qIxZONNdYDIVIfLkhHq/JMpP0FC2Bs5p9Jl2bHHzTfbs=
X-Google-Smtp-Source: AGHT+IHag+XyI9AEKljQkUUbITbyiNy7sILEJRnoopPBDpFTzbe1XSGFErdxTP4ZeoFPTMso1aYmeQ==
X-Received: by 2002:a17:906:c146:b0:b3c:f48:ed57 with SMTP id a640c23a62f3a-b50aba9f7b9mr602408966b.35.1759990464254;
        Wed, 08 Oct 2025 23:14:24 -0700 (PDT)
Received: from localhost (109-81-95-234.rct.o2.cz. [109.81.95.234])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b486970b5acsm1816673066b.60.2025.10.08.23.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 23:14:23 -0700 (PDT)
Date: Thu, 9 Oct 2025 08:14:22 +0200
From: Michal Hocko <mhocko@suse.com>
To: Gregory Price <gourry@gourry.net>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	corbet@lwn.net, muchun.song@linux.dev, osalvador@suse.de,
	akpm@linux-foundation.org, hannes@cmpxchg.org, laoar.shao@gmail.com,
	brauner@kernel.org, mclapinski@google.com, joel.granados@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mel Gorman <mgorman@suse.de>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable
 sysctl"
Message-ID: <aOdSvriKRoCR5IUs@tiehlicka>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
 <aOZ8PPWMchRN_t5-@tiehlicka>
 <271f9af4-695c-4aa5-9249-2d21ad3db76e@redhat.com>
 <aOaCAG6e5a7BDUxK@tiehlicka>
 <83e33641-8c42-4341-8e6e-5c75d00f93b9@redhat.com>
 <aOaR2gXBX_bOpG61@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOaR2gXBX_bOpG61@gourry-fedora-PF4VCD3F>

On Wed 08-10-25 12:31:22, Gregory Price wrote:
> On Wed, Oct 08, 2025 at 05:43:23PM +0200, David Hildenbrand wrote:
> > On 08.10.25 17:23, Michal Hocko wrote:
> > > On Wed 08-10-25 17:14:26, David Hildenbrand wrote:
> > > > On 08.10.25 16:59, Michal Hocko wrote:
> > > > > yes, I do agree. This is just muddying the semantic of the zone.
> > > > > 
> > > > > Maybe what we really want is to have a configurable zone rather than a
> > > > > very specific consumer of it instead. What do I mean by that? We clearly
> > > > > have physically (DMA, DMA32) and usability (NORMAL, MOVABLE) constrained
> > > > > zones. So rather than having a MOVABLE zone we can have a single zone
> > > > > $FOO_NAME zone with configurable attributes - like allocation
> > > > > constrains (kernel, user, movable, etc). Now that we can overlap zones
> > > > > this should allow for quite a lot flexibility. Implementation wise this
> > > > > would require some tricks as we have 2 zone types for potentially 3
> > > > > different major usecases (kernel allocations, userspace reserved ranges
> > > > > without movability and movable allocations). I haven't thought this
> > > > > through completely and mostly throwing this as an idea (maybe won't
> > > > > work). Does that make sense?
> > > >
> 
> I'd also considered something between NORMAL and MOVABLE, something like
> ZONE_NOKERNEL or ZONE_USER. But that seemed excessive.
> 
> > > That is why I called it user allocations because those are supposed to
> > > be configured for userspace consumation and planned for that use. So you
> > > would get pretty much a guarantee that no kernel allocations will fall
> > > there.
> > 
> > What could end up on it that would not already end up on ZONE_MOVABLE? I
> > guess long-term pinned pages, secretmem, guest_memfd, gigantic pages.
> > 
> > Anything else?
> > 
> > I'm not quite clear yet on the use case, though. If all the user allocations
> > end up fragmenting the memory, there is also not a lot of benefit to be had
> > from that zone long term.
> >
> 
> The only real use case i've seen is exactly: 
>  - Don't want random GFP_KERNEL to land there
>  - Might want it to be pinnable
> 
> I think that covers what you've described above.
> 
> But adding an entire zone felt a bit heavy handed.  Allowing gigantic in
> movable seemed less - immediately - offensive.

The question is whether we need a full zone for that or we can control
those allocation constrains on per memory block bases to override
otherwise default. So it wouldn't be MOVABLE but rather something like
USER zone.
-- 
Michal Hocko
SUSE Labs
