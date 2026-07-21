Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D293749E9
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 16:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784652470; cv=none; b=buUDlDPvW7YUbYrevml+0ItsHkweWdW+EMZ6APukJX4a4F2Ffy14k0mItxCYVQgla7MfNGST+20vdz3HehnRQwPnxHM7BrYDgeiI4GxfOmMfgn+5fLL21aX7RrwPPQ0P/V6/qCpdPSAivZeoS5GdLX2x3I9MpHkPdo5TGwk89Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784652470; c=relaxed/simple;
	bh=pYw4qJYEuIKXAeuRPdQmYxpzWhSWZPRkfjwhKHTgS20=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XcaGnqst7lYbNe+Ib21vT5rXruXefBVo0xyt8LzXFVY1JrC8ufobAHhcGuT3BqjwVAbwBu6klzP1n5Tt10wXr1SdBKoiw6JfSNTFXnuu3U2sYpGiH5RYbarI3elQSRWzRz1a6pvkYOFOUdAq2ZJOHEddVvT9rq55fh/t6OESvOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rKfLAUmr; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rKfLAUmr"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso2675775a12.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 09:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784652467; x=1785257267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=unwEFoUznbE0xbP8WwUDTc6RnsTSmOdGWxnp8ooVbH0=;
        b=rKfLAUmrpt3S1xlpCY086YrNJi3HkIFTu316nvuv8aoAoGzAu1VvUmInZgira7Epue
         BngnIazBsuS7Zn4o1iFY18OI0Abe/pPaLXaVaIi2iEA41L4LC0TsgUX8Mxli9599b/7W
         OU1K++OVapigTWloFTxFVevPhP9vzKc7JPlvd/Rof1f/p0gAEYoDvULFKIcUSmKW4LcK
         501VSEqttE+KziaJviqP15lGO2eIhpKdlsmn/m3jpSI3jILw2lpGoms/k3A9aXkSJCvo
         425SHs2+8QezINQHqWpbKl6DcAYkuxs0GgmO6wG/BFOPUdGMXJXbqfFUA2inhkieeG5v
         Xdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784652467; x=1785257267;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unwEFoUznbE0xbP8WwUDTc6RnsTSmOdGWxnp8ooVbH0=;
        b=RjzoBRzN4SddldKFSjUMP9cTCkCRApZrryp2f66BKfvYW8R5fkg9RnOhe5pCe+Rs1O
         J8BRILDa2OfP60pKznL6iR+ZUEQXm9qI1sIrA7UDIiZEJ0YbnJaFCslZmJiqAJZdHVPN
         mbrHvKptYHzIkx8bv0GrEMGe+wBxSNWZWIAnCCSp81fvyEYnNCZCLXPiS26B+cBYppcm
         HtRyFhxlwL4Rf22hV9sc5BbzNP/r0BXKnAsjso5h5Y9JwvEonrrVDuExGPHV1f1Qfx4z
         OZku9sL/NkJI/2bVFJDvpHTKAwBr9R68ng6Jgo2ydkBKkhqaIN25oBwYdZmiRtq2fK1U
         O0aw==
X-Forwarded-Encrypted: i=1; AHgh+RorPvhvs1DRkQ5l9zOomdSF34NWRxAi+AhSPfUWfhn4upWJrd0q/2sKXi31yeBWAEBRnjs3Z35TYHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWJwy1vmUoFpveHt8y4MswfJpcsNuOgxssU007Z5i6A5bODriV
	0hPpxQ0Zp9cuBlXu46/n1XldB6mH5+Fo714FpJcS6kU60Fi+ncmgfhPFCxx6NLWEoMqFgC/BDAi
	rY3IxYg==
X-Received: from pfbgu27.prod.google.com ([2002:a05:6a00:4e5b:b0:84b:1607:a892])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:12ce:b0:848:824d:aff4
 with SMTP id d2e1a72fcca58-84c2954bdafmr17836552b3a.56.1784652466889; Tue, 21
 Jul 2026 09:47:46 -0700 (PDT)
Date: Tue, 21 Jul 2026 09:47:46 -0700
In-Reply-To: <f5552576fc749b4b453514f52921332cc104c6a6.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260720192221.72912-1-absandze@amazon.de> <f5552576fc749b4b453514f52921332cc104c6a6.camel@infradead.org>
Message-ID: <al-isty0nYjQEwqH@google.com>
Subject: Re: [RFC PATCH 0/2] KVM: x86/pmu: Let userspace disable SW accounting
 of emulated instructions
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Luka Absandze <absandze@amazon.de>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026, David Woodhouse wrote:
> On Mon, 2026-07-20 at 19:22 +0000, Luka Absandze wrote:
> > On hosts that run guests with an *emulated* vPMU -- guest PMU MSR
> > accesses trap into KVM and each guest counter is backed by a host
> > perf_event -- the per-emulated-instruction PMU accounting added by comm=
it
> > 9cd803d496e7 ("KVM: x86: Update vPMCs when retiring instructions") is
> > pathologically expensive.
>=20
> Given that the guest PMU MSR accesses are trapped... is there a reason
> we can't fold a *separate* count of emulated instructions into the
> value we return to the guest?
>=20
> I guess the overflow would come late... but isn't that tolerable?=20

Like ignoring emulated instructions entirely, it probably depends on the gu=
est.

> And we could probably impose a limit on how large the addend could be =E2=
=80=94 even
> if we only reprogram the PMU once every 100 times, that's still a win?

Hmm, yeah, that'd be better than ignoring emulated instruction entirely, an=
d
would give userspace far better control over how shoddy KVM's emulation is.=
  Off
the cuff, the change would be fairly trivial too?  E.g.

diff --git arch/x86/kvm/pmu.c arch/x86/kvm/pmu.c
index 7f777049d328..c5f436c6f83f 100644
--- arch/x86/kvm/pmu.c
+++ arch/x86/kvm/pmu.c
@@ -1084,7 +1084,8 @@ static void kvm_pmu_incr_counter(struct kvm_pmc *pmc)
         */
        if (!kvm_vcpu_has_mediated_pmu(vcpu)) {
                pmc->emulated_counter++;
-               kvm_pmu_request_counter_reprogram(pmc);
+               if (pmc->emulated_counter > pmu_something_something_toleran=
ce)
+                       kvm_pmu_request_counter_reprogram(pmc);
                return;
        }
=20

