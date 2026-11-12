Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501749;
	b=CEVqD4rsOLAXRsvcx+PVRv5IdVHj6wWUrKwlyviQtgciqcA7Jp1cKqxhIkpli811f66Y
	 o96L2DTyNRAsWGjbIBdFjuR2ztS+qwnfUGVYiXhZRs3ueHb3sob5Uc5PRbEku8iytdDn8
	 NvAOBXks470q0yG0wPK8YWBhFe9AysPJDE8LPWd3RVwwDaRZqOPK+TSsiei5SSNVsLd7I
	 L601jtJezpibGIIbg3KU0jJIvRQzeiVqsrxFvEAv9q9qPCb3PgrN5KriszNSCpWN/bZnX
	 e77HRIt32sLRFqfhuiZgIxXqhDu6Z0FiC+qePE40pQdR4DTqxB3RFaAxKUfuG6yQPcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
	b=wLT8C7XkDuf/pmx9kuk13WCc4ogUHneirll48db8BfuN+6JaxYN5T4PdzH9l7pWsn1Mp
	 vSFZTmbOPlXRo7aBBh8/Ug8EgENl8OINZno58j2TLFKq34wzzMXiRlglU0p94YKkzfPrE
	 HQYoqs9Bkwi9wUmpjoBFGSNJEHsMvCNmmMHO7DHacem5WVkzdt9YAVfaqufmmJzKOl+xi
	 UoXukfdgzZBDxT8LetJw5hbVaGacXSOf9RZj2+ug2XB+JRZJbLXXA0LPEt/dfQgSlUUvz
	 pMxUlHC/Knpx9IrHduPQoLPUSSj4KS4CGtVRaxGlPvEco5qj/I66dvlyHvOSx70NNJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etvsK4IG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56CE606A321
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C56CE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etvsK4IG
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso32927205e9.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 08:42:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794501747; cv=none;
        d=google.com; s=arc-20260327;
        b=Bowmsm6mGS0ymyKfyFlM+twivrIvRyjRiqyAU5QipvsZb8mlnP+xCIckrwuzM0CaaV
         toC3ZVk/j10XVcG5F+R6goyIdjZJ6QX9IhBHfbKo8n4ovjlQSw40jOvvH/5AxgvaWgUE
         Q/FXQ/gjI4OACqt66IcCqOyg0K/B4Se2tkHIYjH5MMZ94bRUv9pszncYe/23nZpTU+Gb
         WqZ1fV8pVxGl44ekCXClYrfIroZi4+jA36bnisj61/e8mfvI/KGTXv/y7uKrGzJoaqsw
         a9ICzy0n+LTtmvnDDWb5T/S6Gy5VYJV6ZthgWx3XYeX5SKqQLcjX8EsHq/FYacRjileU
         KUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
        fh=CPcb6gp3ByFvW1r7CDrQxedDSPaYSL5LDUwGu99k37Y=;
        b=boQuqm9OPiuYql+hhHJ/8qZ5+TPjv/92bOkohSpxHjeW51zgPRZrYko/vURm6KTA8T
         EEg0WP/SjjoUqf2GKWnAehdYVD5F1eoyJv4w97HRWil3q4ujlR6QICdeC4sXWs+3eV3r
         dUYZIvbAJvLvvkDLl8Vx8VVIwEmXtxUisZNjF2i9dv8Zn9kH8RrrYka3yHEo/YFwp445
         DtjMOQhF+WNnJK0ZPC8MxhbC5k/2U2jPNdo9z68PoyqLGjGD03mspV8r87MtsbzkF8YS
         8RNGjIuzV/j1kGYv2gqb6Ypa7ofM0Mv8ZLu4o5OdkI6KiTA2tjO7otBRBf0Zqi6Yhjug
         54eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501747; x=1795106547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
        b=etvsK4IGKtC1tmmWAGvlMBJDCobivzoekXoqFKuVsVWyGu8lShV/ecQ/M5I17JaUlL
         GIgJYMp8UmzWyFSoNcGMefWzA368T6y84Dl1UkNYt0uoWQZgdBdZG/Aiwpc7CVTIhAF/
         0JQFaTCfa2V+RNlaKbkn7+i4NAyorYBX8ybqJH3XjzPN9VMak9jeuoTXVavcz/TXTb21
         FaF8VhxNqyxbBZju9qp2Ln/N+5T7gJZ/RicqGc8poLGUIGAlMT1edOhRdpffMJ38j6/6
         qtsYNESSzPCd2ar5kLu/sN0j0+3cPO20UPb5V2eBQ/lZWth2IIrqyP4VOjINWfuUb+5N
         qDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501747; x=1795106547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
        b=0w1e3ZfRTYqfGJA0TeZzxFgaQERNHaHWgjlfsHPb0tPPVR+7xhBzcxUkbLUn68lowT
         h9m6idhIbAM4ym+Bkp2CHRIJ3A8b705W/mqbEsgx2kNl42QaTNCUxCkzHF44CINGehB6
         RLgD8popLV8xX3HCGRo5QOCiwsaqL/bMt21nYIFX557tWTS+bbpyEOUmGr6n3COwOjHa
         YINrWj7Dud7BGo4DE8Zoolk/l9FHyxWDMSxJFv+m5JTcaYLQwPfyJezTLr0Rruh00qmu
         nmBtCdYTh/2fD+LDWWe9yuhrgkw1Xb8L1TXJ8dVotngyAwOoo0KPzyOcOsQ0N4ls8i3W
         5vmQ==
X-Forwarded-Encrypted: i=1; AL+hErGZJpbvPBAg2+zmXho8d1b0KtYu2zuD4kdQpF4Te2dcWHVu/ZwasbegmqKiFZlN/4xlmxLI65QZxwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GG4o1M3HfU6+W4mwR9vqqIpQzWaE8q2BtShMokQKunqDjdTcE
	NJSZPcATaKshPcPE619wgzwu+ZCryz+JcmlZ+mqDinuI2l4Am5UZgr1GM+p6fUohafHEUrgwbjK
	YWS/dDKSRHIGsq+Y6VaemTMNcFgzJOcs=
X-Gm-Gg: AYBFou0sC/6psuPJt7tm7iYh7caLPLXoJxy3jCfNyKlkevZIgwBqaOWM1nb8zuu1xF6
	Urc4M/0sZIs9zI91JtXX52bK+SZ4cro4XDTef6y9cFnjRoyUkaCJNGEznvTgf+V5z4C4BAy+/9g
	V7BIj0OknZLGwpZ3M4lAgfrfeP9X2b8vfSeBIrvPdSAW+3HWhdkXCkad9xQRPAzDsI5gSFdwsRp
	p6w/pc1CkrnNQF7qBYrh6Hi/HHCQlDhsLGeHqF510KVveUSew7zhbdDnLma/9pUfJ5kgxMRgscS
	xBN1rrgxjOoX/Hirq9N68pbcHSigUAvvf5EKnOW2Q6mQ2uWCv+FKMTC0sAEUQzXD/peCSH1Q/Rc
	eRxBc6OadMLEz4RRGsE05B7SfKbwVrXOxDhG9ATOqM8g84UsIPiBA+A874pK4z4uUSJUG7w==
X-Received: by 2002:a05:600c:310e:b0:4a2:c9b:9b98 with SMTP id
 5b1f17b1804b1-4ba0936d857mr116824585e9.17.1794501746962; Thu, 12 Nov 2026
 08:42:26 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
 <20261104165504.2430480-26-kunwu.chan@gmail.com> <1c2eff9d-213b-4ea2-9905-a054c6d40d97@paulmck-laptop>
In-Reply-To: <1c2eff9d-213b-4ea2-9905-a054c6d40d97@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:42:13 +0800
X-Gm-Features: AclHuK_5dn6ii1XkN_5ubWft1GmD866Yv1veX15FudsEky0EOAdtZ7tnwYRl5R4
Message-ID: <CAN_Opa-RGS=5kTnMVsj6KE=xCLS8aB=dYSqee7DuFeQ=uvDHKA@mail.gmail.com>
Subject: Re: [PATCH 25/28] hazptr: Select TRACING for HAZPTR_TORTURE_TEST to
 enable tracepoint
To: paulmck@kernel.org
Cc: boqun@kernel.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, stern@rowland.harvard.edu, parri.andrea@gmail.com, 
	will@kernel.org, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:50=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:43AM +0800, Kunwu Chan wrote:
> > The hazptr torture test registers the hazptr_waiter_enqueue
> > tracepoint for its hot-address scenario; select TRACING so
> > that the register_trace_*() API is available.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> It is useful to run the torture tests without CONFIG_TRACING=3Dy in order
> to quickly isolate RCU bugs that tracing related.  Is there a way to do
> this so that people wanting to register tracing can do so, but so that
> it is still easy to run the tests without tracing?
>

Agreed. Only the HOTADDR and LONGHOLD scenarios need the enqueue
tracepoint; the other hazptrtorture scenarios should remain usable
without tracing.

I'll drop the select TRACING changes, make the tracepoint-dependent
scenarios conditional on CONFIG_TRACING, and enable tracing
explicitly in their scripted runs.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > ---
> >  kernel/rcu/Kconfig.debug | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
> > index b500e96ea1c1..8fc6434a05d1 100644
> > --- a/kernel/rcu/Kconfig.debug
> > +++ b/kernel/rcu/Kconfig.debug
> > @@ -27,6 +27,7 @@ config RCU_SCALE_TEST
> >       tristate "performance tests for RCU"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides a kernel module that runs performance
> > @@ -42,6 +43,7 @@ config RCU_TORTURE_TEST
> >       tristate "torture tests for RCU"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides a kernel module that runs torture tests
> > @@ -102,6 +104,7 @@ config RCU_REF_SCALE_TEST
> >       tristate "Scalability tests for read-side synchronization (RCU an=
d others)"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides a kernel module that runs performance test=
s
> > @@ -117,6 +120,7 @@ config HAZPTR_TORTURE_TEST
> >       tristate "Torture tests for hazard pointers"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides in-kernel hazard-pointer stress tests.
> > --
> > 2.43.0
> >
