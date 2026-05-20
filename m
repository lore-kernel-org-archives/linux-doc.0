Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C848372EFF
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 20:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779309556; cv=none; b=AGa1e6MoRzyrf87uY605eG5Wiv8qUHz6AZa+4u5WBdLG3nc0nUrd6PdqDy/n8Uhb6SjxvEknvx2gJTeGNKvyRjBqtbyFgkhuGg3c+10Rx9jkr/Ou0BFf5v2Akii+ThYDIvfkuXChQ5+k6zlHzJYMOd7d1UK1gbnZ7N/kOjStCRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779309556; c=relaxed/simple;
	bh=aPHKuisUhH51MTn8T7XbafpJ/oicbFys4PXe9ZcC4Dc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A9ohkq8NZoO+X2cdsGyBilBr4NnReJASjJaJ3wIlz9qq7aumC+y1bL20a4Mazk5SVYYABRfGd+KodKvJ3cKh9uKq7MUCH//LvEhgl5BdoRGOXmkd1O+FYoKVlnUzrzFei+MYv9AVGk7hFYe5ZrYCMqVI3KJCiMbHGn+GfaNji4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ID5ERv0A; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ID5ERv0A"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ba3245a43dso55091025ad.0
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 13:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779309552; x=1779914352; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dGWVowUBUXf4rcBcRgB2FD5jKsVoidTqoHPe2NfYeqM=;
        b=ID5ERv0A/Umh/N9lLuKsLSbU+Xi78SKhu/ROv21k59yrfH4sVRYKKksl9pLy7Z1yqC
         Zf6ewCbZKIOesodoWWeRZTOUhG3U4Vj39KOn3cSp2hpOCIqnKSjKfptTnX3ZP1kx7IUl
         hL4HsGncKuV0AL709nhYKa6qJLInhhLJxKkCYTcmx3S6dFPHhxs80JkDF7Uajbxbk2Hv
         BlmYa1Oy4Q4BZZjZ5lNHjg9+n2G9rfGPjNiU0dmIFCEPygc0nf7pZ0OkTwlT29xkU/uW
         4kjqbN8ZBIiYgd35Yx+V7Eo0I8v6lK6yKO76XDWzpa5lgDDFLf2NrOeYWzwu/xySiKCH
         bR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779309552; x=1779914352;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dGWVowUBUXf4rcBcRgB2FD5jKsVoidTqoHPe2NfYeqM=;
        b=aagQuIC9yS3qxyFaHRBRRC7OmCqdSx/dfPNnpeT5s5VThI8AS3wilRVrNwp2+V+QuV
         6jj/rSGUtg3V7nPLkqZ9v/mxoNu1myt69fTKRWHvnzZnLWxIu1g6agj3QQDbQAcuSvhe
         fvyfsKLTigV62shqDP6X2zP9HUErVMaIfeWXF1Hnl2aSUQLrNnHiiB1b33HwsJerWx6d
         ATP4/V7mhZJijhD9mN3ielsJf0qoMZXr2tVkCnTxPrr0aG8p6vSG7Dan/no/45OcKXMN
         fmhyiPWDFV5USSY+st4JVddJ/wPOQ8MCoUCpO0V4xz9WgXTzPDX52/+VMOt9lN8ND9u+
         pw8w==
X-Forwarded-Encrypted: i=1; AFNElJ/+5IAgLhtV5rrbHQR37pooKPf7hfReBMvjpsH/9yDoUNLGqPAm5toU42sxVyoHvkPyyCfZR6suEWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0WE3ZfiFeDsQAkiyTLNfHHkISYJwhIMVtchPbdqciulMwLmRh
	Pa5geQsFny9y7aT0p/9CzzFdc+B2fHVZWsGT9Bb/QnzwsQz9YDdnZoy4pCy4pSuFc6+Mq+n7qDK
	dnF/QYw==
X-Received: from pghz21.prod.google.com ([2002:a63:e115:0:b0:c7f:c4f1:ae17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7349:b0:3a3:17f8:bedd
 with SMTP id adf61e73a8af0-3b22ea4f434mr28099153637.17.1779309551955; Wed, 20
 May 2026 13:39:11 -0700 (PDT)
Date: Wed, 20 May 2026 13:39:11 -0700
In-Reply-To: <CAEvNRgGHHkvfJ-mn9rfDvS+_1ht08YatFWo-Swt+5wFSPnC9Nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-6-91ab5a8b19a4@google.com>
 <CA+EHjTxvLU4XDPXDXYXXWJES1OFQgN8VTRLMgCCNMwBE6Hk8tQ@mail.gmail.com>
 <ag3DawWCcrpCkD0e@google.com> <CAEvNRgGHHkvfJ-mn9rfDvS+_1ht08YatFWo-Swt+5wFSPnC9Nw@mail.gmail.com>
Message-ID: <ag4b74HTrFZQ7bra@google.com>
Subject: Re: [PATCH v6 06/43] KVM: x86/mmu: Bug the VM if gmem attributes are
 queried to determine max mapping level
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Fuad Tabba <tabba@google.com>, aik@amd.com, andrew.jones@linux.dev, 
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
Content-Type: text/plain; charset="us-ascii"

On Wed, May 20, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> >> >         } else {
> >> > +               /*
> >> > +                * Memory attributes cannot be obtained from guest_memfd while
> >> > +                * the MMU lock is held.
> >> > +                */
> >> > +               if (KVM_BUG_ON(static_call_query(__kvm_get_memory_attributes) ==
> >> > +                              kvm_gmem_get_memory_attributes, kvm)) {
> >> > +                       return 0;
> >> > +               }
> >> > +
> >>
> >> This directly takes the address of kvm_gmem_get_memory_attributes,
> >> which is only compiled if CONFIG_KVM_GUEST_MEMFD=y. This breaks
> >> ARCH=i386.
> >
> > And this bleeds guest_memfd implementation details into places they don't belong.
> > The right way to deal with this is to use lockdep_assert_not_held() in whatever
> > code mustn't run with mmu_lock held.  E.g.
> >
> > diff --git virt/kvm/guest_memfd.c virt/kvm/guest_memfd.c
> > index c9f155c2dc5c..3bea9c1137ef 100644
> > --- virt/kvm/guest_memfd.c
> > +++ virt/kvm/guest_memfd.c
> > @@ -547,6 +547,9 @@ unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> >         struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
> >         struct inode *inode;
> >
> > +       /* Comment goes here. */
> > +       lockdep_assert_not_held(&kvm->mmu_lock);
> > +
> >         /*
> >          * If this gfn has no associated memslot, there's no chance of the gfn
> >          * being backed by private memory, since guest_memfd must be used for
> >
> > But I'm confused, because kvm_gmem_get_memory_attributes() doesn't actually take
> > filemap_invalidate_lock(), so what exactly is the problem?
> >
> 
> Ahh I can drop this patch now. kvm_gmem_get_memory_attributes() used to
> take the filemap_invalidate_lock(), but after Liam pointed out that
> the attributes maple tree should be using MT_FLAGS_USE_RCU, I stopped
> taking filemap_invalidate_lock() and forgot to undo this.
> 
> I'll wait a bit for more reviews and then put out another revision
> without this patch.

If this is the only issue with v6, don't send a new version, I'll just drop it
when applying.
