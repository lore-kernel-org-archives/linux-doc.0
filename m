Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54703A9623
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 18:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776970662; cv=none; b=dAv8OKRDembNR0AjLBOpTwzqUaNAY64S8ED/V0HGtosJeXw1IpJl1LlmEP5lrP7ioNuKl6dxx239NcH4RXBYyvphIgA4zGHlrWTcIzqxNgxEPlVOgi2QeIAybyK7KV7PXv18v9clt5PUmJT1WuXRTGmih+UgEUjwy1oTbK/26kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776970662; c=relaxed/simple;
	bh=niKZtqlAI1WXLJcvUDuBu11wIBF8OMXhnVzDxso+PGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2TjWITVmI7+4JkwpIig1xH4OHOTQGPUvuDKf7wFIy+3E+kCQYA+jaHr0Sz2mnprB9SCaAc972gmc9qs76CA5KWmQkiYwg5cf55XIu0zQCRYeJ1AG4MaNE54z60hXEZ74EOR8UK2z2dlKD+1qZU++ySfNAZjmawp4oeDXsqAo/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QUa591AV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AgztHeEI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QUa591AV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AgztHeEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776970659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1v3UsaiegGHksvrF9Y9nL/7mOWH7jtFrC/O6F2cdKbA=;
	b=QUa591AV2FsxmkvhWB/xaVqHdwAYltrhMywZQU5c+kpbZCl1L37mHzsXbhmaBefk9/2OzZ
	vuiW3bu/wDiayYyK9YarYGChFuU/l2b/02/+mkDZ3MWx9gel01R6OtBvPD6NwXR9+pbDTx
	+MkcASa9N9Cnecs4TtvBDQ29KzG4Jj4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-sgEZngiQPsCyV1LiSdUNVA-1; Thu, 23 Apr 2026 14:57:38 -0400
X-MC-Unique: sgEZngiQPsCyV1LiSdUNVA-1
X-Mimecast-MFC-AGG-ID: sgEZngiQPsCyV1LiSdUNVA_1776970658
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso879441085a.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 11:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776970658; x=1777575458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1v3UsaiegGHksvrF9Y9nL/7mOWH7jtFrC/O6F2cdKbA=;
        b=AgztHeEIo7PBdPr/uPTovGczchhKQsjm2o9qprPcO7MTX2DaYetqhNGj5pxHmbHnTH
         CeGt9UcOhNsDJnOBMBoEBwkf5Lsd3M05zXFDkr+oeRT1Xb7FhdRba/piFktf6mpEDK7K
         vNhORcUYfB3hpsc1nvAyZKFGGoMRCw3u/QdqamzjU8QRV9bh6cc0nFhSypoPVqKjycog
         wfaEGir/cSQRbZkMJ9ufO33/jARJxMQp3QIQXYGn+9q4gfLHltyWdo6RZMVkIcHtqBgT
         ll6bOKhedUgwhJ5sr4ds+TtIv2lmZEFh51CS2yOVnvZ2C6fqvjgPbgfRkwGtI+StzdO+
         HDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776970658; x=1777575458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1v3UsaiegGHksvrF9Y9nL/7mOWH7jtFrC/O6F2cdKbA=;
        b=gPCGZDdLUrgr/dwnjkG8/cR+H3IuGC4nlbT2OE0rvrlhrIND0rYyx+NPJPu95rx4YD
         TQVsre/lVoQ/sqm6FAknXArkcztv9rhmhrBCcEoarSuLNZWJ84onY6VaXVJhnNSCmLOb
         Fyv3aLr/DWjDP4N8NlW9qTJKb/Mk1p7lQjyo23x2piCTGi+HcC7GNlzoYN+UZqVY5p91
         zMLEv5GrNf7MP+BNTrqyk7gsmjBXIPkbcrZXIWRpxO4++yrnSBPMj0AKSHXB3/A3/pkC
         guKsyzK/TsHKyVY6BNgYvQYu77cxFCTX1iB75rpdybvElYEbOgh4Qka2Ct9awYK+h3pE
         41gg==
X-Forwarded-Encrypted: i=1; AFNElJ9dcIntHFizbsLkM/11jiKnT1tevSbaxgj58jPj6MfaJ8pzrX6cG5QfEQnBFP1y+gjjVurq0iYAiqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsZ5NR+mmNT1lr4/jMgr7xDw40aOrOmPYguCeOkn1EPcblrWyO
	vGNDv9Mi1JwbajAww9jmjQbZRUBrUhQ8zYW7aLuI7gWimzUC9WtP7N4QY4YIsBHahON/dYwCWWU
	Wxh+mhbCUKA+dEQfL8EjXnI4P0muinslJX4nWftNDNeP6b/pm46HUw0DWaRiKCg==
X-Gm-Gg: AeBDietu0LwdUv7cltHTDmIat4g81iL3PhZdkU0lDeYAB4dGGjJl3FJiwQhAGgFxDo4
	D+NR0dATezbyLBbdT6RSzTpsZqY3BuP7mntuuFeskfxhyifrcl//lD4N+D0JkGs+aTfvOIy+p6B
	rSkFo34TFIadrOuYEwzk2UJOE0S/wY/9RwTQZV/T1oboGCdw70oC+Fq1B+NUL9MJpCModEL+Snp
	Aze2WN1IFtzR4lYzpqcMnDvq4VUZ0qIODvKLkwgmBWaW12Ca6wz8lP3dAvr/ia/PRGdj953Hhem
	7WTTCm2umDhmDwN7Rz3efMymOnS8szYgYsrGsNRjcr8au214NuQMoyejAIsZgoEYAnteBnimWp2
	DhytOMdM1Jj8qi/SMSG9eHHU36y9wlEpKonSCoUEVOhd1F7/xKGleRZt1Zw==
X-Received: by 2002:a05:620a:9042:b0:8ec:c4a7:f8fc with SMTP id af79cd13be357-8ecc4a80004mr1612411085a.43.1776970657796;
        Thu, 23 Apr 2026 11:57:37 -0700 (PDT)
X-Received: by 2002:a05:620a:9042:b0:8ec:c4a7:f8fc with SMTP id af79cd13be357-8ecc4a80004mr1612405685a.43.1776970657173;
        Thu, 23 Apr 2026 11:57:37 -0700 (PDT)
Received: from x1.local ([142.189.10.167])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ebce6ef86dsm1023174085a.30.2026.04.23.11.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 11:57:36 -0700 (PDT)
Date: Thu, 23 Apr 2026 14:57:34 -0400
From: Peter Xu <peterx@redhat.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
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
Message-ID: <aeprnnccJeyHB2rt@x1.local>
References: <aeFCuLJXT8VOkzH7@thinkstation>
 <4c635703-3d8d-4cfa-bb98-7f6f5fcbe547@kernel.org>
 <aeImfRrrvr3UoKtL@thinkstation>
 <aeTnlQUOOh-dHG8z@thinkstation>
 <34f75083-29a3-4860-8a6e-94551d37ac6a@kernel.org>
 <aed6fHLrIdahbdY3@thinkstation>
 <b77d559b-215e-460a-a268-e63b8273ef42@kernel.org>
 <aeorZMvKwu8zKX5i@thinkstation>
 <aeoxnuGKO3uqS2kG@x1.local>
 <aeo5IPpQi7onyjTF@thinkstation>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aeo5IPpQi7onyjTF@thinkstation>

On Thu, Apr 23, 2026 at 07:08:00PM +0100, Kiryl Shutsemau wrote:
> On Thu, Apr 23, 2026 at 10:50:06AM -0400, Peter Xu wrote:
> > Hello, Kiryl,
> > 
> > On Thu, Apr 23, 2026 at 03:27:11PM +0100, Kiryl Shutsemau wrote:
> > > The patchet is pretty good shape in my eyes and will probably drop RFC
> > > tag.
> > 
> > I still have some high level questions not yet got answered.  Do you want
> > to answer them?
> > 
> > https://lore.kernel.org/all/ad59TxAHNwFWH7Cc@x1.local/
> 
> Sorry, reply to this got lost in my TODO list.

No worries.

> 
> > In summary, it's about:
> > 
> > - Whether we have explored other approaches on page hotness tracking
> 
> So, for read/write tracking we have clear_refs=1, page_idle and DAMON.
> Did I miss something?
> 
> clear_refs is process-wide hammer. And you can miss a hot page if it
> races with LRU rotation.
> 
> page_idle needs rmap. It will not scale.

Yes. If you would benefit from a per-mm page_idle, then it may apply to us
too if we will be enforced to implement full-userspace swap in QEMU.

That's also why I suggested (in my previous reply) that we split the
requirement: one is for hotness tracking, the other is about read-inclusive
trapping (v.s. wr-protect only traps).

> 
> DAMON is built around sampling. It is good for working set estimation,
> but I don't think it is directly useful for eviction decision. It can
> miss hot pages. LRU rotation will also loose info.

Exactly.  If we need to collect ACCESS bit (or anything similar) for
eviction accuracy pusrpose, IIUC we need per-page info, we can't estimate
by sampling.

> 
> None of them gives comparable capabilities.

I want to see if some of your work can be generalized so we can use too,
and we can also work together.

> 
> We also need a mechanism to atomically evict pages.

Yes, this is the 2nd question below, and btw uffd-wp can also achieve this.

> 
> > - Whether read protection is required for an userspace swap system
> >   (e.g. did you get time to have a look at umap?)
> 
> I looked at it briefly, so I can miss details.
> 
> IIUC, in absence of read tracking it doesn't collect hotness information
> at all. The eviction is based on fault-in time: the oldest faulted-in

For example, let's imagine if we can have a per-mm idle page tracker, would
it work for you to collect hotness info?

The other idea is, no matter whether we use MGLRU or legacy LRU, if we can
expose a better interface to share hotness info from kernel to userspace,
would it be possible?

> page gets evicted first. I guess it is fine if you don't care much about
> refault cost. Like, if your workload fits into memory completely and
> refaults are rare.

One thing to mention is, if we have any hotness tracking facility ready
above (e.g. per-mm idle page tracking) we _will_ trap read faults too; it's
just that it'll be much faster (when it's hardware ACCESS bit).

So if I'm not wrong, what I am trying to discuss as a full userspace swap
system will always trap read too for most of the cases.

The difference is only about that 5ms (in case of 30s+5ms example I gave in
the other email).  Your RW protection will also trap that 5ms, what I
described won't: when a decision is made, we wr-protect the page, any read
on top of it will still go through so it will trigger a refault.  My point
is, that 5ms missing over 30s (in reality maybe more than 30s) sampling
window (which covered read accesses) isn't a major issue, and IMHO it's not
a strong enough reason to include the whole RW feature.

The other thing is, as I mentioned in the other email, I still don't know
how the current RW protection would work for anonymous.  I don't yet think
the user swapper can read the anon page with RW-protected pgtables.  So far
my understanding is maybe you only care about shmem so it's fine, but it'll
always be great to confirm with you.

Thanks,

> 
> That's not my case.
> 
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov
> 

-- 
Peter Xu

