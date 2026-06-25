Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7390C2DECC2
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412537; cv=none; b=rATCW1lJhoIpNzuGIOZwW0nE9SYB7FiyAIQlnuI4Ry1OTltMmRhAb3wiSsLJGLh5MvWaSIbDaUS1Mi8G7i+NnNXKZIspV0OrNljW+NYQfQbIFCeP8iXUKs0w/oyKj6J8XD3B1jWDF04o6eM9DksTOFWPNSDQPjYMvwH52A7jjcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412537; c=relaxed/simple;
	bh=L9vCpaeeEmhW+X3fHblf6tQERv8UAVK3udM+8P3RNr0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MLhRU16dXREBPiAGleemBI4DrYvwUMfKUUjnHYIrM1YuIkurZcDCwLejA1CVWv7QPlDqjshtYP/+JyhfaAMY7EnBzbDKRbCBfO+O729MiGJ3/oVpW4OlJp5sQkO33MUQS8YReTXx4WNBuLsn9EzL4hFKSGOeIeprTPFPPhUrZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qcatYeyB; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qcatYeyB"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c894391f000so178627a12.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782412536; x=1783017336; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXrEPlz9Ov6WhImX2KAHJf2Hbzd09EWe17YltKaKh6c=;
        b=qcatYeyBvaAf2V63iqR7grZEaB1XVKQkBeiXQKabmdPi51WudavK/SR8iTvNwGNqEz
         BalS1LnUB73eML2mz/iIWejpmxfA/59vmn4Pz7i1aMXeKdVFuxKAfKqQFjMHaTQMt0/y
         q/i/gPcoIhdJbudLKip/WumJiJac9llUhSdp/MCbORMVIuZYXotDSNxjNrkM3OZCSHmn
         phA6duulBtgUnro7/7raUQJN8kBwLxfVsofSrJN55AyUoo+saU22scc/Nazzket2Fu+5
         yL7X5Hpa7piVAViuyytzHwOAIp35osMn2XRE9gH9Nz4uc51BDK8EgZW3JcuBcES37Fnd
         AnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412536; x=1783017336;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXrEPlz9Ov6WhImX2KAHJf2Hbzd09EWe17YltKaKh6c=;
        b=AIi6H5/eo021xZNcM+n/bxYQBvXhBvNtiyERnT/d3EIEjp8DlRRL2Muxys6rGU2jot
         +Tjh7PnSsl7aU3bCgRqQzi+di67VE3CugssMfKKKWBfvasKRWFfTpUPDDY23g/wuGfRN
         /N4/l5gL3DuHUz9bKRFenjbdMiDlfmUuSmChXQxRPJxLQzLPtJ3CuwuJJ+zV6gFAiBVT
         Wq1oiv9Q+Z9nSCk/qcgUM7VEcLJfwv7hwrSySEeqHZGVPq1IWl3kUsOv2LwIFNSrR0Y1
         UyPZw9r3aAhYcWBsvljHofZJp9aT2uH8QLMoX8ZcJbo5/vrvO6M07OPmr5lmjWvfkHfR
         ZLog==
X-Forwarded-Encrypted: i=1; AFNElJ/fZBus3cdYEvXJVR9s7z928U1HnJs1Q5Spw27O1rUTPgJ0Vzd6JMIIoEmqiBwjtedbhxYabOnLZWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk+nbp0RTjX5i7ZBvkxv1gGfxgecqjXUCKKPvafvKYNZ8yFgBh
	3fHGTYXO/7jx4b8p74fHHNMMB4i88F8YRI+us0eKP37KAEAd3yfttCk153f4IG010T40GhAvkvA
	bwVwjew==
X-Received: from pgbz5.prod.google.com ([2002:a63:6505:0:b0:c8b:dff5:ac27])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a11b:b0:398:7256:3c0
 with SMTP id adf61e73a8af0-3bd4ac9e542mr4363119637.13.1782412535530; Thu, 25
 Jun 2026 11:35:35 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:35:34 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-7-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-7-4fe8b602ff47@google.com>
Message-ID: <aj109naG1wr46Cpf@google.com>
Subject: Re: [PATCH RFC 07/12] Documentation: KVM: Drop mention of kvm->lock
 in SRCU documentation
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, vannapurve@google.com, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, May 27, 2026, Ackerley Tng wrote:
> The original comment says that synchronize_srcu(&kvm->srcu) is called
> inside critical sections for kvm->lock, vcpu->mutex and
> kvm->slots_lock. Drop mention of kvm->lock since this is no longer true.

I would *much* rather "fix" this by saying synchronize_srcu() *may* be called
inside blah blah blah.  Because (a) I don't feel like auditing all of KVM to see
if the above is true, (b) KVM's implementation may change again in the future,
and (c) taking kvm->lock inside a kvm->srcu read-side critical section is still
unsafe as we'd end up with ABBA deadlock (well, ABCCA?).

  1. SRCU held, waiting on kvm->lock
  2. kvm->lock held, waiting on vcpu->mutex
  3. vcpu->mutex held, waiting on synchronize_srcu()
