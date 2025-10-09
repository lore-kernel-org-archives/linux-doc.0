Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DD818859B
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760023802; cv=none; b=kuJo2mFqTZ7UrUsFFMEjCqr+R+UeURTK+D4xVEJmP5qcex0LSL1/Zi+QWKqiDmhxZ7mR5gp4hS/c420Rpm/IItorvl6jayu3amgQRRH8hMrA/O8wWLEWsQS/IaCxDDW759IIKDdvTu+oHs3aNUoMhvwGVgQ4DWYFN5r9+DI6D7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760023802; c=relaxed/simple;
	bh=gd5cjc2YDQCWkA8evLBN0VUFvCTfmbJVeE9I3tDWPk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0HatgJ3fX9nooK437zGirnx/b2eXEQuZpOHmBYPA3wG9cgbrnV+1zVlBXnhdZcgezNMZiSEQL1LgF5tnUJO3O0ju2CQ8nTKoCx+Xr9zNbD4NcVyVq8k4GArvIDg14ucwCnM3GDvJWGPjMXIlFVmUBPvT8uovIzeE3rYbWdRqWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Ld4G2DyO; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Ld4G2DyO"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-796d68804a0so13940156d6.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1760023800; x=1760628600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5KXAYePP4BLP0oPw4Oo2yec/zLTGELhv7tKRSHRmraM=;
        b=Ld4G2DyO0tepnMs45JoXCcL17nkacHSQL3Lh14ZisIFERpBxhy33A9XOHu6e7ezDQ9
         XrQugbSNGmT5m7cBOEUG7uz56OlLT52nKTLYBGZez6ZIYNSJeVL44LBra5NauLPXqou2
         wo3tgCU2ztH7cAFuWqwAE/VQqNEwEEdyLTvMjeFSPqap1SJYOoTmjRPP1Jnbzag2DbU/
         mRbdybrhI8ztX/7VHJAep/4uE4oZXHFNxsHwTSILJ7NHikPVOJS7PYAvWEzeU+DkqMSJ
         NH+VkfDLhWPIuzZAXcGEgF1Um2cyOzM3eqLIWTr1ysXT9bvmHGwY5UO/enkVl220dhh3
         i33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023800; x=1760628600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KXAYePP4BLP0oPw4Oo2yec/zLTGELhv7tKRSHRmraM=;
        b=sAQY8t82nJdbBoiYRkEbKhRkb5c1RkCgz+dU84dpdfWhvu0i3fcSYAt7uCa5r/GUrp
         AMrnkNSEvGzEXhOCydQP2nzxOlZmjMhMqrwehIlca3WF2MD8N3jQL29bS7EB6o8PUd7a
         Z16KYstS42iGtTopScV6/VqjAnRAhvBd46uKwtkkrWoiB6NvCR7urS6uYE5AtqJNAZcI
         va2jWcwvkhow04OrMxK4GfdHCz9PQdFv2nDCVcSk4BzAdPSM28V+Biqz8F0YrjPQBzgL
         yH+YFd+kI0FajxvD0FcZaQrlQdahv+EiyQ7zVLAvGflr/2vU6P6nYj/RtzJaXAFs6uPm
         xYVg==
X-Forwarded-Encrypted: i=1; AJvYcCW+lIy5pnZu2fyNJX/qQe1udxrlkvDIZo6v0lPBZygxsW0BtDz4gLuBENreoGlX0oycd847wMzByrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkD+rFn0XIgVjkC5wg6DBznqLmUkQFxYnsp3T/EdNPa3vhkM+y
	qPBmo2gOzPc1QLRCKeiOQwF7EsAdr+CyEKXV63ZV/Z5rBUF85apHVmAUMg/q61EaL2E=
X-Gm-Gg: ASbGncusaNnqAEVfNzlTKgZm9MrNkFS6MJ+PF++BFqu8Cq2cAnmi1VqWwTEEimd77n8
	9RUUQ4KjNI9SVGJmdDI9MF/ECkBs37tvgDY9PH926qMeEvcaGP26qSsp2AWUIYYr5qU6zL26PE5
	4LvC4Xd1FtK9P34XPSVtgDrGjTNsVDBtnXdIT6+mzvcjkrZcXQNen5mKXlIm1HZlolUho1y7od7
	MGpeVdzk/Qossj2oKiIqYvCmerzSajXagwNylXGEmgVovOH0ahtMKsEO++an1rv70swNCSQjIYG
	Rf084Szy2Yod2WhdXWVYiG2PM7OyMG5l0H//AnyW6OYe31FIekURF3wbCzaicrlzr9Uku6sM572
	vM9DB+mjN0pgSNK7+m1r8SlODvZSgd+8wT/vve6oO/4C9F7LErkKQVNh/UDinCez+NBA8+djG3v
	Ab4cSxOCdMQ3NP65eORIkyYzJagpDB6Q==
X-Google-Smtp-Source: AGHT+IFdgTVH9uyu/5o64basHMKsbAG88LBs1aBY1NSyzfZE3IVT45kHm7IlO9M72p9+htOIi0Mntg==
X-Received: by 2002:a05:6214:29cd:b0:772:4853:48 with SMTP id 6a1803df08f44-87b21002ac1mr103016176d6.8.1760023799963;
        Thu, 09 Oct 2025 08:29:59 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bae60c89sm179458576d6.12.2025.10.09.08.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:29:59 -0700 (PDT)
Date: Thu, 9 Oct 2025 11:29:57 -0400
From: Gregory Price <gourry@gourry.net>
To: Michal Hocko <mhocko@suse.com>
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
Message-ID: <aOfU9YTKMPWzYOta@gourry-fedora-PF4VCD3F>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
 <aOZ8PPWMchRN_t5-@tiehlicka>
 <271f9af4-695c-4aa5-9249-2d21ad3db76e@redhat.com>
 <aOaCAG6e5a7BDUxK@tiehlicka>
 <83e33641-8c42-4341-8e6e-5c75d00f93b9@redhat.com>
 <aOaR2gXBX_bOpG61@gourry-fedora-PF4VCD3F>
 <aOdSvriKRoCR5IUs@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOdSvriKRoCR5IUs@tiehlicka>

On Thu, Oct 09, 2025 at 08:14:22AM +0200, Michal Hocko wrote:
> On Wed 08-10-25 12:31:22, Gregory Price wrote:
> > > I'm not quite clear yet on the use case, though. If all the user allocations
> > > end up fragmenting the memory, there is also not a lot of benefit to be had
> > > from that zone long term.
> > >
> > 
> > The only real use case i've seen is exactly: 
> >  - Don't want random GFP_KERNEL to land there
> >  - Might want it to be pinnable
> > 
> > I think that covers what you've described above.
> > 
> > But adding an entire zone felt a bit heavy handed.  Allowing gigantic in
> > movable seemed less - immediately - offensive.
> 
> The question is whether we need a full zone for that or we can control
> those allocation constrains on per memory block bases to override
> otherwise default. So it wouldn't be MOVABLE but rather something like
> USER zone.


Mild ignorance here - but I don't think the buddy allocator currently
differentiates chunks of memory based on block membership, it just eats
folios from certain zones/nodes.

I'm scratching my head trying to think of the discrete mechanism to do
this that doesn't inject significantly more complexity into the buddy
allocator.

Looking at the recent[1] THP support for ZONE_DEVICE, I wonder if we end
up with something more along these lines?  But this aschews the other
requirement of wanting the memory to be otherwise general purpose.

https://lore.kernel.org/linux-mm/20251001065707.920170-1-balbirs@nvidia.com/

ZONE_USER does feel like the most natural solution.  Literally just
(ZONE_NORMAL - GFP_KERNEL).  This might need a new GFP flag for certain
use cases like KVM (GFP_USER) to denote certain "This isn't technically
kernel memory, but it needs to be pinnable".  That would slot right
between ZONE_NORMAL and ZONE_MOVABLE.

Alternatively we could go the opposite way and introduce ZONE_KERNEL
below ZONE_NORMAL and disallow GFP_KERNEL from ZONE_NORMAL - then have
strict watermarks on ZONE_KERNEL to ensure the kernel is always able
to get memory. 

~Gregory
