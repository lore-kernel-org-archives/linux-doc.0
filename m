Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C7241D65C
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 08:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041374; cv=pass; b=UNnhzB+gSznYV/FzSC2j8yDfgipGHPjWuYzSyQgO5YBTHZ5k0KpyFK6Mxrd9MQ0UjCPJNaAE0GZ/zuoC7v5PSK8AEYaVHps3Muy9Tyu4SgF0rtawlDzAjtatB4Q2faJvlp4Gq2eba79HA9g62p4ul+5QIprnLtTjahUjNRSvMuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041374; c=relaxed/simple;
	bh=5J3xUB3/7aisz9iRktEt7o1yC5SHtH7S+wRq998947s=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVkHV1xf1uhptJ/jMXsDyx8XCj8iD4jk4I7/vftOzervIlsY8u1jswuti8B2h6M97NgmQG+Wj3+THtOIR1UrM2PaQWQmuR5A1zlxLV4m4/HXYyreCdWhnJFTfhX7ClYnhvxJ5rb47kPaGzV9aszolDzuIO9TVjW/d2BEEbuJYQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T826V2Jz; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T826V2Jz"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf50c6f235so52722945ad.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 01:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787041373; cv=none;
        d=google.com; s=arc-20260327;
        b=sayc9OHg7QQogtIgTZ6C6WPWlKY/1SbeURq45tvgrqlzcJiSCbc73ofd0jfbNvp9wB
         mpiSNf4UFNOuxkDtFjIRA/Hlt/MiXBhtPqaEEfsYRqSEKdZAKUjReOrywa9/9Nbq+XgG
         DHXWSUZWHwEPkbrNbGPPS+Lul9ho/5ETts8KLZ3QPPrWq8riYkSiAB+kQpouc9bsB1Sn
         cWC5BqLGEJcgg0Q07s3Pcg5N707XEm+k95bjJNcwU2qPDvgzs50x6dwSSGNGwQOIpuqW
         Uw79dneAITKxnkLNPjtW6pgjjFll4iK76YG6yho+CAw09ryecAkB5FzXZCLPApQbuZBb
         qQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y79lKilZje+Nl3Rv+2N5vQhP9be8wEt4E0ek84GffA4=;
        fh=mQ2PNTfcLv5BE/EluCRqmvYbzlBSOmZ0up4ztW3FcEw=;
        b=IdV4HyLw4AhLVKSi7ABqND2/8LehxuJnEJGctH0B6BNdqiaW0HSEwj7t9jdRHe5Rsd
         eijcM14r0cvtUjBGbRryZjvXooTP4kiWa5nDsj+CFuzp6CasY2K14ZUTEFrKqCbyhTFM
         zrMBNtcRSk0tpaohzTDcxtfUfGZbmX0jVXJDTKC7GEfqUpRKJY+d9Tn7Lp/eRb0nz9L9
         h41RWa9DCiPNBWquiGgQXEQ//HMaNv+Z/1KRMPJ7ljlt7rSgxmNw6b0pwNPh0q3+tX74
         OS7NERuQlnUjVtyqVdppJuI/+SQ1UQCWY3rnLcE6d9Gnw9FFRLvMeRxb4kjzvywLwgRy
         cP0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787041373; x=1787646173; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y79lKilZje+Nl3Rv+2N5vQhP9be8wEt4E0ek84GffA4=;
        b=T826V2JzQmY0bin515X5csS1JNLlgJ+k5RabIjx8Nf7P7g03ErnJyovgsFXd23Q9Vc
         z8AQrpDSkqu5btNFUJQ+DwbG49sSIRey6haYFnfXG7fADLiaig6qymiR7wtLstRdfMZZ
         Hf47/UsUqaozOh0olPd+JMVYoN1k0yKArFcwSNgUOsZbXZIGNV8S8jn8ebaDN+Nqis4D
         kshDA4GemxSpnAG1A75p227PY8LLhRZhUFG00TbwipJnr1y0LnFlW12gzWrQgdkbnWEr
         IqclVk5a6tg9N5IhKhpIgj77Jx0w5raAz9uJnCZH4mGjIWvuqjtRXD97grWSZ+ls6bWw
         m+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041373; x=1787646173;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y79lKilZje+Nl3Rv+2N5vQhP9be8wEt4E0ek84GffA4=;
        b=Z1ZTiCZ25oLHd0N3D/iXKhXYQ9J6fo6kAS1gFqyOybox3VzVCBV/Sz1H7eovQ5KwYs
         hgTc/n/uKSlr06gPt72UdGdUcQxPj0yKy94I4cAJAa+PhJY8B9eyZe1i0CmnD+M3XFWo
         jJBvVH06uoqE8wIKUJAW5Bx0jeeTOAn0eTxgfbnGwU8JuFc3u6hD08D1hLoUKumtzUhz
         OyCZyUpblQjTHsD6yxl+4g9UXMCQBEi9IV9UdoTRZzeVRu2VFMZom+vmtILs9jK/x/xq
         J6X53YpOzEQQoEnG1Kjb/aUhkugoP24gbWHbrT5fcdcSTwTAg6ROZVhMcVUvOce1iMDq
         hZ6A==
X-Forwarded-Encrypted: i=1; AHgh+Rpfokhao/oG/xIbuAkmTmIz8qxe6JlWKEzILhjBAy0JPehBmDMAxEtYelM92mUqGmTHQ5FLJB6SbcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47rK/pg0vP3eotMrFKez9Eo4F8w+4ss/iz5TJrNC82ccqEffN
	uQ8JkNI0Az/lZhA+/QJdiCwd2BkfsQlLnh8FFs7ntxaTaxkbTNY/LmrXIbmSYZmJFVgIu34peRH
	s/JgTeZyrUE+ovzpSB/vli56g0bFWGSqT4wZOwHKa
X-Gm-Gg: AR+sD11+gtQBBeWEepsnLLet9OjoPiwvvivITTBoJlmmBBcuYF5lmbi26g+D/DU2wnU
	Fhr9DLMUxI+xirrl7S4OEQjXTH4j189aISko0DM6WxJPCzQGTkEFJi0ZDo40g1W/ZZvn943F9j4
	4BsRJsT7YfF19JRz5nNn8Zi4GWbYSlbYu9NstgGnYYfs8KsrGftTahfib/3iNvcejHJGRYJ/N5w
	/yWa4fLWVSYttC0KulIkTtEFWeHDHwhJfKgB/zs30DWTBlBoIVwFfXIOiZ45fgc62RAKdzQm1CQ
	echwHCFPlXPfwb8Rr4RQW73WnIg1AQRLpLdYlMDU34DahVTjkHDJPcn206ZhM6k6wOTBhGCVNTc
	JnXC0X82AAQ==
X-Received: by 2002:a17:90b:314a:b0:395:5404:95 with SMTP id
 98e67ed59e1d1-3955a79c987mr7608716a91.12.1787041372060; Tue, 18 Aug 2026
 01:22:52 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 01:22:50 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 01:22:49 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aoOJRk5SXBzzT24K@google.com>
References: <CAEvNRgFWcndQKJE_q+ZATFZEMYd=6uRLygozLvg7L77bPX0cEQ@mail.gmail.com>
 <anqqKH6kuwpvuwp9@yzhao56-desk.sh.intel.com> <CAEvNRgGWDY_fxbyBM-5sMdYMevMe0HzVP9kbC1cCGLE_dV=_Gw@mail.gmail.com>
 <a71d4fccdffd1f6a12332ddd18fa812542ea2118.camel@intel.com>
 <CAEvNRgHxda6XK_XqWaqqVnA7oW=Fhp_C5gF4vNcL+-HfwfXMqQ@mail.gmail.com>
 <0c80b9b0e13e3ab2cbe4f9eaf4a02ebba25a7001.camel@intel.com>
 <an5RJYTwlYeym--O@google.com> <aoKnmW9St5zCoTD3@yzhao56-desk.sh.intel.com>
 <aoNrFX9yLfsM7KQI@google.com> <CAEvNRgH_=8YqKHb_OJfT583ZJ346cceRimd9YJ762Vv08uJGHQ@mail.gmail.com>
 <aoOJRk5SXBzzT24K@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 18 Aug 2026 01:22:49 -0700
X-Gm-Features: AcwNN1UwBN-I8e5ZL1Wm4VeVuI85_vvgyrgG68xpeG1bFCBW0uOQsMiH1U5tIzU
Message-ID: <CAEvNRgHXXXBgO2Pw9PcaiaTLXBrm-F++nJKSeHn6m0rnZiT7RQ@mail.gmail.com>
Subject: Re: [PATCH v10 11/41] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: Sean Christopherson <seanjc@google.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"david@kernel.org" <david@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"steven.price@arm.com" <steven.price@arm.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"forkloop@google.com" <forkloop@google.com>, "tabba@google.com" <tabba@google.com>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, "willy@infradead.org" <willy@infradead.org>, 
	"tglx@kernel.org" <tglx@kernel.org>, "wyihan@google.com" <wyihan@google.com>, 
	"pratyush@kernel.org" <pratyush@kernel.org>, "aik@amd.com" <aik@amd.com>, 
	"jmattson@google.com" <jmattson@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "rientjes@google.com" <rientjes@google.com>, 
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "chrisl@kernel.org" <chrisl@kernel.org>, 
	"shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, 
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>, "oupton@kernel.org" <oupton@kernel.org>, 
	"mhiramat@kernel.org" <mhiramat@kernel.org>, "baohua@kernel.org" <baohua@kernel.org>, 
	"tarunsahu@google.com" <tarunsahu@google.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, 
	"jgg@ziepe.ca" <jgg@ziepe.ca>, "jthoughton@google.com" <jthoughton@google.com>, 
	"yuanchu@google.com" <yuanchu@google.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"shikemeng@huaweicloud.com" <shikemeng@huaweicloud.com>, "nphamcs@gmail.com" <nphamcs@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "shivankg@amd.com" <shivankg@amd.com>, 
	"shuah@kernel.org" <shuah@kernel.org>, "youngjun.park@lge.com" <youngjun.park@lge.com>, 
	"kasong@tencent.com" <kasong@tencent.com>, "pankaj.gupta@amd.com" <pankaj.gupta@amd.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"vbabka@kernel.org" <vbabka@kernel.org>, "weixugc@google.com" <weixugc@google.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "qperret@google.com" <qperret@google.com>, 
	"brauner@kernel.org" <brauner@kernel.org>, "bp@alien8.de" <bp@alien8.de>, 
	"baoquan.he@linux.dev" <baoquan.he@linux.dev>, "corbet@lwn.net" <corbet@lwn.net>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "liam@infradead.org" <liam@infradead.org>, 
	"axelrasmussen@google.com" <axelrasmussen@google.com>, "kas@kernel.org" <kas@kernel.org>, 
	"qi.zheng@linux.dev" <qi.zheng@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>> > The only question is if we want to commit to
>> > guaranteeing that conversion will succeed in this scenario, or if we want to take
>> > the easy way out and formally document that conversion can fail with EAGAIN at any
>> > time, even if userspace has never mmap()'d the memory in question.
>>
>> I don't really think there's a need to commit to this, IIUC in principle,
>> ignoring that on many paths of those guest_memfd may be excluded, refcounts
>> can be taken even if there are no host userspace mappings. For one, memory
>> failure handling doesn't care if there are mappings, the refcount will be
>> taken for a short while and could cause this conversion failure.
>>
>> Here's the relevant part of the documentation added for conversions:
>>
>>   If this ioctl returns -EAGAIN, the offset of the page with unexpected
>>   refcounts will be returned in `error_offset`. This can occur if there
>>   are transient refcounts on the pages, taken by other parts of the
>>   kernel.
>>
>>   Userspace is expected to figure out how to remove all known refcounts
>>   on the shared pages, such as refcounts taken by get_user_pages(), and
>>   try the ioctl again. A possible source of these long term refcounts is
>>   if the guest_memfd memory was pinned in IOMMU page tables.
>>
>> > I'm leaning pretty strongly towards guaranteeing conversion will succeed.  We'll
>> > still need to document the EAGAIN behavior, but IMO there's a massive difference
>> > between conversion failing if there's a lingering reference acquired via a VMA,
>> > conversion failing because a vCPU page fault raced with conversion.  E.g. being
>> > able to assert success in a very curated test, as the stress test presumably does,
>> > would be extremely valuable for helping detect/prevent edge case bugs.
>> >
>> > The argument against guaranteeing success is that we might make our future lives
>> > harder, e.g. if it turns out there are legitimate, hard-to-solve edge cases.  But
>> > I'm ok with that risk, as it seems highly unlikely to be problematic in practice,
>> > and there is real benefit to guaranteeing success.
>> >
>>
>> Is there really a need to commit to anything? This is already documented
>> as "can fail", and it's orthogonal to whether the memory was mapped.
>
> Yes, but the above docs also say "it's userspace's problem".  Which I generally
> agree with, but that's not a very good story when it comes to KVM itself taking
> transient references, because then the answer becomes "Stop running all vCPUs",
> which I don't like.  E.g. in a very pathological scenario, it's theoretically
> possible that conversion may never succeed.  That's what gives me pause.
>
>> The transient nature of refcounts on pages in general makes it hard to
>> guarantee, and this stretches outside of KVM. I mean, anything could take a
>> refcount on a page in future and we can't be auditing the entire kernel for
>> no refcounts on guest_memfd pages ever.
>
> True, but at the same time, if there were never any VMAs then I would expect there
> to never be transient refcounts, modulo memory failure.  And it'd be easy enough
> to document the memory failure angle.
>

I think even modulo memory failure the contract in mm for pages is that
transient refcounts are allowed to be taken.

>> >> > As for in-place conversion, this is not a blocker.
>> >> Sorry. I didn't intend to block in-place conversion.
>> >
>> > LOL, what we intend and what happens aren't always the same. :-)
>>
>> I don't think we're ready to guarantee conversion success when guest_memfd
>> pages are not mapped to userspace
>
> Yeah, that was too strong of wording on my part.  The needle I was trying to
> thread was "conversion for this specific scenario, in a controlled environment,
> is guaranteed to succeed".
>

So I think we can only specifically fix this case Yan reported.

>> without dragging this out way further.
>>
>> I'm all for KVM not taking any references on guest_memfd, but I think
>> eliminating KVM itself as a source of transient refcounts can be a
>> series in itself.
>
> Yes, it would definitely be a separate mini-series.
>
>> KVM not taking any references on guest_memfd memory is definitely welcome,
>> it'll pave the way to using non-struct-page memory in guest_memfd.
>>
>> It'll come, can we not block on this please?
>
> FWIW, it doesn't have to block initial merge, just the final release.  E.g. even
> if we decide that this is a blocking issue, we can still land the in-place
> conversion series, so long as it's not exposed to userspace in the final release
> of 7.4 (or whatever kernel) without fixing the transient refcount issue.
>
>> If we find a way to strengthen the guarantee, wouldn't that be an iterative
>> improvement?
>
> Yes, but we do need to draw a line in the sand.  E.g. if conversion failed 99%
> of the time because KVM was taking spurious references, I think we'd all agree
> that needs to be fixed before the code is released.
>
> I'm still leaning towards saying this one has to be fixed, because it would give
> us a solid baseline from which to start, and a way to enforce it going forward
> (Yan's stress test).  I could certinaly be convinced otherwise, though dropping
> the transiest reference seems straightforward enough that hopefully it's a moot
> point, i.e. we land both in 7.4 and don't actually have to make a decision.

Sean seems confident enough that it's a small change to drop the
transient reference so I went ahead to put together the series [1] so we
can kick off the reviews.

I'll follow up soon with some testing and report on the other series
[1]. Yan, if you could provide a Tested-by on either series it'd be
great :)

Please send your reviews on [1] so we can make it for 7.4! ~7 weeks to
the soft-close of 7.3-rc5!

[1] https://lore.kernel.org/all/20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com/
