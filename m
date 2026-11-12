Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501639;
	b=ekWeKP6ifGvwXS9vllA1E9ZKMrrODJbildIldU6uJWFddZruCIn80RPoVGD4jrlSToCw
	 A16aU/9qzMCtnBZuii8rg+DKsguwaW6PlmiKqjfrwKKUKG9+kR/3zziw5AaUlHa64SKmt
	 8a7LTElOo2bGqoMvwIOAJS6zygLmFtabRAaEIGuc2I7MuSZ1aFF0RmINky7IE+DQuc6ja
	 1TiIK58hfXLiZgfYRc/VK9ZwhO4s4npVljNTJm68BIrHNWuaBtFfq0uxkxgUfDCzuKnCm
	 YIeX7NNhaCW7bok3rycV3b5wIbXhYF6cSurezylVQAypc/7Bo19dKA0zKkrvd98Qm8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
	b=2NU2uoRstjxZ7QnewJmRCUdMpgTRaVNA9S6BbNpdOZLvwa51nbj9tMHCB6aGVc/n5ZiO
	 p/xl6H7lRdP0Edb/STtxbUGbRi2+uCnnFC99OjbuMF6VFtgRiGSQP9cOanvHvg/Tja4MD
	 mFB02NivXZ2Lnwo6RGYWLd9oMdOl7+BYxyoZut89iztOpLw5Np4o1z/GJVDCwnN0Z3zue
	 iAtk1RyKtDcISyUGSRaF66hjBEu251+ESoRCB71ahH/1EX+l2X1pdlVnU1ovoSRiosavZ
	 C+K/aYOzpV0s7dAB031NCf1w858qUwgm6MHoyUBsG7keBKae7fI/JY2nCcV+FbU6HeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSTRe6bc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB92606A335
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB92606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSTRe6bc
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3788099f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 08:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794501638; cv=none;
        d=google.com; s=arc-20260327;
        b=PGl3q1CsTwDwu2kiWjbNjIWrqeL9dWkhz+lg01b9fvC0YNAdWhHWH6HSlKv7y07U80
         1iMTxbzHk5AYYUadqTzKyeddQv3ugAyBpr3Ybh4ShQYoia7IDlAp9gwj8TaYhba+dM/v
         HS7ZCQYQtO2jMhsZBw5fmjWMGNqm16hUYSGFWlEu2NEK60tMIyUT0IZ7GgXPrV4yKmif
         sTO5LbDr3b/KuL62tBtJ6ymCX6Dc7b2WVuhw+cY7epm4+QVgzBB//TWG327sMIRWL9rj
         iIAXfC8h+QKY+XQJUMAPD7C/Qg8igASlpt0aVlcl2AQK/N65VvWiXyE2SVPIK6BnMtZL
         OQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
        fh=JgdMTYeX+YLRhW4ls6SD1OkIJmv/a6KDM+ySJ7ieFzo=;
        b=U7HknJzl8fTayw5t4bAeJHsR+pEtFWAX0pYL9a36IpwLkQVyIyKum8VPkM9BNhx1AI
         DP+CyC4c5+uhWWLWJvqUR4W5WANqit/Ar4Iy3bORQdc36EMug4p3L6M3Nbxm9U14tQ6o
         bwHdYbuc88c6D+YLZDDzkR5q+eYH/CAflDbm1H4LKxyRB3Qcaa1FB+vEIjiXQ4VYAWjy
         12iZPs0Ysr/L309jURiyt5jNieHRTkgYDqwAp2N5ww6p9R4ytHWiH9ZMUcw9noj80oRA
         ZkmyZEe3lPquCv9CTZB9vJOE8H0iGnCjvvyTtkByelDTLvtKdZzT5qn+vOt3PITXYCSk
         DawQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501638; x=1795106438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
        b=zSTRe6bcpEP0F6lRzme7StvyYeoHX4QkB0ipadH2vg/pjnjMLNyV84pDO0l2RsL4H3
         NiX5YYkTTQo/IbG4eKCM7ptmaQ7zGd87omyitWEWk9Uc22tWQeokvwrzEQNpPng/1/q7
         6dCDIJplhjRVyLU1DCWjS7MRw508izhA0NS80M8HAyxabXNSFR8WN7lUgm3kFRC8+KaD
         1XhAMA9Ko6pvCIAMy3pI/Up75av8t8te2PBEBGEp81c2fFIvgWYmvp0hmfWL1IjpwGdM
         B9+VZv/tm6Qk1JOFPsr5Ff1pp1Irdji+Tv8WvUcoiFhNurMwnW+zyuHax8WBwILRnr8K
         jDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501638; x=1795106438;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
        b=JAWwcmgbIdWS7qBVDniS4NBBcGJNYZ6vSUrGAky9hxeP46z/e9Zn49NMAkM8FF5SWT
         SL8YfqaS3Y+C++kc3z3H6zGyHTJOdgeU2CYpYVp8Kr+xvpOkzfq1ZUrsu0Vnp3LT2npe
         nXXw2Hmz+bg+GfBYidRYbCPGxW8CVHfRHiaCKUaTvS01PRqRHH2XPbNNZ1R21a6C2sjp
         TurRHhsN+2IEm2r8oo2XxIQEeC6dIsNP/3x94432av3SNJtFTFcXsnWs3YIgI+gEwD62
         GCHw7iGa8vhiKQvHX5c4hibkoPxxaiQMzN9AwAr3eevLrbEtOjtFhSLgF5ijsWPRVVR1
         wVcw==
X-Forwarded-Encrypted: i=1; AL+hErHBA8F1Dpa7fk7RO+/bfLyNHPre15EHTavAmBpooQULNIOgHL4/StNTynNeGy0A4e+uaXIOTgLXoAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z83COLCsHBC84U8SkesixZSlKDu2iTxHcjRj2QZ3YWNM7rFTnjI
	MQDjnD2/zLqG9BvYqBCDYP0slSSjgvOAaHw7R+bhIQNAOuljbV1aRAKeKQCDRhLFECRJItmrogl
	N+R7tfByw3/ZmwUt9fZIpnVGY1DLdMAQ=
X-Gm-Gg: AYBFou3aAcfEnGcWd/jhMzDUVK7F2gC+M2nWlrZFIKgBvsyJF70ltwjhzByvZiLpXdV
	SouqR8o+3KkLpulD3RxwZ6mtZhDTOKB65xAD20ZsrpAU0APNolFNr8bcWbhLdItuDCcgJOJSOFq
	WxG+8sLyE4zdte9dF8BV26FIhl2W07E8im5CXfHi/M5fCwd0Km5DDlNhaU8kCT8H2Gis4k1O5OL
	c8io5BLaUsDHeZkvepUgMPjKgerpN1gWKKklBftxcHFKZA4/x82Hty4dBGsBVpSHk3NT2W/j+p7
	RcrAyGjH+0b28z/WuGSezBXYUM3eIbF/nLDmkGsy2wBdSoRBozNrVwVJi0lG0GRXU1j2kyUAwho
	Q+9DDwk48L+yJfWUFSwi3n6YYEKQgAlCzHIq/3Re1y/t8adMrIR4daVBB+TyvJzsFMWWiHA==
X-Received: by 2002:a05:600c:354a:b0:4a2:1050:aff with SMTP id
 5b1f17b1804b1-4ba0939cc9cmr116023935e9.6.1794501637516; Thu, 12 Nov 2026
 08:40:37 -0800 (PST)
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
 <20261104165504.2430480-24-kunwu.chan@gmail.com> <c4f84631-5805-4750-a7bb-3fd5a24bbb62@paulmck-laptop>
In-Reply-To: <c4f84631-5805-4750-a7bb-3fd5a24bbb62@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:40:24 +0800
X-Gm-Features: AclHuK9v_Y77arVgZcVVGwgCPDnh2ZgjQdSu0zI-cG-aALJ_JZ_d5zP_ayWkNKk
Message-ID: <CAN_Opa-z5mmmw-OB7bU3xuKJAHp0L4Tp8a9A7tjqiaY4s9V5+A@mail.gmail.com>
Subject: Re: [PATCH 23/28] rcuscale: Add hazptr scale type
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

On Wed, Nov 11, 2026 at 5:45=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:41AM +0800, Kunwu Chan wrote:
> > Add a hazptr scale type for per-writer hazptr_synchronize()
> > cost and per-reader hazptr_acquire()/hazptr_release() overhead.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  kernel/rcu/rcuscale.c | 67 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >
> > diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
> > index 5659eaebc5c0..6e3e3f296f85 100644
> > --- a/kernel/rcu/rcuscale.c
> > +++ b/kernel/rcu/rcuscale.c
> > @@ -40,6 +40,7 @@
> >  #include <linux/vmalloc.h>
> >  #include <linux/rcupdate_trace.h>
> >  #include <linux/sched/debug.h>
> > +#include <linux/hazptr.h>
> >
> >  #include "rcu.h"
> >
> > @@ -460,6 +461,71 @@ static struct rcu_scale_ops tasks_tracing_ops =3D =
{
> >
> >  #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
> >
> > +#if IS_ENABLED(CONFIG_HAZPTR_TORTURE_TEST)
>
> Ah, maybe this is why you want hazptrtorture and rcuscale to be built
> into the same kernel.
>
> But what you really want is hazard pointers to be built in, right?
> As opposed to the torture test?  But this patch will be on top of the
> patches providing unconditional hazard-pointer support in the kernel,
> so you can just omit the above #ifdef.
>
> The reason for the CONFIG_HAZPTR_TORTURE_TEST #ifdef is that it is
> possible to build kernels that do not support Tasks Trace RCU.
>

Hi Paul,

Yes, that guard is what led me to enable hazptrtorture for the
rcuscale runs in patch 26. rcuscale only needs the hazptr core,
which is available unconditionally at this point in the series.

I'll remove the guard and add &hazptr_scale_ops directly to
scale_ops[]. This also removes the need for the torture_type=3Dnone
workaround.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > +#define HAZPTR_SCALE_NR_OBJS 8
> > +static int hazptr_scale_obj[HAZPTR_SCALE_NR_OBJS];
> > +static atomic_t hazptr_scale_sync_idx =3D ATOMIC_INIT(0);
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
> > +     int idx =3D smp_processor_id() % HAZPTR_SCALE_NR_OBJS;
> > +     void *ptr =3D &hazptr_scale_obj[idx];
> > +
> > +     state->addr =3D hazptr_acquire(&state->ctx, &ptr);
> > +     return 0;
> > +}
> > +
> > +static void hazptr_scale_read_unlock(int idx)
> > +{
> > +     struct hazptr_scale_state *state =3D this_cpu_ptr(&hazptr_scale_s=
tate);
> > +
> > +     hazptr_release(&state->ctx, state->addr);
> > +}
> > +
> > +static unsigned long hazptr_scale_completed(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +static void hazptr_scale_sync(void)
> > +{
> > +     int idx =3D atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCA=
LE_NR_OBJS;
> > +
> > +     hazptr_synchronize(&hazptr_scale_obj[idx]);
> > +}
> > +
> > +static void hazptr_scale_sync_exp(void)
> > +{
> > +     int idx =3D atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCA=
LE_NR_OBJS;
> > +
> > +     hazptr_synchronize(&hazptr_scale_obj[idx]);
> > +}
> > +
> > +static struct rcu_scale_ops hazptr_scale_ops =3D {
> > +     .ptype          =3D 0,
> > +     .readlock       =3D hazptr_scale_read_lock,
> > +     .readunlock     =3D hazptr_scale_read_unlock,
> > +     .get_gp_seq     =3D hazptr_scale_completed,
> > +     .gp_diff        =3D NULL,
> > +     .exp_completed  =3D hazptr_scale_completed,
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
> > @@ -1140,6 +1206,7 @@ rcu_scale_init(void)
> >       static struct rcu_scale_ops *scale_ops[] =3D {
> >               &rcu_ops, &srcu_ops, &srcua_ops, &srcud_ops,
> >               TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
> > +             HAZPTR_SCALE_OPS
> >       };
> >
> >       if (!torture_init_begin(scale_type, verbose))
> > --
> > 2.43.0
> >
