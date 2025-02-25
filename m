Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B5D155C8C
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740498077; cv=none; b=J4wQuv4VMaKBS80IVOFKxsA6W9s8GuMaTipISFI+dwX3m8dlHYpZ1svlP2JDhH2Zqhb7vfeYoAXhOL8eTR0iOXejPu6i6vwqr7Q5WGVqhuDqxCjLvaTkU4CiPba14kPEqP0mvUmhkkiKy4/tu2D4KKS3L6Nf3UTeUsstpJK0w/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740498077; c=relaxed/simple;
	bh=h0k6Bw8oebc5YQIbZ75hirrCib3mxXfTLg5zcaiUPQU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ezeq8L2k8CcahKqsVzDXTSS/eL9lrrQXMwXM9OkbkL/iXvY6CxTJtI2vcykKHcJRFXRD4ZV51a+9YWrKjQiZxuxe2Mbznk/q+modkYiq3HNadCwQPe8aw4V3mMnzPZxs/UpUV33MEcDfBKUrpdU9ktnTHZOMTaoMzA2pGeAvFJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lvpEHwrX; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lvpEHwrX"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fbff6426f5so11987990a91.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 07:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740498075; x=1741102875; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gith30kTBfPn10AwyFeCKv7JIoJKUJTfhcaJAgn5H8=;
        b=lvpEHwrXZMafR5bjJMMb/R0J7wbSws4Ye2WMk1fS+rUsdeN7iGm8r7jJsWa+4G+xoU
         Sz5T5bjLekDkQtOPdVnzZSHB96XbjTGvPeuQOv0BkT9rg3A2RejXPFEHNzp5zKaGhZEE
         ai+QMEI0cNmJwsv7CcO7O9wMkLRTBt9TCVAFqt9DibPPwcadBut8WasGHIZAejgbEiv1
         eQ2z10bP+q9CDsnLIoPnS2VwmEwIQ5HxaW+s2TD/YvXzk+94xLq70MyfJmeL4R6/l/Vf
         qRd64KdU5RGPoXUkqEXVzeF5bvhWqWHqTZFyF4IH0ohtDAvkmXo9oLsLxssjMFTlIPz8
         ABDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740498075; x=1741102875;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gith30kTBfPn10AwyFeCKv7JIoJKUJTfhcaJAgn5H8=;
        b=t6GJBTbcqgLPtstiAFiItdT7Xw+a1yiEi+Xntrx7cHPBLClSgb+P7eqWQAzhQpWP/o
         m0OSReFW/hge6ZC4xB+bBwB3k+admfZb66ErwdIoL/fXPFigT9S5pb0Z57DSjElpneod
         CiJ0MU/Yhavncy9yac+nXQQcO+47uhPBRvSfOJKg+ptgBkjITSjcVm9gGo6NcfUwXCXp
         ETBtoyIheK6t0cH9cQEELSvetZzU3vxi4YFMj6rLksbVJE3ltS/rVxW+ps8gC5S/Qlcm
         p0hN4CdNv/wGLMMHBaa9LnWhuT3+ao7B3HBz13MihRo5h5NJYSLzEzLRLtpDIlbDgSED
         Tf7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHx0SMYcFi5FxOmxgfAPpNg8ef7J2moKBe+vRy7Nn2GwwNs6Jd0fhC/SPyito4oM78X6NXNyASurY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGpj5UXSZiNl0Ox0BNJGIAvfgsQoHh6GEgh6ahLnEGp+WsnKCx
	qukE9/kVdjYBLKP3Xnw1GhDjmiaRbPwHb5jNlStzZU9sJGBpA2l6wGmuZjXxicLU23TS87HelWR
	rhw==
X-Google-Smtp-Source: AGHT+IGZkp+roO0TVp3rz40ka6O9p/N9EvFel5/ggMinuedWjO6jtk5+r13X1rdCPxFnx16CfV0N9Na/IiI=
X-Received: from pjbpv16.prod.google.com ([2002:a17:90b:3c90:b0:2fc:11a0:c53f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e4f:b0:2f1:3355:4a8f
 with SMTP id 98e67ed59e1d1-2fe68ac94a8mr5754618a91.4.1740498074970; Tue, 25
 Feb 2025 07:41:14 -0800 (PST)
Date: Tue, 25 Feb 2025 07:41:13 -0800
In-Reply-To: <20241001050110.3643764-21-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241001050110.3643764-1-xin@zytor.com> <20241001050110.3643764-21-xin@zytor.com>
Message-ID: <Z73kmRwZFJJAVkiZ@google.com>
Subject: Re: [PATCH v3 20/27] KVM: x86: Allow WRMSRNS to be advertised to guests
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 30, 2024, Xin Li (Intel) wrote:
> From: Xin Li <xin3.li@intel.com>
> 
> Allow WRMSRNS to be advertised to guests.

The shortlog and this sentence are incorrect.  Assuming there are no controls for
WRMSRNS, then KVM isn't allowing anything.  Userspace can advertise WRMSRNS support
whenever it wants, and the guest can cleanly execute WRMSRNS regardless of whether
or not it's advertised in CPUID.  KVM is simply advertising support to userspace.

> WRMSRNS behaves exactly like WRMSR with the only difference being

Nope, not the only difference.

  WRMSR and WRMSRNS use the same basic exit reason (see Appendix C). For WRMSR,
  the exit qualification is 0, while for WRMSRNS it is 1.

And the whole reaosn I went spelunking was to verify that WRMSRNS honors all MSR
exiting controls and generates the same exits.  That information needs to be
explicitly stated.

I'll rewrite the shortlog and changelog when applying.
