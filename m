Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600F12EC57C
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935553; cv=none; b=ogrLWrnghLTBQmnzM7ryQ3eJ8Sntcr4GTCnndI7BnbxWqsow4P9BXydX5JXxfIXvXJtCGM0b8pEFwJ6G+RdwoRE/aXXPMXGTDfjjUA0//3PBKrGAHb6sg9zV8+u3x+JEevGWkc8lPkdbA62EBB5UKC7aNCVq+VFZpbw8sleLTtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935553; c=relaxed/simple;
	bh=+yCckR6yn9p7GyvjYoiZcRvKpmENICzodGyAOj0De5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJOhgkB6WFxGCV09AuBEeE4qUwXm6WrbsWy0U4b4BvwugeAiR68j1TuUNd7YEY1yq6497mxErQHPyqSs/9LVXDJZmgVRZmXHmFC9h/vYO7wuL76LaoqoOwQueL2DoOvDdpPTMDw6Fh6Ygn3O0KJ7lVB3EqnU/oYkWKHsO1S+/48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UZi485t/; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UZi485t/"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b41870fef44so1475059066b.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 07:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759935549; x=1760540349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3WqvDkSw2KqYGDX5nwqWxTk9V6PgPZ8rHUAzP3TxPgg=;
        b=UZi485t/zJJ5TjlZqaskhRnlbWU0zLJn9oSBQclSA4JzgJHQH5p6e3HPWBR9quckTX
         ZMjoMBBZnusAdRQxIQD9sH+8UTIjBJ3+078Bb4otJhlrBU3PuE6AZaw3MK2QeAlFksgW
         2zHW7C8qAe4NeEyy6K4ottFFESs/XMbUWq/KxRVV0Y/H0Igmkblg4cG6a2bNBjqg/BEM
         q7OOSQcOr4yZJaqdm6lacYpYx5pPiPJWL+hU721IQKmRWzUE6ChktVQ3ZEI4+bt7E1So
         LyI4gtggktfUO8rYw7C5CzfDXm4E9ERn1udzJ8Kw3Zw0j033XZhSzPOU0nyLiyJfN0MB
         mg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935549; x=1760540349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WqvDkSw2KqYGDX5nwqWxTk9V6PgPZ8rHUAzP3TxPgg=;
        b=OPRB8wQ5B5Y7NYw+JfNtUxUB1iGCAO6xjP3N6R9/pP+UHlPPxJRZbdk12PQmfEyOlX
         yPfC7VHXlMkQPbHTlW/KLH5GCrL0m3OITh7KouBLuDIYGB0D1en+OqM5+jn2piQYte9I
         i0a7U3mf1i/YaXGnwTPqX5egEKnlxedf/M/U02PE4s0zrMLtQK+EyzOoBGBMit4AZSO3
         9WaniOm+moO41PG5h5izMwxqTtqBC9FQjJ6vL+sAepV8vcZZlptx3Pkk9Sk2nZe9PzTi
         5xxgeYqXnN2M6OiUHDqxTVsZmlO9PDmx4OjbNfWS3NqcyGU7diNZgTx5JLJ9gYmx14Ug
         +qUA==
X-Forwarded-Encrypted: i=1; AJvYcCUFJNAknG4mRHJPD2En58qLwNfylzKxiW8VKGrpiR63xijhrvaYy6nIjwZtSLOEeUGoUA4ZqUkxjXA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3zpuKsixsiIoOa2R1oNLoudK13JtvgJd94rJMBL17rrxTtoN4
	f7AzwlfO+XJ7xkyq9qoI8CwwAH2Ah/0uqsbMsLg5L/+qc8x5R+Gn3fWpgDlZWIv9PLA=
X-Gm-Gg: ASbGncvcs8YmsRbPVUKfFRuSjpMr+uPCVMrtkremwiVQzKUbodHmnT5pLNL0KtrEF1h
	sW7gTG4NEg2ZFqjSISc9Q3iVIbmTLYavbPBT6LgdIXHSjfQuxti6uJkfNOOPzwHi6aqy/9T1J3g
	B8dfM2LiqMnmJUyyI9hdvNFibVS0gl/lLGDPtMQh+aAcpkmbQlswldft5MPT56qm759nD7Fcs66
	k3xri1H9W4KR7WkYVuLUNkRc80ixGmkMBALPUYQZ1OQYv4+Nr/Ky10CDw2xsL7YnykYfI7Dtxr/
	D79Ciwvug+OEo3UBb0U8lO8svxKRQznGYPm1nsUYmdwtdtOiruUHURnFAc9qXSsXDa0GSK1fZ11
	sjuKHQd61B+tc+FmUP4DAPye5vQ2SHAtvUdIX5atT10CRCy+dnaaPt7OgzOgsrU4AhGl4FxQ=
X-Google-Smtp-Source: AGHT+IFBSess4JhPzPnfqXQ4vaR52HMiQOJrNFMXBMaP94ew77X1V9umXx+wx/PFKR0AyuDpLcmESQ==
X-Received: by 2002:a17:907:25c6:b0:b3b:4e6:46e6 with SMTP id a640c23a62f3a-b50aa393beamr401394066b.1.1759935549398;
        Wed, 08 Oct 2025 07:59:09 -0700 (PDT)
Received: from localhost (109-81-95-234.rct.o2.cz. [109.81.95.234])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b4865f741f1sm1679808966b.39.2025.10.08.07.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:59:09 -0700 (PDT)
Date: Wed, 8 Oct 2025 16:59:08 +0200
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
Message-ID: <aOZ8PPWMchRN_t5-@tiehlicka>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>

On Wed 08-10-25 10:58:23, David Hildenbrand wrote:
> On 07.10.25 23:44, Gregory Price wrote:
[...]
> > @@ -926,7 +927,8 @@ static inline gfp_t htlb_alloc_mask(struct hstate *h)
> >   {
> >   	gfp_t gfp = __GFP_COMP | __GFP_NOWARN;
> > -	gfp |= hugepage_movable_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
> > +	gfp |= (hugepage_movable_supported(h) || hugepages_treat_as_movable) ?
> > +	       GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
> 
> I mean, this is as ugly as it gets.
> 
> Can't we just let that old approach RIP where it belongs? :)
> 
> If something unmovable, it does not belong on ZONE_MOVABLE, as simple as that.

yes, I do agree. This is just muddying the semantic of the zone.

Maybe what we really want is to have a configurable zone rather than a
very specific consumer of it instead. What do I mean by that? We clearly
have physically (DMA, DMA32) and usability (NORMAL, MOVABLE) constrained
zones. So rather than having a MOVABLE zone we can have a single zone
$FOO_NAME zone with configurable attributes - like allocation
constrains (kernel, user, movable, etc). Now that we can overlap zones
this should allow for quite a lot flexibility. Implementation wise this
would require some tricks as we have 2 zone types for potentially 3
different major usecases (kernel allocations, userspace reserved ranges
without movability and movable allocations). I haven't thought this
through completely and mostly throwing this as an idea (maybe won't
work). Does that make sense?
-- 
Michal Hocko
SUSE Labs
