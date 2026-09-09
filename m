Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175075678C1
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964585; cv=pass; b=RcvxrrwRCezP5vncQhaelVDTL1zRCbSTXd/lXBK1woJnzCOITrzYCeO2gLlH3FVh1jY4ZTKZYtN6A84w2teaMmWpZZMutQOfAB2vK9hGuPHBHoAdnTaBtZhsxEETqLe71H9gpsqR10xySY7irxpeiXSyHVGk1ayd7t43nEGQ4M0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964585; c=relaxed/simple;
	bh=7AyHAWTKyqNTciVM9XLOxi3jtsvJfGFJongziGZ+beM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4BJDJvVkbVfNQy5NVcH9pfHfZFtkoqcxRG76chnsRLG24nmPkNSzspWbaId16cM4kyp1i8mB5aUb2WoGqPqdwNBaq1xrVbJ3Mlwap1xdf6wSyeHrxkHoETgZ1HEA6suJZSr4thBDaE8Pr+DZS0K6otIZRj6p2FZpboX6sYKOZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dGsiYTKa; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dGsiYTKa"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9106ffe17e9so7256996d6.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 07:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788964582; cv=none;
        d=google.com; s=arc-20260327;
        b=VAryS//ymDtB4xoG/6mNDTl2ZLyPUommsFsLssuEbibi3SgsXPjQwnV8w1ET98Nj9k
         kuTPmtv680JmjKetIiyGfK5sQmHW/Ekpo3r7ZzDiB0WenZEFbJEHi6fSXBfC7BkTmp/6
         DL0zkG3NPzTtb+hfxT5AAvwNhmOmGUqldpzJGx1JCaYxfVA80mSWcnurxgnQIXFUEq9s
         WN9Yh5SpaIJ4fu2cAgIcrON9V3l85d/1WuTfy94o4+mnJHPVQp3VOFFSYn+V0GbU0xSs
         /w0HVKQhE4GUffEZfjgkdscmteLRuwOPWiqZHByOVcvAejQmJWG5qWCtoTPK/85FR6m5
         Ti3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=WOdNfCxlVFqMCNwG5WAXrbnbeG8MIfsFEPI5I8fCsWw=;
        fh=OCL/cKE3T7X3bWQWygEWh48D+JD8x4c2TLrVOwea1dQ=;
        b=bB6/xRZ2x0oTSic9wBPbhFtMyIqLx0Vyl2guQVNWa19z/kvzwtk1MQnP+T4JeU+1Jn
         fcNFCJ9aJRIQBDCcao1/EB8RwfKXfnXxobGEWyi7uJERDjc5vPnGUUMBeyuJ05z+Qp9O
         cCeiF3t5Xi6Qe3pf7lXIcWqx5EBo7nak2nxhIGDWuRrgQCdsPnP5Qwcyzgl6uFIfvpaX
         Q6DCtFo1INS2dRbbsvWOb5rE1R9cNkciAXa77R32QwbXcnCTxukaiaI0Cbkmpil1oYdO
         eaxuXM3eek7z/ONfP4bRfczCx5L6GcYSBgfqcsdGnSZ+pF3sp4Tl92kRshiIdYgReShi
         p1fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788964582; x=1789569382; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOdNfCxlVFqMCNwG5WAXrbnbeG8MIfsFEPI5I8fCsWw=;
        b=dGsiYTKaFp9FGDwKvEsAeUcOdGsL74uWemUti0nr4w33aRRJErCdwdKueOTKyD5QAJ
         JIjJ3YKQ9H32NXQen63CtE80VKgenxExiWL/Ev/1cBnKtjnJMqQvmW3q/0+CS6BeRl5y
         QYuFNrMPHAH+uboqqIpzvVcd+PcqQTVq9vi3hojyk58+7B92Gg/DHY6VZ2DIInsq9cBR
         fkR2wDtUxI2pb8qZiYYKUIq5ifPOyPhDqTR6QBmjuzp0in7cZyOKFEr4g+MoEzc3H1b+
         M2lFJkShzuoJ8Ezbui+5tOjMjTZL6WiKCYg0lSc4oA0ZGb5l5J76QdQv/3qkxmW/gcCW
         yEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964582; x=1789569382;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOdNfCxlVFqMCNwG5WAXrbnbeG8MIfsFEPI5I8fCsWw=;
        b=Imyh2jel4B6eOdJJHZwtxf7RRvBYx+vetQraoX5dfTKcew5IHUsg6EgGNe/X0SpAC1
         9TehHK6yNOCTu/ljDSM3+1ErCHh/9ko/E9skt8dUQYRX1jAtQwXZbUp3NT9xUHbqxsZs
         tp40wP+Wj9/FnaRF7VOwpoOf/4MS8tWZ2lXvqLlscM/uKMDLRbCZX5ux7xBHAfgkJLyn
         4QUHgh41WjvWzA6OGzxvSgBiVK0MWNhOowbIsQRBGF5NPZfdh2QGUstZ73N3tzx9bksg
         6s8mPxWhFE7RZkAGyqSJVHEJItmkzphWFGsjKqEFau2mwTzFVdtbNqViuasATbzZ5Gp8
         EJ+g==
X-Forwarded-Encrypted: i=1; AKwUvBwMmyiQcW79rqg4aMm9M5XBME0FxAdlmqxEB/qZYCP7BlBZ/e7/qEOSu1XVN8eWq7z3jGs0sdQkvcw=@vger.kernel.org
X-Gm-Message-State: AFuF++lMH954v4du9kE8TDmFRrTQGo9rq+XvHYYz/j8N6/vrBg8JG46p
	s+IVCsG5xNRcFJgiJNwArBOe+GS1o+aHoQwkMnsYP2fspns/WpiKVkVM4D5oRxgxd5A1RpOfPcs
	A3FfK5HzrUpRaELa9KISN/uvD7KLjJTivJH+ReA/g
X-Gm-Gg: AYBFou3Kp88BtGR0M1r/r379wmo5eeV+pUQtX3U+BW2fujeFaGmqPVCY5TvxpPe+Sfd
	+juS+nBGD9AEnMG4MGFOAdKJ7EM+4sxdlu57+idL0zLJ2RBwds1JNcO8fwDQhmxtIuS7l1SwmYt
	vy1p48GdBD10eoo3Kat+iPDqjMrDY8OghDZzEbvOtqtVM8S9cPLTNK08Q1Kc9SDdNeQck1lXzBC
	ULkmqbXB8UCGLdulqiJZ9rebQ37yrAsJnTqxk9focIUXTtrVkm2aqJqc78XMyEMOSxVWQ7rvKoQ
	b6VsW7m3wnH2PKDb78rMWmZcaRftziiHqYUJ56eIziZAHcft2/+I4Kg54ZSKsd5SAjjU83Kyvz6
	4zTBmfYQg2FI=
X-Received: by 2002:a05:6214:2f8c:b0:910:3451:341 with SMTP id
 6a1803df08f44-9103efb48afmr490270826d6.32.1788964580576; Wed, 09 Sep 2026
 07:36:20 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:36:19 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:36:19 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <apetw3aqXSawLBt0@yzhao56-desk.sh.intel.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-12-85e5fd25252a@google.com> <apetw3aqXSawLBt0@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 07:36:19 -0700
X-Gm-Features: AcwNN1VdQII_SBwvozqnLJxonm84Qmsr9AHJ5M73oMtr5q_ETKWllQrAhks6iFI
Message-ID: <CAEvNRgEmO-R35susJd+U+k-nB_yFE_gfh+ACrnaOR=ECJdWGuA@mail.gmail.com>
Subject: Re: [PATCH v12 12/45] KVM: guest_memfd: Always fault from guest_memfd
 if in-place conversion is enabled
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

> On Sun, Aug 30, 2026 at 05:25:13PM -0700, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> If a guest_memfd memslot is created but the guest_memfd does not have the
>> GUEST_MEMFD_FLAG_MMAP set, KVM still fulfils guest faults by looking up the
>> memslot's userspace_addr.
>>
>> Set KVM_MEMSLOT_GMEM_ONLY if in-place conversion is enabled so that the
>> guest_memfd's memory will be used for both shared and private memory. With
>> in-place conversion, guest_memfd will be the only backing memory for the
>> memslot.
>>
>> No validation is performed to require userspace_addr to be a mapping from
>> the associated guest_memfd because even after validation, userspace is free
>> to remap something else at the provided userspace_addr.
>>
>> userspace_addr will still be used by functions like kvm_read_guest(), and
>> if userspace_addr does not match up with the corresponding memory in the
>> memslot's guest_memfd (whether userspace_addr points to the wrong offset or
>> some non-guest_memfd memory, etc), that is a user error.
>>
>> Requiring both shared and private memory to come from the only associated
>> guest_memfd simplifies invalidation in stage 2 page tables. On a PUNCH_HOLE
>> operation on a guest_memfd, the invalidation is now guaranteed to be
>> invalidating only memory mapped from the given guest_memfd.
>>
>> Suggested-by: Sean Christopherson <seanjc@google.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  Documentation/virt/kvm/api.rst | 22 ++++++++++++++--------
>>  virt/kvm/guest_memfd.c         |  2 +-
>>  2 files changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 90a29424c54c8..668886f50024d 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -6381,10 +6381,16 @@ mapping for userspace_addr is not required to be valid/populated at the time of
>>  KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/allocated
>>  on-demand.
>>
>> -When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
>> -userspace_addr vs. guest_memfd, based on the state in guest_memfd, which is the
>> -sole authority on private vs. shared memory.  See :ref:`KVM_CREATE_GUEST_MEMFD`
>> -to find out more about the creation-time shared/private status.
>> +When mapping a gfn into the guest, guest faults are always serviced from
>> +guest_memfd regardless of whether memory is shared or private.  KVM determines
>> +shared vs. private based on the state in guest_memfd, which is the sole
>> +authority on private vs. shared memory.  See :ref:`KVM_CREATE_GUEST_MEMFD` to
>> +find out more about the creation-time shared/private status.
>> +
>> +userspace_addr is expected to be the mmap()-ed address corresponding to the
>> +right offset within the guest_memfd. Any mismatch between userspace_addr and
>> +guest_memfd is not validated and is a user error. userspace_addr is only used
>> +for host-side guest accesses such as kvm_read_guest().
>>
>>  If in-place conversion is disabled, KVM selects shared vs. private, i.e consumes
>>  userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
>> @@ -6490,10 +6496,10 @@ specified via KVM_CREATE_GUEST_MEMFD.  Currently defined flags:
>>                                 page tables. Private memory cannot.
>>    ============================ ================================================
>>
>> -When the KVM MMU performs a PFN lookup to service a guest fault and the backing
>> -guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
>> -consumed from guest_memfd, regardless of whether it is a shared or a private
>> -fault.
>> +When the KVM MMU performs a PFN lookup to service a guest fault, the fault will
>> +always be consumed from guest_memfd, regardless of whether it is a shared or a
>> +private fault (unless in-place conversion is disabled and the backing
>> +guest_memfd does not have the GUEST_MEMFD_FLAG_MMAP flag set).
>>
>>  See KVM_SET_USER_MEMORY_REGION2 for additional details.
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 0afe1468d2d9d..e41802944756b 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -746,7 +746,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  	 */
>>  	WRITE_ONCE(slot->gmem.file, file);
>>  	slot->gmem.pgoff = start;
>> -	if (kvm_gmem_supports_mmap(inode))
>> +	if (gmem_in_place_conversion || kvm_gmem_supports_mmap(inode))
>>  		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
> I like this change, which actually enforces in-place conversion -- when
> gmem_in_place_conversion is true, if userspace sets slot->userspace_addr to a
> different backend, the host and guest will no longer be able to access the same
> backend.
>
> However, since gmem_in_place_conversion is globally and statically specified, it
> essentially disables the coexistence of VMs using out-of-place conversions when
> gmem_in_place_conversion is true. Previously, VMs using out-of-place conversions
> could still boot successfully as long as they switched to using per-gmem memory
> attributes. Is this change intended?
>

Yes, this is intended. gmem_in_place_conversion is intended to be global
for the entire host.

> On a separate note, is kvm_gmem_supports_mmap() still a necessary requirement
> for setting KVM_MEMSLOT_GMEM_ONLY? When gmem_in_place_conversion is false, if
> userspace mmap()s the gmem but sets slot->userspace_addr to a different backend,
> should the KVM_MEMSLOT_GMEM_ONLY flag still be set?
>

Before this patch, requesting an MMAP-able gmem will set
KVM_MEMSLOT_GMEM_ONLY, so if we change that behavior, we'd be breaking
the existing contract.

If userspace requests an MMAP-able gmem and then sets up
slot->userspace_addr to something else, I think that should be
considered user error? MMAP-able => use gmem for all faults has been a
thing since before this patch.

Just like how there's no good way to check and maintain the validity of
the mapped memory behind slot->userspace_addr in relation to the
provided guest_memfd, the mapping can't be used to determine whether to
set KVM_MEMSLOT_GMEM_ONLY either.

>>
>>  	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
>>
>> --
>> 2.55.0.897.gb25b4bd76c-goog
>>
>>
