Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2571E9B29
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738259212; cv=none; b=Il1RW17yzY3P01s2F7+7Jo2KfmcEv7bAPw8sMnwx1l5RwbesOJ8r03chMpOfX+bMq7rNWGoebz60ebMBqtn5F8pZLJmUg/Poz550MX84pJXUSffaI/1DFDqxWeWZ8t7wxQLZGGvMS0hTjlhl5xD2qrz1WArcs5LJCYTMATLfBxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738259212; c=relaxed/simple;
	bh=ogl1Z2kVUAuTJ+ak39fztfgetEJPSLa4WcOE8DCy6Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgY7NJem1eFPigSZjAEJaM1ltiy1YRDmkWlD+AMlK9c8YMphGPQUqzValiuYgYuRcJZ/qk6Ie5aqpzUzLUxYSUK2V9vCNpF5+s7xYie+wFiAF1M0xUKYOzKI49Eedvlh/Fl7TXeqhpf3/qULDjn5ioOazHoVXBbSzCPRx4Y+nHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YZi+b1a/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YZi+b1a/"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab698eae2d9so222196266b.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 09:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738259208; x=1738864008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5snQbJ38VvBoZa24EBcVoHQPXCYbY/0kZ4L1ZVXjM+M=;
        b=YZi+b1a/jON4BqrLs+ezTnwhL4NgdofSHfrgK+qvtHjDe/ds4mBOY4KYiBBJjXGk/U
         bnQiViaEr7fhHnK7l4c5RvPUAn+IisHW63N6LiLzwooImLYdP5JoPk6IP/w244JK/DTT
         qUFTiOGMxxkcwoBk/7H4LKfv5epKt88UvvlRPLu6D67/qKB7jCjR7Z8twLUBmz1Kjt3D
         AjDDNgCNa75BiyEvtzDkeEnCasLMT/Gwm9qV9PZCFLoKbPC66DG0HrmlPxnXjYZx8XWw
         MTQRJuRotDeuaEi+3NrX60/boLoXyHvVt2a1yEVf5AGr+fqTMxmaLivS6ON4lMqAt+au
         rQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738259208; x=1738864008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5snQbJ38VvBoZa24EBcVoHQPXCYbY/0kZ4L1ZVXjM+M=;
        b=Yc+BKE0f5xXMP1cyNhEH70A/2FpSig3tegKO5LZ5Bq/DQ8egupDizO8q746Ia9AKJR
         DY2x9yXu4jCN/xex+xvV+hNlEjighnPLaWGQYbOnIQt88x9e3tRRs/IVHNamLJWZqasV
         lQeb06kYTsJuazh0kfNL8YbYXT45lpklxHJ5vYzWOv1Lo+3VzLad0Ugrn9fw9W6yPe1R
         nY4jwjPsw/4rXTq88C/LSAu5+L3cssOFVvU6NtIObEmjuxkopCLj8HEKc6XFdv53+dxV
         dqf/skzOh3CbK9NHN1y/MyxipTHcQiD2T/nFnb0NDzvh6R64RAy6epgJjK7YSt2sMH/d
         NsEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/WyDQZdjHRNZ6J3Ljcw3OFXZXdIiCuCIepaSLBMFB5DEowcMRbYHlPPFGrYBoe5gy9jxJ68hgKhc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrk/5P4vk9d9CzNkf7yLRPNF27VmFWNinUXbdvncee/C42y8rm
	81jZH2VexmQHpqvxKl6z4EX1jNK+kIvA84NDZ1xjk/wtI38adJC4UmrqbCjAb6g=
X-Gm-Gg: ASbGncuPUOytXN5/79xyEmCt1BEOSkOGmZ2BIBikzpTzYfFw7W5DWAvM4S2tD26SvHq
	IQDQhdgeE7QVi7GjDixqPu9UOBJ3M9ADwCnVHMHfen5QdRboMoi50pTL8Kyzc0WgbBTBgBk+CN/
	c7Ggk6V6KGqYtYJMO0IN8bl/Nrx/8j+RMw8uus+eXWe1bzYhVlW2Ar13k9XubiGspTRYJmiCvgF
	Ajv5r342XxEumzg+Rcx3/uPipbCBieKOcbSmbKLoJ8t2zAg84NTZlOB5ZZax9MGEKCSbzqEDIZR
	iuUr0zqpMxGqo5mElT4iN12pJQ==
X-Google-Smtp-Source: AGHT+IECYjOfJz2tOjzTqFxLsspzu/nakrwmV49yfXfMxCTrHiIH5vR5VrgKigD70NLDeXJhSYb9BA==
X-Received: by 2002:a17:907:9726:b0:aa6:b473:8500 with SMTP id a640c23a62f3a-ab6cfda4249mr845523666b.42.1738259208184;
        Thu, 30 Jan 2025 09:46:48 -0800 (PST)
Received: from localhost (109-81-84-37.rct.o2.cz. [109.81.84.37])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab6e47cf883sm154114966b.49.2025.01.30.09.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 09:46:47 -0800 (PST)
Date: Thu, 30 Jan 2025 18:46:46 +0100
From: Michal Hocko <mhocko@suse.com>
To: Waiman Long <llong@redhat.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	Peter Hunt <pehunt@redhat.com>
Subject: Re: [RFC PATCH] mm, memcg: introduce memory.high.throttle
Message-ID: <Z5u7Bk_ph6AJWt4O@tiehlicka>
References: <20250129191204.368199-1-longman@redhat.com>
 <Z5s1DG2YVH78RWpR@tiehlicka>
 <211b394b-3b9a-4872-8c07-b185386487d3@redhat.com>
 <Z5uxVzFf7Pk7yk9f@google.com>
 <a309f420-4a25-4cf5-b6f0-750059c8467c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a309f420-4a25-4cf5-b6f0-750059c8467c@redhat.com>

On Thu 30-01-25 12:19:38, Waiman Long wrote:
> On 1/30/25 12:05 PM, Roman Gushchin wrote:
> > On Thu, Jan 30, 2025 at 10:05:34AM -0500, Waiman Long wrote:
[...]
> > > > Why cannot they achieve the same with the existing events/metrics we
> > > > already do provide? Most notably PSI which is properly accounted when
> > > > a task is throttled due to memory.high throttling.
> > > That will require the use of a userspace management agent that looks for
> > > these stalling conditions and make the kill, if necessary. There are
> > > certainly users out there that want to get some benefit of using memory.high
> > > like early memory reclaim without the trouble of handling these kind of
> > > stalling conditions.

Could you expand more on that? As long as the memory is reasonably
reclaimable then the hard (max) limit is exactly what you need. If you
want to implement oom policy in the userspace you have high limit to get
notifications about the memory pressure. Why this is insufficient?

> > So you basically want to force the workload into some sort of a proactive
> > reclaim but without an artificial slow down?
> > It makes some sense to me, but
> > 1) Idk if it deserves a new API, because it can be relatively easy implemented
> >    in userspace by a daemon which monitors cgroups usage and reclaims the memory
> >    if necessarily. No kernel changes are needed.
> > 2) If new API is introduced, I think it's better to introduce a new limit,
> >    e.g. memory.target, keeping memory.high semantics intact.
> 
> Yes, you are right about that. Introducing a new "memory.target" without
> disturbing the existing "memory.high" semantics will work for me too.

I thought those usecases want to kill misbehaving containers rather than
burning time trying to reclaim. I do not understand how will such a new
limit help to achieve that.
-- 
Michal Hocko
SUSE Labs
