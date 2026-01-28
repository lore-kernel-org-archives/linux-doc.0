Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2623E36F40D
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 17:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622650; cv=pass; b=IZEtT/9NIjwIBLN3rCMRGNnhPH134JjxvNyD/AEeWxuMC4w3gKX1TUjIVQ2LMlY9lx4AoVX/XkmWZz0easU8Hoj9/okiKnsURgH4H/Ks6Df1dfXNFGC1i0i2NNjJLnrB5nAW8mdVPNuUsUJ98kEXIkXOnDG+sHnKjXTSFTT0KNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622650; c=relaxed/simple;
	bh=CNqWkOyueD1v7WuaKUDdc+x4jRQ5s6ulmoL4RqUerEM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDn5tv+6NurGcqU1EOqvYb7QTSZTlN7/3JrLOQIWsDYqF2tQEi9X1PYKUCEZIBv8bnO717L2SkkNqdX8RGqIE/lnWCaJ8y/NuwbKNbDIatkhAZ8cbTKh9dTNliBUmTYrN+REw/z7+VbM90K0Wfsil+tz/1UaJVjHSdg9pp+jB4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bHT6jDVr; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bHT6jDVr"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-947fe9e92c3so75005241.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 09:50:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769622648; cv=none;
        d=google.com; s=arc-20240605;
        b=Ap9mTXhtxt0RhZ0UGCEFmNJ0QfWUzQPhWoA3QVDqY46roLbn7Pf80MMAciVUKMhhdv
         Pe6RHT1KCzg9K8psv2JThHqLhiJfrYz22ILkzUt0mmCd99mEall5mMk9Py8kObw7sr/8
         dr6HZpqqtNRNmmngLF0Vdi5kd+SSCRsQ+Rr45T3io5DDYcoMPbRrTEykCxdyZH+e7Cd9
         nYlRCHKlMAT/FeSlqeEIXRLvQ9osrx8ZPci5EHFlLcHPrX4wfn+pLl4NN10e9LK2mDy6
         t++Cgx9jPMIUcM1/+8qxGItYCvtE+Zqf4ib9Kap21OdmuNq3O8RWDs++t3nFNbQHUarT
         QU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CNqWkOyueD1v7WuaKUDdc+x4jRQ5s6ulmoL4RqUerEM=;
        fh=uoR2LbB9NGYwawh0jEXXc9xI9E4JSyDvmwOvJDWhEeU=;
        b=WbpQ8U8Q/L/r7Mktb0ymDKTwcKodTHKgaGSFhozJzVvodvvEg52qVIFRqwu1YMaOM8
         kuIbj6XMFqN7dvFF60P1VpFANeTRuIIkhiGK3qazHclg46E57y3OGf4qzlQCJ5yuRdk1
         6nIYHV/cttMcMstMWis+4Wap+8gpahHa4qrbUk7c7zLqv6I8+tYA0GjATJjuUAmKu19x
         PQu3WUGrJJfkc0Q5WZr4waxt3DwEqJgWKC2yRJtU7/A24QcqhteKJDAmvZuVLtjUSrot
         U9PQeYhzW5+u97K0H13WLUSUF8QaPzPkKcAIjxI7Uo1z0rP4Hhqiizi6AjL9rMDBKs8R
         6Bkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769622648; x=1770227448; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CNqWkOyueD1v7WuaKUDdc+x4jRQ5s6ulmoL4RqUerEM=;
        b=bHT6jDVrWJ3mgE3zOdEbPbOXVylCYhJBKidSCHid9ahabufnkQjUDopdWEfUqt8bcF
         lg0R+SYljdK33OM6QbmD4IhWOpcBNORKLrkG/r3rwpBjibP+7XSbTyhpPWf/Fn5tZoXG
         8iXgSC9hofYXikgaLaloBdRIqBSk7PoXv8JMfHLccDyPyNZL1MmlvTj9jVtKoXD1qDdr
         wGJ+WPgGFHT1cBh2DDqw7vc9Y6e98IyTzsVBo90UqQBLxExjeR3YeBxx4KvuntNjJPy/
         oooOPZS5Ffb5yQ3ok1gMnfZO5miSxDmK11nKDNg0N79NN8NPBkqtA39yLQ4KYC7ZycF7
         5tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769622648; x=1770227448;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNqWkOyueD1v7WuaKUDdc+x4jRQ5s6ulmoL4RqUerEM=;
        b=wUrTIK4twObHc5FPTY2Zv0j/Mqk2fAcuySrLpb/QKS6WTICxZaV/19/HDO7OF72/2K
         +TUDhi9MY8u/doAHMzNh14EJu1yR+1D0AFOE9FV0do4fIuj/G++XA/73BTOpHOwxNUCe
         ss95ZbD/K/jZa56/P+cYE+SdF4o1crDz76k+FQlSrZGKUro3UZhU3Rtkt1qT2atb+r8f
         ieFZtlnrQ/Fz2Xo8fPtJxLIWAuV1Xubl8Il9C28J/Dtg79RpwtWPWGzmb7al6simt2HH
         vlh/Omi0cJgkQ1GnymvUH9xjbk4L8+ofcQGOMWV9NqqjKKR/Zy75nzVY9qb+O+AZODtr
         IaFw==
X-Forwarded-Encrypted: i=1; AJvYcCUUeTTOCl0cuNevAc/u2Wgt9TO4GjH7lTJ6za4532MiJHg3mhKVsQNItXxcnzuOEYpJ2b0JPfske5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vd3Pix9um7BeEkoXheDEgMaTuRgQmHKas80IgCr0vbcNd0X+
	B3kG6Jcdn1FrI1y+TR+o7AAwYrXPLb6amFQnIOPHGTZn22SbSZE0isR/cXbFxOlysDs2k8OIvH8
	UPOe5XarOG2O7/N1i0jyZU50Pv6QHbEL14NkbDOes
X-Gm-Gg: AZuq6aJr29CKPnnBIv17Xv/jTMP9+1x21+7GQNdBp0SzKGeUw36iiixLRRQAusW5k3T
	akdrjxqsnveaTJQo02bWx43HcWueESLB+QYZlIrme3vAhUY25jWOBogR6N0wE+K2d0irRY1rsVr
	+R3jNMrHGkBFaKfDGACuR2ic1n5EiVPu2qnvhaToWuoCA1gFR0WhOUDqlmqaRaZh0swpzeg7gPx
	bIqmKLkax95fltaMS+KOL/GPldFB3Def2XDdhoQ4vaONWp5NxQvAxNA8lab4Cq1RmjKdndY8Ldk
	dL0K7ta/fmXy4BNhSx6RqUMTsg==
X-Received: by 2002:a05:6102:390c:b0:5db:e2c2:81a1 with SMTP id
 ada2fe7eead31-5f723765badmr2717805137.14.1769622647325; Wed, 28 Jan 2026
 09:50:47 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 09:50:46 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 09:50:46 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aW3kOgKL7TjpW4AT@yzhao56-desk.sh.intel.com>
References: <cover.1760731772.git.ackerleytng@google.com> <638600e19c6e23959bad60cf61582f387dff6445.1760731772.git.ackerleytng@google.com>
 <aW3kOgKL7TjpW4AT@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 28 Jan 2026 09:50:46 -0800
X-Gm-Features: AZwV_QifG6FXcq-qNYCcE_MoQgt6DAo9uPq6fzN3xKHneI_AD0mm_Yxu6BjCe84
Message-ID: <CAEvNRgEjo5idG7OtMqHt+kCRCQnWjzWzQN7nwNGDExwmf4fyvA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/37] KVM: guest_memfd: Introduce per-gmem
 attributes, use to guard user mappings
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: cgroups@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org, akpm@linux-foundation.org, 
	binbin.wu@linux.intel.com, bp@alien8.de, brauner@kernel.org, 
	chao.p.peng@intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@intel.com, dave.hansen@linux.intel.com, david@redhat.com, 
	dmatlack@google.com, erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, 
	haibo1.xu@intel.com, hannes@cmpxchg.org, hch@infradead.org, hpa@zytor.com, 
	hughd@google.com, ira.weiny@intel.com, isaku.yamahata@intel.com, jack@suse.cz, 
	james.morse@arm.com, jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, 
	jhubbard@nvidia.com, jroedel@suse.de, jthoughton@google.com, 
	jun.miao@intel.com, kai.huang@intel.com, keirf@google.com, 
	kent.overstreet@linux.dev, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, 
	maobibo@loongson.cn, mathieu.desnoyers@efficios.com, maz@kernel.org, 
	mhiramat@kernel.org, mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com, 
	mingo@redhat.com, mlevitsk@redhat.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, peterx@redhat.com, 
	pgonda@google.com, prsampat@amd.com, pvorel@suse.cz, qperret@google.com, 
	richard.weiyang@gmail.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, roypat@amazon.co.uk, rppt@kernel.org, seanjc@google.com, 
	shakeel.butt@linux.dev, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, vannapurve@google.com, 
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, wyihan@google.com, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, yuzenghui@huawei.com, 
	zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

>
> [...snip...]
>
>
> So, it's possible for kvm_mem_is_private() to access invalid mtree data and hit
> the WARN_ON_ONCE() in kvm_gmem_get_attributes().
>
> I reported a similar error in [*].
>
> [*] https://lore.kernel.org/all/aIwD5kGbMibV7ksk@yzhao56-desk.sh.intel.com
>

Will add locking in the next revision. Thanks!
