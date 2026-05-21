Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2C23DD850
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371289; cv=pass; b=SsPJ9UC443V8M0/hzvso2Yp3Kp4V8IE1WpLKzp3JdlAJlltKdYzJXKnbeotsUlYQEa2ZxgXBY3wKKvkMnVxg4Qv4YrPn9CJBjRKUomuypbHWqZ8tRxiuLUI5ft9uEYXRT08SOeBWBJfHgODa2WC4FeyZ8oyZGVQeOE0q7vdcc+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371289; c=relaxed/simple;
	bh=SchiGOmf2MVWPKiRNrNhUxoPmvVzWaDRWZ8BJ0appKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7YSBHJokIlelsTcPnorWM5wazQNVfNDYJJdqoCqNxtlv+CF3N/QzCDshBv07SaUpTMCABS4tlwh21cr+WPVPgLfvDsiTXJkpVRpUp2Aj42AFpWbgk2TzPzln2i6hk8VdZqTV9oe74/1ObSFMw1LGAiGk+4RO8e1FFC5ji0AdwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lx1oqRHd; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lx1oqRHd"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50d864c23bdso7261cf.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 06:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779371287; cv=none;
        d=google.com; s=arc-20240605;
        b=OAkg6iw31PBwbhsuEbCqk/SpFDX6mTzbA96OXL+tuiGEsPz3G09KM7vc0oPRHbMu88
         jrUxcBywVnqckQibA4OuV2XNOyjDiQL26b02XYl3x1eG58XMgIMi3o4+ymHEWnEz0vBF
         aQ0xqpTAQK4I1iMZaiZ/TlJCYuYY9YfuB3Wc+0CaYpi3BJefi6EbFehhGniqQqmPpxaR
         HU7OQ+36tDeCJVzabUP7YyoBl1qzgiAz/mxgRy+aFYwD5XqFzm0yV6wqtLBqpL0R0Y1K
         EXH+x4V3NWnThFq0Qyv8sTmo+1nP0rCSW4BaU9y+YRJq7Wo6vE0aRfE+d49a9mhMq9wy
         KbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x8ZLZpFna8QE3sntZWYFYWQfy/d2E0NvjrGgGfpza44=;
        fh=gGHh869eH5JjDxaLTLYOKlerk+ut6gt9QAzM9NmwWNE=;
        b=VLyrQM0EPcCApGNyEkh77uZIiPyHFU6fRUosozSBQXdUizVdIJKPdZKfDstYQ+5Dof
         9QTJoz/Wfp2wJSSpaH1x2IcSFHXCVr6sd1Plhg8QuxXymxglblO8zNuHSCgPXXwEbWc9
         rbCIR8CNHx0kWCsfzAFpYiPIsHVJcBH+vz8ey846VL2wjU0Is7ir8vyYmO3jl0A4CXZ+
         ET3IcmuYItayeR1BrkPReAFVgvJL5Ace+RoOPMdpnAjFrp4pcEDRFZ0r3IJu+W3E6NrF
         J2ZiB/7QYV59gyw0oM55FPPZrwy7EwP7pvIK/1Hr2PC0xjKS2O2FD30qNWvETOONAeFl
         ZQDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779371287; x=1779976087; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x8ZLZpFna8QE3sntZWYFYWQfy/d2E0NvjrGgGfpza44=;
        b=Lx1oqRHdWDgVYOHOCHJys4JsK+4F7VW/ZHeh0hBX83+yoop4fyRs24a6i9uAuLooVR
         nAV8yQQYBoLFBfIuq4w+GMTwXInZKbjfuBl0EnzQO4NUX25svESwxho6+kl6wZlp6ptC
         /j+lMqBh4NGHbhJYl9ZRyPAia5DF94tW2W+Y+xy1YlGftVZs8OyligmT7oRpe9xDRDVd
         XSSqOVofuAoUwdERaodTDsq6vwPBalzBNDsLOyfJkIR6mUo0k6zeTDcb7NHiTn8a9iEc
         zhhc591pInuhfTvINnXrcK6ZM+xtQqKO+vB+2IeO9eMaJHCLPj4rK3/rtNz5UhVuYtGY
         P/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779371287; x=1779976087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8ZLZpFna8QE3sntZWYFYWQfy/d2E0NvjrGgGfpza44=;
        b=ooh0uJ7i/0gLurprqgFinX0IHiXHnmNCgtQ7vemqWM1jLjKfL3OXwbVKnob8zMZgPW
         r7G5X5Rp8MQilmT34IY47Uvnuxo2wjA36KdqcS2kCFtoLyFiciHatQxb+J0DKEKRNNbt
         Fdw2D8wqNd4uH/woPFhIOUajxP3l1+ZwtAdd/lo7mwOXlo0OZo5l7HLD8Yi9amXzDBQk
         8eg45172W2qUZVqybS9ZqWsfa1oh34hzIj0Cydj5ZGS9ic3mjA1j5J7Hye3DDPXV2eNr
         MouIOD7YviemGylg6KetdO+U8c3r8vLPBJMV1EQgbKhMArVtrtu/uvShyEMHTiseXsqA
         D2CA==
X-Forwarded-Encrypted: i=1; AFNElJ8FBM0EOUyS2PA66PZpkpamcM0wLas9sQoI4UH1OzZPdY1NTX4faSqaItr2+umt51WUctHZRK3c5gk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpp+kkuxaZvaTkC7O1qkPv7q5BXDRvORRWnoBFu9FKwfNUgSQy
	i3g83ZNo+ewdZWZyT7RgSG7tx/SWqv12FJ1zaR8C3zRFN/NkHg/PwPFeBri2FwnefRyHHmDa8oU
	I3RcBaR2kN+ehWyWyj0TEN/pPXvn7ahjaHg2fitve
X-Gm-Gg: Acq92OEeH1CuseR+d3aODJmZdF5bZ+c5/LDBh8fAaPy2imbfXhS5n/o+ZwWagNpSiMh
	lBBl+msVbvN4AR7DGg/bbYM+YPppAf4DEVYCnkJesUQmxnkUnbvrODeUFpuYQvcUPkTLMKAfZaW
	z7qgkH7cX2T3OYPcjWh8Wy1hJZNekkKEmRaj6zGenGbQgCfBjE3QHXB4TnzOTuUFtJ9D/yM5Wt+
	XbhaTJRi3q+OZ0Yx3wOuT4v6fxnJcQ/Xj6x6OKBqDEEz+Re8bCxcvRJvLDICQkn9Rb0HLbI1zsE
	wU2Lg+gaQAb/BXr04PY=
X-Received: by 2002:a05:622a:9005:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-516c53118ecmr8206941cf.1.1779371285395; Thu, 21 May 2026
 06:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com>
 <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
 <CAEvNRgGQvMdDmVfbk42EY_PGN0ybTp-x21Zj+pg_X1mk9iCRtA@mail.gmail.com>
 <CA+EHjTzLCD-dU-euZKgzwyEr2ecPqFDNutcaHm2fCDGA+MHVXA@mail.gmail.com> <ag8JIlHjohAOC3-g@google.com>
In-Reply-To: <ag8JIlHjohAOC3-g@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 14:48:00 +0100
X-Gm-Features: AVHnY4IjTx7kpi4F7EdVLun66lc7vUTNuuJ9Vgrkm1t1onCQ9N7OW44CxOISbbA
Message-ID: <CA+EHjTyF19FPod10EEm3pMaPvsAR6HUXOhtC83qSSqxQ2g1s2Q@mail.gmail.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 May 2026 at 14:31, Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, May 21, 2026, Fuad Tabba wrote:
> > On Wed, 20 May 2026 at 22:44, Ackerley Tng <ackerleytng@google.com> wrote:
> > >
> > > Fuad Tabba <tabba@google.com> writes:
> > >
> > > >
> > > > [...snip...]
> > > >
> > > >> +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> > > >> +{
> > > >> +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
> > > >> +       struct inode *inode;
> > > >> +
> > > >> +       /*
> > > >> +        * If this gfn has no associated memslot, there's no chance of the gfn
> > > >> +        * being backed by private memory, since guest_memfd must be used for
> > > >> +        * private memory, and guest_memfd must be associated with some memslot.
> > > >> +        */
> > > >> +       if (!slot)
> > > >> +               return 0;
> > > >> +
> > > >> +       CLASS(gmem_get_file, file)(slot);
> > > >> +       if (!file)
> > > >> +               return 0;
> > > >> +
> > > >> +       inode = file_inode(file);
> > > >> +
> > > >> +       /*
> > > >> +        * Rely on the maple tree's internal RCU lock to ensure a
> > > >> +        * stable result. This result can become stale as soon as the
> > > >> +        * lock is dropped, so the caller _must_ still protect
> > > >> +        * consumption of private vs. shared by checking
> > > >> +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
> > > >> +        * against ongoing attribute updates.
> > > >> +        */
> > > >> +       return kvm_gmem_get_attributes(inode, kvm_gmem_get_index(slot, gfn));
> > > >> +}
> > > >
> > > > Doesn't this imply that all consumers of kvm_mem_is_private() should
> > > > validate the result using mmu_lock and the invalidation sequence?
> > >
> > > Let me know how I can improve the comment.
> >
> > Given Sean's context, the comment is good I think. I would quibble
> > with the the "_must_ still protect" phrasing being a bit too strict.
> >
> > Maybe just soften it slightly to acknowledge the exception? Something like:
> >
> >   * lock is dropped, so callers that require a strict result _must_ protect
> >   * consumption of private vs. shared by checking mmu_invalidate_retry_gfn()
> >   * under mmu_lock to serialize against ongoing attribute updates. Callers
> >   * doing lockless reads must be able to tolerate a stale result.
> >
> > That aligns the comment with how KVM is actually using it today. That
> > said, this is nitpicking. Feel free to use or ignore.
>
> Hmm, I wonder if we can figure out a way to consolidate some documentation,
> because this is _exactly_ the same pattern that x86's host_pfn_mapping_level()
> deals with (see its big comment below).
>
> There's also the stale comment in kvm_invalidate_memslot(), which, stating the
> obvious, speaks to the memslot+SRCU side of things.
>
> Maybe it makes sense to to find a central location for one giant comment about
> how how MMU notifier events and memslot+SRCU protections work?  And then refer
> to that in paths where some asset needs to be tied into MMU notifiers and/or
> memslots+SRCU?
>
> [*] https://lore.kernel.org/all/agcbWe8s9lmPuJwG@google.com

This would fix a few related issues at once. sgtm
/fuad


/fuad

>
> /*
>  * Lookup the mapping level for @gfn in the current mm.
>  *
>  * WARNING!  Use of host_pfn_mapping_level() requires the caller and the end
>  * consumer to be tied into KVM's handlers for MMU notifier events!
>  *
>  * There are several ways to safely use this helper:
>  *
>  * - Check mmu_invalidate_retry_gfn() after grabbing the mapping level, before
>  *   consuming it.  In this case, mmu_lock doesn't need to be held during the
>  *   lookup, but it does need to be held while checking the MMU notifier.
>  *
>  * - Hold mmu_lock AND ensure there is no in-progress MMU notifier invalidation
>  *   event for the hva.  This can be done by explicit checking the MMU notifier
>  *   or by ensuring that KVM already has a valid mapping that covers the hva.
>  *
>  * - Do not use the result to install new mappings, e.g. use the host mapping
>  *   level only to decide whether or not to zap an entry.  In this case, it's
>  *   not required to hold mmu_lock (though it's highly likely the caller will
>  *   want to hold mmu_lock anyways, e.g. to modify SPTEs).
>  *
>  * Note!  The lookup can still race with modifications to host page tables, but
>  * the above "rules" ensure KVM will not _consume_ the result of the walk if a
>  * race with the primary MMU occurs.
>  */
