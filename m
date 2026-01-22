Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECA53C0890
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 22:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769122064; cv=pass; b=hfSVwRKeJvceVZC/IT3g8BHKif0hurZDqD2UIl2mF9jFrQiSmWGKLPcHjk1cesn+aZ8agB6+FIUYHpR4dsO3Hc/qNMA+fhn61U95/I6TTjS6lPw/PhMtc7miEu2CkeCgdntmwEo5hMTve2c/GPdxWbIee/WgXONWpSvNvAGOMq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769122064; c=relaxed/simple;
	bh=xs+dLd9PKnX16GE3/TgauaKHwwAlEIk3gXFN84JGCiE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2cm5IHqLCjA4kxUwI6aICidldSbzwE8V05soy2u+NK0AAJ94XEdMnuzN7hgSgv7/HauXj139I1IXfC2IpUE0rapi277VlN92ywkkniksUqhKZajBFF6wOARy7mw5hmUDDwnj2MbGm8ARUeFwT5IuY+ahkRGtL4uBd14HbBjSeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=efb65WUp; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="efb65WUp"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5f530da3a07so1499966137.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 14:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769122051; cv=none;
        d=google.com; s=arc-20240605;
        b=jttvvVgvgWYDvNFD57bMSaTecqcOwiGLcHknVZkjMMAZ0sFa9pUobCCdtaaM9crgoa
         5FObmL/pYLOrOPr5MUwmeLC754ZMMkso0Z+u6K0zi2hOVSxAy9/lAwtL1h8+MM4e/VPB
         2Wn1xAd1RIYrIKq7FRrEFFgqJMFHDIb0q3uqn1KQaEGCxQnjgBYaXL+6NvdUX10KfCF9
         oIlrMF2yt/7BE7Ftd4bV4xTCLNdSQtK4wcUfj2QyHkUITJnEoMR2zmleAlWbMwyC8NAL
         i2GgKCGNjvRD50vL+fnpVceEV8cO//9anLh/quhQxsC8Yn56p2TjcD82qUGeZ6tsUfML
         MxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xs+dLd9PKnX16GE3/TgauaKHwwAlEIk3gXFN84JGCiE=;
        fh=CxOQXGfEyZKSrFqnMJitqFCgEsWeJpRldAJ8R/nsCIM=;
        b=Zt+NvEUSBmoStWqsvQhyLGDjHDhddO+ixZHKV1xLtDrz/V+ESCcTp9jciOjt1VjFbp
         SpaC+MfVFhnGv00J7CDxaTiMFGTw+6YS5+R3pf8inpN7YAplmfCZWHiKc0JRhFb0TN1m
         1xRaQnnZ8CT+4gcdUwgtAQp77cy1myoiLumN7TENy/lz8RllbjGGSgZl6BUkUchueT9Z
         z0752rlVYuKgCiMAhWJCgHGOcw2XfHlHSIxhiIga9dY5irirZC4wGOoWbNdLf6AjdM0Q
         GS/0D6708BhZs+JWMpzJNEg1BQ9mFFj14f+moLITq/Eug+KMu21G9prMPupJvvqA/Ssu
         2YWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769122051; x=1769726851; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xs+dLd9PKnX16GE3/TgauaKHwwAlEIk3gXFN84JGCiE=;
        b=efb65WUpsdnX9MYn5Ketl7Aqg/S+LI5Twe86EAN0CJTXTQi0SV6Bc272kwWB7FV0YN
         VTMlkEUN8MS6bLkGYmILKii6n/XJ35CPl/ILj3DG7K3xM4+6SS49g6yrAvmzWytKVEOD
         T5SY7G9OaavZfDvBTD8//I95ljshXWVriDkG6Ob3ZNbZhhRFOml4NIXTj6qn7LZyAWAQ
         xVorS0Du0q+93wf+l2qMsTaHfD6Teinzsu04Csei+HRHvjEQI3gZYVMuVqWJCuRqmfuK
         4swpPyoAFWCfix/BNwv0dlaxb0vbG3lHkKG0G4CbblEPQTn6grdmtf9GRYYV07o3eWEX
         6TsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769122051; x=1769726851;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xs+dLd9PKnX16GE3/TgauaKHwwAlEIk3gXFN84JGCiE=;
        b=CE1SBIXTAKCLirgKVrKe9p1FN3d9CoHvdLYofYIOQWmlaynlAauwGQ6xXuMVxyJhdU
         sQSCQbc1uHLxhOAFXelmVDELR6YQU8XBRYMrdOUwlppmkKRFegRd6HIB9NyPZ61k+lJi
         BaUgNdBprFgUOTuIqRt8LYDf9AiDNOeWB24/V2ZVqVX8NJlzVrAx0bMcWYLIKTQtfTTL
         Q4Ukjq6ntVxl1jDTnmD1Pz3hy/+r4XfVQa/MMYZ9W4lecP+v/yqa05o1u0TYfadHUX1j
         8V5j97on7hmRUu7068zgs5HVkaiPTmZBgp3tRR+mlYlV6f8tf83My8blYCXRCrJBnT2s
         o+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWvgtBks6HhiKFqbZh5oEzx78tkDI30syrQUuwlxPEy6cDx9rtz/26totu58OhbvLlhxxBZwUO+e5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrtx72aKFHBMH7Z+uAkmP0gPTmBRrxk1qxH5d/wGWuFFaY74E4
	RAuFmbSw45TuFL7hsUPWaCxVEVeTn3KN7vhamDHcAIXOI3CFdZSPseyNYpSg7YTdIV0NEvo3Reh
	QOyXyIt4aIvoyeBULxrr61PLsmeSOLzpFmmtuD5Xp
X-Gm-Gg: AZuq6aJIbFYSnDG2/Lqku7FdXItyZoRvdppoMPgugOKt4GddkR2HrfnbXtC2j94U403
	zlClF/+d+UWI7/bAG2PaWuzQYuVegsoKYO9w/HilDvovaQksIHyC2y4lyAuETI+MLez0CiTeXGJ
	T2+KIxD+1zsqa7E/7GGpZJm/kSzCN1BRoYnu4GaKwB9i8aOuFregneIamCa9FNgIVLTVkhf46hT
	JXf8BnYfrjnkb5ttgWdcqcTQmFndh8xsvVukReoqZ4o2FfWO0S7jWwvcvn5LT48AKIMCCDceAmp
	JRnhYSfGduP3//nt4lLuqwrZ/Uh94lHuEqQ=
X-Received: by 2002:a05:6102:3a12:b0:5ef:7220:bcb2 with SMTP id
 ada2fe7eead31-5f54bc8224dmr480092137.28.1769122050230; Thu, 22 Jan 2026
 14:47:30 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 14:47:29 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 14:47:28 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ee9c649eed3893d852c3d20fb96bdc4904b7c295.camel@intel.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <ed01838830679880d3eadaf6f11c539b9c72c22d.camel@intel.com>
 <CAGtprH_qGGRvk3uT74-wWXDiQyY1N1ua+_P2i-0UMmGWovaZuw@mail.gmail.com>
 <8c1fb4092547e2453ddcdcfab97f06e273ad17d8.camel@intel.com>
 <CAEvNRgEbG-RhCTsX1D8a3MgEKN2dfMuKj0tY0MZZioEzjw=4Xw@mail.gmail.com> <ee9c649eed3893d852c3d20fb96bdc4904b7c295.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 14:47:28 -0800
X-Gm-Features: AZwV_QhacTtf2zgQk3uMxNHfKwdT09Bqx79KDOGE5Z3VW9UujMTrgN_9VI-QiKU
Message-ID: <CAEvNRgEz0+ic9uvcsWYqWgR5EV=TfY0SAGC39zAL+n19SoBXmw@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Annapurve, Vishal" <vannapurve@google.com>
Cc: "david@kernel.org" <david@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"jgross@suse.com" <jgross@suse.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"surenb@google.com" <surenb@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"riel@surriel.com" <riel@surriel.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "x86@kernel.org" <x86@kernel.org>, 
	"rppt@kernel.org" <rppt@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "ast@kernel.org" <ast@kernel.org>, "pjw@kernel.org" <pjw@kernel.org>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"willy@infradead.org" <willy@infradead.org>, "wyihan@google.com" <wyihan@google.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"jmattson@google.com" <jmattson@google.com>, "luto@kernel.org" <luto@kernel.org>, 
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "haoluo@google.com" <haoluo@google.com>, 
	"patrick.roy@linux.dev" <patrick.roy@linux.dev>, "peterx@redhat.com" <peterx@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, 
	"mhocko@suse.com" <mhocko@suse.com>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "song@kernel.org" <song@kernel.org>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "oupton@kernel.org" <oupton@kernel.org>, 
	"kernel@xen0n.name" <kernel@xen0n.name>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"jthoughton@google.com" <jthoughton@google.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, 
	"Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "shuah@kernel.org" <shuah@kernel.org>, 
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, 
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"gor@linux.ibm.com" <gor@linux.ibm.com>, "dev.jain@arm.com" <dev.jain@arm.com>, 
	"daniel@iogearbox.net" <daniel@iogearbox.net>, "jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, 
	"agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "joey.gouly@arm.com" <joey.gouly@arm.com>, 
	"derekmn@amazon.com" <derekmn@amazon.com>, "xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "sdf@fomichev.me" <sdf@fomichev.me>, 
	"jackmanb@google.com" <jackmanb@google.com>, "bp@alien8.de" <bp@alien8.de>, "corbet@lwn.net" <corbet@lwn.net>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "jannh@google.com" <jannh@google.com>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kas@kernel.org" <kas@kernel.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "will@kernel.org" <will@kernel.org>, 
	"seanjc@google.com" <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Thu, 2026-01-22 at 08:44 -0800, Ackerley Tng wrote:
>>
>> Can we disable direct map removal for errata systems using TDX only,
>> instead of all TDX?
>>
>> If it's complicated to figure that out, we can disable direct map
>> removal for TDX for now and figure that out later.
>
> In theory, but it still would require changes to TDX code since it does
> the clflush unconditionally today. To know whether clflush is needed
> (it's a different thing to the errata), you need to check a TDX module
> flag. (CLFLUSH_BEFORE_ALLOC)
>
> Gosh, you know what, I should double check that we don't need the
> clflush from the vm shutdown optimization. It should be a different
> thing, but for we gave scrutiny to the whole Linux flow when we did
> that. So I'd have to double check nothing relied on it. We can follow
> up here.
>
>>
>> > Then there is the clfush. It is not actually required for the most
>> > part. There is a TDX flag to check to see if you need to do it, so
>> > we could probably remove the direct map accesses for some systems
>> > and avoid temporary mappings.
>> >
>> > So long term, I don't see a problem. For the old systems it would
>> > have extra cost of temporary mappings at shutdown, but I would have
>> > imagined direct map removal would have been costly too.
>>
>> Is there a way to check if the code is running on the errata system
>> and set up the temporary mappings only for those?
>
> The TDX code today doesn't do any remapping because the direct map is
> reliably present. There isn't a flag or anything to just do the
> remapping automatically. We would have to do some vmalloc mapping or
> temporary_mm or something.
>
> Can you explain what the use case is for unmapping encrypted TDX
> private memory from the host direct map?

There's no use case I can think of for unmapping TDX private memory from
the host direct map, but Sean's suggestion
https://lore.kernel.org/all/aWpcDrGVLrZOqdcg@google.com/ won't even let
shared guest_memfd memory be unmapped from the direct map for TDX VMs.

Actually, does TDX's clflush that assumes presence in the direct map
apply only for private pages, or all pages?

If TDX's clflush only happens for private pages, then we could restore
private pages to the direct map, and then we'd be safe even for TDX?
