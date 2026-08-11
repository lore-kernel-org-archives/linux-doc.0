Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD68285CA4
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 00:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786409292; cv=none; b=mnk7eUkklLEmoAlwUjTrKi3cZEBpAsPt2lpLzC3WNUANwvHEC264IUSboLXcjpKbg1VNNHov8c6s2oNrrGYqoU9enWzXQb9daDgnw0zNCEQFfLXEEGApOAPyE4ViM5l810CpVbHK0+egUs7ehhYgpYj5iTck7ek1boSayM7mkcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786409292; c=relaxed/simple;
	bh=SW0ZwvYoKhM6FW3ut7EHho8mS7J5qQPyYhcgYTaD0w4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QjK9JVD5l2torxKpVlF4AH+TYvxamxUmPTaLGRkJPhXi+qRb0440GswHZ45EEREJCflzGU23YLr8+stgWz/3WaslY22+olfF+DwsaYAem5e42YRamrWna8v2CqlJU8Wd+SDpAUuna77KlPe1UJ/bTWMAWPJCBy3UBUAJrZeb94o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OkF58ZSf; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OkF58ZSf"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a3514f912so397126b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 17:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786409290; x=1787014090; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=57qFiioTiYY05WIjQzEmLqwAbaTdR8MUfRFj4mAMGpo=;
        b=OkF58ZSfbwD6hAKHhtsGYgcNgMEybXUHPMiz4hNTsNgOx1ctbvpYmfpVyUhQIBpYZ4
         fMr19mCP+i6W1+8U22BrTOZSqwhwIJf4wmokILGULS0RzbhuwC7yMj9kCvLNQ/atUpDs
         lEuEuhRB1Z0MCWKI+bKtPYBw0A8S1udDZrzdHnArKrT95pSaG9rLMfUwdVDz5Xo8bo0f
         MMoYmP/jV/dK1/zSIx6y4G/4RDXVR9hZ/i+ITqxiWpry7ULqVvrVXJejHnhrJ7C7DVEs
         1WKWTCfHbbn6hNEoDGCsIgNw7Qv5FvNdSl2vA3QWc0UpGDt/N1gVXud7pbT+o5igmfdi
         0wLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786409290; x=1787014090;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57qFiioTiYY05WIjQzEmLqwAbaTdR8MUfRFj4mAMGpo=;
        b=EpU36pMYPli+88ukNa1OwfKtOGXIUP+o2TmJ6/b1uuiY37lYK4k5vlFAnKs9oHiBN6
         OtUdcjMgzwZO5jDzJNrT0oGXPx7XvBFDiSYlO40TDNQmgmcE04CVwMEqc77WSX3tTFEu
         gaWTxvItlUKYaFHyMYv0ngXg4VZxDKoZ0SMMoqnPaYkM9/J2hJSH88ISlDUz8JOim+BW
         vry7VY5p1JJldLurhVaepfW0we6fCJhlE+VG/z2LK9DZRj8YUrQfJPkVdmMAB+N49jI1
         1mdgMrSN8tbAVa9LTllCmGbZfp+BsZD2JsdfNDSpnfJaHZ5fcx0ZuywiOCcxSYEsUTO1
         +KVw==
X-Forwarded-Encrypted: i=1; AHgh+Rrp72BZ9X26x3dU6gu86z5MNbQ7Zy9Y2/3JSGCmIwwM99+wRd7dSo/8fFDQe1p+ozAfZs+Y10rcjOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvu3udFddh92XvcyY9iQAucXf5poytnWkzXAAYF2RzyJCwlD3c
	JDUWElAc9a2QUphIc4KSCOQBnUp5Lau/52y2TvEwBAELPCStd+sVyiqwPW4eF+O+jNVtHVdR39i
	+Tk+iuQ==
X-Received: from pgbgf7.prod.google.com ([2002:a05:6a02:2cc7:b0:cbe:9522:2c9d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4519:b0:847:968d:b101
 with SMTP id d2e1a72fcca58-84f2e03916amr55995346b3a.21.1786409290016; Mon, 10
 Aug 2026 17:48:10 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:48:09 -0700
In-Reply-To: <20260713105033.15405-1-sarunkod@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260713105033.15405-1-sarunkod@amd.com>
Message-ID: <anpxSbwbYzyJ1SQQ@google.com>
Subject: Re: [RFC PATCH v3 0/6] Add support for AMD IOMMU GAPPI
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Eric Biggers <ebiggers@kernel.org>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Li RongQing <lirongqing@baidu.com>, Marco Elver <elver@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Thomas Gleixner <tglx@kernel.org>, 
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jul 13, 2026, Sairaj Kodilkar wrote:
> On newer generations of AMD processors, IOMMU AVIC/x2AVIC guest-mode interrupt
> remapping can use Guest APIC Physical Processor Interrupt (GAPPI) as an
> alternative host-notification path when device interrupts target a vCPU that
> is not running (IRTE[IsRun] = 0).

Why is this still an RFC?  I mean that in a good way.  I haven't looked at this
super duper closely, but the patches all look to be in generally good shape.
I.e. this seems well beyond RFC, unless there's a hard blocker or something,
e.g. known bugs?

Another bigger picture comment: I'm very tempted to say this has a hard dependency
on KVM's irq_test[*] adding support for AMD.  I know it's being worked on, but I
can't remember who is doing the work, or when it's expected...

[*] https://lore.kernel.org/all/20260626213534.3866178-1-seanjc@google.com
