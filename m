Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A0B207679
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734375505; cv=none; b=GC/Myc1nbn7gaXH1Ll9guJqfVlJuVxLFnIrgRMuWQIik76u9l/D+B2MlVxnHB7lqm6jufMJN2zLiHZJrVgiM6H/AjPUd7jIJ+yzimxNgKpdas2XMOjdSSqN7qIvU8dkUS5hIWjGURcT0GRBiC75RuvjGCQJ1YY2uWnjGn2sFGQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734375505; c=relaxed/simple;
	bh=SV3LQEGL/hN47W8AIErH56BEHP30IF73FmJb8pNKbK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLAmFFh22WJqdZ/gqBoKxDUzJ1fkUqj3853EYA3CyVc51qF7RanOFzKyqAL9FKX6EtxrzHZWa6bvKJBJrZ+c9HQgVd8MIy7qxegm59PGKT1PAgDHQDX3TruTprtO9H4ZqUMTaCaHw1R846byouQf+Fq5BN0DCPhsEWtbImBi1Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ry4SSsp/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ry4SSsp/"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401c68b89eso4839329e87.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 10:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734375502; x=1734980302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzLRRgSYQAZ/LGhu2QHm86mP47vUyI0NVq1+fminqCk=;
        b=Ry4SSsp/7VBMUsRMouTGw/UurnFk8Lxo893/GXTbrbDY15AzlicWBWcTnSKw8yysb3
         vQmFJKuLzSZXGhfN5HRzl5FnkQKr5kqCuneX5FQPB4hHhlruDIkF2NDP4g007vj5QDr8
         qLkPrR/x8TXyExoSva4XyBJjeDHBtDWv3pHUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734375502; x=1734980302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzLRRgSYQAZ/LGhu2QHm86mP47vUyI0NVq1+fminqCk=;
        b=ecv68UEJrZ8ME5INtSfJPPxpaohgdZScdNlwR7SpaHZA36s5CSQCzZ1sdvf57DCtav
         490N4obmmOMI4xJMgtEK9RQYwQWgHz8YHJJyI3bk8uqqyqXrtN0qaiwWAoJjwCWwSbDw
         ziYDmfsZAXvJdDHVL/Yy6zba+Buv7UbF6Zd9O40z5ELABO834Kxgjunc6wr0yIDPBFIz
         idCxTspCL0PHCOm8EFSZ14SFx2ZoW2jY1s9rewPmqSSEl77NxHgGoziSazdz1jaC34LX
         s084jo40Uj2EZx5xBKI6fC7FcNthxLm3CcYcra27lMwXkK9dpQMEleraBth2wZrQxvzD
         aK0w==
X-Forwarded-Encrypted: i=1; AJvYcCXOUIH9Tze9DAFK2feMDLqrXBoh8+p8NWN6tRNuAXl932/UKIyQNtp3Hd1jSeqzXdiludqFK2UARlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmdUfqYzzAcEQxBN2Nri7m7wttkJGj3ZRXvUFvCOoMBsiJo7WK
	nkRCwm/EuXYwX88DGzPnxknkPhNTfJuxEgMY1Rxd1fy+miM20mx7EQvcpjwFikFDmBBzTt7N1Ot
	6UlnZQI0IhFajhUvTX3O40/ef0jqIUFNmJz5W
X-Gm-Gg: ASbGncsRVoAVYFJVzGvQsHH73luwUXEaAsQ/21h5AOlaSksCQ40BKDqcqmUKTFa8Le5
	tgto7pHFj5gTx69hHAR43M7D80wseTyRIx7y6Og==
X-Google-Smtp-Source: AGHT+IGMcETnavPEQXH8jvNLA+aG8u1ChCxl9+noimfdpLvWFaGfKMRKYUnalnnaiR2BYuqbdP6Hwsq/S3/avpzeJSk=
X-Received: by 2002:a05:6512:b11:b0:541:3175:1bc8 with SMTP id
 2adb3069b0e04-54131751e17mr71296e87.20.1734375501655; Mon, 16 Dec 2024
 10:58:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212224114.888373-1-dualli@chromium.org> <20241212224114.888373-3-dualli@chromium.org>
 <Z2BtgqkPUZxE8B83@google.com>
In-Reply-To: <Z2BtgqkPUZxE8B83@google.com>
From: Li Li <dualli@chromium.org>
Date: Mon, 16 Dec 2024 10:58:10 -0800
Message-ID: <CANBPYPhZ-_5=VMRoBxbfVb+AFb_qu49QH_hKOiSjX93E1GQA8A@mail.gmail.com>
Subject: Re: [PATCH net-next v10 2/2] binder: report txn errors via generic netlink
To: Carlos Llamas <cmllamas@google.com>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, surenb@google.com, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 10:12=E2=80=AFAM Carlos Llamas <cmllamas@google.com=
> wrote:
>
> On Thu, Dec 12, 2024 at 02:41:14PM -0800, Li Li wrote:
> > ---
> >  Documentation/admin-guide/binder_genl.rst     | 110 ++++++++
>
> Thanks for renaming to "Binder Netlink" this seems much better IMO.
> Also, I belive the documentation should also be binder_netlink.rst in
> such case?
>

Will also change it.

> > +++ b/Documentation/netlink/specs/binder_netlink.yaml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3=
-Clause)
>
> I think you need a Copyright for this. I'm not sure if it would also be
> needed for the Documentation though.
>

Hmm, all other yaml files follow the same code style.

Netlink experts, can you please clarify this?

> > +/**
> > + * binder_find_proc() - set binder report flags
>
> the description of "binder report flags" is no longer accurate here.

Good catch! Will fix that.

>
> > + * @pid:     the target process
> > + */
> > +static struct binder_proc *binder_find_proc(int pid)
> > +{
> > +     struct binder_proc *proc;
> > +
> > +     mutex_lock(&binder_procs_lock);
> > +     hlist_for_each_entry(proc, &binder_procs, proc_node) {
> > +             if (proc->pid =3D=3D pid) {
> > +                     mutex_unlock(&binder_procs_lock);
> > +                     return proc;
>
> fwiw, the for_each stops when proc is NULL, so you can just break and
> return proc everytime. e.g.:
>
>         mutex_lock(&binder_procs_lock);
>         hlist_for_each_entry(proc, &binder_procs, proc_node) {
>                 if (proc->pid =3D=3D pid)
>                         break;
>         }
>         mutex_unlock(&binder_procs_lock);
>
>         return proc;
>

Got it. Thx

> >  /**
> >   * struct binder_device - information about a binder device node
> > - * @hlist:          list of binder devices (only used for devices requ=
ested via
> > - *                  CONFIG_ANDROID_BINDER_DEVICES)
> > + * @hlist:          list of binder devices
>
> This is the hunk that needs to go on the first 1/2 patch.

Sure.

> >  /**
> > diff --git a/drivers/android/binder_netlink.c b/drivers/android/binder_=
netlink.c
> > new file mode 100644
> > index 000000000000..2081b4319268
> > --- /dev/null
> > +++ b/drivers/android/binder_netlink.c
> > @@ -0,0 +1,39 @@
> > +// SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-=
3-Clause)
> > +/* Do not edit directly, auto-generated from: */
> > +/*   Documentation/netlink/specs/binder_netlink.yaml */
> > +/* YNL-GEN kernel source */
> > +
> > +#include <net/netlink.h>
> > +#include <net/genetlink.h>
> > +
> > +#include "binder_netlink.h"
> > +
> > +#include <uapi/linux/android/binder_netlink.h>
> > +
> > +/* BINDER_NETLINK_CMD_REPORT_SETUP - do */
> > +static const struct nla_policy binder_netlink_report_setup_nl_policy[B=
INDER_NETLINK_A_CMD_FLAGS + 1] =3D {
> > +     [BINDER_NETLINK_A_CMD_CONTEXT] =3D { .type =3D NLA_NUL_STRING, },
> > +     [BINDER_NETLINK_A_CMD_PID] =3D { .type =3D NLA_U32, },
> > +     [BINDER_NETLINK_A_CMD_FLAGS] =3D NLA_POLICY_MASK(NLA_U32, 0xf),
> > +};
> > +
> > +/* Ops table for binder_netlink */
> > +static const struct genl_split_ops binder_netlink_nl_ops[] =3D {
>
> not: There are several places where you have "netlink_nl" which seems
> kind of redundant to me. wdyt? IMO you should drop the "nl" in all of
> these cases.
>

These are automatically generated from the yaml file. So let's just
keep them as is.
But it's a good suggestion to the owner of yaml parser.
