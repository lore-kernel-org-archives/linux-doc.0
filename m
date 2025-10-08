Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4192BDC3F
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 16:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759941094; cv=none; b=USkkt0hRVQA5fUiudekhas+lwz8lzK8t2RcXLDOjh5V5S2H91vm5P8TihQd2X6X3EO/3eq3sRgstAlZt+Ox0Pc1FVV2IUQvJE3IkiW0p+2LSwu94RP6/PP7Xc1PCLm1WBAJ7AxWFyNoOypm/tl7WaQdPonFDN/pdPnak6rF7hTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759941094; c=relaxed/simple;
	bh=TrrcF9VvlM8y9jx1omUO5ImthqYGOXo9CnJHYDJv+EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePCKCR76X8QQSBQg4p4EQB9gce7qznzFtICYvOsdSuou59Pl2oB9DdZLARyvr1sQPFsfv07KCZxh/DdW2bCDq7LLxwpgzJ/q3F1Qpqc6qHJ+1j5wp2R7dhj0P6Eqazdy7QKehp9p3dr1zxI/pQMGRzSMXp0tNx4uFxCSJtYV/6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=iDe2rMBX; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="iDe2rMBX"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-7946137e7a2so1358546d6.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 09:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1759941091; x=1760545891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ftJpOb1xcFQZv0a+i4an7Jz1/tLAQUsdU9C49sUWsFQ=;
        b=iDe2rMBX09JK/cWe1mBG1zkqxU4offe1BTAqI0yHNJUHw3J2IQ/AIv1AT1COEvZknJ
         ejs9ff7yomtDtahoyBkqAT62QZmyrCCw3Grd1keLJmtmcG0MrtXETLPC0UHLKeU0CjSc
         eCac2K4ukaIxkcDqgOAOWNdlXXwlpzbozPOiExDCWD1rhE/bazxT9BvPxXixRQFLY3+7
         c/XklO6oW4Yy9ykErYUA3q7BdNDdk7aigwbD1rJQi0LQv3O9++K+Nc++XT6RE2H5qQqP
         PLmX950VlPUcli2LeI3d+sGhX1LBasUbGeasife326AbpTbebAn8hswb2MPpFZcRntpg
         cXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759941091; x=1760545891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftJpOb1xcFQZv0a+i4an7Jz1/tLAQUsdU9C49sUWsFQ=;
        b=uJ81vf3pU/6oumHaZZhVzXlq8czRhYvpYT3A2ZAbvDNxkmeX3ETvBIiajRTfEuZJZw
         fDa6eITayp0VnijorLM26xhPVnBMVc6O3wT3oO2mTF+jEE7o+EK1VxyOd887VH993EQZ
         FG/BQybwO5ZkxLokDAyKkNKaGUi+WJZvu/+usx4E2FxGQtI2cwQ6yNFn2SFUaFqD4NMa
         SudanJMml3euFppL0XOGaWT0laZ40eGTiUIKxcHeBmK7TLq0O8DS/PIbgVi//HiVl9dN
         HQ1GdGsfnIpm/0H5JAm8yabbelbw0RZEp3gMDpvo2y0pOcBQQ51YlwglCVuoh1iZSbmB
         wCUw==
X-Forwarded-Encrypted: i=1; AJvYcCV0hjwye4UfH4DYS+eEe9cLOVjA3IdQy0UgqsBcYnaEd7R+uxq1qhlL70+eJNQ9hOJoVfUc7ROxezw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykf2Q5ICM2GFPIRwwRLoP1/3z/HLYiwzJMITSp/HpoBkjjarNk
	dtTu2YBjVe1qTHtiGH3u7UCdExaav1MlyPrRzqvNLyuLbYNfxf2RVMoCCleAVCUIwsM=
X-Gm-Gg: ASbGncvfjfIpoA0b8Pros/opn26DB2PHkWD1JXoMTtwjFxHOX9FNNySsWFXXnq7jxIf
	xMaQs5rAt2HwUbI0MXSOV6QUVqobB0qf65KFhLK1X7aAQKcV+vcQHPUcgzjff6Jn9or3FTpnTbX
	1lz6x5EDlR/ACwbWiZy6ZSo+iX/4mI7erKTLc/JHeapAInLpwXN6YNXKCNZHJPiWDgK6SWWEWe6
	cwYBPdAbXUOKqx16p+BevsU/O88A/8ct3bK/wd+hOUWtsRMAScRcuBx8vHP++dmZ+tLYdeockZ4
	aS0VeIn1bb37ZsodGio7c/vG4xtv9DdqCqG0R5UYsllpvnW89r57rYxMLDU7shlAFvYvis/7dJK
	eV/sjTsMAMpYZHUt2R4PvHIlxJHYEElbmJcRSA6L24CNHfmHZ3o5OdjOMuu4bIf6RZES5eNOwEV
	uCIyZd7tmb5qQnZJ5rqbyHIJI1RBF0v330lA5BDL/81QG3DDYoD9w=
X-Google-Smtp-Source: AGHT+IH3li9YLOy2HwLU9l6NJx1hAvZugBHxS1HCl35MSzFjO8cle36MgAd2/H/V1sd72ii7wdm6jg==
X-Received: by 2002:ad4:4ea6:0:b0:73f:a7c8:980b with SMTP id 6a1803df08f44-87b21001056mr61864846d6.4.1759941084963;
        Wed, 08 Oct 2025 09:31:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bb446e8esm164513976d6.18.2025.10.08.09.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 09:31:24 -0700 (PDT)
Date: Wed, 8 Oct 2025 12:31:22 -0400
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, corbet@lwn.net,
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
Message-ID: <aOaR2gXBX_bOpG61@gourry-fedora-PF4VCD3F>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
 <aOZ8PPWMchRN_t5-@tiehlicka>
 <271f9af4-695c-4aa5-9249-2d21ad3db76e@redhat.com>
 <aOaCAG6e5a7BDUxK@tiehlicka>
 <83e33641-8c42-4341-8e6e-5c75d00f93b9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83e33641-8c42-4341-8e6e-5c75d00f93b9@redhat.com>

On Wed, Oct 08, 2025 at 05:43:23PM +0200, David Hildenbrand wrote:
> On 08.10.25 17:23, Michal Hocko wrote:
> > On Wed 08-10-25 17:14:26, David Hildenbrand wrote:
> > > On 08.10.25 16:59, Michal Hocko wrote:
> > > > yes, I do agree. This is just muddying the semantic of the zone.
> > > > 
> > > > Maybe what we really want is to have a configurable zone rather than a
> > > > very specific consumer of it instead. What do I mean by that? We clearly
> > > > have physically (DMA, DMA32) and usability (NORMAL, MOVABLE) constrained
> > > > zones. So rather than having a MOVABLE zone we can have a single zone
> > > > $FOO_NAME zone with configurable attributes - like allocation
> > > > constrains (kernel, user, movable, etc). Now that we can overlap zones
> > > > this should allow for quite a lot flexibility. Implementation wise this
> > > > would require some tricks as we have 2 zone types for potentially 3
> > > > different major usecases (kernel allocations, userspace reserved ranges
> > > > without movability and movable allocations). I haven't thought this
> > > > through completely and mostly throwing this as an idea (maybe won't
> > > > work). Does that make sense?
> > >

I'd also considered something between NORMAL and MOVABLE, something like
ZONE_NOKERNEL or ZONE_USER. But that seemed excessive.

> > That is why I called it user allocations because those are supposed to
> > be configured for userspace consumation and planned for that use. So you
> > would get pretty much a guarantee that no kernel allocations will fall
> > there.
> 
> What could end up on it that would not already end up on ZONE_MOVABLE? I
> guess long-term pinned pages, secretmem, guest_memfd, gigantic pages.
> 
> Anything else?
> 
> I'm not quite clear yet on the use case, though. If all the user allocations
> end up fragmenting the memory, there is also not a lot of benefit to be had
> from that zone long term.
>

The only real use case i've seen is exactly: 
 - Don't want random GFP_KERNEL to land there
 - Might want it to be pinnable

I think that covers what you've described above.

But adding an entire zone felt a bit heavy handed.  Allowing gigantic in
movable seemed less - immediately - offensive.

~Gregory
