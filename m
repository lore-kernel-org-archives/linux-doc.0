Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B776801
	for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 05:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731561993; cv=none; b=VDPmve1PrmNEdH+WaWvwSLgrgsVe8UMH7vDOr33F7+8N9kNQ1+KcCkCDe7a9+B3IiFru10MDH/+x6Yrx9Pc4TZBm4uqI4rq9DCGyMkKBUI4sB9kbYsh1yDm1/lwGmUZKL/C0xA6EHqGU2hxxO76DK29HBNL3J5jh1dpmFyGLCuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731561993; c=relaxed/simple;
	bh=odCtyuGSP4U+xEd+Bqh5yu6A9Sz2dMhnPQQcNOnq0gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s49nBEY9pGW8Zyi+sOX/jPArlnJwczxjUGsxMCb0oc+8Jlil9vhm7TzKkSqPItXi5krb6CwD9SqQS39EXkgb61uZKiEEruk4Obg3tH04iMeYy7vUdyI16GqHx1lv2qwkRkR2V25Ls9aO4gU6vIOSf9xOD136R4SHDMYxndIlHdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=3Wlcm78j; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="3Wlcm78j"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-460b04e4b1cso1393221cf.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 21:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1731561990; x=1732166790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ct2KdI9H+NQ3tYLhkxmYVmA9Qvc093HJhW861qh5z9M=;
        b=3Wlcm78j6MK1r8uuUGzwe0e0n9qgxWTumA2MbwKn7XSmjgPoXPNxAtZffyDQKFBxNk
         q9SI1UzDM/qKg5BGsSFTEkDlz9ysT1kx74B+/Mhl1S9KhjkKccCpECjcv0uYVXmzvSqO
         qlRNJ+fOy67yl7lZ9De+pjgw0Z7PAEAwVkW1WAsy9eEFaVzUZ2t8c7QIQrAr3uKP4afS
         2nXaZrwxRTleY9K7xBjqwAgHrsRtCda5VCqXUhVUNvpDReZoTzJz2hsHSFUQh3ODwb3X
         7WPCpvXTCseMW1Y+hd8vR+f8hMWpxpsK6RrppCeWSnGgP7tOX6OlY4TWsq5Ols4gdYZZ
         N8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731561990; x=1732166790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ct2KdI9H+NQ3tYLhkxmYVmA9Qvc093HJhW861qh5z9M=;
        b=IIsTZ5Wo/BYtjFC3tUEUHXHyP/6jl8tdDK7gM77gTKATN4WlV5Grv5AQY43C4hehNW
         RVr9Lg86GKIYIDPV5qnD+gbfCJ21ldZF0SpYZbiiMZvT09n9xBN0fGgm4cFyJO8gVqHl
         6Ysy5A2x3WUpd/j6trbG8FHJFFVykQiZ5gDN2jounGWKkQmUDnjYRusTR3LssxdUFBxC
         tjHrjtPKrk8p1vwQJWZu4NpR5L1V8l9Or1zpoZpWxT3iIURHXYavs28/1Q328WJnwvwT
         n8TM7A49D6vA+BYiQya3tP3YPhNBVXToMnut+mfus6KO0gU4Ph6b0FLoTGWyEK89h+7L
         aHLA==
X-Forwarded-Encrypted: i=1; AJvYcCXetBkzgjatIz0R8oZQZGSsvUOEqDmG9G1FneqQ+6076Fn/Xpsu3O1TlHeh9rXfZmWnnxqs6pJl0xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzghXL4bwWQACCSyGX+6q3ilqNfOqPpB3o82UddCy0gS6WfTdEC
	3gOuqK97qAHAZgfIIhmiUxj/orHPXWjHC4DVCcoVcSfQpBf0LHzprXzCw13QwvY=
X-Google-Smtp-Source: AGHT+IG0/Yi9jDXoMe4SbQutAeX4TmKNmVpk+ce0gjUbWlJ8vwuEqUnLIYyO1WfPbeVRkHQmWS0XzQ==
X-Received: by 2002:a05:6214:54c4:b0:6d3:5265:608c with SMTP id 6a1803df08f44-6d39e1077e3mr287671706d6.3.1731561990274;
        Wed, 13 Nov 2024 21:26:30 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee773212sm1858856d6.2.2024.11.13.21.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 21:26:29 -0800 (PST)
Date: Thu, 14 Nov 2024 00:26:24 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: David Rientjes <rientjes@google.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, akpm@linux-foundation.org,
	nphamcs@gmail.com, shakeel.butt@linux.dev, roman.gushchin@linux.dev,
	muchun.song@linux.dev, chris@chrisdown.name, tj@kernel.org,
	lizefan.x@bytedance.com, mkoutny@suse.com, corbet@lwn.net,
	lnyng@meta.com, cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v4 1/1] memcg/hugetlb: Add hugeTLB counters to memcg
Message-ID: <20241114052624.GD1564047@cmpxchg.org>
References: <20241101204402.1885383-1-joshua.hahnjy@gmail.com>
 <72688d81-24db-70ba-e260-bd5c74066d27@google.com>
 <CAN+CAwPSCiAuyO2o7z20NmVUeAUHsNQacV1JvdoLeyNB4LADsw@mail.gmail.com>
 <eb4aada0-f519-02b5-c3c2-e6c26d468d7d@google.com>
 <c41adcce-473d-c1a7-57a1-0c44ea572679@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c41adcce-473d-c1a7-57a1-0c44ea572679@google.com>

On Wed, Nov 13, 2024 at 02:42:29PM -0800, David Rientjes wrote:
> On Mon, 11 Nov 2024, David Rientjes wrote:
> 
> > > The reason that I opted not to include a breakdown of each hugetlb
> > > size in memory.stat is only because I wanted to keep the addition that
> > > this patch makes as minimal as possible, while still addressing
> > > the goal of bridging the gap between memory.stat and memory.current.
> > > Users who are curious about this breakdown can see how much memory
> > > is used by each hugetlb size by enabling the hugetlb controller as well.
> > > 
> > 
> > While the patch may be minimal, this is solidifying a kernel API that 
> > users will start to count on.  Users who may be interested in their 
> > hugetlb usage may not have control over the configuration of their kernel?
> > 
> > Does it make sense to provide a breakdown in memory.stat so that users can 
> > differentiate between mapping one 1GB hugetlb page and 512 2MB hugetlb 
> > pages, which are different global resources?
> > 
> > > It's true that this is the case as well for total hugeltb usage, but
> > > I felt that not including hugetlb memory usage in memory.stat when it
> > > is accounted by memory.current would cause confusion for the users
> > > not being able to see that memory.current = sum of memory.stat. On the
> > > other hand, seeing the breakdown of how much each hugetlb size felt more
> > > like an optimization, and not a solution that bridges a confusion.
> > > 
> > 
> > If broken down into hugetlb_2048kB and hugetlb_1048576kB on x86, for 
> > example, users could still do sum of memory.stat, no?>
> > 
> 
> Friendly ping on this, would there be any objections to splitting the 
> memory.stat metrics out to be per hugepage size?

I don't think it has to be either/or. We can add the total here, and a
per-size breakdown in a separate patch (with its own changelog)?

That said, a per-size breakdown might make more sense in the hugetlb
cgroup controller. You're mentioning separate global resources, which
suggests this is about more explicitly controlled hugetlb use.

From a memcg POV, all hugetlb is the same. It's just (non-swappable)
memory consumed by the cgroup.
