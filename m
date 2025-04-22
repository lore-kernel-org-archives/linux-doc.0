Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5743C1EE039
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308261; cv=none; b=l/4QWyzyjlZkRo7I21tV8ihvp/8ZVj/Z8Cqo2aJysmqI6ksopO5UzF8NJW0YnQuSn+lP0kOcpMW+/i7RX+/IOHNli1BINZA58EQNwDW3gLT3fka3r7I4f7O6d0LkLw61oXD9q4jCQc+nU6crstTKNXvY/RQAZ6v/5kG9IQ50qj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308261; c=relaxed/simple;
	bh=K5TlSpgCezwrkhpJYXKHq+tO3s/fMaFlpuKCXnES4pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHrTmUHHpvNETPhl3dM7HkPNJe3PfbnJVXNf6es6sbhTETsiFxjqFzqcF6NCJoe5oL25afL6IWcwyKtjh9uWDXSiiCYDUXufrSwjZFImFsVWw9vMxISeDzvdtgWCtc6JrPGK5n4HPYCo01UsphA/FF2kIQXndTeiawZ5jt+ML8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CDcQcU9f; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CDcQcU9f"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-31062172698so50422441fa.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745308257; x=1745913057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVtxQ5LUW5yEW/YQ3syV6ferQWM3qh8TOAVJvyrjx5U=;
        b=CDcQcU9fqw5CUPbHmPgbNNiWawKd9plqa7buFGHuQ4J4PAw6ElZfNDnvGh33n0xJ6w
         vkpA1Q/3H05b78eAl3bDqCi7l0SVw08M4Ukbz3qU2BSDNiuIypa3KH7s9J7qBHGycIMu
         O77yGkNh2gji3JXQ9IuwjRajJsqRSXtW8g108=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308257; x=1745913057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVtxQ5LUW5yEW/YQ3syV6ferQWM3qh8TOAVJvyrjx5U=;
        b=vMIFbqO4u6Yxfl9d/VBap6ga9a5cvc/K/TqqV5SassXnZX+mrb2kmG0s3HQCkNUDXK
         s0y0dIhSPufXm7d49qeprl71aFiGKDb6fiZ53YOno0SB0HMi8hXApuOQhch3aY8GDkds
         9gvQ2RMgX8PwkBAxyrlOTHLtMWdC6G+U9r3MSshPt2+ULthZmXbO9XabIbX6dndI9Uo0
         jSPS71DYcN5Xigr4439pP6t7M77DfJ9DlhIsb/15PHWs4abfry9OFMQpQP+DhpFbyzFC
         C1m9A+Am0R+fYqSIb4ExHeiuhzPjXBPybzIlit5mJJaY2yCv4tuAWrbQj8Y4owQW2dRv
         cr0g==
X-Forwarded-Encrypted: i=1; AJvYcCVO9Tly+f5/y1rK9p5qKk+Ln4qyCbIiznHrnajrji4mSCshIQKUvo9RIo4Pptb5GW53SJKMQIEwiZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1mancOSbPlP3ibsF7Ljm0HpW2Wy7mSrrrRC0a4sayTv2EymN4
	7Mju0S0TvBINL98df6Jix6Bwgd70v1LTDcjdt9fQ7bND9meKTBGkBAjihiJI/LhJAV1xBTsGttL
	S9QJeTogk252OPBGl9XPzu9AzloKEUV9ug2n7
X-Gm-Gg: ASbGncta3Uab/nRY+s99PhtMREszJmuvA7yrzLvYYMoPodmnVUAuNLJMondyeeL6NWy
	ADagZtRQ90l0OFVoUeqRKqx7fY4YGaevVlaQaVDpphT2tC2Sl6AaGgxbjIApSut8Fe/iUy5/2cg
	SC8Up1U2lI9Dga1SE/0j9yoQ==
X-Google-Smtp-Source: AGHT+IFPA4dv+dbrXeIzAKpqrKSn5BCK2fHkI/VLTpZHnfC+Xq7droe2PGrPiys1O9W8TcXVW9eFgX7YcqOBoAKvJPM=
X-Received: by 2002:a05:651c:1549:b0:30b:b7c3:ea4d with SMTP id
 38308e7fff4ca-310904d5e02mr40566621fa.12.1745308257345; Tue, 22 Apr 2025
 00:50:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417002005.2306284-1-dualli@chromium.org> <20250417002005.2306284-3-dualli@chromium.org>
 <20250421151713.GP2789685@horms.kernel.org>
In-Reply-To: <20250421151713.GP2789685@horms.kernel.org>
From: Li Li <dualli@chromium.org>
Date: Tue, 22 Apr 2025 00:50:46 -0700
X-Gm-Features: ATxdqUEmRjx_0GfVjTB3Oy_Zp0rhgonSUtQpFQWgKnZpJ6xpRZ9C4PjIWcwSQOE
Message-ID: <CANBPYPhbzDqijP2verfDTFpSp3aKFY59pJzXk9FnALM=0U_yjw@mail.gmail.com>
Subject: Re: [PATCH RESEND v17 2/3] binder: report txn errors via generic netlink
To: Simon Horman <horms@kernel.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, cmllamas@google.com, surenb@google.com, 
	omosnace@redhat.com, shuah@kernel.org, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, tweek@google.com, paul@paul-moore.com, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, ynaffit@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 8:17=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Wed, Apr 16, 2025 at 05:20:03PM -0700, Li Li wrote:
> > From: Li Li <dualli@google.com>
> >
> > Introduce generic netlink messages into the binder driver so that the
> > Linux/Android system administration processes can listen to important
> > events and take corresponding actions, like stopping a broken app from
> > attacking the OS by sending huge amount of spamming binder transactions=
.
> >
> > The binder netlink sources and headers are automatically generated from
> > the corresponding binder netlink YAML spec. Don't modify them directly.
> >
> > Signed-off-by: Li Li <dualli@google.com>
>
> Hi Li Li,
>
> > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
>
> ...
>
> >  static void binder_transaction(struct binder_proc *proc,
> >                              struct binder_thread *thread,
> >                              struct binder_transaction_data *tr, int re=
ply,
> > @@ -3683,10 +3764,14 @@ static void binder_transaction(struct binder_pr=
oc *proc,
> >               return_error_line =3D __LINE__;
> >               goto err_copy_data_failed;
> >       }
> > -     if (t->buffer->oneway_spam_suspect)
> > +     if (t->buffer->oneway_spam_suspect) {
> >               tcomplete->type =3D BINDER_WORK_TRANSACTION_ONEWAY_SPAM_S=
USPECT;
> > -     else
> > +             if (binder_netlink_enabled(proc, BINDER_FLAG_SPAM))
> > +                     binder_netlink_report(context, BR_ONEWAY_SPAM_SUS=
PECT,
> > +                                           reply, t);
> > +     } else {
> >               tcomplete->type =3D BINDER_WORK_TRANSACTION_COMPLETE;
> > +     }
> >       t->work.type =3D BINDER_WORK_TRANSACTION;
> >
> >       if (reply) {
> > @@ -3736,8 +3821,12 @@ static void binder_transaction(struct binder_pro=
c *proc,
> >                * process and is put in a pending queue, waiting for the=
 target
> >                * process to be unfrozen.
> >                */
> > -             if (return_error =3D=3D BR_TRANSACTION_PENDING_FROZEN)
> > +             if (return_error =3D=3D BR_TRANSACTION_PENDING_FROZEN) {
> >                       tcomplete->type =3D BINDER_WORK_TRANSACTION_PENDI=
NG;
> > +                     if (binder_netlink_enabled(proc, BINDER_FLAG_ASYN=
C_FROZEN))
> > +                             binder_netlink_report(context, return_err=
or,
> > +                                                   reply, t);
> > +             }
> >               binder_enqueue_thread_work(thread, tcomplete);
> >               if (return_error &&
> >                   return_error !=3D BR_TRANSACTION_PENDING_FROZEN)
> > @@ -3799,6 +3888,10 @@ static void binder_transaction(struct binder_pro=
c *proc,
>
> The code preceding this hunk looks like this:
>
> err_alloc_tcomplete_failed:
>         if (trace_binder_txn_latency_free_enabled())
>                 binder_txn_latency_free(t);
>         kfree(t);
>         binder_stats_deleted(BINDER_STAT_TRANSACTION);
> err_alloc_t_failed:
> err_bad_todo_list:
> err_bad_call_stack:
> err_empty_call_stack:
> err_dead_binder:
> err_invalid_target_handle:
>         if (target_node) {
>                 binder_dec_node(target_node, 1, 0);
>                 binder_dec_node_tmpref(target_node);
>         }
>
> 1. The labels err_bad_todo_list, err_bad_call_stack,
>    err_empty_call_stack, and err_invalid_target_handle may
>    be jumped to before t is initialised.
>
> 2. In the err_alloc_tcomplete_failed label t is kfree'd.
>
> However, the call to binder_netlink_report below will dereference t.
>
> Flagged by Smatch.
>

Thank you for flagging this! Let me double check the lifecycle of t.

> >               binder_dec_node_tmpref(target_node);
> >       }
> >
> > +     if (binder_netlink_enabled(proc, BINDER_FLAG_FAILED))
> > +             binder_netlink_report(context, return_error,
> > +                                   reply, t);
> > +
> >       binder_debug(BINDER_DEBUG_FAILED_TRANSACTION,
> >                    "%d:%d transaction %s to %d:%d failed %d/%d/%d, code=
 %u size %lld-%lld line %d\n",
> >                    proc->pid, thread->pid, reply ? "reply" :
>
> ...
>
> > +/**
> > + * binder_nl_report_setup_doit() - netlink .doit handler
> > + * @skb:     the metadata struct passed from netlink driver
> > + * @info:    the generic netlink struct passed from netlink driver
> > + *
> > + * Implements the .doit function to process binder netlink commands.
> > + */
> > +int binder_nl_report_setup_doit(struct sk_buff *skb, struct genl_info =
*info)
> > +{
> > +     struct binder_context *context =3D NULL;
> > +     struct binder_device *device;
> > +     struct binder_proc *proc;
> > +     u32 flags, pid;
> > +     bool found;
> > +     void *hdr;
> > +     int ret;
> > +
> > +     ret =3D security_binder_setup_report(current_cred());
> > +     if (ret < 0) {
> > +             NL_SET_ERR_MSG(info->extack, "Permission denied");
> > +             return ret;
> > +     }
> > +
> > +     if (nla_len(info->attrs[BINDER_A_CMD_CONTEXT])) {
> > +             /* Search the specified binder context */
> > +             hlist_for_each_entry(device, &binder_devices, hlist) {
> > +                     if (!nla_strcmp(info->attrs[BINDER_A_CMD_CONTEXT]=
,
> > +                                     device->context.name)) {
> > +                             context =3D &device->context;
> > +                             break;
> > +                     }
> > +             }
> > +
> > +             if (!context) {
> > +                     NL_SET_ERR_MSG(info->extack, "Invalid binder cont=
ext");
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +
> > +     pid =3D nla_get_u32(info->attrs[BINDER_A_CMD_PID]);
> > +     flags =3D nla_get_u32(info->attrs[BINDER_A_CMD_FLAGS]);
> > +
> > +     if (!pid) {
> > +             if (!context) {
> > +                     NL_SET_ERR_MSG(info->extack,
> > +                                    "Invalid binder context and pid");
> > +                     return -EINVAL;
> > +             }
> > +
> > +             /* Set the global flags for the whole binder context */
> > +             context->report_flags =3D flags;
> > +     } else {
> > +             /* Set the per-process flags */
> > +             found =3D false;
> > +             mutex_lock(&binder_procs_lock);
> > +             hlist_for_each_entry(proc, &binder_procs, proc_node) {
> > +                     if (proc->pid =3D=3D pid
> > +                         && (proc->context =3D=3D context || !context)=
) {
> > +                             proc->report_flags =3D flags;
> > +                             found =3D true;
> > +                     }
> > +             }
> > +             mutex_unlock(&binder_procs_lock);
> > +
> > +             if (!found) {
> > +                     NL_SET_ERR_MSG_FMT(info->extack,
> > +                                        "Invalid binder report pid %u"=
,
> > +                                        pid);
> > +                     return -EINVAL;
> > +             }
> > +     }
>
> Within the above conditions it is assumed that context may be NULL.
>
> > +
> > +     skb =3D genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
> > +     if (!skb) {
> > +             pr_err("Failed to alloc binder netlink reply message\n");
> > +             return -ENOMEM;
> > +     }
> > +
> > +     hdr =3D genlmsg_iput(skb, info);
> > +     if (!hdr)
> > +             goto free_skb;
> > +
> > +     if (nla_put_string(skb, BINDER_A_CMD_CONTEXT, context->name) ||
>
> But here context is dereferenced unconditionally.
> This does not seem consistent.
>
> Flagged by Smatch.
>

Indeed, I should use proc->context->name here.


> > +         nla_put_u32(skb, BINDER_A_CMD_PID, pid) ||
> > +         nla_put_u32(skb, BINDER_A_CMD_FLAGS, flags))
> > +             goto cancel_skb;
> > +
> > +     genlmsg_end(skb, hdr);
> > +
> > +     if (genlmsg_reply(skb, info)) {
> > +             pr_err("Failed to send binder netlink reply message\n");
> > +             return -EFAULT;
> > +     }
> > +
> > +     return 0;
> > +
> > +cancel_skb:
> > +     pr_err("Failed to add reply attributes to binder netlink message\=
n");
> > +     genlmsg_cancel(skb, hdr);
> > +free_skb:
> > +     pr_err("Free binder netlink reply message on error\n");
> > +     nlmsg_free(skb);
> > +     ret =3D -EMSGSIZE;
> > +
> > +     return ret;
> > +}
>
> ...
