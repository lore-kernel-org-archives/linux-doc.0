Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CB32750E6
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 19:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953560; cv=none; b=rkbkeLWNrrEb2q4aUL5xYDHE3jVjNMw8ifTeBSS1EpXXygblyVj0Re+WbdukomYaInYv6DHqOUhRaWELfcCxNWxjGjvF3WPFawOfcGX4mVHLBazUrEDOeu6Onnv0U22w/LXzKyVQApGh5FtCaAUI3c85wpCt6/tTlwhfeLHrBdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953560; c=relaxed/simple;
	bh=6nsqwikc+gppKx465Dsw1tXk6ea/s3IqiQajcjH9T4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2SbreDiFkZVeEGyH4M3ykzXtNxvtlPvecoKEqI3px09waa/YPcRRy1KzRMIUHCxEwMt4la60oV/ahfWpKUGA/FVn+YVjp1RKD2wX6+4Yvsd9DPSxgwDikOHmcKYke3kx/AIerK5BqS4y3l1fjH2uVviWKhVX/7Dau22Q8i4G2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=N+n3DIOc; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="N+n3DIOc"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-80ff41475cdso3747506d6.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 12:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1759953557; x=1760558357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bQgR6a95356dPsVrbrUk33Cag4UDOjeL50G3GytdiSY=;
        b=N+n3DIOcwQMmr6wsL4trcAinkaO4Z8aBNw4mXByxjiNwYRd5zoqUSnFQHUw/3nvAGs
         DFCGPHRHORqcB8DfHme7WG8stuRnx1TSYyQAXGD4ofWx5MgB7jSlP6koMKcMJBMVyBsU
         /hsyP278bFXx3s6g7giWhC7I5rk+1uvsVDT5Fp40P7daHPE+jH754CtoTfkPieKqV3kM
         tF/piJYoUVWfkDVh38jkZvt08KZrLfCM3KNW1yvBJT6S6Y8CeyGaebWxMjFyxNt01uWi
         vqv+894/xf38IQcNCTGTZTfNqHIoNmZf0ovu/RdIm2uGBLP3aewB0KE9jRs1Apy3d6qO
         XJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759953557; x=1760558357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQgR6a95356dPsVrbrUk33Cag4UDOjeL50G3GytdiSY=;
        b=nXIVd2untrgmrToxahUs91LYyYa6+0ohA4T/nRJJmorsGx/VuAop5lfD4kM0SGMJaZ
         JGp7XrAYvGau0YfnYqIo986b0jfvBVip/+H//LbU9MZ3fDS3W8zVIEErmB2vvXjfBlQQ
         8WvRowoIEAh5kCA5Ce+JqpH66bL9x2QpkEx9bQ39W6Z0uJ5cFcuOufMU+Lh1UA7D1mal
         R+3amLFHWVIbv+fj/RkE2vw3o1csc4+dehWKMDafe4wKcY0DxVnMwaLqQsUcUg6taeAv
         qzqTrpGJhbfzubmOKCrNmG5+TNak/jGEQJAoThW8zsOOcKEOloWOBRmdM4Hm3UwJfLh/
         T9+g==
X-Forwarded-Encrypted: i=1; AJvYcCW9i7Q8YtXAbtXMJ+VtBv/gd2mAk6qZ+xwhcaWh3X2HjOTbcCbTDO1xV+2YeSmCRtjM/CUgjRmByqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YziN3/NE3ZAwf4A43OkSxQsw4EJInxLd9/zteANYHXYAa8moh4Q
	pUtOhWmgJeu2P5KfUmZQ/Rip3tL4QVgHE94RBvYJElGTCMerwEYQPol5RTo4MIr7YwU=
X-Gm-Gg: ASbGncuBNG68sSyHkVUvcKJpGR/JHAvMPLlHhgV1LBd5y0/QbBm2/Z4yl6Zkr1Qf0Ki
	Xa9jCncnsH4cWQrdgR0uua6qHAUzaT0P5WwF3YP92Rx9xWGLuW9Hw/rk5290+MGNcVhbIMAFY9X
	uij2ZDreBRFi/9XkmxdM3WBDxc/6uZRjxEzlOQIE/GFTUB9vrVa3W1ihh9xCVfKAMZwcx2oRJ/i
	zFBz23GoBCpobi1dzM80faue5/+cvHjxvnTxkq6RiZv2rxpspwiWBZ85VPYteoMZBhI3FdLCBo3
	dbc/omXVJudlqPsykpeVMtHiFQwpIWW3DbGqQ4gRfQDdfGpTFRjYJcJ159RyadYBMAejXx8t1Sj
	7QBRQf9MElDanDooJ9GNB6TBG6J09r2Eg4oyLuYvnowOjOh+JEeBgXWd1pdRohieLBeXZYLcgWd
	2fTkxwypxuxA45mlj8K+ZDAVlXxk5DwT58+8KgNm2d
X-Google-Smtp-Source: AGHT+IGOIjFNFX0UWzmMPfhHtuIlkaHHvw+0tGaxRx+44ltIOKx7Dm5ffks6WimcIFao6ap2lPWKnw==
X-Received: by 2002:a05:6214:410f:b0:77e:aba2:c8a7 with SMTP id 6a1803df08f44-87b21000e61mr61430946d6.13.1759953556821;
        Wed, 08 Oct 2025 12:59:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878be61f6bcsm169735486d6.65.2025.10.08.12.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 12:59:16 -0700 (PDT)
Date: Wed, 8 Oct 2025 15:59:14 -0400
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, corbet@lwn.net, muchun.song@linux.dev,
	osalvador@suse.de, akpm@linux-foundation.org, hannes@cmpxchg.org,
	laoar.shao@gmail.com, brauner@kernel.org, mclapinski@google.com,
	joel.granados@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	David Rientjes <rientjes@google.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable
 sysctl"
Message-ID: <aObCks3bwrT27CIu@gourry-fedora-PF4VCD3F>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
 <aOZyt-7sf5PFCdpb@gourry-fedora-PF4VCD3F>
 <f4d0e176-b1d4-47f0-be76-4bff3dd7339a@redhat.com>
 <aOa0UPnxJVGvqc8S@gourry-fedora-PF4VCD3F>
 <b6d472ba-e6cf-4c96-935d-88c842ab3cd8@redhat.com>
 <aOa_A_i1HUt1wzCj@gourry-fedora-PF4VCD3F>
 <1763f0d9-37fc-4c3e-b31b-2cfac33d5c95@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1763f0d9-37fc-4c3e-b31b-2cfac33d5c95@redhat.com>

On Wed, Oct 08, 2025 at 09:52:09PM +0200, David Hildenbrand wrote:
> On 08.10.25 21:44, Gregory Price wrote:
> > On Wed, Oct 08, 2025 at 09:01:09PM +0200, David Hildenbrand wrote:
> > > > 
> > > > fwiw this works cleanly.  Just dropping this here, but should continue
> > > > the zone conversation.  I need to check, but does this actually allow
> > > > pinnable allocations?  I thought pinning kicked off migration.
> > > 
> > > Yes, it should because longterm pinning -> unmovable.
> > > 
> > 
> > You know i just realized, my test here only works before I allocated 1GB
> > pages on both node0 and node1.  If I only allocate 1gb hugetlb on node1,
> > then the migrate pages call fails - because there are no 1gb pages
> > available there.
> > 
> > I imagine this would cause hot-unplug/offline to fail since it uses the
> > same migration mechanisms.
> > 
> > Worse I would imagine this would fail for 2MB.
> > 
> > Seems like the 1GB limitation is arbitrary if 2MB causes the same issue.
> 
> Yeah, with hugetlb allocations there are no guarantees either. It's just
> that page compaction / defragmentation makes it much less likely to fail in
> many scenarios.
> 

Gotcha, well I am open to suggestions.  This chicken bit here feels like
a sufficient guardrail, but I'm happy to explore the ZONE discussion
further if we think that's fruitful.

Joshua Hahn (cc) did privately question whether zonelist ordering breaks
for such a configuable zone.  If memory can't live in ZONE_NORMAL or
ZONE_MOVABLE, but you want it to have some combination of attributes
between the two, it can't also live above ZONE_MOVABLE I don't think.

~Gregory
