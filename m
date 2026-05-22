Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2B438D3E3
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 21:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779486442; cv=none; b=JRFvUo+Z05eJoMyvXP/BrWJabHehDi2dOm3ncEi3HZ38/4rsjsyGttI1FtMnC+AOi6xYMVdww0sv0racvJ9RU5D2EvtbPMYwLbzNQRrJMheiOyLMluEVxFWrIJP9MjBWcrC4NRQYSPGZe0t7KL5cdMI1UNOCi/v+8fncqGoNz+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779486442; c=relaxed/simple;
	bh=CoghQin1KhXux0hst27Dy6jPuyHPo3tWKEEVC3sFXWk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nZAHfuC5rwNsZuLFsfFQXLTkqQ3fKuqWndTMcmkucxtTmaJmpo/1P54uLRdZNlhxm35lN85BcivJVsjdqJHotLw4XgmTNyRXEuyn3B3dPOVtvhnn6g87Mmg1r+L1F4HQyxqNkgYuAXkcGXtdw5gWMDAEejPaWHZhfuUfOroEoVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e/aAXRgY; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e/aAXRgY"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so7708288a91.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 14:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779486440; x=1780091240; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W3aVsVjXQJZTTHakYlHvO90VBaY9HPHtidD9aUCTMEA=;
        b=e/aAXRgYPaKlPsD64HYfouTr0vGdw1aCFb/CLvE9sYdInVlULC37D0inMrTJ6LxdbH
         T5MvwEbTcaseCiTNSOjLyVzYEu+NXp1v7RSjL1YDIRQuVeaGV3irMYWXOiia3LxJNkOh
         7M1AKlxKsSuxMmyCaoiMslVA866NSj5+r5AP6zVJidDcnyYrx4pjcem8AF71mv46lbun
         9Uit0ahfiechNWu9/pLk24QygtTq87YuTrs0K5pB32X5+Byx9AzeabVvMWApMAdXOSkp
         1uMCUM4gBvBNqzAB4H1xUL6f3/9SARB19ic0+kAQqaf01ezRy2QTai8DNsnlKg7AZ2Yr
         4mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779486440; x=1780091240;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3aVsVjXQJZTTHakYlHvO90VBaY9HPHtidD9aUCTMEA=;
        b=EKThwZ9nqjxfAgqPJaE2aeQRvUlwu3H9uwQen2+Mu/iCkE5jxdrOtrHlIdZMoecsES
         glSqo6KY8QFN8xpSr4KZRlJL7pMmVRAVEKfrgQqY0WtuD3m+Pbb1PkFAx0ZJ7pOR2YVv
         CYy2Q+MvXhFn6Z2y4Rk/KyrQugis02KzdKAAbxl/VrtD/EGX1ELsNo3cWS3rBWCaLFla
         d8geqYQlTRu1Nx+nrZPhRb3+5w0PLDCSp5oYQokYrIAU/t3/2pr7zXuj34ZrMBGv3vm3
         z78SDrxPyYZB+yUz0i0mqWVm/k5+7eL811pw+OOBUhYb8VEbIFbYW+J6AB+2ZRybpC4o
         uj0w==
X-Forwarded-Encrypted: i=1; AFNElJ8I/ct4n0pHzWHYhZAXRpW+4XHjiSzZZCkCk4cizoZx5NXhtmANdo47uyQscQwnHXmz4zQB6hlSCiU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbi6fU0PsGgmVw7RXcsTwAJiiwYKMx5nEAhFc7s0bc9t6UVCYl
	y3a7pFcxLkh3J7c1e68XrGtsyP0SOtUt+heWIsp4yEN7Cpw2q2ehpHmQmgrtpPb64BtXOXwbsen
	+bPTg1Q==
X-Received: from pgkb12.prod.google.com ([2002:a63:eb4c:0:b0:c82:743c:ea8f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3887:b0:369:a359:b181
 with SMTP id 98e67ed59e1d1-36a6787b0dcmr5234805a91.23.1779486440140; Fri, 22
 May 2026 14:47:20 -0700 (PDT)
Date: Fri, 22 May 2026 14:47:19 -0700
In-Reply-To: <99356a588677e9ff31c1747db1705d9250a2728d.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260509224824.3264567-1-dwmw2@infradead.org> <20260509224824.3264567-28-dwmw2@infradead.org>
 <3ad6cd109480772ade3c11f23b9c1d7a9855d67e.camel@infradead.org>
 <ag-Hf2liLSX9q0rS@google.com> <ab84153e33fbe7c25667f595c56b310d4d5a93ef.camel@infradead.org>
 <ahBQ7mXNaTtouT3C@google.com> <c4b498c401287477402ddd60a0120b0c5a9bf8d3.camel@infradead.org>
 <ahCQluJj59uWlDAF@google.com> <99356a588677e9ff31c1747db1705d9250a2728d.camel@infradead.org>
Message-ID: <ahDO58dKuPt-lj_J@google.com>
Subject: Re: [PATCH v4 27/30] KVM: x86: Add KVM_VCPU_TSC_EFFECTIVE_FREQ attribute
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 22, 2026, David Woodhouse wrote:
> On Fri, 2026-05-22 at 10:21 -0700, Sean Christopherson wrote:
> > 
> > I'll send a standalone patch, along with a selftest tweak to verify the fix.
> > It's technically a fix and won't generate any conflicts, no reason to delay it.
> 
> Are you suggesting the other 30 should be delayed? :P

LOL, just acknowledging that it'll take me a minute to page all of that code in.
