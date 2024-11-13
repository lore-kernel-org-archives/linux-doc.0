Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA66C33CFC
	for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 22:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731537752; cv=none; b=Epv12MB01dDmDLzhUza4qwQx0PobwhveU/y7BjsOYhCR0NSQyyXDTQBd0HEvnVCCGREF+g3WyXxh7PXA0lQt8ZTpvJMMuvrxp9/J+Qz6NjnTugr2JtNj98Dg8v2UhcSZHEwpVwJJkHlGePpbM/MwZXfBKqUNVQ6Eu4KaVms+0hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731537752; c=relaxed/simple;
	bh=9pNOROf7TWR2JtIXPLrhkgnISjLpTD0sYz1c27sb9UA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qUABcjZhwYcUV719HVXqbLK5FtsfI39mLkPbRspN77+QPWSqDCVRxYFC8b+POPE/E6gyihRM228J7MaG4vI658N2YoCpurfpsph0cZZHnkp9xP1YNV9JOhU6LbVfkWS+87btuEtREgc/443GwjCTd7G0cqazR9yo/NQd9tpYJ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r0BRTHVH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r0BRTHVH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c87b0332cso7205ad.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 14:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731537750; x=1732142550; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ieehf+E6LMEA4ReJKxyD53FpolrCogZOFJkea/91AC4=;
        b=r0BRTHVHu02TqFQJqMnM+Lp6+CmD4WMpnWf53BBgInVK8eT6ZTYA8dHAKEJcwn9d1O
         BvacqPRgFhppIAfv2aZIe2DAoQ382H2d5b3sIwRlNLWETbBxM39WVaaboCv7VUJtrYor
         EPawi+T6kqzzT3Dhl8kmOj6Hu1AJArMcyV+mq04lxuyPnF+7Q6yyALN7QEIEq3N121yP
         Ukip6eVMO2+OjQUduGztBiPTSja4wHqbs95vAKrMRVcl5f+mFAvc4twFNwenKPNedg+Y
         ZDptKrHOTvCAJcMYb70X1LwOAlymme5zz3L0LUNBv20FRZL7+41Po7bHNstY6EFnwpmG
         3XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731537750; x=1732142550;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ieehf+E6LMEA4ReJKxyD53FpolrCogZOFJkea/91AC4=;
        b=A6x6a9Pk5EZhw7JBVq15RgoF1I9NEr8vJRMYMuXJwdRqwjuANMeQcg+pYN1YXmMScZ
         +53dy1Rp0U/rpevh8Rl7y/yUtLQ42GNYZk4F9sHWmjRLJleILw8Oo5UAQEFVzUBIfuYj
         TvJXgRJRhMDTM2NMHnbuysD/uB37sL9O60BKsk8iyFwTkSmOPi9vnzu+QAz7Di2J/U5Z
         mWfvawVlwFQpQjDgOcTf72/vDxUlkPXftO5tZiit2Avs0Jed8o+elnt6tSuTpfBjIeDS
         /Xgaiwa6oFt1+5a8bH4lPYKfxxI4unUr6TO53NZoofDlmjU++5K/fmeh/WbKz8Olv//U
         cKJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhL4Zwb4g1sXvBCb1lFdHRQ441Ec7xWkQ5JRJxw3FzEi+DXTrQ16NC340cgF2IcnFMcPZ5OwrOqxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbeqTNlNxWGej/tj+0hYW+2IwGONwzAB4Hrh/lJOttuiGtzpV5
	xHSOqGc9uFPWUELU2qGcuiJ0Hs/V8i/KB9NadgONssyojPHXW/l205wCremwPA==
X-Gm-Gg: ASbGncsDOW3FCSIs/4nVCFGs7CfuBkijuNVPXFevMyxwmQmNOYUi10wFl1peV/7K5B8
	8EVa/ixrZ9+/VCqI/20Dr2JjqUEAP3JlC2BltuDjjdj4fnEP3FdMO+jiuGxh1z6+jIMXNbZaYGv
	izpcLfs5yZnKtzi1VL+OwXILQV+siPPaNciAdtIx5beUmUe287Faf68nkrFMjTjaGFxjk3+C7GY
	VLuu9uYltz3Z64hJaIipbpyjPBCyvhCW1X2sXxRZlqpIC94/V/QZBpgI+yqqvUdz0Sx+9GlpqDd
	dLyD
X-Google-Smtp-Source: AGHT+IEEnqKMwGy+6M5UqJv9rrrpl3mUiwwjrWvoQVOQqROaho6ADPFiiCjrnLC1sQ4UdZv0xFkCzA==
X-Received: by 2002:a17:902:ea10:b0:20b:6c3c:d495 with SMTP id d9443c01a7336-211c369658amr254265ad.25.1731537750084;
        Wed, 13 Nov 2024 14:42:30 -0800 (PST)
Received: from [2620:0:1008:15:93ad:2d94:6e99:1a3c] ([2620:0:1008:15:93ad:2d94:6e99:1a3c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a18f51sm13753218b3a.155.2024.11.13.14.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 14:42:29 -0800 (PST)
Date: Wed, 13 Nov 2024 14:42:29 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
cc: akpm@linux-foundation.org, hannes@cmpxchg.org, nphamcs@gmail.com, 
    shakeel.butt@linux.dev, roman.gushchin@linux.dev, muchun.song@linux.dev, 
    chris@chrisdown.name, tj@kernel.org, lizefan.x@bytedance.com, 
    mkoutny@suse.com, corbet@lwn.net, lnyng@meta.com, cgroups@vger.kernel.org, 
    linux-mm@kvack.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v4 1/1] memcg/hugetlb: Add hugeTLB counters to memcg
In-Reply-To: <eb4aada0-f519-02b5-c3c2-e6c26d468d7d@google.com>
Message-ID: <c41adcce-473d-c1a7-57a1-0c44ea572679@google.com>
References: <20241101204402.1885383-1-joshua.hahnjy@gmail.com> <72688d81-24db-70ba-e260-bd5c74066d27@google.com> <CAN+CAwPSCiAuyO2o7z20NmVUeAUHsNQacV1JvdoLeyNB4LADsw@mail.gmail.com> <eb4aada0-f519-02b5-c3c2-e6c26d468d7d@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Nov 2024, David Rientjes wrote:

> > The reason that I opted not to include a breakdown of each hugetlb
> > size in memory.stat is only because I wanted to keep the addition that
> > this patch makes as minimal as possible, while still addressing
> > the goal of bridging the gap between memory.stat and memory.current.
> > Users who are curious about this breakdown can see how much memory
> > is used by each hugetlb size by enabling the hugetlb controller as well.
> > 
> 
> While the patch may be minimal, this is solidifying a kernel API that 
> users will start to count on.  Users who may be interested in their 
> hugetlb usage may not have control over the configuration of their kernel?
> 
> Does it make sense to provide a breakdown in memory.stat so that users can 
> differentiate between mapping one 1GB hugetlb page and 512 2MB hugetlb 
> pages, which are different global resources?
> 
> > It's true that this is the case as well for total hugeltb usage, but
> > I felt that not including hugetlb memory usage in memory.stat when it
> > is accounted by memory.current would cause confusion for the users
> > not being able to see that memory.current = sum of memory.stat. On the
> > other hand, seeing the breakdown of how much each hugetlb size felt more
> > like an optimization, and not a solution that bridges a confusion.
> > 
> 
> If broken down into hugetlb_2048kB and hugetlb_1048576kB on x86, for 
> example, users could still do sum of memory.stat, no?>
> 

Friendly ping on this, would there be any objections to splitting the 
memory.stat metrics out to be per hugepage size?
