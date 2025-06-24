Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7013C2D8DB7
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 14:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776299; cv=none; b=kx0EuxDVrZbZYpp4JiSPHag02MVcF6w8loPMz3EHkHk4MMXR0RCHjVqwVhRLp0CtXNFe0dh3Q12kKPFSkiSzW817kWFnSjG/pi/cGKAxQTz4myphuS5o3TVConwBinrFSLfdGNnlzzlsK79Mz+0tZ3UItU5ggHQ0T19q9ZsUQeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776299; c=relaxed/simple;
	bh=PMtBkVKWw5Pna9jZlC5WnAmSVHkdhULOnJd14bo0Luc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z8XjYL36MEntHxocbsfimT/35fT+lmY98Y7pNXOOpSi7jQsHwmDVmpCsOOaciMeB6dcA6c4pMdCx/3SOgqiuPiqTh2bJ5E/L2bfZVBPEGu8JT1mNsAziIEPClS8qVFTQ5HsEdYP75A2EI9x+AvRYhBh1GkA3lm8QlrQxwVNJ9Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZQHZa6P6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZQHZa6P6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750776296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mLcxxnqRZ5+f05tvB52Bk6zB2CYTD16ghvbgMe9EAr8=;
	b=ZQHZa6P6xt0ehj8rjdW1iuboq96R6pYNNK4Fj2pwe8TlBnhj2gVHZJCy09XnYpHz6IoBF6
	UfqDTgCCcmyQFaoWYBwLtV+lpFKY1tkqgREAwl8pXZleVNjcGHcS91aqWZ0dXhRdF4h8fW
	jbrINC9Xog8PFkrPCeDnN2CbYq465j0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-PFPIKXzrMImyzJcYKvHHAQ-1; Tue, 24 Jun 2025 10:44:53 -0400
X-MC-Unique: PFPIKXzrMImyzJcYKvHHAQ-1
X-Mimecast-MFC-AGG-ID: PFPIKXzrMImyzJcYKvHHAQ_1750776292
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450df53d461so40445185e9.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 07:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776292; x=1751381092;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLcxxnqRZ5+f05tvB52Bk6zB2CYTD16ghvbgMe9EAr8=;
        b=wBMQNd5tf7gGcTzPgSx1W5r88SBpi70+4DeNrWoorEVnbdvvQoVpSrl8kapXOx49fb
         8I9gqAUD2afTSfJ43DDZvPGmVWd7W8pcMMuVum5n7Phw43J8ajeafv8tzBIfkbs7f8Fu
         lS0c/1ke/9Rfq/IT8CdE7eXxxxASDhVkMKFNjOMaNAWMxzxknlwoyo09EA1zOj6OI7dS
         A5zrPlxV5Ey2mOZd0WovunilsXrgA/dGwCeRju7cMUwq0wHoLiWyjD7oz79rBVs1NCLP
         jyNOLNTqwj4vpIosI8qkPjqdOB3i86kl8bS+EYP2dW8CO+DGqukXIs4Cbz8sW5vbWFy/
         9phw==
X-Forwarded-Encrypted: i=1; AJvYcCXcn8P0I9W3HVWmXVTMYtUKNfjs3/RdxHzdgyu3ADxo/XNVVeJg2HFvWIGyjpyvOCI1BnF/djSgSqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm0yn101j6JI9yPu379ba2Vb15kHiIvyai1g6Lt1V9LxB5jzQo
	3HUdDIR903ysegLhrgfo+pIDOdpZdytgVXyNSv2rHjHt47tXd0119cNPbYDUqCfgu4odeDebDkm
	9AZ5cAPApQQ/Eet8QccH+WwFsXdKkaB8S1xl09ZEAyM4s2HtvgLTE12odAU3nmg==
X-Gm-Gg: ASbGnctYLeMqacsxxuroR7/bTyqStr/Qe2r7ytUy09ILw7x3jGQweutx9+ykfEuWg4y
	891IN8G6QcNLeI9bHsv6Hj4S6wlBWfDCzOUXrlttK0JmK72EcsvsllbmT/23rCVTWdCiuyWvSWO
	0JBnvxYJ3MtnY/VAzmhu6AauEwqThJNptytw7uNvgNs1ABA8/Nw33gCyLCWW+vUcZcw2zdI4y62
	ZqnCQtiIAE+24IGjW4l685EKAGHJ8jbJIkpm20+4mFnGWi9dJk7jPJhojjj7jV/xjp9JUdRirEp
	VfxA0PdHfvrSVpxouinhb/fD7Q/a9UE0ZoRRshEMdQ+/Cps4
X-Received: by 2002:a05:600c:4fc5:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-453659ee9famr167525165e9.16.1750776292485;
        Tue, 24 Jun 2025 07:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH+bnvqk5AdSusPNS/x+/GsWWWythv10L4NSLOB5NqoePKQqBx7+VdoIha2cWe8D+LTySvCA==
X-Received: by 2002:a05:600c:4fc5:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-453659ee9famr167524865e9.16.1750776292042;
        Tue, 24 Jun 2025 07:44:52 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb57fsm146342375e9.1.2025.06.24.07.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:44:51 -0700 (PDT)
Message-ID: <e2b2e78a9c66973d90a9dbeea83b88b97182c36e.camel@redhat.com>
Subject: Re: [RFC PATCH v2 09/12] rv: Replace tss monitor with more complete
 sts
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet	 <corbet@lwn.net>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Ingo Molnar	
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Tomas Glozar	
 <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>,
 john.ogness@linutronix.de
Date: Tue, 24 Jun 2025 16:44:49 +0200
In-Reply-To: <20250624073609.OA9Q1V4g@linutronix.de>
References: <20250514084314.57976-1-gmonaco@redhat.com>
	 <20250514084314.57976-10-gmonaco@redhat.com>
	 <20250624073609.OA9Q1V4g@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Tue, 2025-06-24 at 09:36 +0200, Nam Cao wrote:
> On Wed, May 14, 2025 at 10:43:11AM +0200, Gabriele Monaco wrote:
> > diff --git a/kernel/trace/rv/monitors/tss/tss_trace.h
> > b/kernel/trace/rv/monitors/sts/sts_trace.h
> > similarity index 67%
> > rename from kernel/trace/rv/monitors/tss/tss_trace.h
> > rename to kernel/trace/rv/monitors/sts/sts_trace.h
> > index 4619dbb50cc0..d78beb58d5b3 100644
> > --- a/kernel/trace/rv/monitors/tss/tss_trace.h
> > +++ b/kernel/trace/rv/monitors/sts/sts_trace.h
> > @@ -4,12 +4,12 @@
> > =C2=A0 * Snippet to be included in rv_trace.h
> > =C2=A0 */
> > =C2=A0
> > -#ifdef CONFIG_RV_MON_TSS
> > -DEFINE_EVENT(event_da_monitor, event_tss,
> > +#ifdef CONFIG_RV_MON_STS
> > +DEFINE_EVENT(event_da_monitor, event_sts,
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event, char=
 *next_state,
> > bool final_state),
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event, next_state, final=
_state));
> > =C2=A0
> > -DEFINE_EVENT(error_da_monitor, error_tss,
> > +DEFINE_EVENT(error_da_monitor, error_sts,
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_PROTO(char *state, char *event),
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 TP_ARGS(state, event));
> > -#endif /* CONFIG_RV_MON_TSS */
> > +#endif /* CONFIG_RV_MON_STS */
>=20
> You are changing the tracepoint's name. Should we worry about
> breaking
> userspace?
>=20

Well, to be extremely picky, although that's what git shows, I'm not
changing tracepoints names, I'm removing tracepoints and adding similar
ones with different names.

That said, you're bringing a very good point, I guess removing/adding
monitors is going to be something quite common in the near future.

> It probably doesn't matter at the moment, because I doubt anyone is
> really
> relying on this tracepoint. But I think we should have a definite
> stance on
> this, for future references.
>=20
> I have seen tracepoints being changed (I know of [1][2][3], I was one
> of
> them :P), so it seems to be considered okay. But adding userspace
> tools to
> the equation and it doesn't make sense to me. For example, lttng is
> using
> the page_fault tracepoints [4], which is broken by [3].
>=20
> If this should be stable user API, then we should starting thinking
> about
> better API which allows changes like this to happen. Otherwise, they
> should
> be clearly documented to be unstable.
>=20
> (I think I may also need to change my rtapp's tracepoint names at
> some point
> in the future, that's why I am asking)
>=20

As you mentioned, nobody is likely relying on those tracepoints names
at the moment, but I would rather be cautious basing userspace tools on
some monitors to exist at all.

In my opinion, RV tracepoints are useful as an alternative of
reactors/rv userspace tool but cannot be used without considering the
RV interface itself (e.g. available_monitors and friends).

We could at least stick to the following assumptions:
1. monitors can change names, be added or removed
2. tracepoints are consistent to monitor names (in available_monitors)
3. the tracepoint structure does not change (i.e. event_/error_, args.)
   (can change for new monitors types where seen fit)

If in the future we allow the possibility to build RV monitors as BPF
programs, we'd probably also allow monitors without tracepoints at all,
but I'd say for now those assumptions are sensible.

What do you think?

Thanks,
Gabriele

> Best regards,
> Nam
>=20
> [1] commit dbb6ecb328cb ("btrfs: tracepoints: simplify raid56
> events")
> [2] commit 244132c4e577 ("tracing/timers: Rename the hrtimer_init
> event to hrtimer_setup")
> [3]
> https://lore.kernel.org/lkml/2dda8c03-072a-43b2-af0c-bb996d64c388@cs.wisc=
.edu/#t
> [4]
> https://github.com/lttng/lttng-modules/blob/master/include/instrumentatio=
n/events/arch/x86/exceptions.h#L88C48-L88C63

