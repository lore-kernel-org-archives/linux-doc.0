Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCB336AB53
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 20:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308755; cv=pass; b=oLmMmbL8tPWFwmkGAh+7Uejt+EBzbY0dp5v55kob5cemtBoK/WsgOIp8BN2plsawU0Ge08whZoJSY2cVJ8b12Fld5pR1XCdAvCCHj6DrSEAjFQMxJ7y19r2Z00oHYelBqLLKShPX+9miO0iKS2flpOXrx3mIXYcKhVAZhWbxzTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308755; c=relaxed/simple;
	bh=0y54nFg7E7TaoQP1DdnZ3Kd8izilERRAcK4RB5V7BZY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IzdHZ3O/kETjA4cXMPnzbvVKC3bNRYYKNWNHYbV7dZcCJPpD4aPycKPLNmhYsfrdOodFzebchRvb6aKb0123bMhIk5qJDNRkVbiiWfkbP67rqTvvtjSBIpElEJ4LT13lQ+vcGf3SFpjrP/twsSxyAn4zBwZjHGuMo+gJsJmxgTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XwbOvfxx; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XwbOvfxx"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6312bdd281eso4837247137.0
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 13:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779308752; cv=none;
        d=google.com; s=arc-20240605;
        b=izheH5MFKZw/guac26D4jiwd0qxsJ4NFbLMwkMskByT6C1bglnfS/hZR3YvsT9BMbE
         ueG6dBzUsET3VVnFK6vLmKHTuq4wrycA2Agp/7I4FtddGuzozcd4GXWzPXARRLkQCOWu
         cF3Zj0+U/mTITS/8jfdxVG9k49Ooyuzk32R753bIcMQO0PxRQllu3xyhqaeC3XO9Tv3p
         uXeV3CA+/44Z3pIf42JtKqHs5fD8nZlDnDMfGv7F638DhsT4Xv7UuPxA04EGbB2khTts
         sl3lXecNQ8tYf2EPDTNaS0FC3R66XyFqC1BW4e0ejhFRH1M/mhhNTff81A9Y9t7/EIPs
         ZxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ANitp46w7gSSv/gOMNKZIor35cJdYj41rSqFN5gAzAs=;
        fh=NwoqBQy1t2xhKhGXjvhd+4BGu86skbts3QNL9/grOX8=;
        b=ObKt3x/+hIUNY+4X0FcX7UhzzjrOM6Fnp6FkbasMbboHSXBY70oqT9XCz43Hlf0uzL
         HhXNr4sRB5gupidnLiwZlOL+LhUi+E3Faf3Si3Ni3ERHng7UDuvEK8lcOmNpiMqX/lTc
         JsRcwHDXZGCYNAIVN9G49FkSd1vT6rU5crt4/2joZiwSeTwh1vA4err1K1o3TEsomQJ/
         5Gla/eZm/OopB54QSl6ZWt7d7u8PKF+uJuqT1OE2FUrt4NwSbUbooWoXAjml245HNbtJ
         0AiPo9bvg//B+Bl/zpsskhfNuRsb4houWl7Qf2anLrVDOikEsNb7REtuDgRaH9mPIFVB
         /Nww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779308752; x=1779913552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ANitp46w7gSSv/gOMNKZIor35cJdYj41rSqFN5gAzAs=;
        b=XwbOvfxxojNTaZZg5xc85ejdAJLXOGIhj/ihtMbe8SNH7QL1VPADFRhf2ZTOAtHqFV
         4k7u1P39PnV25R6VstbsKpEE4wyX0JhVZqvNJ8buaI6G2q2H87BuGLzAO2nbgYCxH5Ft
         GnRlujwb7rxQbKACZqw87Jpo8dHQ7+08omse+HqQur9nmbbQbcYBGsu6Lt95kx29nZ8H
         oiskX7kcTOn14ZXsouLohobxRDb0u/MaDuHoHkfQpRcCjf3Xaun8eVFfJz7WA98ch44F
         epcFLiYRTMix2UmAxWj2gy1brAg77X3TksdbyI3HnBAOQPRug4fxELrHdLfrSuRtRNJl
         7tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779308752; x=1779913552;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANitp46w7gSSv/gOMNKZIor35cJdYj41rSqFN5gAzAs=;
        b=BxVWo3ONMdxoHIGqyFYmT0xFOW0E117uKQeeXBBcigx5Nz7VTK0iQfDFU+k/xdRIEU
         r7kSqcIOXOyCQjofXFXBed9WyQcCzji2ya3W+NoUKoV2WMockRjn0n9o9ZyhkkFeH3IN
         CtJMESSo4p0xHMUvj7bqoMT/PgZtngpHqMSQB+IyQvRM60uYidIggw5YGe9zAZjwINzj
         0s4jKcVohoVS93LYEfvhrUpJrvjiTcAo+3NjdxPmWQB+Fc/X/4ThLxQUEjIok43XNtqy
         /kTo7MynQ7WqH8tCGS80azwThs3C3CEy2Q/TW58PH5DygPBZdWDOTeUPbkmSrZqawcC5
         N/qQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LZoL5buUwBSxMZzMQphgo28C7owpSGHfA7i5TcvfTDn4ntvo0dlpMWbOsFumqM657KRgzu8Ltm6k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkhkr/UzCQcXxL+RWYGOik6RfLtKijBISEVV3rJnL40Cco6Hvl
	xNSFdwptKnT1Vv9PV7J7+r2WIrRTcJptKILKV8+0pGtAJAwpHfuBDmPQVDLMPvf0S8HFXC1+7Kz
	9D1KIsemAA1ttqAuvrSZ+Aa8ihL2vGYCuhGYKKfzr
X-Gm-Gg: Acq92OE+EK672nCEwLNzbcRqKgyQZ7teo0oMoKbyTrCat39QI2gu8p8s+iCN5q2hkkk
	arVnLcQ+15qEK9tLYLhTDZVInWkAMPOidiQQjjLV2mPnPTNe3j5NmE6QxVmmOTnv5pZ/DbyfEY3
	SQmpXPcM5iYfCtEiKL3CncDLlRhBIIG8vBnmRh1lBzdd3ibhaucvCaTbbQCaOAfsqixpvfqoMR+
	r+S46Anh4O9V9iyFIW9MLqjIwyIr03wfqqb7qSgknRWYnGGpuBPfmQbzop06lWDID0WT485ppda
	rjqG1LTfMP5WU6EiBC3nd97cwEP5BmY2gM0t7IThgTMUPip/300xRv7CddwNICuyxi6edjZJGZc
	U37tO
X-Received: by 2002:a05:6102:2583:10b0:631:a34d:b671 with SMTP id
 ada2fe7eead31-673bf885fcfmr10043137.5.1779308751281; Wed, 20 May 2026
 13:25:51 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 13:25:50 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 13:25:50 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ag3DawWCcrpCkD0e@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-6-91ab5a8b19a4@google.com>
 <CA+EHjTxvLU4XDPXDXYXXWJES1OFQgN8VTRLMgCCNMwBE6Hk8tQ@mail.gmail.com> <ag3DawWCcrpCkD0e@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 20 May 2026 13:25:50 -0700
X-Gm-Features: AVHnY4IBlIN9DzOr96NZ1ZZdFo1tnLv8pC5ZAKQh-hjUOng4U7q5IXabnxVwwpI
Message-ID: <CAEvNRgGHHkvfJ-mn9rfDvS+_1ht08YatFWo-Swt+5wFSPnC9Nw@mail.gmail.com>
Subject: Re: [PATCH v6 06/43] KVM: x86/mmu: Bug the VM if gmem attributes are
 queried to determine max mapping level
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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

>
> [...snip...]
>
>> > @@ -3357,6 +3357,15 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
>> >                 max_level = fault->max_level;
>> >                 is_private = fault->is_private;
>> >         } else {
>> > +               /*
>> > +                * Memory attributes cannot be obtained from guest_memfd while
>> > +                * the MMU lock is held.
>> > +                */
>> > +               if (KVM_BUG_ON(static_call_query(__kvm_get_memory_attributes) ==
>> > +                              kvm_gmem_get_memory_attributes, kvm)) {
>> > +                       return 0;
>> > +               }
>> > +
>>
>> This directly takes the address of kvm_gmem_get_memory_attributes,
>> which is only compiled if CONFIG_KVM_GUEST_MEMFD=y. This breaks
>> ARCH=i386.
>
> And this bleeds guest_memfd implementation details into places they don't belong.
> The right way to deal with this is to use lockdep_assert_not_held() in whatever
> code mustn't run with mmu_lock held.  E.g.
>
> diff --git virt/kvm/guest_memfd.c virt/kvm/guest_memfd.c
> index c9f155c2dc5c..3bea9c1137ef 100644
> --- virt/kvm/guest_memfd.c
> +++ virt/kvm/guest_memfd.c
> @@ -547,6 +547,9 @@ unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
>         struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
>         struct inode *inode;
>
> +       /* Comment goes here. */
> +       lockdep_assert_not_held(&kvm->mmu_lock);
> +
>         /*
>          * If this gfn has no associated memslot, there's no chance of the gfn
>          * being backed by private memory, since guest_memfd must be used for
>
> But I'm confused, because kvm_gmem_get_memory_attributes() doesn't actually take
> filemap_invalidate_lock(), so what exactly is the problem?
>

Ahh I can drop this patch now. kvm_gmem_get_memory_attributes() used to
take the filemap_invalidate_lock(), but after Liam pointed out that
the attributes maple tree should be using MT_FLAGS_USE_RCU, I stopped
taking filemap_invalidate_lock() and forgot to undo this.

I'll wait a bit for more reviews and then put out another revision
without this patch.

>> >                 max_level = PG_LEVEL_NUM;
>> >                 is_private = kvm_mem_is_private(kvm, gfn);
>> >         }
>> >
>> > --
>> > 2.54.0.563.g4f69b47b94-goog
>> >
>> >
