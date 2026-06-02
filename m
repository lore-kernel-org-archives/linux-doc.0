Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE353ADBAF
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 22:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440084; cv=pass; b=If+U6QHBSPcH8Ho6cyNdh+YPI3Yb0pulI7mNLBzxJiSGUXi+m9rWQwnq4cRpAmAnEMHG27iRdwNFTSF1M1cXU+AMJtsRwNamzOKUbsTo3gkIXmH4EnpRj0dvw2mgPArzm0/hv4wLpHmj8XMcGjBcqvUERelYV+1Xs7+bwfoT//Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440084; c=relaxed/simple;
	bh=JN5w0VLC4CArOs/YqYBchGdpeM2L7REgIk+BeZ3c7Nc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFPAGPk+1ZeKQ5ukR3IDvp2wSynPw1YmpMO5+2ZbZwbtQYin5iKltPC32nc+AuVe+6TmS6tQ2BUJsPWf8sAmLLl/Bg2YrZseFrTtQLsx+3moU9QqYiILNkAKWezlEodGz2a4OfncIIKgcvLUaNyG6xq+MQiUtiSOXlrIqoZ8Ubc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OLdpuuzZ; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OLdpuuzZ"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-137dd523634so4883209c88.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 15:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780440082; cv=none;
        d=google.com; s=arc-20240605;
        b=WNOmSsN/s8yTfCBQCZJUPaFd1HzeaQO3PzUVs0MIMQ6FtpTYpSQ22LVjHYQj1HKUj5
         FqXS1dLQGfXGVhAYJEafyuhcA769mCmvms2TniBqBNCP1dLlRamm2caTu0i4KsB6Xpsq
         2VZLLYquGM6DXS1wgPQrgqk5IVKOIVW9OMQ1KpolB5ACp4npZPKNo7OjKcYFAkjkEIhD
         uYMH+7+l6O9TqcY7MUAPDdsJv2d+UTKMu8HB3I4KyJ3OG48VL/68t/rqdJcKAGcIGlcX
         bVXtcfXiC258FO87QtVhZQdGVrqR5h+KlP2tcrznfWL4EjUE49HUrXIvTKmp1jJSrGWP
         H88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=9Zpj3jj8aTNr4p/iPSCl+ydGEAQL1021/sdQMyQbGis=;
        fh=6t0f96F0C99xxg4yQyruHlOgAX9++bJ0yrnosq6jHpk=;
        b=FHs5zcxScT9irHFi2QUbZdPDXV8uCBmPkVLx1MjEGbmgpuKF6nrC+HrsyJI3xxPn/O
         DA7WP4cuE7ilPvmz0Nf+K3g+sPWz/0Xx9HtSSzmF2rVODMA2stj0pmyCsp8UBNv/M6T0
         r2IwTRvZ5UEBpO/n8ffd+7J5LfD7t2Y3yGJ292BYtTnVU4gXhzNgPcgcvtzVyVJpFJ3u
         buvEvcKgBPTWED00mE5qQyXEVnxiLP0S6kPSQlO6BTgotgk5kf476vzjrU3DTk2oNgNv
         G8uowqHwgf3xqQdJuR9oKW9FhneHvWMrcVY7YVvI955hCGEY5ABQDEsInhXWYmHdc1uO
         Lg9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780440082; x=1781044882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Zpj3jj8aTNr4p/iPSCl+ydGEAQL1021/sdQMyQbGis=;
        b=OLdpuuzZDB47YplpmtAP4MJX6E8SIykbgJ59+5rm698PCRhUth1naGUs65Lu/IeH4N
         ktaZJLkhg0AECim8CAiss+raZ1tL3+xj5x8J4vTFCWyH52UwhtKMpUP3YFLnzflInGxe
         gBlAw0xf3m0ndFGggP8kAVwB7KfALltPNU6hF3FzGQf7wJmpllivrfKTMNoruZDSXoZS
         339scviSYJyk3gU8ZYDJICqQKcYeYM7F5gqrNqVreAcke/GozMlRPW+ugYZJd3OMUm6l
         QQC9Z8QHO2nEEXfI6mQFaJR6s1lg852u4+rNjjci7JsAhk0fCfrr46LzOkPwmjaJ9JgS
         VlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780440082; x=1781044882;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Zpj3jj8aTNr4p/iPSCl+ydGEAQL1021/sdQMyQbGis=;
        b=r8gdeshEXhX9KqMmgzo7jWRNwuiVViysZLqJil5GbdW8tFykrHTCj0pHbs7Fi4Q/PU
         GeRuSZRo/4UENSgKMkRX+XxttPvE17g236ghLzkzVHpWFkbijrXD/w30myj8d+et02vz
         W3Br8CvkRicwv3eKXF9ZfA3Swa6KfwHne2CNlxDwj/hjy7f1oYiMh1vC4PSUZbXaDapE
         ji0VYwwDwSgMABdrqjFJenzYLEhCrEloMeLYizeOmkvRNn9+fqa66Fjljw7ed8S+vp9i
         iv7Qxuu4AfCJ25zZm2elzqqUSlB78D00rtLLdI2GOu9FfX3KOxzWDXHEdYVUi049lHJg
         oQGw==
X-Forwarded-Encrypted: i=1; AFNElJ/pPfIe9jyri/g7Er7eErb388mFtl8QP8UGRqZZhKpVa4KpanjDyxoq/fYU2/1e/J4CLUJEdWo8iqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNhCDWQc36eCOJurgQaR6rvWVfeNCwWkJI+2w+MHPcElqIm5Zn
	eYxIcExTphROnjY1V6bW1Sncpt1wuOAO8bNxRo2OavI6BrY8rNKvahblo4nAQJW0IXCZAN1o9t1
	wmt1drtKltdVbWeqhUfW5aORabR9/Lem6H93/g2cY
X-Gm-Gg: Acq92OGRgmfplPiI1r6CBpMWapes9EVnUbON9a5hwmrd3QgZYzcPNP6/8v3b+B7mpbC
	yeRHvzmbboiF4Jk32HIYZjeObnTOczSwW0+Jz4tioodI+9aF1BCjpyPaoR930eJ5G98/PtQRJ7w
	ru8kHu62/unLqYjBIwMUKJIinEcExAUgVGXLFmypxJk+TNcax3r0FSj77i0B8hG7J00Zpn6MJrK
	wWGwOkDtarPzFABVzMWgf6mVhGYyHrf575L9zAkNPcZN34jLHj4N6ed2GwPfHoB6K45x1lsucpc
	dyvOLVBFoz6oOzaG8WjTTfYSVE06EXx0h4oNdDsUG4oknsEHLiVDebIdduJvLBLer58R3fINcdQ
	J645c+osPMRMktP4=
X-Received: by 2002:a05:7022:6ba8:b0:135:5d4b:2096 with SMTP id
 a92af1059eb24-137f6bd71e0mr275458c88.36.1780440081068; Tue, 02 Jun 2026
 15:41:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 15:41:20 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 15:41:20 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <144bbb9f-39a2-4c90-8903-51521e022da0@arm.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-7-2f0fae496530@google.com>
 <d01cf1ec-b85d-4af6-9810-8107c0e2a4ec@arm.com> <144bbb9f-39a2-4c90-8903-51521e022da0@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 2 Jun 2026 15:41:20 -0700
X-Gm-Features: AVHnY4Il1A6xpCFYh9Ccj4ryfsVj2nvlEe4xvqbfHFojqcjHjss1rOCXb44vh2I
Message-ID: <CAEvNRgE1dCVAxJWd_hyFa8N=m9JLfn97ip9tAmvHxspWJ50oGg@mail.gmail.com>
Subject: Re: [PATCH v7 07/42] KVM: guest_memfd: Only prepare folios for
 private pages
To: Suzuki K Poulose <suzuki.poulose@arm.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

>
> [...snip...]
>
>>> @@ -914,7 +916,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct
>>> kvm_memory_slot *slot,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 folio_mark_uptod=
ate(folio);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> -=C2=A0=C2=A0=C2=A0 r =3D kvm_gmem_prepare_folio(kvm, slot, gfn, folio)=
;
>>> +=C2=A0=C2=A0=C2=A0 if (kvm_gmem_is_private_mem(inode, index))
>>
>> Don't we need to make sure the entire folio is private ? Not just the
>> page at the index ?
>>  =C2=A0=C2=A0=C2=A0=C2=A0if (kvm_gmem_range_is_private(, index, folio_nr=
_pages(folio)) ?

I was thinking to fix this when I do huge pages, for now guest_memfd is
always just PAGE_SIZE, so just looking up index is fine.

Is that okay?

>
> Or rather, we should go through the individual pages and apply the
> prepare for ones that are private ?
>
> Suzuki
>

IIRC the plan was to make kvm_gmem_prepare_folio() idempotent, as in, if
a page is already private, just skip. Currently sev_gmem_prepare() does
a pr_debug(), which I guess is technically still idempotent.

I'm thinking that the information tha needs tracking to make
.gmem_prepare() idempotent should be tracked by arch code.

Does this work for ARM CCA?

>>
>> [...snip...]
>>
