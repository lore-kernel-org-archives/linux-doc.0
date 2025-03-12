Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911EF256C7F
	for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 18:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741805357; cv=none; b=A00aP5OOSuNVhgi6lNY5uixnYgwgIXoehKWXQuNJZxNi2+dl1O07glhQDiPntKeJbalErtt0M0MWPU7gU0b6zFSn5SVz79PU2yOhnmdPM93I6IpbZtVZpWyColKNfv818UwWCz0bBGjewhMhnzM9is0kM6NtGb89lp6G5UImWUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741805357; c=relaxed/simple;
	bh=JEv0N9Ir1ejtdnozN6BUIcUt5wu1A+oaE1DQlOhNtIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+7+vlUzLoimKvGIUIOBBqDHJYtY4DSbuoVx4y011m2Dh+wwU44vBjr8mpQ0bnPnJGMkoiWt5s5URty7rFW1AKtkN6TWTU8xyX6h/exwrM8qLmtAPEyYET9Q3qsdluNzUNy+q9vYvEstA8xoWMU6PZWpQL3QjF1dmRQN2r2ULHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ibAZvABg; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ibAZvABg"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bfca745c7so1730701fa.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 11:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741805354; x=1742410154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SU9eA8XTstbIi4MFjUo+WZEiwuYa9EXV8LicSal4nK8=;
        b=ibAZvABglz674+vkq+Bg9ZBNr4b8qEvDkuqMujqMOSw6ddF/W8wc3i7022OQjRycES
         L0vPwLqNMXJS8yun+PMmcZpS83t8y8Ky3PsGJRQ5W8h5WS7ee4amASq7jFse1XsXHNx9
         QPpnvVIh9v7FU2jko1ezTD5yHpdfcE56lQDdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741805354; x=1742410154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SU9eA8XTstbIi4MFjUo+WZEiwuYa9EXV8LicSal4nK8=;
        b=FxRVtJVI8pEyejg+WaQ05l8EQoBIUDJiiXGDSA+Pc7nRsqrEmUa26Le0u6SwxR/+Sc
         oXUYlthf50BFuM0ktvhilEuCAKQQCOCsJDMvsIWxp5eKqDRT6w5KHS2x7c3L/lN5ad0K
         +vkgRIlQPcKtFuyimNZOhl5hHPCvDFKAANlD3Y/hC0tRB4ES08wEpwz6jHr3IpVJSJS4
         s2OOJC8YVuShHSNiF9ZNHidnvokZHbHja7XvWpFCRk10KpuKtHOxmHJRGzCiGiYBMmyl
         dKIyBcff60sFltvZ5w9Dy70ZH+aV+lt6KWXYjFmO4urqhtteFmJtEMxsJhC7VnsH+fxT
         FeAw==
X-Forwarded-Encrypted: i=1; AJvYcCUVl/RMT1IUE7UMFjbbI6hOeyf9FDDOysE/vXfSWSxeOYmGhRQmRx4ED+hLDmj4Xqa6vW9mVgQK+3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8rj5FMgkWsokRWyAj1aNO7kzFjw8tR7lUATLRmF8JpcecD92f
	QDboDtwr1jcc4EjC8G99kOxF5vB/Akqk0arNIu3c7zViS0XJzygaE5XaI91/16mdyIuaSPOw9fC
	7VJeeM18u9+D5MUYvxODrBLpiG9EuDZJS+f3q
X-Gm-Gg: ASbGnctMC8OSptSu4W0eiZZ8+YH0jY4f0jCTah4Vi85YtTq2p6l8vUSILy1rFoJZbek
	3X3d/HMIokISvzqFaqazilL0sgyeol4P3BkZRl8KPQpJLAi31DMAXlEVOpPhga9m6sQkWdg8ifG
	ma/U7GCLpZJcqVxlgxLgN7aDoGCg==
X-Google-Smtp-Source: AGHT+IGvH0dqMXrkY7n5hJujCz7OuO/8hmt2UWjsgfjuLHqwUgRRurdzSX7a9KyPFKlVA/3gJSbDfmbKT4cpl4wY+rY=
X-Received: by 2002:a05:6512:4020:b0:549:5769:6aee with SMTP id
 2adb3069b0e04-54990e2be9dmr8011040e87.7.1741805353612; Wed, 12 Mar 2025
 11:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303200212.3294679-1-dualli@chromium.org> <20250303200212.3294679-3-dualli@chromium.org>
 <Z8-4SZv6plpyQUwf@google.com> <CANBPYPhR-C3VTv=ZHc1LJ0c7OG8-K2iGS62vXHmg9gcX0y89Cw@mail.gmail.com>
In-Reply-To: <CANBPYPhR-C3VTv=ZHc1LJ0c7OG8-K2iGS62vXHmg9gcX0y89Cw@mail.gmail.com>
From: Li Li <dualli@chromium.org>
Date: Wed, 12 Mar 2025 11:49:02 -0700
X-Gm-Features: AQ5f1JoYq5_VGpuvJ9bwTUUHGEFdrn9qYS1Sn08ly9dC1t7FWBEmJCr1XCpHboA
Message-ID: <CANBPYPg5i5PhqV0-1foaKwNOaoKNoit6-cLUAqNu=2S0AUp==w@mail.gmail.com>
Subject: Fwd: [PATCH v16 2/3] binder: report txn errors via generic netlink
To: Carlos Llamas <cmllamas@google.com>
Cc: "Cc:" <dualli@google.com>, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com, 
	donald.hunter@gmail.com, Greg KH <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, tkjos@android.com, 
	maco@android.com, "Joel Fernandes (Google)" <joel@joelfernandes.org>, brauner@kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, omosnace@redhat.com, shuah@kernel.org, arnd@arndb.de, 
	masahiroy@kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Simon Horman <horms@kernel.org>, tweek@google.com, LKML <linux-kernel@vger.kernel.org>, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, selinux@vger.kernel.org, 
	Hridya Valsaraju <hridya@google.com>, smoreland@google.com, ynaffit@google.com, 
	Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for resending this email. My email client was wrongly set to HTML mod=
e.

On Mon, Mar 10, 2025 at 9:13=E2=80=AFPM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> On Mon, Mar 03, 2025 at 12:02:11PM -0800, Li Li wrote:
> > From: Li Li <dualli@google.com>
> >
> > +/**
> > + * binder_find_proc() - find the binder_proc by pid
> > + * @pid:     the target process
> > + *
> > + * Returns the struct binder_proc if the pid is found, or NULL otherwi=
se.
> > + */
> > +static struct binder_proc *binder_find_proc(int pid)
> > +{
> > +     struct binder_proc *proc;
> > +
> > +     mutex_lock(&binder_procs_lock);
> > +     hlist_for_each_entry(proc, &binder_procs, proc_node) {
> > +             if (proc->pid =3D=3D pid)
> > +                     break;
>
> Wait... can't there be multiple binder_proc instances matching the same
> pid? I know that binder_proc is a bit of a misnomer but what should you
> do in such case? Shouldn't you set the flags in _all_ matching pids?
>
> Furthermore, there could be a single task talking on multiple contexts,
> so you could be returning the 'proc' that doesn't match the context that
> you are looking for right?
>

You're right. I should update this logic to search the process within a
certain binder_context only.

> > +     }
> > +     mutex_unlock(&binder_procs_lock);
> > +
> > +     return proc;
> > +}
> > +
> > +/**
> > + * binder_netlink_enabled() - check if binder netlink reports are enab=
led
> > + * @proc:    the binder_proc to check
> > + * @mask:    the categories of binder netlink reports
> > + *
> > + * Returns true if certain binder netlink reports are enabled for this=
 binder
> > + * proc (when per-process overriding takes effect) or context.
> > + */
> > +static bool binder_netlink_enabled(struct binder_proc *proc, u32 mask)
> > +{
> > +     struct binder_context *context =3D proc->context;
> > +
> > +     if (!genl_has_listeners(&binder_nl_family, &init_net, BINDER_NLGR=
P_REPORT))
> > +             return false;
> > +
> > +     if (proc->report_flags & BINDER_FLAG_OVERRIDE)
> > +             return (proc->report_flags & mask) !=3D 0;
> > +     else
> > +             return (context->report_flags & mask) !=3D 0;
> > +}
> > +
> > +/**
> > + * binder_netlink_report() - report one binder netlink event
> > + * @context: the binder context
> > + * @err:     copy of binder_driver_return_protocol returned to the sen=
der
> > + * @pid:     sender process
> > + * @tid:     sender thread
> > + * @to_pid:  target process
> > + * @to_tid:  target thread
> > + * @reply:   whether the binder transaction is a reply
> > + * @tr:              the binder transaction data
> > + *
> > + * Packs the report data into a binder netlink message and send it.
> > + */
> > +static void binder_netlink_report(struct binder_context *context, u32 =
err,
> > +                               u32 pid, u32 tid, u32 to_pid, u32 to_ti=
d,
>
> Instead of all these parameters, is there a way to pass the transaction
> itself? Isn't this info already populated there? I think it even holds
> the info you are looking for from the 'binder_transaction_data' below.
>

The binder_transaction_data doesn't include all of pid, tid, to_pid and to_=
tid.

> > +                               u32 reply,
> > +                               struct binder_transaction_data *tr)
> > +{
> > +     struct sk_buff *skb;
> > +     void *hdr;
> > +     int ret;
> > +
> > +     trace_binder_netlink_report(context->name, err, pid, tid, to_pid,
> > +                                 to_tid, reply, tr);
> > +
> > +     skb =3D genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
> > +     if (!skb) {
> > +             pr_err("Failed to alloc binder netlink message\n");
> > +             return;
> > +     }
> > +
> > +     hdr =3D genlmsg_put(skb, 0, atomic_inc_return(&context->report_se=
q),
> > +                       &binder_nl_family, 0, BINDER_CMD_REPORT);
> > +     if (!hdr)
> > +             goto free_skb;
> > +
> > +     if (nla_put_string(skb, BINDER_A_REPORT_CONTEXT, context->name) |=
|
> > +         nla_put_u32(skb, BINDER_A_REPORT_ERR, err) ||
> > +         nla_put_u32(skb, BINDER_A_REPORT_FROM_PID, pid) ||
> > +         nla_put_u32(skb, BINDER_A_REPORT_FROM_TID, tid) ||
> > +         nla_put_u32(skb, BINDER_A_REPORT_TO_PID, to_pid) ||
> > +         nla_put_u32(skb, BINDER_A_REPORT_TO_TID, to_tid) ||
> > +         nla_put_u32(skb, BINDER_A_REPORT_REPLY, reply) ||
> > +         nla_put_u32(skb, BINDER_A_REPORT_FLAGS, tr->flags) ||
> > +         nla_put_u32(skb, BINDER_A_REPORT_CODE, tr->code) ||
> > +         nla_put_u32(skb, BINDER_A_REPORT_DATA_SIZE, tr->data_size))
> > +             goto cancel_skb;
> > +
> > +     genlmsg_end(skb, hdr);
> > +
> > +     ret =3D genlmsg_multicast(&binder_nl_family, skb, 0, BINDER_NLGRP=
_REPORT, GFP_KERNEL);
>
> Thanks for switching to multicast. On this topic, we can only have a
> single global configuration at a time correct? e.g. context vs per-proc.
> So all listeners would ahve to work with the same setup?
>

We only have a single global configuration, which can include both
context and proc setup.
Yes, all listeners work with the same setup as we have only one
multicast group defined.
The user space code can demux it by checking the context field of the
netlink messages.

> > +     if (ret < 0)
> > +             pr_err("Failed to send binder netlink message: %d\n", ret=
);
>
> nit: can you please add an emtpy new line before the return?
>

Sure.

> > @@ -7013,6 +7231,11 @@ static int __init binder_init(void)
> >       if (ret)
> >               goto err_init_binder_device_failed;
> >
> > +     ret =3D genl_register_family(&binder_nl_family);
> > +     if (ret) {
>
> You don't undo init_binderfs() here? If that seems hard, then you can
> move up the genl registration instead, leaving init_binderfs() last.
> However, you would need to then undo the genl_register_family() call I
> suppose.
>

The current logic allows binder driver to continue working even if
genl_register_family
fails. But your suggestion makes sense. I'll move it up and undo it if
anything fails.

> > +TRACE_EVENT(binder_netlink_report,
> > +     TP_PROTO(const char *name, u32 err, u32 pid, u32 tid, u32 to_pid,
> > +              u32 to_tid, u32 reply, struct binder_transaction_data *t=
r),
>
> Similarly here I think you could get away with passing 'struct
> binder_transaction' instead of all the individual fields.
>

Same as above, the pid/tid fields are not in the struct
binder_transaction (or redacted for oneway txns).
