Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7572DEA6E
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776188761; cv=none; b=A0ruIXeYXrHaKMupq5p1LWw2Ze43JdC2Q2GYmcB/WTi9xrmcrV9T5ump2EuwzxvUGFk795y39sxPSC/UdIOSc/5c3I+AC1WvLN0pQvFcHUg6/qrjcGNUPNaezijWhfo6gIjkS4ipUGa1X+da1MQA+/CgpElnZwOYy9QCicGQ38w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776188761; c=relaxed/simple;
	bh=caYqKS/PGkKE5/alosNGczPJNeGI8wHSodMZa0PvBpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqrtWWtJusGniKGzbD9qZSn/yaIvXnojZC2K6sEW/Ou3EQvLKc8mhWP3YUfzcSAdLg7epLcxQpncfLlfoTt4fY6N+vdm6knRgqC2lrTcLNJK4EDmtyG88oUHwSzkl05NpNKcigQ5J1xkCVpnr3GOn5GOkVK0/yVmZGvYpRpzOYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DdqBV1Ah; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ii0mSKrK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DdqBV1Ah";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ii0mSKrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776188757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mANt+MJIo4mwSuWx1hJyMYIsIgCq8OGnhUtWVmIQp40=;
	b=DdqBV1AhBWwYf7UN8DBNFlUxuVfv1o9ZGq57ndviJnNko1+rX4dYe0TJJ5lI0+hGaoOBvk
	C9T38C2LfaD6xijaC6k9HPPxoUSOSzTl8s+k4YkzlIp0OYEtghUKABXSIoi2pN/2Yd6yj0
	ODCNlmJ7Kee3T7Mfen7VAWpuXXrH+p0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-XjKM_oG-OZSYS8ayQs8tEw-1; Tue, 14 Apr 2026 13:45:56 -0400
X-MC-Unique: XjKM_oG-OZSYS8ayQs8tEw-1
X-Mimecast-MFC-AGG-ID: XjKM_oG-OZSYS8ayQs8tEw_1776188755
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50dd17a71f6so76149711cf.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 10:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776188755; x=1776793555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mANt+MJIo4mwSuWx1hJyMYIsIgCq8OGnhUtWVmIQp40=;
        b=ii0mSKrKV/gFikfzPX/KHbc1yo2DPHgc2yfhjyYb61r3eqtmIacr+426PHnWGksntc
         PKs3HaCvq09QxZVokr5NFIZfZiSECAq6pOrIwaI3G8Y+0vTYgEBlEIslorXxVNbpbj9V
         6FjAUcusn1BGTg1ZEswTWcn3FKkqeXpODfBd3YFHhdipE1R0VWZ7xswuRSJ962+/AcTg
         RhcbcylhZFx9USOXv8WmfkEy1Bv7RvQsFH2B92Sbo7mdZOwEfN1Cw8eT4Q6577f8sU2Y
         sOOnCm4KcwjpkMd7unUi/t1rB8+YlfsPerAZF9yf6xGtIquZAjLVWsXBXuVGqhNi9pNa
         94Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776188755; x=1776793555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mANt+MJIo4mwSuWx1hJyMYIsIgCq8OGnhUtWVmIQp40=;
        b=QulvfStVWnq+c4AzJi9DwPN2v1sTjWOPjTP43ZoMWA6RwJKhmV5CC93GvXDA1VXqng
         Y4eJixQ3zyQMMKt5/6yTP+FcOHVDCvbNLEK3HVj1bV3vqUJXVI3p9USrM0w3wkHXfaiQ
         +7gMLyXe9k09qblg25AKqT2NJ14PsFzqfzkgOl4OqXZeeFjDq2ItgiLZ0oe3IaEZ6kmM
         +Q1Ru7lqcekEFnMA+kgbZlUOsOqfSDIZJLr3KkgDQfr+fUvjb5zPTBti6wHxzntu+Oi8
         Bcc8D5x6ndC1eIVILShMWf6VXxQqfd9ze1VI7P4IYeRKmBq0BgIK8pwus4je0bYjJLrw
         NEAg==
X-Forwarded-Encrypted: i=1; AFNElJ8951kDFw7JNejkwdsde8Lsoh/wP/gOpK9gWv0yuXjkjtCCw+zrCovOV6ujwesj3662Im8OAMqDhfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpY5xGvoZlIGFmXnSxqM4C+nluTjZS+Tfs4stqH2KhNxYGcF+P
	KhL5Ux3t31PupzEdetFQGp8gxjvkH70ktpdPqEaCHjj+9huXgv6vYICChpGmnO8gBOwH5mWz6D4
	XduHhfDvfACcWB0rTehHStNHNbuCJzOwLAmB2685oI+Iht6O25Qh3lNjsOAPK8Q==
X-Gm-Gg: AeBDieuhQNrTsYh7dtX7HblO3NX8heIRjXfKHNMslb3w81KYII2j0huVpEwo19dMK+w
	Kz0mofSBjalAD11djKksMhB9Ng2LHf5iYqU+RCsGaQKnKKC1+kSVWLCZ4yXsP76RdujHApz9oYK
	lLmNJEEANJ1rzBkfekCcz8SkFAJwyH1cLoAuK+dxetpHsNSVswMnSPN1msmzPcmSvhzNzobYLYn
	TtBgwbEKKJU4glstYuWmoNCEwmDOugfyKL4XqHiC1CWtGp9c4SeHlxfXmHtTqY8tIOZctabj4L8
	/QnBmVeFkmQbtYJlAB9gD2cJtjo7IVx4+ahj7pmtie0jtgcvWCoRXL1uxaYPzs6unulDNAgLocr
	BU5tQtmurC6bjNwedM9FEjr6P729gAqieE4MVO14/fDjuvhPTC9g/xehKbg==
X-Received: by 2002:a05:622a:5c98:b0:509:11bd:9d3 with SMTP id d75a77b69052e-50dd6a6a478mr232486171cf.1.1776188755086;
        Tue, 14 Apr 2026 10:45:55 -0700 (PDT)
X-Received: by 2002:a05:622a:5c98:b0:509:11bd:9d3 with SMTP id d75a77b69052e-50dd6a6a478mr232485641cf.1.1776188754505;
        Tue, 14 Apr 2026 10:45:54 -0700 (PDT)
Received: from x1.local ([142.189.10.167])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50dd53f9c16sm110767131cf.11.2026.04.14.10.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:45:53 -0700 (PDT)
Date: Tue, 14 Apr 2026 13:45:51 -0400
From: Peter Xu <peterx@redhat.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
	James Houghton <jthoughton@google.com>,
	Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: [RFC, PATCH 00/12] userfaultfd: working set tracking for VM
 guest memory
Message-ID: <ad59TxAHNwFWH7Cc@x1.local>
References: <20260414142354.1465950-1-kas@kernel.org>
 <ad5dIUpAMs4MuBvV@x1.local>
 <ad5hAVuRwa_0VNPf@thinkstation>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad5hAVuRwa_0VNPf@thinkstation>

On Tue, Apr 14, 2026 at 06:08:48PM +0100, Kiryl Shutsemau wrote:
> On Tue, Apr 14, 2026 at 11:28:33AM -0400, Peter Xu wrote:
> > Hi, Kiryl,
> > 
> > On Tue, Apr 14, 2026 at 03:23:34PM +0100, Kiryl Shutsemau (Meta) wrote:
> > > This series adds userfaultfd support for tracking the working set of
> > > VM guest memory, enabling VMMs to identify cold pages and evict them
> > > to tiered or remote storage.
> > 
> > Thanks for sharing this work, it looks very interesting to me.
> > 
> > Personally I am also looking at some kind of VMM memtiering issues.  I'm
> > not sure if you saw my lsfmm proposal, it mentioned the challenge we're
> > facing, it's slightly different but still a bit relevant:
> > 
> > https://lore.kernel.org/all/aYuad2k75iD9bnBE@x1.local/
> 
> Thanks will read up. I didn't follow userfultfd work until recently.

Thanks.  Note that the proposal doesn't have much with userfaultfd.  You'll
see when you start reading.

> 
> > Unfortunately, that proposal was rejected upstream.
> 
> Sorry about that. We can chat about in hall track, if you are there :)

I won't be there (as it's rejected.. hence not invited).  But I'm always
happy to discuss on this topic on the list or elsewhere.  Alone the way I
believe it'll also help us to know what is the most acceptable path
forward as it's still very relevant.

> 
> > > == VMM Workflow ==
> > 
> > AFAIU, this workflow provides two functionalities:
> > 
> > > 
> > >     UFFDIO_DEACTIVATE(all)            -- async, no vCPU stalls
> > >     sleep(interval)
> > >     PAGEMAP_SCAN                      -- find cold pages
> > 
> > Until here it's only about page hotness tracking.  I am curious whether you
> > evaluated idle page tracking.  Is it because of perf overheads on rmap?
> 
> I didn't gave idle page tracking much thought. I needed uffd faults to
> serialize reclaim against memory accesses. If use it for one thing we
> can as well try to use it for tracking as well. And it seems to be
> fitting together nicely with sync/async mode flipping.

Yes, I get your point.

It's just that it'll still partly done what access bit has already been
doing for mm core in general on tracking hotness.  So I wonder if we should
still try to see if we can separate the two problems.

One other quick thought is maybe we could also report hotness from kernel
directly rather than relying on async faults, you can refer to "(2) Hotness
Information API" in my above proposal.  Here when it's only about knowing
which page is less frequently used, it's only a READ interface.

> 
> > To
> > me, your solution (until here.. on the hotness sampling) reads more like a
> > more efficient way to do idle page tracking but only per-mm, not per-folio.
> > 
> > That will also be something I would like to benefit if QEMU will decide to
> > do full userspace swap.  I think that's our last resort, I'll likely start
> > with something that makes QEMU work together with Linux on swapping
> > (e.g. we're happy to make MGLRU or any reclaim logic that Linux mm
> > currently uses, as long as efficient) then QEMU only cares about the rest,
> > which is what the migration problem is about.
> > 
> > The other issue about idle page tracking to us is, I believe MGLRU
> > currently doesn't work well with it (due to ignoring IDLE bits) where the
> > old LRU algo works.  I'm not sure how much you evaluated above, so it'll be
> > great to share from that perspective too.  I also mentioned some of these
> > challenges in the lsfmm proposal link above.
> > 
> > >     UFFDIO_SET_MODE(sync)             -- block faults for eviction
> > >     pwrite + MADV_DONTNEED cold pages -- safe, faults block
> > >     UFFDIO_SET_MODE(async)            -- resume tracking
> > 
> > These operations are the 2nd function.  It's, IMHO, a full userspace swap
> > system based on userfaultfd.
> 
> Right. And we want to decide where to put cold pages from userspace. 
> 
> > Have you thought about directly relying on userfaultfd-wp to do this work?
> > The relevant question is, why do we need to block guest reads on pages
> > being evicted by the userapp?  Can we still allow that to happen, which
> > seems to be more efficient?  IIUC, only writes / updates matters in such
> > swap system.
> 
> But we do care about about read accesses. We don't want to swap out
> pages that got read-touched. And we cannot in practice switch to WP mode

This is a good point.

When it's considered on top of your above "async trapping to collect
hotness with userfaultfd" idea, it flows naturally with this idea indeed.

However, IMHO that should really be an extremely small window, and the
major part the userapp should rely on is the larger window sampling
whether, in your current case, PROT_NONE (or PTE_NONE for shmem) switched
back to a accessable PTE.

It means using RW protection v.s. WR-ONLY protection will only differ very
slightly if by accident some page got read-only during evicting.  For
example, if the mgmt app monitors PROT_NONE state for 30 seconds, make a
decision to evict, evicting takes 5ms, then within 5ms someone read the
page.  It means it only misses the 5ms/30sec access pattern of guest.

So far I don't yet know if this would justify a new kernel API just for
that small false postive reporting some page is cold but actually it's hot.
To me it's still fine to consider using WP-ONLY and just allow that trivial
window to get refaulted later, because it shouldn't be the majority.

> after PAGEMAP_SCAN: it would require a lot of UFFDIO_WRITEPROTECT calls
> with TLB flushing each.

This is indeed a concern, maybe a bigger one.  I don't know how much
benefit we can get from avoiding one extra TLB flush when evicting.  IMHO
some numbers might be more than great to justify this part.

While at this, I do have a pure question that is relevant on the full
protection scheme (and it can be naive; please bare with me on not yet
reading the whole series): if you change anon mappings to PROT_NONE in
pgtables, then how do the mgmt app reads this page before dumping it to
anywhere? It's not like shmem where you can have a separate mapping.

Do you need to fork(), for example?

> 
> With my approach switching tracking and reclaiming is single bit flip
> under mmap lock.
> 
> > Also, I'm not sure if you're aware of LLNL's umap library:
> > 
> > https://github.com/llnl/umap
> > 
> > That implemnted the swap system using userfaultfd wr-protect mode only, so
> > no new kernel API needed.
> 
> Will look into it. Thanks.

Thanks,

-- 
Peter Xu

