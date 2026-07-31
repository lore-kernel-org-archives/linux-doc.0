Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0013B05AB
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514101; cv=none; b=H5KkRprOtw9AnPNyhMODyXNqMYDcRcQC1m+M78XWr29J15Qp/UEXwIJSDxE+mV+B1rTTGqVeofp/EB4hK9mcCriTNHujRXM0ufZdXccvu+8xQ0GOlx61DTtXjcsRVjrYFjom8ekd22BEOZMcGoT4knhirW0Tlh7BCZc33SPYNCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514101; c=relaxed/simple;
	bh=eoU/bl01juZhkFeEsFCNMw62ts9Heu+h9ABYGuS6Gco=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VUyJjHc3irY2E3uQNA2Z9FGIrH4t5gD/sVGAunUMVb3M6qeJKDqkNf6yVLEWLPPIa42BmvOSNtyiOgGFerG/YJkcYCLwliEi9JFc+eSZKRFK79QxdjEUPmwskIWvjyQPWz474gjAchbtvQFcZ4v4Q8uHTS9joSsk3bbajMz1/ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NiSFwaBK; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NiSFwaBK"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e667368f0so1982456a91.2
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785514099; x=1786118899; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnhBgLexccnG/MXIqot9sZlADClDA3hnAx45msmNhUo=;
        b=NiSFwaBKPsjjoPv3NvcMIWPqVxq0p7c+DyG+r9piw2MBF7EDbV9Ep7OZH8o4eerwJk
         H4JIySR2SCukYBn3VBz7X3hXMstFPXpFLW5EU0wf0VT2ardZaaOgdzP7I+pKGu8EKi3j
         5U71NNkkCRnm6Vhw7uq179S2yAPv/XNEnuCDF53GWfvCNTqK9llFMQJwpEpbukV7n7xA
         5SbrFFcfGjnwPkFtop0zYzjr6cja1EyCPReIDeZKQzXyOSU9mHEwdvmA9E9sDROLayR1
         FEJmkTo1V7BqW2UhxmuWNg9uFLq/SGsXwt+zlEvzp5J78rCQnjEGOxk+OJSnyRHsccnG
         73eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514099; x=1786118899;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnhBgLexccnG/MXIqot9sZlADClDA3hnAx45msmNhUo=;
        b=QJYMgse/mssVRkssnoEm56g2CTrTfZaZk8ftiz8AUJyi4rq2zFiWQLwbYt4mJBRZ/f
         +dEwKEiQr/Qqbl15Qn55FIYkVdhxa1I35TuXGNssfpFM1bZSHSAbnSvU5kVHr+veOudY
         zfUSTJA0aUNdd/JxR51tNQgZc3eorxiTjnFGjwm1GP/n3Nkp+gsBGJmbH6Lr+ZSs4Ryj
         6QEyJLRk4fkrN4R4HgWGdhxoQSqRt9tTHo46w3h7Xol+JaFJPIoGfWgC7TsQGwlREC2G
         IQCsEPPBD+PHVeatRHVEHbMRv5zA9RYB7FRAFW3kUKxnlQ/xRTlF4Had7a1rFpaAax8g
         W/Kw==
X-Forwarded-Encrypted: i=1; AHgh+RriytX/3HQ/GdGmbiNZ4Y4biBqjcshdogriOibRU/SlCi1kt7gic2HU8aiXP2qcuyuPwBz7CDE4ZqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZdcsX0JyWJCLJAx7HhzZFKNZZ5kTOVG0YgpNAweIMAE0CkTpw
	HrOwojSzF7nhTen8nkzJtpHzujRdw3pcq6AQ3GJsLWOlhBAuvhJ6MC4vRqP12v7wbIp6lNI9x9Z
	B0Zk4fg==
X-Received: from pjp5.prod.google.com ([2002:a17:90b:55c5:b0:37f:acb7:9d81])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1a8a:b0:37c:18e0:90dc
 with SMTP id 98e67ed59e1d1-38fbc45a7abmr414580a91.16.1785514098749; Fri, 31
 Jul 2026 09:08:18 -0700 (PDT)
Date: Fri, 31 Jul 2026 09:08:18 -0700
In-Reply-To: <b78bfee9-29f3-4044-8ac7-f294b3cd0ad8@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-1-35f9aec2aed2@google.com> <b78bfee9-29f3-4044-8ac7-f294b3cd0ad8@intel.com>
Message-ID: <amzIckjuwf0JfINI@google.com>
Subject: Re: [PATCH v9 01/41] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
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
> On 7/29/2026 8:35 AM, Ackerley Tng via B4 Relay wrote:
> > From: Sean Christopherson<seanjc@google.com>
> > 
> > Start plumbing in guest_memfd support for in-place private<=>shared
> > conversions by tracking attributes via a maple tree.  KVM currently tracks
> > private vs. shared attributes on a per-VM basis, which made sense when a
> > guest_memfd_only_ supported private memory, but tracking per-VM simply
> > can't work for in-place conversions as the shared/private status of a given
> > page needs to be per-gmem_inode, not per-VM.
> > 
> > Use the filemap invalidation lock to protect the maple tree, as taking the
> > lock for read when faulting in memory (for userspace or the guest) isn't
> > expected to result in meaningful contention, and using a separate lock
> > would add significant complexity (avoiding deadlock is quite difficult).
> > 
> > Co-developed-by: Vishal Annapurve<vannapurve@google.com>
> > Signed-off-by: Vishal Annapurve<vannapurve@google.com>
> > Co-developed-by: Fuad Tabba<tabba@google.com>
> > Signed-off-by: Fuad Tabba<tabba@google.com>
> > Signed-off-by: Sean Christopherson<seanjc@google.com>
> > Tested-by: Shivank Garg<shivankg@amd.com>
> > Co-developed-by: Ackerley Tng<ackerleytng@google.com>
> > Signed-off-by: Ackerley Tng<ackerleytng@google.com>
> 
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> 
> <...>
> 
> >   static __always_inline struct gmem_inode *GMEM_I(struct inode *inode)
> > @@ -60,9 +68,25 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
> >   	return gfn - slot->base_gfn + slot->gmem.pgoff;
> >   }
> > +static u64 kvm_gmem_interpret_entry(struct inode *inode, void *entry)
> 
> Ummm, I'm not sure on the name. It doesn't look like KVM's style?
> 
> Maybe, just kvm_gmem_get_attributes()?

+1000, "interpret_entry" is extremely vague.
