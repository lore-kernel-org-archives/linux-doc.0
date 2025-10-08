Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069963CB
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759937030; cv=none; b=unujj9AP85BSDNj711VGIiOBSVezaevv4k7YzISuHNTAXCSDcuKkwtn+E+ZDhwPBJJJk7xnjQDxX/5KnyALDG0oDv2jSfJ6y/sCPT0W4zzneg7Tg8JAA5CGPI4K37oek99N9nFASQqBQD6s3LPEJrVs5glB0ObsCek4Ff9pLfIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759937030; c=relaxed/simple;
	bh=l9os6ZO8dPY7bfQh/0jGGJRonldCJsuxvWJYvxUUJAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qez63AYrq3XHm42X62VwJ73+eF9eictlZWsO3EBF+07YP3andh3hAYd7FwpiDWpY0TNJHcyw7aVPbuxlWvfXg/wCZN153gtn1fOV7dM1U3gz3Ak4xt3AtY7rEsGWPXVtvPrTO2kFPUH41FpBQQC/XU1h+5QrDj5ZOrnIE+/XcdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cebxWFv8; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cebxWFv8"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so1397783966b.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 08:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759937026; x=1760541826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VEFKGIEcuas2Pari3eoGaAS3BufIbyvqNDimCw+KvpQ=;
        b=cebxWFv8EJqPNUrzmjVbTGNroZHu/D3PH9uWTrbbR54e7gke8WRw0GnQwsYE6H2Bdf
         m5ZKXmocBQrRLEQxUqkvM2ZhZ5kZe4d1qLImQwjuCUArAyZhRMpF++I+coXLDecnKIyY
         2ccjiBPt8+JK4upy4cIU6gB36lN5n/h4d4zDE+P8sG4q+PaEql6T5XVvZI1lTLQaddTY
         0rmzeJUiRtPsA4R5jAVI7EdZKrNLM9LRZMFPruEDf4YPZhV3Yz98rBjPOp90+8ITiNmm
         ApDcTvjylchy+D5dxGyGHnmBgpSl/oJrWfTgdhlkF+I6fnoUNg53Cnio0HeRR85YsNfu
         qAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759937026; x=1760541826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEFKGIEcuas2Pari3eoGaAS3BufIbyvqNDimCw+KvpQ=;
        b=pq5MWfi0HUWqP/RQr5DPRHtcJnoW0OnRv9oDfl1xKAEaNG4Tf0qnOeB3SfeKQi4e4K
         NfKDZ5ltRvh/el9wQuwYVnEatZD8y0XrvXng++FpvB3pPH0ZFto5UHAwgPV7la7oApXs
         U3907nWDJrfdZ/t8Lpk1/wbENZR2/LUnCwjTQsvr6nkkwDk9p9+A3fRu8IZsNXJ6W5aX
         5LATdAzJ9L++dwcl/8n6BP95NnVctV+M+uJm4HN+7oegohnaVLRgQXRFA8MDP5tqXA2+
         X9PYvbZwW3DIrcqMCfHWdYw4FgOS4IHxGvq8urhTN3w4Hzd1N/6meqw7M7uj3FtU+9xK
         3gdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0+5q0vMD3y4uEwBujZMpPh3OQnSbQy+1Zyyhf6tdFW0+naO3/0yd0sxZgJEZKn/1nhvT12DufG1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywowhj6jRk+n4YJZl4g0z6ZU+bZu5YSqPlj5dIU9YBJzO6SONQ4
	qvSQGDCIPV2CB3Q5cjnutOQF9X9BV2Afk59O/oynC5/g6PocYbstWOEJ1VQVJ+A/zmE=
X-Gm-Gg: ASbGnctDHsSuCt98v2+8leljWPDpoNHF270zcI5QBRLRxfTyN6HWGUDczhlyUveqTbe
	DKcEAjIMK4n2eQeIt+5E30eMNV2t4pHkCkTDoWuRMt3sPdO/0O3n9rIDFMvhb022f655/F5+fXY
	dh8G9MgC4IuPw2RNPAK1BUBnxERVCgmTsM4rRL9h7jR1j+l1yBrCz7Tq9PZIRJDyoTWq/URSRTi
	YwJstluQsyEG2B5ajhATNZFQA6PsBdEjXcvRlp4ew0B0ebKImPsv0o+RS2nNbA1rRqvs2qtvqx7
	GBwl6tIrUqFKmkUuZzQPJiJ1m1meRWy/+1PtW6VIGqIPcGAB6OfB99HY7C6c4cF/oFXyQSzgCJr
	r32AriferCd/HNS3fGjuKOoHWND8Si5lFBRdsg3Obt+bUVLIcE0GyOhyYWDyr
X-Google-Smtp-Source: AGHT+IGNuMGqHdw+uNNDnAnIMkPJmLsC8kdVFIi2VETZkBtQkqYRsFlkZfBi/u6TL2LUyonVmTrK0w==
X-Received: by 2002:a17:907:c14:b0:b45:8370:eef6 with SMTP id a640c23a62f3a-b50aaa9d0f5mr485367066b.19.1759937026160;
        Wed, 08 Oct 2025 08:23:46 -0700 (PDT)
Received: from localhost (109-81-95-234.rct.o2.cz. [109.81.95.234])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b486970b2ffsm1711555666b.47.2025.10.08.08.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 08:23:45 -0700 (PDT)
Date: Wed, 8 Oct 2025 17:23:44 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org, corbet@lwn.net,
	muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org,
	hannes@cmpxchg.org, laoar.shao@gmail.com, brauner@kernel.org,
	mclapinski@google.com, joel.granados@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mel Gorman <mgorman@suse.de>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable
 sysctl"
Message-ID: <aOaCAG6e5a7BDUxK@tiehlicka>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
 <aOZ8PPWMchRN_t5-@tiehlicka>
 <271f9af4-695c-4aa5-9249-2d21ad3db76e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <271f9af4-695c-4aa5-9249-2d21ad3db76e@redhat.com>

On Wed 08-10-25 17:14:26, David Hildenbrand wrote:
> On 08.10.25 16:59, Michal Hocko wrote:
> > On Wed 08-10-25 10:58:23, David Hildenbrand wrote:
> > > On 07.10.25 23:44, Gregory Price wrote:
> > [...]
> > > > @@ -926,7 +927,8 @@ static inline gfp_t htlb_alloc_mask(struct hstate *h)
> > > >    {
> > > >    	gfp_t gfp = __GFP_COMP | __GFP_NOWARN;
> > > > -	gfp |= hugepage_movable_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
> > > > +	gfp |= (hugepage_movable_supported(h) || hugepages_treat_as_movable) ?
> > > > +	       GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
> > > 
> > > I mean, this is as ugly as it gets.
> > > 
> > > Can't we just let that old approach RIP where it belongs? :)
> > > 
> > > If something unmovable, it does not belong on ZONE_MOVABLE, as simple as that.
> > 
> > yes, I do agree. This is just muddying the semantic of the zone.
> > 
> > Maybe what we really want is to have a configurable zone rather than a
> > very specific consumer of it instead. What do I mean by that? We clearly
> > have physically (DMA, DMA32) and usability (NORMAL, MOVABLE) constrained
> > zones. So rather than having a MOVABLE zone we can have a single zone
> > $FOO_NAME zone with configurable attributes - like allocation
> > constrains (kernel, user, movable, etc). Now that we can overlap zones
> > this should allow for quite a lot flexibility. Implementation wise this
> > would require some tricks as we have 2 zone types for potentially 3
> > different major usecases (kernel allocations, userspace reserved ranges
> > without movability and movable allocations). I haven't thought this
> > through completely and mostly throwing this as an idea (maybe won't
> > work). Does that make sense?
> 
> I suggested something called PREFER_MOVABLE in the past, that would prefer
> movable allocations but nothing would stop unmovable allocations to end up
> on it. But only as a last resort or when explicitly requested (e.g.,
> gigantic pages).
> 
> Maybe that's similar to what you have in mind?

Slightly different because what I was thinking about was more towards
guarantee/predictability. Last resort is quite hard to plan around. It
might be a peak memory pressure to eat up portion of a memory block and
then fragmenting it to prevent other use planned for that memroy block.
That is why I called it user allocations because those are supposed to
be configured for userspace consumation and planned for that use. So you
would get pretty much a guarantee that no kernel allocations will fall
there.

-- 
Michal Hocko
SUSE Labs
