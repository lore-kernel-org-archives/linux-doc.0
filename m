Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A9045C71E
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515194; cv=none; b=lFfkxRkuQP9U6wt9C/Dc9Ci/QUI9yP3jSAe+I1s7N1t+R6kljnay3p1qKJi378efTnnv3twa1ANko6IuqsC6UnS6hS8DVfbH4xMWoc4utDAY+r8LuPeTgmNeYfXEsrGtnqUKYHy/eAbv1uPqbCRhVamyps/tMDAZOTBRM47Fo3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515194; c=relaxed/simple;
	bh=tmfdgsRNGmMoH53JWSNejad3XkKOScNgIyXixI/ReSE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SC8miLNmg+tw6R41jHNMBZ58Zeu02cuD8t6OtGSPgovg2b6e0UX+3p8OUq2oymidvmZGKsVGQbXTUABk0LDwzfJlo7ZYXIrIITGINVJRjsFFZriZqLoiAg+lQJZxl/SSTMRWNld/HEkBAx69IRrTz7Lm/EYamA+13ri5fmJa9Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cQq0Hcdr; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cQq0Hcdr"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so1973750a91.2
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 09:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785515191; x=1786119991; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ICGNWuPesT/hzVX75ShCk7Kt8oQvWLyQi/M5mp0efms=;
        b=cQq0Hcdr0r3PJQFHe2++OWFB2+NTTTKzwLXHp9sbf5CcOqxPuvOYOPEo4Wk79d0Euu
         En+Nz+SPNupRZZN+Bjxfw1HzaZPWxH6hSR+eNa1auWZq7vYaa2V0jua9Rmp8sq+c3Fjl
         ylycm5nS1nEyd/xdhWdVk5LWtelb/hjCVHT9Rr304ltdSLPRIJey1PW7OphyVGN9GZr9
         nNMpL0NeJtgBz2p3vi123hL5sjSSBeNkpbRI5yqm2IHfQPwo9KpfC9vTllKXY3RJpPBS
         nsZNJW+qtQBGpMrEG+QlUFREEbDvaRQGAJ9nfJRiU32eTXL2wC6u8kD2FuOToSEMR+2H
         Gs/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515191; x=1786119991;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ICGNWuPesT/hzVX75ShCk7Kt8oQvWLyQi/M5mp0efms=;
        b=aTB+bBDgXqID3vGv8XJA3Ruuzko2JOdOH3gxbOKx9S2jG3s3KJmhvx9kM2opdP2Qc9
         bGzfUjkBhCsEB+MFUUPgnv+7OLepawAnY1PXdo6K35XsUQ2dDfbjDxw+gW/gN/NaBTHT
         i6/W7LFvMHgDIe3I4dyqdHlrczyJlq219suYHnHguie6EAX+peLNgyXtxv60CBKBjZAn
         mZV8YV9Ss+e79xbktGsEQRe86wQq554N454Jj43jbPdF2kc4n6tcBBgbs37VknLXPujq
         68KeQOepW5fzV5E9kGlY5folY1IggTh+iX/NrHqhBvUbMAOVRrgePGD6mipM2oGQbkQu
         R5BQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQtzKLi4XRg8AXqiQWQ0Gij9c7v3XfhpwQ+5lkXORQDkGjGso8MDZJg2uaLXIzZ+KvcoFS0HdfSHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvqBdj4oa1+Yh2wBH3NFUEt7ewgWusJwTrGNXMgAB91Ln025AO
	rsyDkzamtpPZEpLlS7k0E3I8ofjo4T0ZmSYZYafxAQt3Vhw825gmpKmjHrM2o7oZJfqlrD5QSEw
	tW7Rm6A==
X-Received: from plhi11.prod.google.com ([2002:a17:903:2ecb:b0:2cc:5fd1:2d93])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3b8e:b0:2ce:b096:e517
 with SMTP id d9443c01a7336-2d0521cda4dmr6567475ad.5.1785515190881; Fri, 31
 Jul 2026 09:26:30 -0700 (PDT)
Date: Fri, 31 Jul 2026 09:26:30 -0700
In-Reply-To: <dd4201f2-3660-46ad-958f-c70feb1ab1c3@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-7-35f9aec2aed2@google.com>
 <60d19013-d6d7-4eec-827a-2622e22cec98@intel.com> <CAEvNRgF0SxmoMtqq69tUih54A9K7j_wcMFRrq=r9w6TnAGAUQQ@mail.gmail.com>
 <dd4201f2-3660-46ad-958f-c70feb1ab1c3@intel.com>
Message-ID: <amzMtg4K6qEEsudx@google.com>
Subject: Re: [PATCH v9 07/41] KVM: guest_memfd: Wire up core private/shared
 attribute interfaces
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 31, 2026, Xiaoyao Li wrote:
> On 7/31/2026 4:42 AM, Ackerley Tng wrote:
> > Xiaoyao Li <xiaoyao.li@intel.com> writes:
> > 
> > > On 7/29/2026 8:35 AM, Ackerley Tng via B4 Relay wrote:
> > > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > > index 33c9830190e2e..89cf922232920 100644
> > > > --- a/virt/kvm/guest_memfd.c
> > > > +++ b/virt/kvm/guest_memfd.c
> > > > @@ -893,6 +893,27 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
> > > >    EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
> > > > 
> > > >    #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
> > > > +static bool kvm_range_is_private(struct file *file, pgoff_t index,
> > > > +				 size_t nr_pages, struct kvm *kvm, gfn_t gfn)
> > > > +{
> > > > +	struct inode *inode = file_inode(file);
> > > > +	pgoff_t last = index + nr_pages - 1;
> > > > +	struct maple_tree *mt;
> > > > +	void *entry;
> > > > +
> > > > +	if (!gmem_in_place_conversion)
> > > > +		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
> > > > +							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
> > > > +							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
> > > > +
> > > > +	mt = &GMEM_I(inode)->attributes;
> > > > +	mt_for_each(mt, entry, index, last) {
> > > > +		if (kvm_gmem_interpret_entry(inode, entry) !=
> > > > +		    KVM_MEMORY_ATTRIBUTE_PRIVATE)
> > > > +			return false;
> > > > +	}
> > > > +	return true;
> > > > +}
> > > > 
> > > >    static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
> > > >    				struct file *file, gfn_t gfn, struct page *src_page,
> > > > @@ -913,9 +934,7 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
> > > > 
> > > >    	folio_unlock(folio);
> > > > 
> > > > -	if (!kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + 1,
> > > > -						KVM_MEMORY_ATTRIBUTE_PRIVATE,
> > > > -						KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
> > > > +	if (!kvm_range_is_private(file, index, 1, kvm, gfn)) {
> > > 
> > > It's checking if a single gfn is private.
> > > 
> > 
> > But with huge page support we'd need to check a range of gfns... I guess
> > there's the argument of not keeping complexity for the future, but in
> > this case it's undoing functionality for this series and probably adding
> > it back later.
> 
> let's leave the work for huge page support in the future.

It's not just for hugepage support, the core functionality is used in this series
by __kvm_gmem_set_attributes() in:

  KVM: guest_memfd: Return early if range already has requested attributes

> > > We can just use kvm_mem_is_private()? And it seems can be a separate patch.
> > > 
> > 
> > Do you mean that this refactoring could be a separate patch? I could
> > refactor out kvm_range_is_private() in a separate patch, then put in the
> > mt_for_each() check in this patch together as part of all the rest of
> > the "wiring".
> > 
> > I considered that but it seemed like the refactoring was too small to
> > separate out into another patch when the mt_for_each() part is going to
> > be in this patch anyway.
> > 
> > Or, I could add an earlier patch to first replace the call to
> > kvm_range_has_vm_memory_attributes() with a call to check just 1 gfn,
> > then this wiring patch would be simpler.
> > 
> 
> This is what I meant. An earlier patch to just replace
> kvm_range_has_vm_memory_attributes() with kvm_mem_is_private(). Then we can
> drop this 'big' diff in this patch.
> 
> If kvm_range_is_private() is useful/required by huge page support, then let
> the huge page series to introduce it. It has nothing to do with the in-place
> conversion series.

If it weren't for the fact that the range-based search is used later in this
series, I would 100% agree with Xiaoyao.  But since the core logic is used and
needed elsewhere, and because kvm_range_has_vm_memory_attributes() takes a range,
my vote is to provide the plumbing now, even though a small portion of it isn't
strictly necessary.
