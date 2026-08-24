Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB94393DC7
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787608739; cv=none; b=fby5Hm+0kQCC1zwIG50wgbPzdadw1CtjCEgRndBBGBXqIJSDTUZnZ4dO40wiuQ9YIbb4LhqpKHUNgUt3dOztuO2B1zops6Uz2xkcCb/35B/6k8mmPe//NMkdRXikDOUHahyuGNvTpanYYEcMacOJSgJupuFH84Dr91KDZnguYJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787608739; c=relaxed/simple;
	bh=wHIknkl3akbrXed1MMW7wu+rEQV0V9E6XtCSzIf/KQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlc3BURk5Jadv44HXyLv69IV1slbd+qrUBP1zBtIqYNabi08pw7iQW1dgQvD6kZIOXmy9pUFBLFSGMefDNtsALw+YfO+j7au/XmJTGR44QYhSQHFMd9sXcohZS8ML14NjDYCwtzYInoO6Hq9BAHAIn0nZO9k6fpi87YML68BTFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=byFDewlg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y6enUsSg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="byFDewlg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y6enUsSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787608736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KBpVXvNSIu/VB+Hjuc+28Xij0/FItj9lSc9IUEB2grs=;
	b=byFDewlg/Tqb3tb82LmVQG9WytwGn877lQ78PiXn3HeepN+JlhthDXTRVJdwEAB7BKQUEY
	zDRT8GrmaNYUdZfvhrSoRqs0H7VYKSDDKZxymAa/Lbc9ifz/HTKN5hcR63fQ9FPb1/p8mA
	H+3rrdtqV94Jgo1jsmpgvqjCcwVPQ1o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-nfqlxm92P6mu6Kvz4B_Ffw-1; Mon, 24 Aug 2026 17:58:53 -0400
X-MC-Unique: nfqlxm92P6mu6Kvz4B_Ffw-1
X-Mimecast-MFC-AGG-ID: nfqlxm92P6mu6Kvz4B_Ffw_1787608732
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d827597fbso42688691cf.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 14:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787608732; x=1788213532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KBpVXvNSIu/VB+Hjuc+28Xij0/FItj9lSc9IUEB2grs=;
        b=Y6enUsSg5ZqJ2nfG48FYcL7DZ7e5ZppG4iEYZnYYQedg6maUa0kt0Gh0UNKeUA+EtT
         i6CWWwJ/bP9Q0E96IMy+v7Bkij25+gCZwASv5C/uQKYtOQMb3AcyOSkV5Hk/i/fm/orj
         VNdeSxRIaqPL0wrHw0e1Jk0ELpp6UNp+q+3M+HGWIn+7gInFJ4CAlMHvQDLjiL/hfOrR
         vJB8bhi/TKiRsi/ORp+VHvsUJBGqHKBQ+5kMThMmQAwBLQVDERROKhbYwMwhBJtB5aVU
         kBiXKXWIZh1zZ1t/KvRX79RhxNt5H4KJdrhsPEfsgpYy6oAGo3y7Sf7CiLH29F+XQ1q/
         +75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787608732; x=1788213532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBpVXvNSIu/VB+Hjuc+28Xij0/FItj9lSc9IUEB2grs=;
        b=krKMjWTFpV1erIxO6JH1q/Cl1QFrM4b+khrTZUT9SjQTzUAy+1ZqRq8td0DjeCNe2T
         5U6HOXJU/J6ckvwE7pBaTlVYlMXO3Mmtb4HJ7p1oN4RmDOYgwWBJtvQLh75Nuxk4tlLn
         5ejB+NBlnONVwx0DjSOhBMdaGPNnntXqEGRSIbGGoTA6/K6ohUuQ5tLO4GJSxXfdB941
         u56n3b9zvL9fVjGHWx3WqksKVuY8G6K+mYXQe7EgXRR0tfqcil9cPwQHicohRhWR07G2
         6OGqplE7i47tVatI0zbeYTg8T3Cuiqe8Ed0tJPvVaQzPxc+MQGV6S1O2iVt8ipI2cTbD
         Na/A==
X-Forwarded-Encrypted: i=1; AHgh+RpPrZcafPeX9cKbMZ7lLqQ53CBhwpKVyxkluME3CJ4P6hoTbVsooGoOLRCj7Z2J+x4eOPaFWJE6D1o=@vger.kernel.org
X-Gm-Message-State: AFuF++mHash6KpkKfHDThWkO8RELMHA55joeBS2FD8JnnqMvbPg4qZSz
	3cu3Ml8OA8E4B9kMoJ5nTz8dnxRi+jlhHKQHY6OLmVkTJfoiu4KnHosD2wlycYLaxjxkGIMEban
	/jC7tOV1YkUa8hOPN8G9zymQZE0Ok+27aHgEtt9Rp8i6ZT4d4lLYQdjK0P+7mYg==
X-Gm-Gg: AR+sD1305wGyJgirGfZFJKWkyA2lTCajcBBwWQu5ZBSZ+hcU0kuGHPJFWK1O83SCtEl
	OY8E1Zi4h08ccRqtzekKJO+eFcBA0Hy7Cpc4S3DUUtixjPR2EGnpZ2A+ANqE0xnkBEOFO2aiofT
	rwZiDm3DZ+O54ADdJ3SFQYq8/I0q20CVU1//sFPJRXlRHM+DYSzkYeOpPy3unqO7urIU5Tua3Sl
	U2y/38lk/8bXw3hSbkK6uBQNTyPO7v0LNbV+lenZ/6eTeUcHpfnkS4/4N7xzkla+Jra4kIfQuxA
	/XEuIV6LYy9ovHiZelwbz+zGDDsnDyLezfLq4LLMPO9mENNSjTO2fB7U8Sb13a1q3rjLipjzkoI
	gG+lEN5dEce3PUri5/9p8inWt2Um9sRF9P27dJRaiLoaB
X-Received: by 2002:ac8:7f4e:0:b0:521:934c:bcf with SMTP id d75a77b69052e-52e2f17d066mr22918941cf.41.1787608732346;
        Mon, 24 Aug 2026 14:58:52 -0700 (PDT)
X-Received: by 2002:ac8:7f4e:0:b0:521:934c:bcf with SMTP id d75a77b69052e-52e2f17d066mr22918481cf.41.1787608731836;
        Mon, 24 Aug 2026 14:58:51 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e099baf17sm55607001cf.12.2026.08.24.14.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 14:58:50 -0700 (PDT)
Date: Mon, 24 Aug 2026 17:58:49 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <aoy88hVQcA6Gkfuk@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aoqbCyX-32doBJwd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoqbCyX-32doBJwd@kernel.org>

On Sun, Aug 23, 2026 at 10:02:35AM +0300, Mike Rapoport wrote:
> Hi Eric,
> 
> On Fri, Aug 21, 2026 at 02:56:52PM -0400, Eric Chanudet wrote:
> > CMA allocations are currently unaccounted for by cgroup memory
> > controllers. As system resources, they should fall under memcg, but CMA
> > areas partition the available space for different purposes and memcg
> > doesn't have a good representation for that.
> > 
> > Add a memory_cma_accounting cgroupfs option in preparation for the
> > following new behavior. Make it disabled by default since it will
> > account for CMA allocations in memcg which may affect existing systems.
> > 
> > Provide CMA charge/uncharge functions to memcg that introduce a CMA area
> > specific counter per CMA area. Charges are issued to memcg and to a page
> > counter for the CMA area used. The allocation's folios are marked with
> > the cgroup via commit_charge() (once for large folios, per-page for
> > 0-order ones) so they can be later uncharged correctly.
> > 
> > Add the new memcg calls into the cma allocator under __cma_alloc_frozen,
> > for both cma and hugetlb_cma allocations accounting.
> > 
> > Finally register the per-area usage counters in the cgroupfs. Each CMA
> > area creates a memory.cma.<area>.{current,max} pair for reporting and
> > limitation for each area.
> > 
> > Selftests and a vmtest script are added to this series for convenience.
> > The tests are simple accounting and limit enforcement verification using
> > the default reserved CMA area (cma=) and hugetlb_cma.
> > 
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
> > ---
> > Eric Chanudet (11):
> >       mm/cma: drop const for struct page on release API
> >       mm/cma: include linux/cma.h in cma.h
> >       cgroup: add memory_cma_accounting mount option
> >       memcg: add cma charge/uncharge functions for area counters
> >       mm/cma: charge cma allocation to memcg per area counters
> >       memcg: register per-area usage counters in cgroupfs
> >       selftests: cgroup: add cma configs for cgroup selftest suite
> >       selftests: cgroup: add memcg cma tests
> >       selftests: cgroup: add a vmtest script for memcg
> >       selftests: cgroup: add memcg hugetlb_cma tests
> >       selftests: cgroup: amend vmtest-memcg to run the hugetlb cma tests
> 
> CI found issues:
>  
> https://github.com/linux-mm/linux-mm/actions/runs/32519133924

Indeed my apologies, I messed up CMA=n it needed a forward declaration
and gating for mm/cma.h content included in mm/memcontrol.c.

I queued this up for a v2, with the other issues reported by Sashiko.

> 
> >  Documentation/admin-guide/cgroup-v2.rst         |  35 +++
> >  include/linux/cgroup-defs.h                     |   5 +
> >  include/linux/cma.h                             |   4 +-
> >  include/linux/memcontrol.h                      |  19 ++
> >  kernel/cgroup/cgroup.c                          |  15 +-
> >  mm/cma.c                                        |  14 +-
> >  mm/cma.h                                        |   6 +
> >  mm/cma_debug.c                                  |   1 -
> >  mm/cma_sysfs.c                                  |   1 -
> >  mm/memcontrol.c                                 | 205 ++++++++++++
> >  tools/testing/selftests/cgroup/.gitignore       |   1 +
> >  tools/testing/selftests/cgroup/Makefile         |   2 +
> >  tools/testing/selftests/cgroup/config           |   5 +
> >  tools/testing/selftests/cgroup/test_cma_memcg.c | 402 ++++++++++++++++++++++++
> >  tools/testing/selftests/cgroup/vmtest-memcg.sh  | 197 ++++++++++++
> >  15 files changed, 903 insertions(+), 9 deletions(-)
> > ---
> > base-commit: 98f21c54f99519329c18e2625b0ea6db14524d09
> > change-id: 20260706-cma-memcg-regions-696cb5ef7998
> > 
> > Best regards,
> > -- 
> > Eric Chanudet <echanude@redhat.com>
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

-- 
Eric Chanudet

