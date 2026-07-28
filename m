Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A176F231842
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 01:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201328; cv=none; b=BlRqqlu1bvcyeY1l29z5GMeADvx/B1/l+ZEJ5QfavzR6UCEiVmc2vj/i0daYKffbmjCkzHk3pZEcC+NSBpv/ovmxYuRlLXE1EZqzqXOoK2DAeLLmCf/UzXxO2fspBPHajvvn3zGhL/sN2SSRcNOSwGSK+wNR2UGbRtiSlgHPUZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201328; c=relaxed/simple;
	bh=y/XcUrQ9JDmytrIFC28W6hlKYpOa2xKcjTs85GAJWDY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fLyoO/GgVvFrvG6DXMIxoVgNq58FUJ1iqHA5YNuEDxznsyLhEjI5iGvp1Wnmil3VDgxIjzE8ZaoRYq8wZCAtBnB2Bx8PQaBYFbcxvwVIxzoeNKSgjcAe/uoWASRNDRE6svUkrS6r852crK3q2o2LnfxIRx4OMv+2oqc6rnS/hiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nkr26+jY; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nkr26+jY"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cd01a14e81so46593545ad.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 18:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785201327; x=1785806127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c0xvxXA1DaICzQTJ/i8SO6Ba9ZbY1wPwU/bxHtjqVsI=;
        b=nkr26+jY9SF2mcbJwzW8twOpyeORwlisIuc4yZFEk+V+a9jyM7ceEwy9pxrhMRPny2
         aUup54qj3bynFaX2baeVVO8o60kNkeLFKJLXzuSGXEzCfskuBtl3schibaV5bsFxoP05
         hUwZiUrDD9PmNaC4gYXGvX6stfDOKs6PN4nFqVxvMO+UWcoLHDszNmHwnP6rCALwtGa2
         KRDa3pr3mv1xorNTcWxWLTmhOLm23NX+9CZE8dXOztNAYTKUmqqFweaS3MIsdi/aNQHV
         EsRZg+9PGtbd/VAhIulTEMBfeAEw333aN7yHCMPsu+VE47p+2xFJPKPn7m+Vdlp8a1Jw
         0grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785201327; x=1785806127;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0xvxXA1DaICzQTJ/i8SO6Ba9ZbY1wPwU/bxHtjqVsI=;
        b=N+fHj1Q83t5KfiBuGeIJsmXgLHJU0x+7gKRR7N4wkezI8D/xl9gNzZ1vvUGvL5s7Lz
         EhsMp7AgwPGNa8Xi/GLLtE59Zw39iA6Z2upjr1p4XPPNV7rrjweW/esqdd0HXpoCMP6N
         7Wnfm7x2cMjGV533bX8VFRDwYfZ4QFhCZtZmvgyfTres5Njj0y0Hk1MzPDhAk2wiEEtA
         iD0cbHxH+5pU7WlreGSNqsLfl8+plN8WFr3huInnwJL7CIacUce2I//okR9OC2oINOa7
         ajsgt+ynFEZN9H2SuIEFks7jD/kf/QFddplmO+44Qi0C1Z8zmQfnzJfqhC8k+2AYHWhJ
         SZkg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2FRiOgdaTa2pegnE7O7vR9rYwhLt0QHqqKCGEETh9mttK1R/6VDbD6gBBxkAjmNvalbd2Gt6rZHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOMLw1KK9UF0ZXoEiAop/sXxEiOiCyki2HbVe/HVgZguLd42qI
	ShHBMrXZVoPCgursPRxhwVX5TAEp7ShCVJSKwbolXe9csT6tOkPv6dpO9KOPnLqMWboz+CM9RJy
	mgtDnYA==
X-Received: from plas11.prod.google.com ([2002:a17:903:200b:b0:2ca:eea9:9845])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef11:b0:2cc:670d:9b2f
 with SMTP id d9443c01a7336-2d015d57715mr2698085ad.33.1785201326747; Mon, 27
 Jul 2026 18:15:26 -0700 (PDT)
Date: Mon, 27 Jul 2026 18:15:26 -0700
In-Reply-To: <e8e7554debef481d13265f0870e847e2fa37f7c2.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-6-dwmw2@infradead.org>
 <amPWX8lKXw2KS_kZ@google.com> <e8e7554debef481d13265f0870e847e2fa37f7c2.camel@infradead.org>
Message-ID: <amgCrqyqg0zFbhO4@google.com>
Subject: Re: [PATCH v6 05/36] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026, David Woodhouse wrote:
> On Fri, 2026-07-24 at 14:17 -0700, Sean Christopherson wrote:
> > Please post this as a standalone mini-series.=C2=A0 AFAICT, the only de=
pendency of
> > any kind is a minor conflict with the s/hw_tsc_khz/hw_tsc_hz change, an=
d that's
> > trivial to sort out later on.
>=20
> Hm? The calculations in kvm_vcpu_ioctl_set_clock_guest() are all Hz-
> based, not kHz. This *was* the start of the series (Jack posted it on
> its own in 2024), and I thought I'd moved the khz/hz thing to live
> before it on purpose?
>=20
> The kvm_xen_shared_info_init() one could be later, I guess. But is also
> trivial (and its commit message sets the stage for a bunch of the
> cleanups by analysing the various *different* ways that kvmclock gets
> derived).=20
>=20
> I confess I'm not stunningly keen on breaking the series up.

Can the KVM_[GS]ET_CLOCK_GUEST changes be moved to the end of the series?  =
The
total size of the series doesn't scare me, I just don't want to end up with=
 all
the fixes and cleanups stuck behind a patch that isn't a hard dependency.  =
E.g.
AFAICT, none of the following changes, include selftests updates, actualy r=
ely
on KVM_[GS]ET_CLOCK_GUEST existing.

> How about we just do it in stages? Merge patch 1 as it's fairly trivial,=
=20

Ya, I pushed that to kvm-x86 last week, though I rebased it today because o=
f an
unrelated goof.  It's currently commit 710b3a30f407 ("KVM: x86/xen: Do not =
corrupt
KVM clock in kvm_xen_shared_info_init()").  If nothing blows up in the next=
 or two,
that should be the stable hash going forward.

> and then I can use its commit ID when I refer to its taxonomy later. Then=
 we
> can do patches 2-6 which are the KVM_[GS]ET_CLOCK_GUEST support. And I ca=
n
> repost the remainder on top of that?
>=20
> > > +4.145 KVM_GET_CLOCK_GUEST
> > > +----------------------------
> > > +
> > > +:Capability: none
> >=20
> > Why not add a CAP?=C2=A0 The check in the subsequent selftest is quite =
gross.
>=20
> Because nobody would ever use it in practice anyway. Even if the ioctl
> is present, you *still* have to try it and fall back to the old method
> because there are ways that a *guest* can force master clock mode off.

Hmm, I can see setups where a single entity controls both the host and the =
guest
wanting to assert that KVM_SET_CLOCK_GUEST succeeds, though I suppose it's
unlikely such setups would use KVM_SET_CLOCK_GUEST in the first place.
