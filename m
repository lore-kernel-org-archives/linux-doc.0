Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BFA3E9F61
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 21:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780607676; cv=pass; b=gG+kIyRpWZblQ/x9wT4iKpKulVXmCpgYeOOTOchgMwt00C8o4dVB2+t0g3jHAK8bdL1aiUeMquXYXhj9OAIBF0ZXBrIg4577FMU4krAHGbbWXDi5oou1zyjnuuVpfwW9n3gOdKPGD5nrVGntK1HuIthcDeAgaI4bu95+9OahMpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780607676; c=relaxed/simple;
	bh=3EQQ6v/Jh1n3vmJAx1K0KnEtPJfjxcjgCdoh94k7jVc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdZkIlcypAS0PHkBLEsyZmL89LS6ZaUq+arPdEI025OuuMoncGre000kuyoVdOln7cgP4LSVlGcPeaVr5JDGJ57Tg1b0UTk1dE35Tpj9P4lYAN2aSWJ5AVN+gX4QIPxd65vaYmCTj0SCm/Ug82HebUYwcNAE3Zu77KtU//vGknM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HSRVmStj; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HSRVmStj"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137f3cb3f46so2189025c88.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 14:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780607674; cv=none;
        d=google.com; s=arc-20240605;
        b=DG8UxWHAavCraeRS7ark2BvZWYTSNDlaur27RQS/As2WabOX4BS8Yy+CBRgAHXi3z3
         uCVONXlJQ77IFXrhxFbebQSOAkC4cqECG3DLQ/nmzG6MQfmvofVqN78QQ2hKZgui8wm6
         s+WuxBGcrWBXB/5uzMY20SxWyLhdn+/AuRkAEbXAQ9ikAo8uuUCBzZIc8R7z5aqwaTN2
         Qz/BEpB4KAWlZYqD4hbUaszqWtyE4c+5uFdy4QXMjIoOmBR+/2cPH2wLkMTYrQAemMDP
         W/2QdcNRO8AwLSeu+S2ROr8QefjVDQe+GGFkz1S1E8w+VPyDu8G1cqiNvxtO1v6Yw3G4
         a5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=lyPEsnWgMEwVBTMM4vHE6GHrBW2HxmanLD1B4poadMk=;
        fh=9Jqri0IUm36P4oupcOKOHFzkPDFA7pFEhIUIRfqSZKY=;
        b=keJyrJQis8V52qDA4HZ+CgNzp22lSVrDWZSslCznBlGjkFZL+h+Bh6yUGNz/sLPhj5
         bLzWZnqXyDbF7RJV26zBe5x8g7j4k/2qafwkH7DVdgSaUvuiJ0fiSMjPStM0DIg4uS5J
         7j8vh1ipzkhSBUt6EvC6nJJ0t6FiovTmIDOUMGVF0rLXzIEbSinE70cbc48H8mko/LXw
         0uQAD7jh/LxG+eK6+AClWej4YJafcR3FdpQ3eeyIiq/sDNChEiXzIH1Hn1Y27pcGV6rl
         JItBMNIJSdQu75HALp9kEk40P08SHVcKhFKoN8eoFzoawgbJkm0Qv2Gk5fcx8NrrEPJv
         k3Tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780607674; x=1781212474; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lyPEsnWgMEwVBTMM4vHE6GHrBW2HxmanLD1B4poadMk=;
        b=HSRVmStjClcx3bpB0Nbb1WbyCagVBGV1o7cutwUR264MGwQtzC2eb77Y4bg1tLolFP
         UxRJgZO+x7uVz755belwPYpkKr0fa/sLsswY6U1FbRuGSq+FRLZFV9E37egIdz3AcdQD
         Y6oth/EnlnZP+/as2xeBZe3f7YSCyOc+HK+OHIlR+MxlsswubTEXHxmnK/Y/SXtN+RNO
         jjIk9ygzfucGJ4Lbodc642V544cS1eVP+enD/KpsMBJXgJncUfmlXv1lk0kIwxMlnR97
         hDrSM1KDXGTYGLzCh7o2tGiU31yb/ExLLod3UWlbUSsGzNOsH+nfF8R4e8YKs+r5EgoY
         Z6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780607674; x=1781212474;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyPEsnWgMEwVBTMM4vHE6GHrBW2HxmanLD1B4poadMk=;
        b=Y5L9VlWd/zg71UBILU/jaLZaTMmo0TMZoyCb5wThOJ9hs9gCy7v/b6kDO9Q1W6hTKl
         HePG9bWIMsEhLik8gSNnwfKSnNDldeTa2D+oXT+oQ3+3nDxUulnUvBKtcAFl2AnGeScl
         7/CAAz0V14UZzu40N84bDutS1qKzlIZSZKqL6E5g6/jSL9tdUanR+1REhqVlQwoG2EZ1
         2/vWqaXjwy6whfWle9mS5+PvlNKVsIvoQGnHFN8AecQDgdWYau9z6fUzkuybIrpojDNo
         yXSfaud6hBETA7AT/8uYjji+UkzSEkI3r72/1Pjvj2fagV0xYie/EayRtCXLxGARVQFu
         IPyA==
X-Forwarded-Encrypted: i=1; AFNElJ80T8bcc2pY36GOQsRe2Z4P3D6TfQYh6enxxAbRCSgAQSkT9Afl+ceqoIiobg+xmNTfPxCwKbfhJho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy837UhdbqfEGNIds8+G8FiApbpzHcAfwXTJNdmEzB/Cspucz+L
	44kie3nmUysYptuHG+oZ0D30T1BJtR1frUF9zVbjJu5CAuZAskXYZrjWkbSQiYzx5qR6NO4hRFW
	cvtPNE0BgoIzxrkyuUPL9PkvRrUtAVdM34VO4VGLX
X-Gm-Gg: Acq92OFtt1f856kgyqO3waJnWh00QQCD6/NgLt5DTGvLKsCaEeTjcw+iR4igZirqrrd
	lK6CbVCAvhw58CP8pZPZN4sr2PqzQBk6t/YeMLO7KziAY4PJoQcfOvflPlmq+moknqHlp1fQd0P
	0I8ZvZmgRSbSucPE+4Sm0tvGQfynMpQbKsaN/gnF87GsvXkBejuNkW4WZJpaTCWdS4nuClICJlX
	cmROoUz13+trUlNc+phTMnCIA0nhXwOxOBvvCSLchk1yBM8kkAaau9dk/uOULAW1GwWIz8no+vf
	+6RerTLMDh7XfIbvogTgMVn1DqFtTfAN48UFe3cDdrJUyWHoEHpYV6F7Z93KgJpg/Wh4UCKj0w2
	TtLE=
X-Received: by 2002:a05:7300:5b83:b0:304:acc:f086 with SMTP id
 5a478bee46e88-3077b7ec417mr207174eec.33.1780607673246; Thu, 04 Jun 2026
 14:14:33 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 14:14:32 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 14:14:32 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aiHeDZEPkAcWcSkn@google.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <CAEvNRgGpaggjd3=ooyzv7iEbmA-x1mWJHgjLSjPi8=5CPrk-yQ@mail.gmail.com> <aiHeDZEPkAcWcSkn@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 4 Jun 2026 14:14:32 -0700
X-Gm-Features: AVHnY4J7O-BvLwAbWwmNVfQCapmW0Jz58QA9MN7lFJVjBHp7oGK-p6NKEbfSA24
Message-ID: <CAEvNRgHz5GDjq0GqRmpQdHc-X45gCNr39VYWZH-T7XhPEtN5CQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/42] guest_memfd: In-place conversion support
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Jun 03, 2026, Ackerley Tng wrote:
>> Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
>> writes:
>>
>> > This is v7 of guest_memfd in-place conversion support.
>> >
>>
>> Here's the outstanding items after going over everyone's comments
>> including Sashiko's:
>>
>> + KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
>>     + Need to move page clearing into __kvm_gmem_get_pfn to resolve
>>       leak where populate can put initialized kernel memory into TDX
>>       guest
>>     + See suggested fix at [1]
>
> That fix works for me.  The initial guest image will typically be a tiny subset
> of guest memory, so unnecessarily zeroing a few pages isn't a performance concern.
>

In regular usage moving the zeroing in [1] doesn't change anything,
since the same zeroing would have first happened when the host faults
the pages to put the initial image. When populating, there's no more
zeroing since it was zeroed.

[1] covers the case where the host doesn't write anything to the pages
and directly tries to populate the pages to the guest.

>> + KVM: guest_memfd: Only prepare folios for private pages,
>>     + s/non-CoCo/CoCo in commit message "INIT_SHARED is about to be
>>       supported for non-CoCo VMs in a later patch in this series
>>     + Use Suggested-by: Michael Roth <michael.roth@amd.com>
>> + KVM: selftests: Test that shared/private status is consistent across
>>   processes
>>     + Improve test reliability using pthread_mutex
>>     + I have a fixup patch offline.
>> 	
>> I would like feedback on these:
>> 	
>> + KVM: selftests: Test conversion with elevated page refcount
>>     + Askar pointed out that soon vmsplice may not pin pages. Should I
>>       pin pages through CONFIG_GUP_TEST like in [2]? I prefer not to
>>       take a dependency on CONFIG_GUP_TEST.
>
> I'm not exactly excited about taking a dependency on CONFIG_GUP_TEST either, but
> it probably is the least awful choice.  E.g. KVM also pins pages is certain flows,
> but we're _also_ actively working to remove the need to pin.
>
> Hmm, maybe IORING_REGISTER_PBUF_RING?  AFAICT, it's almost literally a "pin user
> memory" syscall.
>

Hmm that takes a dependency on io_uring, which isn't always compiled
in. Between CONFIG_IO_URING and CONFIG_GUP_TEST, I'd rather
CONFIG_GUP_TEST.

>> + KVM: selftests: Add script to exercise private_mem_conversions_test
>>     + Would like to know what people think of a wrapper script before
>>       I address Sashiko's comments.
>
> NAK to a wrapper script.  This sounds like a perfect fit for Vipin's selftest
> runner (which I'm like 4 months overdue for reviewing, testing, and merging).
> If the runner _can't_ do what you want, then I'd rather improve the runner.
>
> [*] https://lore.kernel.org/all/20260331194202.1722082-1-vipinsh@google.com
>

Good to know we have this!

Thanks, I'll work on a v8 to clean up the above.

>>
>> [1] https://lore.kernel.org/all/CAEvNRgEVC=fFuKVgZYvWyZD7t_zvUZihFG8hrACjvtkD5cwugw@mail.gmail.com/
>> [2] https://lore.kernel.org/all/baa8838f623102931e755cf34c86314b305af49c.1747264138.git.ackerleytng@google.com/
>>
>> >
>> > [...snip...]
>> >
