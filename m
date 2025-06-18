Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9882192FC
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750286625; cv=none; b=ELtyLh6b/cmybnIWJSLYljAKjRAEVFOcptADlQwCRJ6SyrwgmJOcRG8wcBm32o1CmwYHyOS/CnVgtyQOyFTFCH/gED7dlYQ0mnjGz0ZgZIvhgIPWswK9eeh9QOxAsEzpxAQJu2ZTQh0ViYdoXE83gFUhR6LtqLwwJ46ITth0Dvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750286625; c=relaxed/simple;
	bh=Iy+Ox/bH+mj99voHVuFYFLezAqT1Ea3TUU/gpHbZh4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLXXvg3p0uoRmR9KGogccPGttQq/zl6Cc+Vwj3nYQLsHS+lA8PFtKBjROuSzDZnWbr1Gq1vuJyaJAZgS2uOF3FgGPAgdxidOAEITJqZBjn0RFLFc0LFYbQD3sK1kOEtH3SWys0KCnOIG2YBF9Ttqx8q7IUM6FU9F5YAa8w+tOFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EpbLDF+7; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EpbLDF+7"
Date: Wed, 18 Jun 2025 15:43:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750286611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iabUtXH2S5hgnNxipXhGWLLQltCqncktdrGikSQJGv8=;
	b=EpbLDF+7NjqZog0McGJwo+5HvohOHNAQ8BaL7lZ03J7iJoDBrg8lFG2S6I9VFIMY3Gd8yJ
	kTLle8vGIij2bB5f/LXeRE9tYV0K5nhLvNCmRGtvD2HcKQJ6cqzHDwB2+zkiC1Sgge9yZn
	6Pp85WKy351lqpG6lvz+IzpntWkiNOc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: James Houghton <jthoughton@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>,
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 04/15] KVM: Add common infrastructure for KVM
 Userfaults
Message-ID: <aFNBCaLEdABfybmd@linux.dev>
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-5-jthoughton@google.com>
 <aFMWQ5_zMXGTCE98@linux.dev>
 <aFMh51vXbTNCf9mv@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFMh51vXbTNCf9mv@google.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jun 18, 2025 at 01:33:17PM -0700, Sean Christopherson wrote:
> On Wed, Jun 18, 2025, Oliver Upton wrote:
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> No need for my SoB.
> 
> > > +#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
> > > +bool kvm_do_userfault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> > 
> > The polarity of the return here feels weird. If we want a value of 0 to
> > indicate success then int is a better return type.
> 
> The boolean is my fault/suggestion.  My thinking is that it would make the callers
> more intuitive, e.g. so that this reads "if do userfault, then exit to userspace
> with -EFAULT".
> 
> 	if (kvm_do_userfault(vcpu, fault))
> 		return -EFAULT;

Agreed, this reads correctly. My only issue is that when I read the
function signature, "bool" is usually wired the other way around.

> > > +{
> > > +	struct kvm_memory_slot *slot = fault->slot;
> > > +	unsigned long __user *user_chunk;
> > > +	unsigned long chunk;
> > > +	gfn_t offset;
> > > +
> > > +	if (!kvm_is_userfault_memslot(slot))
> > > +		return false;
> > > +
> > > +	offset = fault->gfn - slot->base_gfn;
> > > +	user_chunk = slot->userfault_bitmap + (offset / BITS_PER_LONG);
> > > +
> > > +	if (__get_user(chunk, user_chunk))
> > > +		return true;
> 
> And this path is other motiviation for returning a boolean.  To me, return "success"
> when a uaccess fails looks all kinds of wrong:
> 
> 	if (__get_user(chunk, user_chunk))
> 		return 0;

Yeah, that's gross. Although I would imagine we want to express
"failure" here, game over, out to userspace for resolution. So maybe:

	if (__get_user(chunk, user_chunk))
		return -EFAULT;

> That said, I don't have a super strong preference; normally I'm fanatical about
> not returning booleans.  :-D

+1, it isn't _that_ big of a deal, just noticed it as part of review.

Thanks,
Oliver
