Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBDE30FF33
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 20:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776975038; cv=none; b=QaO/uqAu0sp2+qjlDXydYLTVV3yOiBtmXT+Rx7zmEzG74c+6DaGStGOsgySJHeFYL3j2KDbIAuKIs58vdzBOuP0mYCuAqCRdnoJRQf1GcXbE6ohudZ9dC6H+8S9fcLl71QfjXp5Gb8uMqD33zHhVOW6zOzba92xJdfq8gUekk4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776975038; c=relaxed/simple;
	bh=HWvc3SolTkjILjVuQingZd/cQ6XMRPtVQk3Bexw8POc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snTXeRvv2/HacNaNZTkWgJu9VgHBijY2Sz0DF2+2m5y0YAVNXfTzPgmfrXu9wIYRJSMmIoObCoDDx7iFGScNTsPc5X9ahyLkvDV3i+pYJOo6cPjCjJhuLNGG3/FNd5OXdJsKffHOWg3UTdhTl6AJTLuDlwpai/1AnHMGZ0G1D3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fqOYBuwo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uIfRLiTC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fqOYBuwo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uIfRLiTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776975035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1G8kt4KIcRoHxbZhKFDwigWKJXLBw/Au6uDx0Oi0Fg=;
	b=fqOYBuwoG+TkPcby7u/3GnKy6aC+oxzmGZgmhLmt4XIznylsVC+kR4aNZDHRYy9iV1J3LS
	2RVfJaFMhaRTGUv6m2/WJFaHelrUeecw7kEeVSQPzljRtPMVJJugYw3Zq1LfZipGEh8xbl
	gtvBFAr1RPJ76FovSeetfgJ7gzpSWA8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-KGckdxm0PZmQPM2CexYwaw-1; Thu, 23 Apr 2026 16:10:34 -0400
X-MC-Unique: KGckdxm0PZmQPM2CexYwaw-1
X-Mimecast-MFC-AGG-ID: KGckdxm0PZmQPM2CexYwaw_1776975034
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d3ea68b9cdso1383233285a.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 13:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776975034; x=1777579834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L1G8kt4KIcRoHxbZhKFDwigWKJXLBw/Au6uDx0Oi0Fg=;
        b=uIfRLiTCfJA0XH3cVVfxBGtSRk78RR9/pGET5yvBE1xAZGMOe+JfXigqRPHWaUB3wh
         t8w3bJnlIX9FKxFprvDfJ5sN5rvf9l3raPfP8UFyI3k7adcS39wB+I4djBjUTWS8pn23
         pJ+M04GcyseVtZHuqJ3FY6umojVzhu5L/JkHKUje14BQnbmQdrDNW7a3C1jZUTsOnJGC
         PCBEQdsewKBVA6dzTcHGsb0CDBCD8leuUWoqJAnD4FH2x4CVLaQMDsYZqoYHpVO7TlrQ
         LssGP0faSuzyn6Ite29VecxdD5i3ttUL98+q+b3gp3dVU4k/xzys/0JuY0DJI4JnuxCt
         tTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776975034; x=1777579834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1G8kt4KIcRoHxbZhKFDwigWKJXLBw/Au6uDx0Oi0Fg=;
        b=MsV0B93l9vk6DuuhH80CLxWhHwTP8+/dNA4SM2U/wLmTXQ23+vGLR5gBpPu3VKkol3
         5I7KgFS9IccRwIFGJ5VEj9sei8VRL4uMPGhWlN6hFxI/blSzI9gzva0zavJTc5Ofcqr9
         yhzd+pU5+YUXz4HhhbSHCag9r9+3RFNpPstedXtXqztwpAoa/EfsEPalGyByEEHEB405
         Cl7cOlc/z4swLIIx3PLArC/w1bh+CrYnXgcXETMR7egPgXuX1xqileY5gJQ7SHblFjyG
         sdHE1nGz61iF1S/IrHcf0rbQ7ZUqLhyQQ4YWf2z47qEYdco7zgaoSMCgZqD5I91fVZL+
         2xaA==
X-Forwarded-Encrypted: i=1; AFNElJ/dhQTEYf36qOu0jZm3z1PvBSQ1L62eDjZQzx4wsr+m273sAGoG20Qo3Sanru8fcdHru4JndhozgdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwHv+s8dG677zk9fkzivwrpOtqALRy45edC2cm6PBs5qMWORir
	W+s9uLrLQPZIsl9AkX4cOEIee6MG7I9HY6QWmwkE3ewKlQ+/iP0jXcyEtrREzPdF7LzCK8DPM4t
	GGQyuKQPcVXlwhpW2VW4PNI6a6nYVGxS8AbTZPgq2hxrWUQVBiHPVAdHSWKsZaw==
X-Gm-Gg: AeBDies3TliNDMSBaSFXKoIMjdZZFGQJ+98RnQNCDBIAAofj15mDPQUVBuCAgt1Q5K7
	sTRE2DXdQ48uWmDWfn2H6uaCUH5C2QocifNlAF1e3SBZY8xaXaYILaXy8RmIoeSn411VLiofGvB
	KXWjhsfeyu+4JEejqiG8r5D/iNlYdC5VL4baL0UNLyNbAvMixYDmVtsSaPOOyeCPhbBCjheyfvA
	A9BvxVSeguWA08PuR+QnsJOflCo/ONm6lYQzohVldWehw/zXTNGbsrvQS9pfSFvwDNGmP8wVymB
	UapANoPNeE79BpVuIWA2TtvATMCqk95efVZVEWJ5VRp2PhI2KbhJGXPWPIsLwJDDioK9z4KSJEZ
	N3dbfFn5KTUHNfwAZjJ8dTLhJI8/ffbszAeXDqEvJb6PK7C2sT7lnSUL4Xg==
X-Received: by 2002:a05:620a:25ca:b0:8df:1541:d782 with SMTP id af79cd13be357-8e79236e338mr4156919685a.52.1776975034005;
        Thu, 23 Apr 2026 13:10:34 -0700 (PDT)
X-Received: by 2002:a05:620a:25ca:b0:8df:1541:d782 with SMTP id af79cd13be357-8e79236e338mr4156914485a.52.1776975033492;
        Thu, 23 Apr 2026 13:10:33 -0700 (PDT)
Received: from x1.local ([142.189.10.167])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d8edb789sm1845246085a.31.2026.04.23.13.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 13:10:33 -0700 (PDT)
Date: Thu, 23 Apr 2026 16:10:30 -0400
From: Peter Xu <peterx@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [RFC, PATCH 00/12] userfaultfd: working set tracking for VM
 guest memory
Message-ID: <aep8tsYFfr_Xe54q@x1.local>
References: <aeImfRrrvr3UoKtL@thinkstation>
 <aeTnlQUOOh-dHG8z@thinkstation>
 <34f75083-29a3-4860-8a6e-94551d37ac6a@kernel.org>
 <aed6fHLrIdahbdY3@thinkstation>
 <b77d559b-215e-460a-a268-e63b8273ef42@kernel.org>
 <aeorZMvKwu8zKX5i@thinkstation>
 <aeoxnuGKO3uqS2kG@x1.local>
 <aeo5IPpQi7onyjTF@thinkstation>
 <aeprnnccJeyHB2rt@x1.local>
 <17b0dc02-eee3-46d6-9afb-5f81a3a20216@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <17b0dc02-eee3-46d6-9afb-5f81a3a20216@kernel.org>

On Thu, Apr 23, 2026 at 09:25:30PM +0200, David Hildenbrand (Arm) wrote:
> > 
> > The other thing is, as I mentioned in the other email, I still don't know
> > how the current RW protection would work for anonymous.  I don't yet think
> > the user swapper can read the anon page with RW-protected pgtables.  So far
> > my understanding is maybe you only care about shmem so it's fine, but it'll
> > always be great to confirm with you.
> 
> I wonder if uffdio_move could be used for a swapper implementation instead?

If RW is justified to be useful first, maybe.

I had a gut feeling Kirill's use case doesn't use anon at all, then if
nobody needs it we can still decide to not support anon.

> 
> If we ever have to read from a protnone page, maybe we could teach ptrace access
> to do it, or have something that can read from prot_none areas -- like
> uffdio_copy, which can write to prot-none areas.

Somethinig like swap_access() in my proposal can also partly achieve that.

https://lore.kernel.org/all/aYuad2k75iD9bnBE@x1.local/

There, it was only about reading from swap so far, though.  But that one
might be easier to be extended to read PROT_NONE and directly put data into
buffer user specified (ps: in my local tree impl I named it maccess() to
pair with mincore(), but it doesn't really matter; it doesn't even need to
be a syscall..).

To me, the interfacing is not a major issue.  The major question I have is
why RW protection can help in swap system impl when we already have uffd-wp.

So I want to make sure the use case can't be implemented by uffd-wp already.
Because that's really what we might do for QEMU.

The other thing is I want to see possibilities of reusing any new kernel
feature that can provide hotness.  Currently idle page tracking has issue,
not only about perf and rmap, but also on not working with mglru (defaults
for Fedora/RHEL).  If we can split the requirements and solve the hotness
issue, then it'll also be very helpful.

Thanks,

-- 
Peter Xu

