Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36B326BD87
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740497098; cv=none; b=nqx7IdVs9DgKPCJ6Czapbk7mhLuppkSMQHSgIYs8Fg0jcYVEl7YxyRA3OPH16E7qXreZz4X5ps2Est+M3lHxzHI/tJ6DRObxmbErukZsgb5DHmH6vR+xByEDnY5fjV1rcMctMe7cs5yiMVP0sXf5A+SpY0pk6yu5E4b9pQfoauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740497098; c=relaxed/simple;
	bh=/kEmc1RisEmZzLUP6Bb9mGVdImTgWmIIc9sRmzZjAb0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=usl9k7aXY0aNGhiToamnRaYptwKmjcr7PrvlL4hZHHcTfkQW900vQvoVpe4SQwkLAqzYeSjm1SKYWX1zCMHhptiqsWSfR2CZ/Kq2cEXHzWMGs7AknF2ZFYBXXPpWDoLFSfcDHweBeJjSybH8J3fi9048fGtWqueIhaAiFc97WIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CpLrUep1; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CpLrUep1"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fc1c7c8396so11874644a91.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 07:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740497096; x=1741101896; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=htA+KOz3hwOpVDUGhryEfyIW89CbLqdlKndxYP8BGHY=;
        b=CpLrUep199DOdagcEmyW/NLD8D91tT8cvWgdBy+wZB+nSiFfuesOpVS7JzbWJRI4gP
         L4gfkE0NQ8tfTXxxwAu+zT8pwoDq5EFHhLgv55QzvdyGrJxCjmUqBEGMSWvzivBNTcdU
         HGvhm7kRzknwG3bQUjYUl2B1EOpdj7+C1DhfJ9IZ8p+jkf1Ya8rfSmrnhfKJbmjDKt5q
         llKoUkNFvy2GJK7pmtnkMTlN2mbjijr5rhJ1h5KN/LsB3qAxIN+jgIolzNdvIVL79UmN
         GORHAH/pHbwRABIShDzRf8YQuqEOdYAez/dEewyAHYCvk8ETOT2dwEOHrwtbdyYfGXAr
         /7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497096; x=1741101896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=htA+KOz3hwOpVDUGhryEfyIW89CbLqdlKndxYP8BGHY=;
        b=AQxErmwlLqxhFgU/Xe9ptw4qEUfOt3gvRCf2dM3DbEMgg3T0mdmm+ALVyEmAIiXhRY
         2uLe0hMdLyWCC+VOwG3NLgXOv1wyvHjF8Vn69aGp1TEg/BpGyrlD+Nhv/2qEWe7kRj9o
         qJQBr/0YPkpdBOpMIYCKuXnSFKYtwi83Qp+bwLw42W/siaop4Ox39WAOw1rSn8vEmVKR
         +0CutjsYl8uqAzo5TAEXR+a/WAs2q8N0fq+AXsomlvRtmUiZw9mi4AYo3pnWgWlTz0We
         wiBDWKE7AcUGWSCt4HVZxY0k/p0OBqQFeKWp4TbfpRVkCnu0AUxl3Tx1czpS/MIIWMoz
         hPew==
X-Forwarded-Encrypted: i=1; AJvYcCUcoE8g+inZGj3L06Klle81/yGbCp/Yzg8RUibXifon7zhZVw3+ItaFGLF+HAyZ84iO9anQJdDmS78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIp5LM9KY/MbKe/RVyLulsSU089ZHIFeUHTeMHFt0jEjsyPshZ
	6mHBZPwqtHaEhUAFB9I6+dGSugQihfvczwL7BtLQs4FOLos0ElV3qVfPlfn80xD4Qnr/JWYNOeY
	9mg==
X-Google-Smtp-Source: AGHT+IEfGwMFBrSc1PtpNIxEeqJE1KnFkO2G8V6lYOf7bmlh6CIlg9FiV9Y9zAZ7X+CiVfk9lHXS5gclkAA=
X-Received: from pjbtb3.prod.google.com ([2002:a17:90b:53c3:b0:2f4:465d:5c61])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5202:b0:2fa:b8e:3d26
 with SMTP id 98e67ed59e1d1-2fce875bd28mr27277979a91.30.1740497096080; Tue, 25
 Feb 2025 07:24:56 -0800 (PST)
Date: Tue, 25 Feb 2025 07:24:54 -0800
In-Reply-To: <22d4574b-7e2d-4cd8-91bd-f5208e82369e@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241001050110.3643764-1-xin@zytor.com> <22d4574b-7e2d-4cd8-91bd-f5208e82369e@zytor.com>
Message-ID: <Z73gxklugkYpwJiZ@google.com>
Subject: Re: [PATCH v3 00/27] Enable FRED with KVM VMX
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Chao Gao <chao.gao@intel.com>, pbonzini@redhat.com, 
	corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 18, 2025, Xin Li wrote:
> On 9/30/2024 10:00 PM, Xin Li (Intel) wrote:
> While I'm waiting for the CET patches for native Linux and KVM to be
> upstreamed, do you think if it's worth it for you to take the cleanup
> and some of the preparation patches first?

Yes, definitely.  I'll go through the series and see what I can grab now.

Thanks!

> Top of my mind are:
>     KVM: x86: Use a dedicated flow for queueing re-injected exceptions
>     KVM: VMX: Don't modify guest XFD_ERR if CR0.TS=1
>     KVM: VMX: Pass XFD_ERR as pseudo-payload when injecting #NM
>     KVM: nVMX: Add a prerequisite to existence of VMCS fields
>     KVM: nVMX: Add a prerequisite to SHADOW_FIELD_R[OW] macros
> 
> Then specially, the nested exception tracking patch seems a good one as
> Chao Gao suggested to decouple the nested tracking from FRED:
>     KVM: VMX: Virtualize nested exception tracking
> 
> Lastly the patches to add support for the secondary VM exit controls might
> go in early as well:
>     KVM: VMX: Add support for the secondary VM exit controls
>     KVM: nVMX: Add support for the secondary VM exit controls
> 
> But if you don't like the idea please just let me know.
> 
> Thanks!
>     Xin
