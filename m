Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D0438A70B
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 17:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433589; cv=pass; b=EEeI5TbksDpcocSYAntW8MYHYmIBExAtoF0TRibXi/zIWbyW7K0KycgB8bM8X2xsNhNktQo+1pXWFES46Q21/DFTezgNaSMg61sw2pdYVxx714TpApVmKVDS3jUO6uUmz2MXC+rZKFURcHNsIJQGiT9NEP8ITVuiBNOnf20rjHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433589; c=relaxed/simple;
	bh=UOih8CBVKjn02CmrfoiIHS5zm6Wg61jRZNK4KLcmhAA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrBwnHVI32G+Wjnh0LWfd3rUpyJ/CjkyWOkdTHHTLl//S8+4PzxVIK5KieICjrvYtKOi5vFKsQw7gcXh6cQuVmkzBfWFpZJU4ih3IuNVrdtRtjx+Cp4TteH+JJ/IIq1k6wLEcoKmeVSITk9RGqRkOD+l+yJTo8mXTQVw45wQiYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J1/mqrOK; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J1/mqrOK"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso37437a12.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 10:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785433586; cv=none;
        d=google.com; s=arc-20260327;
        b=Xc/Eg5hioWz7t8FO3WO4Qn9kMyQGWhWtYvjCS5UzWbRr+mpsLLEi6EwrTwyEMAXj6H
         g/IAT/Z9R1lfm0LPtxDW8GMJAftpCnJi9mqdHFWcA/0eaTJY1hPt8cpdEu81p8JGhL4O
         jRmKnq58b6cDyWbiZ5R7JyH9EF2/q2P1ntXl86sZk/u3lZ7Biyd9bVLlif+es7z8Ex9e
         Rrl6Ld73UUXJmNhrPozo3QpRjyhAkqsRD1WO0LOZG8YzvhSazw/EFOSnvEFcQVJEBp9m
         kEWK7ClSm4HNVCZyppZ6nIsk7GecH+UFlL4RmhKZrpp4dSeboMHI1s9H29MT35ep1uGz
         540A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=UOih8CBVKjn02CmrfoiIHS5zm6Wg61jRZNK4KLcmhAA=;
        fh=SrWJ3dhx3uAcG10EsoUsZIq9ShyJrTcnIMj5fRIGB3I=;
        b=mPNQVU05d6Wcsnld1I1O1y5n+uwdJaECCcEBZxb78jv1BuJ0zakFygR8vvmAdav9z8
         PK3Xr6BFlWsQKEmZIUrHFRLhJfs6Dcz1fqMcLaa///sTEUW3mVwPi6ktfX0tvqP1QnJT
         uUTl/WXdSU/OOu08RWxWsVlvAhumfcrg/8fK5cIrU3QkCoJxXK2lqkkCu8gwJmuReq5q
         8rO/xSTQwXLQ3rk5B2BJ6ZUVAyVlCCUw9OHsLhj9QVh2W39jqHYmM/Q8QKp4gkNfdMcO
         3Mr7U+QYl009O8xnkv8bolsWMQ5bGhDlCO2e30r7iFlKxufKCR2ZT9dY9GLZcB2OYnQ0
         bEBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785433586; x=1786038386; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOih8CBVKjn02CmrfoiIHS5zm6Wg61jRZNK4KLcmhAA=;
        b=J1/mqrOKozDueyOpPmCiJpfk6B8e+u5yoozZJa6XaOQjjljLb7DHPL0Bmy099pdfi4
         Z/7yelzto4GyAHhRTDywVXDxrz4AZEviushDDgcvs6rgH/JowQ7BUFYYAkIqR7WnTJPE
         Uib25zhKYq+kAtEh2XHHlqNOpXNT4fkDR1bJPyDbyB/DqYAOPazoQjfRRKr3Jpb+x4xr
         iQFPY56TbHxWUHcuyHvvjaqg1GawzvFw1zSajdUJElsK8nSsvJA+z3niIBhYr6GFNXwo
         hO1d3kIpRxiTW48kCG3R+uxUaPfNmksgLGejqeM3RxRwhAtmMuTWxvBnebPfy40LfCzz
         4PtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433586; x=1786038386;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOih8CBVKjn02CmrfoiIHS5zm6Wg61jRZNK4KLcmhAA=;
        b=UWOZXzE1s3SCsTmF+JRWhoiQZEFSzvdg3sRU/EaKbm4+qqchVkPXGp+AJvnscJ0RU9
         pok7ER4KdSn5b5OdiEXnPrAR0NAXhjkHfalFvBMqdM2Y2mDFaWLIjfoZ+7BoAbPlibl6
         gsv3Gqm2yiQXnPdZOSNTZuCHvu8vJXsbPpQq7O4YgQGCYlSgZpDawkBE3DyTQuQP/9Uj
         c26KaX/xVG+yU6h4XYXDj+KacP7MN3Bo5sq+nyBFmUeLL98JSp+tOnq2xUIYu8CHdtG4
         lWpvCNo4CjYxFaLYDarGn+PaU/2RsUNnphWXSg/hMR9ayIP/Ka+/uxzFjBoqkdH4RvZD
         vtuw==
X-Forwarded-Encrypted: i=1; AHgh+RpGTCxvH/IZZwXtOzcjaXaFzd6e8N4pdqN37U5pqaXolmrpbFqgw5Y0z2GRHP0qe+NAUvJFxE1sotY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz715kh1BZ7egW1pbJeBh4r+m4+JITHfumyeUA7IsX3PQY9XUET
	Ipt7aHg7NmknY9B1zt0jVksLcrcTd34RtEQGExhm8Y08VVbjlaSoXQ62wt1WWUgPrJB1zdBVMmp
	/vLcob34Wq+ZFquJL2RhLLD2kEttf0bSL4S7DCClx
X-Gm-Gg: AR+sD13vP0RXsVwOCDTqiZ2YG4aY81OQ9gFVgF2fnjqMl/0Zt7YDyjyvgHLmc9nUvYB
	NkogXEtvTYAKkL3y/pnwUKpWz1f77Y5FdYA5cxO8Gt+n4P+d+VwdDRt2a0xYob0fywPrb4Xg58b
	at3RTqtsfze/rjCfFRawaAu4n6driyb7BfgorPbRmgpfqw87yLMdQdDreMblhdFDpk3o1aAdVDC
	rd/fbD5irafb1BOaG5rB4iNYkfLmorMOzGpn88h/m/87Vr3YevmNhA5WCIjW6nXmM0HOGxdCZy1
	RWT1Aluci6RL6qKffTqssLGdl8RI71bWAGZ/va/+XDSyoIsFBmOFksznjNkhowM297fBZQcuaiP
	qoDHFwDOvGzsQZ83b4p5GBl57D5/ygvrvdw==
X-Received: by 2002:a05:6a21:e8b:b0:3bf:6ac8:8d29 with SMTP id
 adf61e73a8af0-3c9006bb981mr3748982637.21.1785433585760; Thu, 30 Jul 2026
 10:46:25 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 10:46:24 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 10:46:24 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728121138.1103610-8-tarunsahu@google.com>
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-8-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 10:46:24 -0700
X-Gm-Features: AUfX_mxSA02wZmCDGZHkTAv1sqG45AQrWdNvcUlNspdo9IevcZmmfeKZDjs0tR8
Message-ID: <CAEvNRgHvBTKaG4G5J=sMFGYepEnOFaeCBtjkzN6xmGtZ+o6XxA@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] KVM: guest_memfd: Add support for freezing mappings
To: Tarun Sahu <tarunsahu@google.com>, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: linux-kselftest@vger.kernel.org, andre.przywara@arm.com, 
	michael.roth@amd.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	will@kernel.org, vannapurve@google.com, maz@kernel.org, fvdl@google.com, 
	kvm@vger.kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev, 
	alexandru.elisei@arm.com, skhawaja@google.com, aneesh.kumar@kernel.org, 
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, 
	kexec@lists.infradead.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Tarun Sahu <tarunsahu@google.com> writes:

> Introduce kvm_gmem_freeze() to freeze a guest_memfd inode's mapping,
> which prevents fallocate() operations and new page fault allocations
> during preservation.
>
> Use a global SRCU (`kvm_gmem_freeze_srcu`) to synchronize freeze state
> checkers without incurring per-fault locking overhead or risking per-CPU
> memory exhaustion (as per-CPU structure not counted in cgroup) from
> per-inode SRCU structures by faulty/compromised VMM.
>

I wonder if everything to do with freezing should be gated behind
CONFIG_LIVEUPDATE_GUEST_MEMFD. What do people think?

> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>
> [...snip...]
>
