Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201A81BE25F
	for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2024 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723665205; cv=none; b=Sno0qw6x/uAvlQ1xzHfo5CVw9RLftXZJ5XL3TdXkSWqrDXJdJUUprS5pLGElf37iverTv7m3PxkYhMxpFMWyD3//OToZ3LrhTQsVaxiOJnh1S7x8V47Pz9dp/CotrmC5kuEIqw524V9zQdW47bUfEEA/G+6K0P43/v5tfaQxLkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723665205; c=relaxed/simple;
	bh=/BY3SvLRnHgR+5U5306XFRmMRoyDEwL1zSSFrkoTRK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PgiTc9mgh3ozHtTQxx/rK/uqobF3I8U+zUcinnA1LnQQ6VWGx2fsqSw8obnBlmXOaPHR1/EyT5JfQC+YXLz47XxGDlLek6mwSmnC+0wIeOOv4f34EJOsnmVzkm8lbK4hKHbNj+gK8iKPMZD1l+AIWKSEfO2knxGVLj8K7gDOedI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pCsgS6S4; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pCsgS6S4"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4518d9fa2f4so45841cf.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2024 12:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723665203; x=1724270003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BY3SvLRnHgR+5U5306XFRmMRoyDEwL1zSSFrkoTRK0=;
        b=pCsgS6S4qvJBE7CJCdnTu1ozTBi+dqTE37zsLV31LKFyhBVKWDSER2hPeTvDVkJpay
         q+mWpytm3oNK21szbD86AsNpPGCimCjQMKaoEUHKD1CuZIQjlmUzRx+zvFTAD7jejWIt
         VXFq3AV0a5gVuZMPbg/k4Yxe/P3CfHm5Eqc9wjZXlF3iEAmQocrJ69Aj7oJV9TCKOk23
         1OYV1aOlMRWzRTZnnXlJ8XXI6F6ByvkBd+aGhTdhY4GWKXmmwGRZ0jymTWmHNa+5lCNp
         K0TH6YMrK2y6ZiEm2hmIPrFKHTqFqfp/uI110IYVxv6ry2IOIJ4N8ncLuWoumjQwGdD3
         yD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723665203; x=1724270003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BY3SvLRnHgR+5U5306XFRmMRoyDEwL1zSSFrkoTRK0=;
        b=HYM6IIipLoaFT3oBl3WA5nowHI2yvoC+ij6WJZMZ3hrv18C+0X0vEALjC8afgmRTu0
         Gn0Y/6vjCgt4MDyYSRfe3BgTtwPd7loz2V7Ajr8UvXv//UQXttygUWoPv7rDB1Rv/6Wb
         GEgEHgfkFLLYGS3ZK2hkez320BCxV8u/QOs61DXzURMhjPQQ2R3hZiEjN12X2Ap7XbE7
         PSr6hS9VaiAZKnl7C2Jiw8gCoi2AsWRjDxAHagjRSC9xUNQKxjbBdhyohUCFSaiX3kRp
         KCPOtPhnxkU9VxcRQQOOflUTQjDzRe51ezf/8xhauk8upk2UZgLHkp/GOv1G2xtFATAC
         HBEg==
X-Forwarded-Encrypted: i=1; AJvYcCVR8lzMIE28eJiQsFcHyHP2d6TEATfiTiiSNiqKDGSTeGMqyBMdXZFs3kKR7o6Jw7xXl770jjsyxoHJyK5Xg0JeysK39Neyv48x
X-Gm-Message-State: AOJu0YwkYqgqIS60u3CA77yYqeu8MSarIrkDUD14zcl/C11UxLIDgu2s
	IeooPRt3aJDceDqMph6tIN+twn8khsG80qIpmSFw/mF/9G9/y3lANDg47d99VzrSR5Fp9agB2Jc
	JW7PgG/teW3HcA6478yVrtvEllLar2cFbnelx
X-Google-Smtp-Source: AGHT+IEFg40ZSJEF95A3diV9x3plTBjAQ3CA036HBdyf1mC2UdAq8xozTT3D2y+6l3hbaCcVPzJW798aEGJJ19g9Ihs=
X-Received: by 2002:a05:622a:81:b0:447:eeb1:3d2 with SMTP id
 d75a77b69052e-45368bcf26amr218461cf.27.1723665202801; Wed, 14 Aug 2024
 12:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812125717.413108-1-jdamato@fastly.com> <ZrpuWMoXHxzPvvhL@mini-arch>
 <2bb121dd-3dcd-4142-ab87-02ccf4afd469@uwaterloo.ca> <ZrqU3kYgL4-OI-qj@mini-arch>
 <d53e8aa6-a5eb-41f4-9a4c-70d04a5ca748@uwaterloo.ca> <Zrq8zCy1-mfArXka@mini-arch>
 <5e52b556-fe49-4fe0-8bd3-543b3afd89fa@uwaterloo.ca> <Zrrb8xkdIbhS7F58@mini-arch>
 <6f40b6df-4452-48f6-b552-0eceaa1f0bbc@uwaterloo.ca>
In-Reply-To: <6f40b6df-4452-48f6-b552-0eceaa1f0bbc@uwaterloo.ca>
From: Samiullah Khawaja <skhawaja@google.com>
Date: Wed, 14 Aug 2024 12:53:07 -0700
Message-ID: <CAAywjhRsRYUHT0wdyPgqH82mmb9zUPspoitU0QPGYJTu+zL03A@mail.gmail.com>
Subject: Re: [RFC net-next 0/5] Suspend IRQs during preferred busy poll
To: Martin Karsten <mkarsten@uwaterloo.ca>
Cc: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
	Joe Damato <jdamato@fastly.com>, amritha.nambiar@intel.com, sridhar.samudrala@intel.com, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Breno Leitao <leitao@debian.org>, Christian Brauner <brauner@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jiri Pirko <jiri@resnulli.us>, Johannes Berg <johannes.berg@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	"open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 6:19=E2=80=AFAM Martin Karsten <mkarsten@uwaterloo.=
ca> wrote:
>
> On 2024-08-13 00:07, Stanislav Fomichev wrote:
> > On 08/12, Martin Karsten wrote:
> >> On 2024-08-12 21:54, Stanislav Fomichev wrote:
> >>> On 08/12, Martin Karsten wrote:
> >>>> On 2024-08-12 19:03, Stanislav Fomichev wrote:
> >>>>> On 08/12, Martin Karsten wrote:
> >>>>>> On 2024-08-12 16:19, Stanislav Fomichev wrote:
> >>>>>>> On 08/12, Joe Damato wrote:
> >>>>>>>> Greetings:
>
> [snip]
>
> >>>>>>> Maybe expand more on what code paths are we trying to improve? Ex=
isting
> >>>>>>> busy polling code is not super readable, so would be nice to simp=
lify
> >>>>>>> it a bit in the process (if possible) instead of adding one more =
tunable.
> >>>>>>
> >>>>>> There are essentially three possible loops for network processing:
> >>>>>>
> >>>>>> 1) hardirq -> softirq -> napi poll; this is the baseline functiona=
lity
> >>>>>>
> >>>>>> 2) timer -> softirq -> napi poll; this is deferred irq processing =
scheme
> >>>>>> with the shortcomings described above
> >>>>>>
> >>>>>> 3) epoll -> busy-poll -> napi poll
> >>>>>>
> >>>>>> If a system is configured for 1), not much can be done, as it is d=
ifficult
> >>>>>> to interject anything into this loop without adding state and side=
 effects.
> >>>>>> This is what we tried for the paper, but it ended up being a hack.
> >>>>>>
> >>>>>> If however the system is configured for irq deferral, Loops 2) and=
 3)
> >>>>>> "wrestle" with each other for control. Injecting the larger
> >>>>>> irq-suspend-timeout for 'timer' in Loop 2) essentially tilts this =
in favour
> >>>>>> of Loop 3) and creates the nice pattern describe above.
> >>>>>
> >>>>> And you hit (2) when the epoll goes to sleep and/or when the usersp=
ace
> >>>>> isn't fast enough to keep up with the timer, presumably? I wonder
> >>>>> if need to use this opportunity and do proper API as Joe hints in t=
he
> >>>>> cover letter. Something over netlink to say "I'm gonna busy-poll on
> >>>>> this queue / napi_id and with this timeout". And then we can essent=
ially make
> >>>>> gro_flush_timeout per queue (and avoid
> >>>>> napi_resume_irqs/napi_suspend_irqs). Existing gro_flush_timeout fee=
ls
> >>>>> too hacky already :-(
> >>>>
> >>>> If someone would implement the necessary changes to make these param=
eters
> >>>> per-napi, this would improve things further, but note that the curre=
nt
> >>>> proposal gives strong performance across a range of workloads, which=
 is
> >>>> otherwise difficult to impossible to achieve.
> >>>
> >>> Let's see what other people have to say. But we tried to do a similar
> >>> setup at Google recently and getting all these parameters right
> >>> was not trivial. Joe's recent patch series to push some of these into
> >>> epoll context are a step in the right direction. It would be nice to
> >>> have more explicit interface to express busy poling preference for
> >>> the users vs chasing a bunch of global tunables and fighting against =
softirq
> >>> wakups.
> >>
> >> One of the goals of this patch set is to reduce parameter tuning and m=
ake
> >> the parameter setting independent of workload dynamics, so it should m=
ake
> >> things easier. This is of course notwithstanding that per-napi setting=
s
> >> would be even better.
> >>
> >> If you are able to share more details of your previous experiments (he=
re or
> >> off-list), I would be very interested.
> >
> > We went through a similar exercise of trying to get the tail latencies =
down.
> > Starting with SO_BUSY_POLL, then switching to the per-epoll variant (ex=
cept
> > we went with a hard-coded napi_id argument instead of tracking) and try=
ing to
> > get a workable set of budget/timeout/gro_flush. We were fine with burni=
ng all
> > cpu capacity we had and no sleep at all, so we ended up having a bunch
> > of special cases in epoll loop to avoid the sleep.
> >
> > But we were trying to make a different model work (the one you mention =
in the
> > paper as well) where the userspace busy-pollers are just running napi_p=
oll
> > on one cpu and the actual work is consumed by the userspace on a differ=
ent cpu.
> > (we had two epoll fds - one with napi_id=3Dxxx and no sockets to drive =
napi_poll
> > and another epoll fd with actual sockets for signaling).
> >
> > This mode has a different set of challenges with socket lock, socket rx
> > queue and the backlog processing :-(
>
> I agree. That model has challenges and is extremely difficult to tune rig=
ht.
We noticed a similar issue when we were using the same thread to do
application work
and also napi busy polling on it. Large gro_flush_timeout would
improve throughput under
load but reduce latency in low load and vice versa.

We were actually thinking of having gro_flush_timeout value change
based on whether
napi is in busy_poll state and resetting it to default value for
softirq driven mode when
busy_polling is stopped.

Since we didn't have cpu constraints, we had
dedicated pollers polling napi and separate threads polling for epoll
events and doing
application work.
>
> >>>> Note that napi_suspend_irqs/napi_resume_irqs is needed even for the =
sake of
> >>>> an individual queue or application to make sure that IRQ suspension =
is
> >>>> enabled/disabled right away when the state of the system changes fro=
m busy
> >>>> to idle and back.
> >>>
> >>> Can we not handle everything in napi_busy_loop? If we can mark some n=
api
> >>> contexts as "explicitly polled by userspace with a larger defer timeo=
ut",
> >>> we should be able to do better compared to current NAPI_F_PREFER_BUSY=
_POLL
> >>> which is more like "this particular napi_poll call is user busy polli=
ng".
> >>
> >> Then either the application needs to be polling all the time (wasting =
cpu
> >> cycles) or latencies will be determined by the timeout.
But if I understand correctly, this means that if the application
thread that is supposed
to do napi busy polling gets busy doing work on the new data/events in
userspace, napi polling
will not be done until the suspend_timeout triggers? Do you dispatch
work to a separate worker
threads, in userspace, from the thread that is doing epoll_wait?
> >>
> >> Only when switching back and forth between polling and interrupts is i=
t
> >> possible to get low latencies across a large spectrum of offered loads
> >> without burning cpu cycles at 100%.
> >
> > Ah, I see what you're saying, yes, you're right. In this case ignore my=
 comment
> > about ep_suspend_napi_irqs/napi_resume_irqs.
>
> Thanks for probing and double-checking everything! Feedback is important
> for us to properly document our proposal.
>
> > Let's see how other people feel about per-dev irq_suspend_timeout. Prop=
erly
> > disabling napi during busy polling is super useful, but it would still
> > be nice to plumb irq_suspend_timeout via epoll context or have it set o=
n
> > a per-napi basis imho.
I agree, this would allow each napi queue to tune itself based on
heuristics. But I think
doing it through epoll independent interface makes more sense as Stan
suggested earlier.
>
> Fingers crossed. I hope this patch will be accepted, because it has
> practical performance and efficiency benefits, and that this will
> further increase the motivation to re-design the entire irq
> defer(/suspend) infrastructure for per-napi settings.
>
> Thanks,
> Martin
>
>
