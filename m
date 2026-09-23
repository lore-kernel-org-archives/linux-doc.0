Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120B83932F9
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 04:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790138444; cv=pass; b=mzUOegKI+TdzNzlrV0BQRluuIQooqJirqLSOX82c8vtxpUV2ORTjp7ePjxjSEmSRfDZ/xzat8RKedTBBQ5drE2syihkaAwxqkpIM4nk7hYEdQXmDIs2H6Y+E14KOoQ8JvbUlLHQobb/Hkfum9j18Qm9QbbEkObnSj6DYIug1sVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790138444; c=relaxed/simple;
	bh=DfwslUgXH9iUiGASTRA0OnW94V4DmVUUOxWiW01jeOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHzSYbBkFG3Ps0d9rj0fliApLZkZ0PHCt0e3soxmirq+G0oksJzv4sidOvdS6ecN1DsGwANh80DXgkpwckLTeh736uLNsdeAyMH6GOEZ2zvY7M7rc+ldoeALQa6z+ofOZtlKvf3Bl9PJ/zLqzhgpKPM5dCSaDO+CcYjsqLMIGAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ma+vLV0T; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ma+vLV0T"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so2117765e9.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 21:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790138439; cv=none;
        d=google.com; s=arc-20260327;
        b=SjNbHNhBnm5x0HFdk5tGQsjvvNphq67eenMDnYTvRJvMOYxVrw68W6GZ/e9OFDnx+B
         AciKUVIH+N8Vv4Qb2wAVOdG11gsjrgq+dvYUWtb1jV6pB909hAWLXkmnwoT7xEkzkyLX
         zfAwRPZW8J7tZTjF0zxP2v5/aSu1Z3lnxi7AbJzhRHjmV9PKvYOJFOUFffPYJ/LMISyO
         RQ5+OXjiRDcLzdA+PrCBRPHB69bur46BqjVFtXJ/uhztxBY0M6FOS8Fzl2q0KuvCyKhr
         EfdgjQhddodwXACuYmf9vDXRupj1SNtcVD/tHZDgObdl+875JOLCBoGKiJ+72BpdybRd
         wMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3v8KouzydVZ2wFebRu1KMgQMureFqXEgF0puCqWitK4=;
        fh=AVABWFB+3eMqUKxNtOQKKEhdLbAiMns08ETfhAkYh+Y=;
        b=TZMMMVMzDcydZ7UXLM5bUgpmWgzyIznflRLWZ9v4BbF+Jxr0eHDdTqe1IfiWCjR0OY
         9joaaMVwETHHxj2Q73XTo/bfLoMcZlTyXr24l8focgOW6zwfvKnlqsfA17g2R3Xx0qN9
         dBe870NZtnUqAuqOJ866N7/HruRmyr4cDBod7wtOP5QtPRDIS5Q2tpq7o4OkpZ6Uar6a
         +qZgYTh6KYNExfEr+MqsCs+J5Hcjo5wrZ0Ja2mPqyMya9rHOss6mWofPvhuRDm5CcPBx
         u70RWD8t1cf9t966i3EINwrYEaDUdBP8/3Mc+s457ZmyFaatDQ+5lnOql/aXtmdkYU+T
         Vn6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790138439; x=1790743239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3v8KouzydVZ2wFebRu1KMgQMureFqXEgF0puCqWitK4=;
        b=Ma+vLV0TuoWry0i8mVdWA/tHf/iTFMMvvQ65wn42+GXlWOaW3kiRewWZJI0+gCJmoR
         7ylHevOKLYA43YeWy0g0/aEVf4736xnOq8jaC+wZVYIMUEpBuj/+8iBrU9FtHY417/S/
         MRgg0lnYdhon4C4ifCuAg/+2fNUaLlEImSFehh7DIzkLRr4RxKcVV2psBC1ZZuidSl4d
         4iH9CKwN/LKTccY84U4aRcBKMwAWy4lovF2p8sFn1PnDn23TPd3RJD0GJAr6lMHYcO5a
         oPj8skzoX27FghRV154G8/B9eq2YR0fs0RzNRnLmRbztsaTrcqPaS93WifyheEiLAWWU
         TZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790138439; x=1790743239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3v8KouzydVZ2wFebRu1KMgQMureFqXEgF0puCqWitK4=;
        b=B8gbKSzDHyVE8YFcAoIDvCzpBv2Ynu5pC5WnDOzJ4BDhUpTaDOblDIr8GmxjVh52O5
         xwywpKuZ7XbclocK8OX09B99XG1cIlMGkg8CAG2pGWyXV748h2cmk08HuJ4I8Th+o0ye
         2FGJOA8n2S//b7RF5pX3lljcEnDFjrFkd5URrMRLn38CUNH01Op/reMmvBD9v6pWVOE1
         qI/kkZU5lF9QZFXbpYpO8w/eYh283uXD9xtal8O3YXRHNVU+934IRNACcdYbL60TKLQz
         +0p7RE8NhisIO45qNsFVS8g/UfxaWpiLIncTK+E+0+08s2SNYlm78NkkGTah50IfdJjw
         KcYg==
X-Forwarded-Encrypted: i=1; AKwUvBz8AjlyY7pPpb9frlgSgVfGb5tkaaMlE7n7unZ8/SI5nCu/O6Aqb8Ru3nCPT9ACDVRSqVQgxdzsNik=@vger.kernel.org
X-Gm-Message-State: AFuF++l5M0uRfkA4wglTXcrr63ElNndTTA7lLf2eEfVqklL610o7KmJp
	Nro6B3X7qpiqv7kBOQCSlEkgiXacsYC0DdsNwqOSuTmr1J1fVP/2H5YrLIlJzVQq5E4H5GQPJeu
	TUXbrmjlL8Nbv27rYV/k30R5qPlLKc8I=
X-Gm-Gg: AYBFou1KabdwIwJHjoKWliSBNUSHXUaz35ZI6O0rnsMVJi+ufagGFMm44E7a1uXfOx9
	sVexl2L/jEE2YY5yBaA4XJzjCxOziT2YGIYKx9/Mh/CNq31fcjDD0wE2i5ej1sFSpxmqxalC/3m
	jobdgvAJLp5bZ4rvkIoGkBET/kdrBjH+GiCCSeCsu6VwVi4SR/kGEpMHvaUABffWufUM46ZBuSy
	L3wEulqGFa6fYGGQ95pMsGERtG0S/HHh1bTx+JUv6bLtiDw3dcUtk9fg4MsM/2BztW5NPxf+J/W
	nryIZgfVDSYvSz6NDY46NgH6iKw52WGCnKzk0m7JYcx3LB04nQTS4V4D5yewLNtlAKqnMCntT7B
	V1XAN5Kf9dU6p/A==
X-Received: by 2002:a05:600c:4704:b0:49e:799e:c1c3 with SMTP id
 5b1f17b1804b1-49fdf12d3dbmr12321785e9.17.1790138438843; Tue, 22 Sep 2026
 21:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922070950.4173245-1-kunwu.chan@gmail.com>
 <20260922070950.4173245-4-kunwu.chan@gmail.com> <arI0bexTH7CL66Dc@MacBook-0RXW5>
In-Reply-To: <arI0bexTH7CL66Dc@MacBook-0RXW5>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 23 Sep 2026 12:40:27 +0800
X-Gm-Features: AclHuK_6rmoBk0Xrp8rz2DECfqwOHj3oChdP_Pi51R31FmxB0rmW3v9rvLOe0xk
Message-ID: <CAN_Opa-B+ipfSyvzBCtJf7jbiKjBFT1i=-8y9LCj+dCiRh=Z_w@mail.gmail.com>
Subject: Re: [RFC/WIP PATCH 3/4] rcuscale: add hazptr scale type
To: Boqun Feng <boqun@kernel.org>
Cc: stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org, 
	peterz@infradead.org, npiggin@gmail.com, dhowells@redhat.com, 
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, paulmck@kernel.org, 
	corbet@lwn.net, mingo@redhat.com, dave@stgolabs.net, josh@joshtriplett.org, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, urezki@gmail.com, 
	akiyks@gmail.com, dlustig@nvidia.com, joelagnelf@nvidia.com, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, longman@redhat.com, 
	rostedt@goodmis.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	qiang.zhang@linux.dev, include@grrlz.net, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:55=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote=
:
>
> On Tue, Sep 22, 2026 at 03:09:49PM +0800, Kunwu Chan wrote:
> > Add hazptr reader and synchronize operations so that synchronize
> > latency can be measured alongside RCU and SRCU.
> >
> > The read side acquires the hazard pointer in readlock() and holds
> > it until readunlock(), matching the RCU/SRCU reader model.  The
> > address of a static object serves as the synchronize target, which
> > is stable and never reclaimed.  Both normal and expedited sync map
> > to hazptr_synchronize(), since hazptr has no expedited concept.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  kernel/rcu/rcuscale.c | 65 ++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 64 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
> > index 1097ec15879c..072ddf9526c3 100644
> > --- a/kernel/rcu/rcuscale.c
> > +++ b/kernel/rcu/rcuscale.c
> > @@ -39,6 +39,7 @@
> >  #include <linux/torture.h>
> >  #include <linux/vmalloc.h>
> >  #include <linux/rcupdate_trace.h>
> > +#include <linux/hazptr.h>
> >  #include <linux/sched/debug.h>
> >
> >  #include "rcu.h"
> > @@ -418,6 +419,66 @@ static struct rcu_scale_ops tasks_tracing_ops =3D =
{
> >
> >  #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
> >
> > +#if IS_ENABLED(CONFIG_HAZPTR_TORTURE_TEST)
> > +
> > +static int hazptr_scale_obj; /* Stable, non-NULL, never reclaimed. */
>
> You can probaly make hazptr_scale_obj an arrary, and let an updater
> either randomly or round-robin select an object to wait, it'll reflect
> better to a real world workload.
>
> > +static void *hazptr_scale_ptr =3D &hazptr_scale_obj;
> > +
> > +struct hazptr_scale_state {
> > +     struct hazptr_ctx ctx;
> > +     void *addr;
> > +};
> > +static DEFINE_PER_CPU(struct hazptr_scale_state, hazptr_scale_state);
> > +
> > +static int hazptr_scale_read_lock(void)
> > +{
> > +     struct hazptr_scale_state *state =3D this_cpu_ptr(&hazptr_scale_s=
tate);
> > +
> > +     preempt_disable();
>
> I think you can drop the preempt_disable() and preempt_enable() below,
> since the new hazptr_acquire()/hazptr_release() work without them (i.e.
> the hazptr acquisition no longer requires preemption disable).

Thanks, Boqun. Both points make sense.

I'll drop the explicit preempt_disable()/preempt_enable() and use an array =
of
objects with round-robin selection on the updater side.

Thanks,
Kunwu

>
> Regards,
> Boqun
>
> > +     state->addr =3D hazptr_acquire(&state->ctx, &hazptr_scale_ptr);
> > +     return 0;
> > +}
> > +
> > +static void hazptr_scale_read_unlock(int idx)
> > +{
> > +     struct hazptr_scale_state *state =3D this_cpu_ptr(&hazptr_scale_s=
tate);
> > +
> > +     udelay(10);
> > +     hazptr_release(&state->ctx, state->addr);
> > +     preempt_enable();
> > +}
> > +
> > +static unsigned long hazptr_scale_completed(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +static void hazptr_scale_sync(void)
> > +{
> > +     hazptr_synchronize(hazptr_scale_ptr);
> > +}
> > +
> > +static void hazptr_scale_sync_exp(void)
> > +{
> > +     hazptr_synchronize(hazptr_scale_ptr);
> > +}
> > +
> > +static struct rcu_scale_ops hazptr_scale_ops =3D {
> > +     .ptype          =3D 0,
> > +     .readlock       =3D hazptr_scale_read_lock,
> > +     .readunlock     =3D hazptr_scale_read_unlock,
> > +     .get_gp_seq     =3D hazptr_scale_completed,
> > +     .gp_diff        =3D NULL,
> > +     .sync           =3D hazptr_scale_sync,
> > +     .exp_sync       =3D hazptr_scale_sync_exp,
> > +     .name           =3D "hazptr",
> > +};
> > +
> > +#define HAZPTR_SCALE_OPS &hazptr_scale_ops,
> > +#else
> > +#define HAZPTR_SCALE_OPS
> > +#endif
> > +
> >  static unsigned long rcuscale_seq_diff(unsigned long new, unsigned lon=
g old)
> >  {
> >       if (!cur_ops->gp_diff)
> > @@ -1110,7 +1171,9 @@ rcu_scale_init(void)
> >       long i;
> >       long j;
> >       static struct rcu_scale_ops *scale_ops[] =3D {
> > -             &rcu_ops, &srcu_ops, &srcud_ops, TASKS_OPS TASKS_RUDE_OPS=
 TASKS_TRACING_OPS
> > +             &rcu_ops, &srcu_ops, &srcud_ops,
> > +             TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
> > +             HAZPTR_SCALE_OPS
> >       };
> >
> >       if (!torture_init_begin(scale_type, verbose))
> > --
> > 2.43.0
> >
