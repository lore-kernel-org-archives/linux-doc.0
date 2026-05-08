Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D9840F8C7
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 21:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275301; cv=pass; b=RPY+M7toO6Xv3tNtw9DJarW5WPJC+4OAo2s3WiM7nLejJe/Ic/VmHCg0fZ7Mc3Tl8tBhp0Vj1QbhSujPLuSvXR9jrsM0qjnPGeIY4xd0UTkDl3xQZaHqmzh7UULwET2ePduUNwOugMYQpeaXYwroeZQeTGJ1IsdYG3yGHKZhRVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275301; c=relaxed/simple;
	bh=DwVpQtg2nQbOTA132JfDdSVfFAB6KCJ3Mceieu5x3bI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2YluDpAIz3UapcVWrYMahsCcuLAAjjMfSMrEuu8yrLdEiS8eFfMu/7DEcekdMxVoNDfciUzSrJ1WY4ofc/DKYcWkvTsWyLy5qlSt1QV0rumAWCs9ErRFLJIXzvPZ+z7F+rXnSMHL0/OVz7zD5O3FEGHL1D/X1nmUELRSLMSIzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UBSIVYV+; arc=pass smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UBSIVYV+"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so1456650241.0
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 14:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778275299; cv=none;
        d=google.com; s=arc-20240605;
        b=RoQHoeZXydVc2Q0K+IOxHoJBNd/+gUVwgmzcQNRN2GzyhSQ0UKWur2KRVoQQY5jtPi
         kNIk5uuy7OrDT8ao6bHlTUz3GANmb0iIGc+vaKedevH0KWCF/CDOU8WdBfJ+u/HEju4m
         54tFZWeZ1SPxMb8AjQK24k+aQ9EZkaBOew2D8jOaCZemze4eFhXkMkXVQ1/of8XjZcJQ
         UpK1Edez+RK6HXnbgpdLeCbCSDxwlqMXnrW3ZNbHc1QJhYKEJrXHvpAeoA/KgoVQbu+x
         y479fo/EmGC/OYblPbWap5ik32c/+Bqv79NC0k/BAs4osxdMpAuc4jrK7HTST9cj/83b
         6INQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=DwVpQtg2nQbOTA132JfDdSVfFAB6KCJ3Mceieu5x3bI=;
        fh=Kkv1SAks98f3y53p+otaje6+Z2coGiCve9p5PnMN0XY=;
        b=PD78S6dP2tdVkHN3a6FXIgUcohjerIABZvt8egwAeU1Ob4PdqRcIaeqcw46U4T/KcP
         BF4Dh0JedJnBnsQL+5UW2ljdCilDUFPbIVkmCpmWSzP8BeDR2DTrnLMj21/HMuIDKJmA
         FTuqce2uxyQfHMKWu59foc8CqKybZ2pjH5k65FZCV4dSJ4p8oWiadfZ2hqUd4qQGyYVf
         H/H+7qyl/kp2Eoawhp+TfV1sNGBW6Xxsu2SKCmAoTPB0bmHG6smJvjCXY609viR7DiCB
         gvdHrRakaYeyHIb6d4owq763pHLSiQJXYbftQhHuLmiqo9/SX+5ZIKL1O/j7Keju0j8e
         aNqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778275299; x=1778880099; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DwVpQtg2nQbOTA132JfDdSVfFAB6KCJ3Mceieu5x3bI=;
        b=UBSIVYV+DWGpniUTgfToZNAWd5wYknlbdg+jHa8ib8fuBYefruu53HdoscKhtUpTfF
         +FIyWQKOigzjLNooN8kmf4/QhFvDUVDYc1DUcEwGtTp4qHY19snvIawBSOEjY9rjxDAW
         E3hergxglpxvyoFLcNuUevBTJBOMui9j01AzYJ291EqYmksQtJmn1/DabVkI+CKc0zCu
         Z4YpJuyo1aHi8DACkQxc9lzxhTI2w3n2lp2v8tpBUyXyKIdRR4r/MKldOCN8M50cUoMS
         4iWjyCjMuorgsaXskKpwTX/0DXt6udn4RiGrk6SX/h/fYRWj7lxKdYbiKdgQcX9bbXJT
         ZGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275299; x=1778880099;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DwVpQtg2nQbOTA132JfDdSVfFAB6KCJ3Mceieu5x3bI=;
        b=b+7HeEf8f2HMN09BP3oIiD7PEDDlLS528wGODg1czQzwpcLONDRT9u6fe8UyzM52q4
         jk7Qi0QJQOTnub+cuL1v7LFeRz83RfJea2ApM7j1dvR7OWbu4/eiN5Z3/Ajh+sGQIZ+d
         VB4kDIuJBnoRHHq2yVHUiTPwkbeNF9vYLkr2MSAWFu2A/JID9X/5IyfsxH2jwXTy6jfD
         cwNKjG+C+7bi2bKG3tIOWpThns470KEWSoEb1ex1wZZbaxLdS+t4nlNFEtWXo8/Zq3Aj
         zDTJO2otRFI+Ixmn8+K3PHNxaG51cfIfefBP4irbXpy1AtpaiyEKLdkViqnOwUJ6FKNJ
         aNOA==
X-Forwarded-Encrypted: i=1; AFNElJ+iS/Gp5OE9Iy0Pll03PfYSOrAFYKdZHyjeA4uU7uebsf7nYSCICTSmm5fcCTjZCCi7GmBQhOZMbfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQSETiymTRDAHgdqQaIPpuP4dxx7XD2Pm7N1vQV8kFQti93qLP
	6F8wk8Sh1EsgKHiQWtbAQ5cmv7Fa/VBQVQyu+mD7J/djtFsjA+KcSKxaBotZlil/rQ/mv/W7Y2O
	CX029E/FhFJoGfHnWIsvbRaVT1sFKj0sif0TO0Qi3
X-Gm-Gg: Acq92OHZ8dLkyumIOWuMVinOZwizt18zgxALiFOs/FyvX7WUezvLmfti7uetAkvNowR
	bqbp9IZOIzcyaLDJENQp3OBlik3DZG0FvdWcQ3x9cdrn57SQrslI9yrhsLpLDIxAcQDRxfYTE4p
	iKdvMF/RQ8ZPc3IfQAnMBF2rx5Q4Jz58vbWu2arjxru/3SOv2IA6zS2+1RrllHqVIYxI6kT+xxm
	QrO9DLCYWBSQ/Aw3AUQ/tV19Km0wORnlbVYdZgWIm6EVXUbgg2sZg/7wcrxcxPt5Nit3sI7GnEC
	vfy5Vf2hmrNzypH7UvPcyfP5oxM0g1PUeSHhOEvx0wGBNYHAJT8ct73CKDZQFh6eU+BejpwNsSo
	RpYXPWvWGPkuyP58=
X-Received: by 2002:a05:6102:2ac7:b0:631:8bae:f74d with SMTP id
 ada2fe7eead31-6318baf205amr901736137.28.1778275298534; Fri, 08 May 2026
 14:21:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 May 2026 14:21:37 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 May 2026 14:21:37 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <af4gJ6xZ3e7UXOuO@google.com>
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
 <20260326-gmem-inplace-conversion-v4-10-e202fe950ffd@google.com>
 <2r4mmfiuisw26qymahnbh2oxqkkrywqev477kc4rlkcyx7tels@c7ple7kdgpo3>
 <CAEvNRgFkusZeKxGctUpTTbYjdi7nZL1ZZar-gT7XRUOCZ2xtpw@mail.gmail.com>
 <eiiecl7jvywvqb4drq7cchmcabcrdka25wxr77uavxqineeedm@rfcnhdz6xoxf>
 <3blpenhpvysb2ig7efegedx4v3flppl5ftnz6vhpqlatfk3ycn@vmmhs7mvjieg>
 <CAEvNRgGbMhkX310CkFY_M5x-zod=BDTiuznrZ0XvFPUK7weL1A@mail.gmail.com>
 <foi2zvv5qrfdcspnx4fstrvzl74m6xp6zrsw5omlbprxh4jrhx@vxnwk7fr46gu> <af4gJ6xZ3e7UXOuO@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 8 May 2026 14:21:37 -0700
X-Gm-Features: AVHnY4KoLAXwUd272WSq8KkXYOzbLX3Fym78BjF7-ccyQZ1fkjgts947Mu_AiDo
Message-ID: <CAEvNRgGOCUL-MzBmXZNZHYEiFdVmeL_K0itPrSRex2f+FazGGQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 10/44] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Sean Christopherson <seanjc@google.com>, Michael Roth <michael.roth@amd.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
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
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>
> Summarizing this week's PUCK call[*]:
>
> Scrap PRESERVE and ZERO, and simply rely on vendor specific semantics.
>
>
> [...snip...]
>

Thanks for the summary! Please see v6 here:

https://lore.kernel.org/all/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com/T/
