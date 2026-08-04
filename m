Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E09E46AF1B
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857999; cv=pass; b=f+J3aEJwSvE9QT98i6hLT3hHC0Jx6HOe2mz8v7lEKZTqphmiysmTOMmQVYTNsyyv0ei9//Sr+KdH9+6ugoIHXA6g/cwQHo6uWbgDdwA14r1Deo7swRBRAR9d4iqtdC0ybPIL4qErdMYJowtmBLSUDLSru+rJ+NpFCUKd6NfOlRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857999; c=relaxed/simple;
	bh=3oWNFp8mlmM3sK5SQC2KqwSAdHvsMlVK7v6l4lJqdEI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ua8JGQKS1TTgGwGDKJ4VkHA+ZZkhG/2M8/LUQ7GJ0p0ZqE/fQKpfL8tv744/Rw9Z7nDV0rqdEuKcCWxDy4qFrCUrmO85/2p6bn5R9AeT9pXMCVapxuGVTr4irPY3qffonvNzj4hcBbMETee+YVCQIgNmSbjROH1YqszFFQiEvuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u8Kqbe+8; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u8Kqbe+8"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3267189a91.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 08:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785857989; cv=none;
        d=google.com; s=arc-20260327;
        b=aTfydTeSVevEElNnKCZMug0E3U6OXAp2ZjekECMRecqG2kNZbSsIa3nzAavTb6dpnR
         5XAjwWzeInAUCJf+qQA+BZcptDKWaIG6whlDJdzPjVu966L8qOn+4wBsQf4+IZ4L+ymo
         CLKiC6zfJB2aFPgw30Pg5zp0J93pKBxh0/a7PoZo0Y7/vPD6e0QfJ2HtjiZWZgoXLbiq
         Lk49D1LhGnKyOODwP5GlN3e1QjZ+XuSPO0jElQ1odkPTnz/ydpBKchn+NMDWfOpMhxg1
         nNdWkzEG60XYnw1HssB1Tp036oiVbwG+Bv+a1dOjy9j/hAznUBgpf9v8TcVQiCXFi+ko
         /ncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CroU6+PYSvOtV4uy1av7nC/Q1rK5iyolsTF+JTm0nJU=;
        fh=rO9ulBEU8jFH19KC2aq+fHnCu7RCIKeaY8BTloBtf4c=;
        b=PmBV2A259jL+wwE0zAMb3VvS2aecagOf0mKKIZAEtLb/AF4Eh3iJqlNwj+4Bs2VEcT
         xqox6VHif8kmVL9yGnpVd5Ds+l9CJ7Ys+qss96ldr+Hd4bxjYXkdYcNGF6QVE3TD/3XU
         rGTfA3sNUv12dSf14FSfd8r+wMq8IC2cGptUNJTnnz7ZKR0f4khjGQag5u92nrGjf5jB
         +ZaJY4dDUVlRo0hoVQUwS0mrFFKw7n9NZHBq//JNColW9z2J26RvYjlsEDYjI17uehOQ
         Rp5hyqbq+LvEhDJVszH+Ta2gVgoEcgtO0bLoi0SMcEcCJjj0ipKiST0jcgaFFZCaDsBA
         bz1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785857989; x=1786462789; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CroU6+PYSvOtV4uy1av7nC/Q1rK5iyolsTF+JTm0nJU=;
        b=u8Kqbe+8NUGx9yefTwTAvANAItwU6yEEGFtaF1wptzb3NCfl/HzgNPdrrKzF+QZPyO
         qR2u7GnHAczFSGMxmu6RTivLrLESjLA6OcOIxReAP9at23zOfbu276qpd5NXebYcqTHA
         5N8K/OoH4gPX6399D+5ml7KSo3wNwYoSnMp/TiyNx1wFTWwJjIDfZUmJLvmOiqvMoXaq
         PV7jv6yblCt43N8A0QooLDkpvyGjlDlm4fFsN1RXKiXEpq8PzBqPKZHZ+22AjIlEmXOF
         FMh1HQ4kc6jxGPgaZJqsu/nRxDxYvTkJUY9S6qVhyXd3fjEH+qC+jhzuO6k67htlAucv
         cH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857989; x=1786462789;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CroU6+PYSvOtV4uy1av7nC/Q1rK5iyolsTF+JTm0nJU=;
        b=VJGpXhPUdeJwApi6CQgwgIjXd9Q2O3RbdD4Uvh18tcZ4PlS0bMODUDtx3lfPLtuOAK
         WbPmans3XcDHyHqSk7oMrnT8VeyJgIHPVptLuTogRo2YmLVK6EOy67yFvwVfYtcZQCcd
         FX691lkNq6oaVsGWYrbDqdn9RFog2+FHC73M1z4BhGqAMcXdYW2dWcallKgL6WWN6Wf6
         efSI8WTyQcLX+/PXoAO33X5QVG9gdNoq1uLVTzbBTiF6sLfk9+zGLoVGV8NrpbGmZtJa
         R9nr2VXuSYpthB5/YOHvlPpUX1DcA8XKoB9hpd2aoHgIM3eU6/yFzym8l0gGs3HihJBT
         kt0g==
X-Forwarded-Encrypted: i=1; AHgh+Rr2Ijf1J8+eIKlh5UJ5JOscK5ocB9RiqBQWzLqf7ccLegx81VEiLZ8Aqhr1cy13IQk67trepbX8Ssc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbSdAqLWYmwGfqvkItteg39TuXBM2onXdVSkFiDVt97+SJBiWg
	we+TX4Zgt+dOXRyIqHdvKJfonvxhSkJvBKHKviddO0ujbghZ6Vgp6tcLu98IOk0EsSk5yjP+RoB
	fttFyQJ9IrLDhmSs0jdyUfhKZlzKAJ5MuaKku1z1E
X-Gm-Gg: AR+sD13TG0lVRgTJVUPnhm8KFI4gfjj0NDJYz8/VkyWIUH5jHByuxLOPzNhFnC2Cwht
	JxA1G/ZTThKpoHzbhGqArv82qfnCGClWvkdZnlm9ehUcyoA2D4scsC8hCkIDLywrq1wB8moX6t5
	dPH2R/YmW7zmrdn80SDEpAocEM4W16k2MFfN3neySGMp97t8ye9Rpzi77RPTbY1iK6+1BouvpBP
	jFDUmDBRK8P5MT26ZpIxhqPivCnkdWwJYAxp3CSDjCm3S11ZsaAv7ZSIrx3liva3ozNxNgIlBKa
	uJRoT+/PD1FOp/oyP5EE3sl+j++WY+TIefwQH2iZAV7wTrqsHjXPe/kdZxT1Tgkint1k5SMkQ0p
	OCNEPMl4txG4=
X-Received: by 2002:a17:90b:1c8e:b0:38f:1a80:d1e7 with SMTP id
 98e67ed59e1d1-3903c596de7mr90484a91.13.1785857988201; Tue, 04 Aug 2026
 08:39:48 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 08:39:47 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 08:39:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <7f23d149-b7f0-465a-a9c0-5c7484e289d2@intel.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-20-35f9aec2aed2@google.com> <7f23d149-b7f0-465a-a9c0-5c7484e289d2@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 4 Aug 2026 08:39:47 -0700
X-Gm-Features: AUfX_my5tJzuKxcHX_DSDai20MF8F8MLGyTCXlBPRZTIfOOy8MGvwUJsA-dI9HA
Message-ID: <CAEvNRgErZqaLPpBveBd2VxdrS_8mjMbArL_=AhzMdikXmUU5VA@mail.gmail.com>
Subject: Re: [PATCH v9 20/41] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
To: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

>
> [...snip...]
>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index ea2752989f8bd..df67a6188aa99 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -1137,10 +1137,12 @@ static bool kvm_range_is_private(struct file *file, pgoff_t index,
>>   {
>>   	struct inode *inode = file_inode(file);
>>
>> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>>   	if (!gmem_in_place_conversion)
>>   		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>>   							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>>   							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>> +#endif
>>
>>   	return kvm_gmem_range_has_attributes(inode, index, nr_pages,
>>   					     KVM_MEMORY_ATTRIBUTE_PRIVATE);
>
> With my suggestion[1] on patch 7, this diff block can be dropped.
>
> [1]
> https://lore.kernel.org/all/dd4201f2-3660-46ad-958f-c70feb1ab1c3@intel.com/
>
> The code looks good to me,
>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>

I think your earlier suggestion on only defining the module_param when
CONFIG_KVM_VM_MEMORY_ATTRIBUTES is selected still applies, since it
removes an avenue for a user to turn off gmem_in_place_conversion if
the other option (VM memory attributes) isn't available.

  +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
  +module_param(gmem_in_place_conversion, bool, 0444);
  +#endif

Given that we're now dropping the diff block as you suggested, do you
agree that we should keep this #ifdef?

>>
>> [...snip...]
>>
