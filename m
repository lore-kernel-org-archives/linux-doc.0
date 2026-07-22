Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2821DEFE8
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 16:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739234; cv=none; b=mcjbcTog6lgddTVQXvcwMmBHqsULW1LGK+n/cXKXUxMeEQuOgMbI7/hejJj3AUjrtgbXCRdHKdLb8ZB5yhVncrShEMUmXibSHvYrbSvZGdtLG/3/HcTWuu8Llh1F32Agm2V9MpAgFTQBmSJOnJJLUPF40WXi87YfpuouXFdWWTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739234; c=relaxed/simple;
	bh=1ZqVBNhg5WQfTjkuBkPMOP1GU8RElSDI3UK5WrhkV+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NWhlnGIjzG+3dZK+oWS60hpLmzlDAzFagaYX3Ikzn99qvjTdIE4lkLfxJ1e5u8STk7d2kgsg4gbN+jSGNrjlNUix1JsZjLIkyvzxWVyPeYCnxXEFn+ELnoHniDLX/z4P6o+03cnLX9Rn4eriR9acrelmrJSwtE/3uIKEKP8IemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qtAxGKPu; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qtAxGKPu"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a3514f912so17946278b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 09:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784739232; x=1785344032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VQLu5QnUcXf+4BhkcE4GqLXFJ62tKt5T9PIxsjrPEWY=;
        b=qtAxGKPuYLmN8BFpZ7es3J6ClLGSJQsn1+VL6brAdejxissghfa83UXZkQAt4qUSpj
         eWdBC+jvveVIfd1uFMo3g4adPDj/REObkB9xozZDX6X3pXR0LzN4ZeotHzofSmBwDDsT
         ncU5/dOTNOz+PxWlT3UnO33RlND/R1NraoCvgWBMTTevUahKsV+welEm1EJOJVMbJBkl
         fmvubUJ4j6rpBlNQIcZ8lR18C9pMd0roNUgPBtZ+W3mgCqcdnnoBFlB/L0RjgRhydQ7J
         krOiUZpuixpq49adr+B9Yh0fqYFSIsKzL7pRGstPjb1lGnFvsK9KXI4tzTZlH/aNGMVn
         9Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784739232; x=1785344032;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQLu5QnUcXf+4BhkcE4GqLXFJ62tKt5T9PIxsjrPEWY=;
        b=cTHD/Iyqqq3Z/qnB0qjZ73Ojv5pwGXwHneLD1HxUOaREZYRrqENj6iFo46XFBd3BdO
         d8I7e/OUqYhDz+D3ZJjiHU/s2V5WDGmJ3lzFFI/hQuVh4fAvlx+PrWBsmOwhp0yEDcAx
         xhSv00GD0OBAjClB7LN/9SrHnOdzObtbRXpQ8o8q06evkBCfHfe1S94WuYJmxO20iM0r
         zkWoDd1+b5vnuAlK9aHmRgmM9UORYDwKRzItjQp1FOEyfmNtpZzVC1SppZE2mpzTYtK2
         a5oe4TTxT7sV24HuUrTuMckg6ftfrEWUDSQ4ySHiEF++DaLsuBMiPzwgagMsgVWV0G8V
         g6Jg==
X-Forwarded-Encrypted: i=1; AHgh+RoQaq1OlQnZxYOrsVihjpywDRlzuw0FaIbqI23m4KQO9DYPsf7SxRomm+2sjmJROdMETOO9CX/aPXo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9JVI4prFa7mc9hwRDoV7W5/WDZK68oPquVHOXTRGvG+sPzJNh
	LlZuVIEI/hQatPHTLTDZsScbCXQEWJUi9E9DtWe3eXlJjvNgplUd+qT1l72M6vvaVSSTVC1QVeg
	Jg0/C3g==
X-Received: from pfll21.prod.google.com ([2002:a05:6a00:1595:b0:84e:4f2:22c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cce:b0:848:4d4f:d477
 with SMTP id d2e1a72fcca58-84c29310889mr23855075b3a.18.1784739232066; Wed, 22
 Jul 2026 09:53:52 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:53:51 -0700
In-Reply-To: <4a4a2c45452d5b08e90c1357592fb286592e0984.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260720192221.72912-1-absandze@amazon.de> <20260720192221.72912-2-absandze@amazon.de>
 <al6g4VA4l-ZIAr9Q@google.com> <d538bd8eba1058d52f8d32e311c12bf216ff4118.camel@infradead.org>
 <al-j7FTIRAECuhRt@google.com> <4a4a2c45452d5b08e90c1357592fb286592e0984.camel@infradead.org>
Message-ID: <amD1n1JRlaD0sJwW@google.com>
Subject: Re: [RFC PATCH 1/2] KVM: x86/pmu: Add CAP to disable SW accounting of
 emulated instructions
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Luka Absandze <absandze@amazon.de>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026, David Woodhouse wrote:
> On Tue, 2026-07-21 at 09:53 -0700, Sean Christopherson wrote:
> > =C2=A0
> > > Which is the bug? Some would argue that timer interrupts running 50
> > > times slower is also a bug. We just get to choose *which* bug we want
> > > the guest to experience :)
> > >=20
> > > And I think that is a per-guest choice,
> >=20
> > Conceptually, I 100% agree.=C2=A0 But in practice, making a per-guest c=
hoice requires
> > a priori knowledge of what the guest is doing and/or what the guest nee=
ds/wants.
> >=20
> > And so I'm asking, do your use cases have that knowledge *and* will you=
 run VMs
> > with different requirements on a single host?=C2=A0 Because if you'll e=
nd up
> > configuring all VMs on a given host the same way, then I'd strongly pre=
fer a
> > module param to give us more flexibility for the future, e.g. if months=
/years
> > from now we figure out a way to provide acceptable correctness and effi=
ciency
> > that would allows us to drop the param entirely.
>=20
> Normally, the way we'd roll any guest-visible behavioural change out is
> to preserve the existing behaviour for existing running guests. So when
> we kexec to the new kernel underneath them (or when they resume from
> hibernation), they get the old behaviour, and only *new* launches get
> the new behaviour. Very much a per-guest thing, not a module option.

Conceptually, I am 100% aligned.  My only hesitation/concern is the impact =
on
the upstream uAPI.  For cases where a new feature (or whatever) is explicit=
ly
enumerated to the guest, I have zero concerns, because any uAPI related to =
feature
enumeration will need to exist in perpetuity.

But for wonky things like this, where a KVM change is guest visible, but on=
ly as
a side effect and not actually enumerated in any way, and for which the goa=
l is
really only to provide roll-out control, I don't like the idea of adding uA=
PI
*in upstream*.  Because long-term, after many months/years, the change woul=
d
become rollback-safe, and thus the need for per-VM control would become obs=
olete.

In addition to having to carry uAPI (and associated functionality) in perpe=
tuity,
I'm also concerned about having to reach agreement on what exactly is consi=
dered
a guest-visible change.  For feature enumeration, outside of trolls, I don'=
t think
anyone seriously thinks it's ok for a kernel upgrade (or rollback) to chang=
e what
set of features are enumerated to the guest.

But for side-effects / "microarchitectural" behavioral changes, what's cons=
idered
a guest-visible change will vary by use case / provider.  Or rather, what's
considered a big enough change to warrant a per-VM control will vary.  E.g.=
 whether
or not to provide a per-VM control often comes down to balancing overall co=
mplexity
versus risk, and that equation will inevitably be different as the total co=
mplexity
and risk tolerance will vary by use case.

So I'm very sympathetic to the need to provide per-VM controls for things l=
ike
this, but with my upstream hat on, no small part of me thinks that's a prob=
lem
that's best handled out-of-tree, by the companies that are running bespoke =
kernels
anyways and are can feasibly drop such uAPI when it's no longer need.

> Even for things like this where we want it to reach *all* guests in the
> end, that gives a relatively controllable rollout of the change =E2=80=94=
 so
> *if* we get complaints we can fairly quickly flip the switch so that
> new launches *stop* getting the changed behaviour. Then we can think
> about per-customer/per-guest opt-in/opt-out (if we really have to).
>=20
> Very rarely does a module option make sense for us. Systems are largely
> immutable at this scale because all else is madness. If a change like
> that *is* going to be system-wide and fleet-wide, we'd be more likely
> to make a one line code change to set the behaviour we want, and kexec
> them all into that version.
>=20
> But changing visible behaviour underneath millions of running guests
> is... not good. I drink enough as it is, thank you very much...
>=20
> In *this* case though, I do think we can find a middle ground that
> works well enough by batching the actual updates up to a threshold.
> It's not like the overflow NMI is cycle-accurate anyway; by the time
> the guest has *handled* it and read the counter, it's *always* going to
> be somewhat past the point at which it actually triggered, surely?


