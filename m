Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803EA19C575
	for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731346871; cv=none; b=Ft7o2ylfVtiO+3HNYstvOzTje3+gDQDCYWt4SsGS9Az6gtiOk9yfMZT8xuh/on1aVSYEb7V9uV1P7sK+9n2Ivryewab9dCZufYzXAeT1T2oIg+ucCHe7SWAReY4aIiGYPEH10BkscJ2qESJ/uOenYY+/psEHzs+2OM36Z7W7gAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731346871; c=relaxed/simple;
	bh=WE626Jhme0ym7/q8fggm9jaQXx4lOcP4ZRcFhn00/PU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ld3IfWy0mAIuxJrR+oN7gV75JwmYpqalxkPU40cfXPjzLawvi3LUA3t+58aAMV0QqjsMCbPU+DfLS2IG7uUfLRw841ELwZjkgAUGgenl5dIr4p/ehxX0+t3wNO6Do8lnjQVYtbc3u99PbnoVg4IizIZXFEb4ZD28pBWrFgQoil4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q1MnQIPV; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q1MnQIPV"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20ca4877690so291705ad.1
        for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 09:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731346870; x=1731951670; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=spB5wl1urQkI+7B+IPtWDDKj9S/WJUklG9CxIStging=;
        b=Q1MnQIPVS7F2oJA4F+M/9PKEYdh3yaA+H+cHuer6HOalSuZKrsURYy03ic8CEvwwGK
         DvJnIgEAnFAiqZVehHNuJ3OEe+4qnqeGpJPhb/eQ1G+7EfVLyXK52aooe+DqgaUnkhtn
         dmaNQLWFZ7Pmsf8jB2USj9mdu4LyYZoAm42VRYFFazT/tEvPsW6+6kg6zDTJt+NgKWS0
         wG5axKeZ1InEXeVTmxT5AcMMKJE2EdfFv6ZHUwKuj4AHahBRlPj53RzhLFL9CtLLuV/m
         FrYjnLcE9nY1jVEV4BlHHWYteIccUrKRTUSUu5i26ELmwtcuClivdNQE2cxALe8eCUwa
         +Qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731346870; x=1731951670;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spB5wl1urQkI+7B+IPtWDDKj9S/WJUklG9CxIStging=;
        b=Zxo1syZubU6D7KgjwDNv0EZ6RKWQf73IXw8ponE/4qjqvg2J3YvaL1kuovCwxwMm0y
         EhiAVimo2Vtc6xlUPKhvIu1gC/AuBNOSMjId0+VpmNBP47o9iSsUSnRJ8js0j8087uCA
         9Pk9Ukb0Hxmqi7z6yFd8Et+ugk/6gSkOdOVFBf2hUTkXrBLLFICdQ5EsEBm33Lw6DykC
         21LeNXc3njUgCpuJYf39zgMVR+nr2w35Nh3ZUdVaFuxRM5I3J6a7IykjGlDEVAoSF/4B
         geXgmekCpCmRWjVb80x8pmvzQQGOsTNQVbelO261D/4sWXBROK0J6CO2bqked54XRXLT
         9yfg==
X-Forwarded-Encrypted: i=1; AJvYcCV7vMhgEa3ISsh2UPO+d+SKhZXafHG28xgcZzXcpZdxzrT1VKxNCfqqIREOV3oHtms0Nfl2tNf8EQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzG6aGfBxriHummnhOK5927bg7fPLQskB8GJ84o+c6F8hOHxhL
	+03DRR/e+55UikkhWfyw5bzRt+mfNVG+9m+IxdvNzeGkGzFnuFkQ9gbtxP25Mg==
X-Gm-Gg: ASbGncthURK0CSKzFLwhQtTKWsBrhgVqrQjUdJahfPuPQd0CHRkOytBSq99Wjc0a3bk
	vgJVCixYssgLEdb0rQs3eYSNHji5lDfThWzsDXpoXZjPxcxl+q0xY40+PGxwzYr24RhzOdytrI2
	8tK4RL90MH0NrVuvoxQgUQKMKzdcmGd6RaPRY6US74HzQ+OZiqhxcPTcIUmHzngKluJBq8YzONR
	BOzQLOCekrIAOYrvVVYt8O5skfiX8T2KnSUCQYiXIbRjQlxHoT0aLXOukrKzZy+Ro3SsngTEyPR
	kMDx
X-Google-Smtp-Source: AGHT+IHi97GLH/TqT3OzZu+s1FpiP4ABTo0w4bQUtXQTxsCqbBljDo6Rmx3Z4cy0o9PUG5WKfE9Bkg==
X-Received: by 2002:a17:902:db0a:b0:20b:13a8:9f86 with SMTP id d9443c01a7336-2118df842dfmr4318285ad.28.1731346869501;
        Mon, 11 Nov 2024 09:41:09 -0800 (PST)
Received: from [2620:0:1008:15:ae3b:d774:6c29:d63c] ([2620:0:1008:15:ae3b:d774:6c29:d63c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e4196asm78754925ad.162.2024.11.11.09.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 09:41:09 -0800 (PST)
Date: Mon, 11 Nov 2024 09:41:08 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
cc: akpm@linux-foundation.org, hannes@cmpxchg.org, nphamcs@gmail.com, 
    shakeel.butt@linux.dev, roman.gushchin@linux.dev, muchun.song@linux.dev, 
    chris@chrisdown.name, tj@kernel.org, lizefan.x@bytedance.com, 
    mkoutny@suse.com, corbet@lwn.net, lnyng@meta.com, cgroups@vger.kernel.org, 
    linux-mm@kvack.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v4 1/1] memcg/hugetlb: Add hugeTLB counters to memcg
In-Reply-To: <CAN+CAwPSCiAuyO2o7z20NmVUeAUHsNQacV1JvdoLeyNB4LADsw@mail.gmail.com>
Message-ID: <eb4aada0-f519-02b5-c3c2-e6c26d468d7d@google.com>
References: <20241101204402.1885383-1-joshua.hahnjy@gmail.com> <72688d81-24db-70ba-e260-bd5c74066d27@google.com> <CAN+CAwPSCiAuyO2o7z20NmVUeAUHsNQacV1JvdoLeyNB4LADsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Nov 2024, Joshua Hahn wrote:

> > > diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> > > index 69af2173555f..bd7e81c2aa2b 100644
> > > --- a/Documentation/admin-guide/cgroup-v2.rst
> > > +++ b/Documentation/admin-guide/cgroup-v2.rst
> > > @@ -1646,6 +1646,11 @@ The following nested keys are defined.
> > >         pgdemote_khugepaged
> > >               Number of pages demoted by khugepaged.
> > >
> > > +       hugetlb
> > > +             Amount of memory used by hugetlb pages. This metric only shows
> > > +             up if hugetlb usage is accounted for in memory.current (i.e.
> > > +             cgroup is mounted with the memory_hugetlb_accounting option).
> > > +
> > >    memory.numa_stat
> > >       A read-only nested-keyed file which exists on non-root cgroups.
> > >
> >
> > Definitely makes sense to include this.
> >
> > Any reason to not account different hugetlb page sizes separately in this
> > stat, however?  IOW, should there be separate hugetlb_2048kB and
> > hugetlb_1048576kB stats on x86?
> 
> Hello David, Thank you for reviewing my patch!
> 
> The reason that I opted not to include a breakdown of each hugetlb
> size in memory.stat is only because I wanted to keep the addition that
> this patch makes as minimal as possible, while still addressing
> the goal of bridging the gap between memory.stat and memory.current.
> Users who are curious about this breakdown can see how much memory
> is used by each hugetlb size by enabling the hugetlb controller as well.
> 

While the patch may be minimal, this is solidifying a kernel API that 
users will start to count on.  Users who may be interested in their 
hugetlb usage may not have control over the configuration of their kernel?

Does it make sense to provide a breakdown in memory.stat so that users can 
differentiate between mapping one 1GB hugetlb page and 512 2MB hugetlb 
pages, which are different global resources?

> It's true that this is the case as well for total hugeltb usage, but
> I felt that not including hugetlb memory usage in memory.stat when it
> is accounted by memory.current would cause confusion for the users
> not being able to see that memory.current = sum of memory.stat. On the
> other hand, seeing the breakdown of how much each hugetlb size felt more
> like an optimization, and not a solution that bridges a confusion.
> 

If broken down into hugetlb_2048kB and hugetlb_1048576kB on x86, for 
example, users could still do sum of memory.stat, no?>

> I have not had a scenario where I had to look at the breakdown of the
> hugetlb sizes (without the hugetlb controller), or a scenario where not
> knowing this causes some sort of confusion. If others have had this
> problem, I would love to hear about it, and perhaps work on a solution
> that can address this point as well!
> 
> I hope you have a great day!

You too!
