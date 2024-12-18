Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25AD4690;
	Wed, 18 Dec 2024 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734539362; cv=none; b=LZtUYHda5wQfnBYAmlkIU2lXmlcaEG6R1xM3k4iI7qRd5B/e7OHr74Wu3+VJsHO8h81m2TM06hxJdoBoyZpr9h1zCbMGsJNt6ndmUg52VGu4d7vXTtGk3XVpnRWxE/d7d3yUjPoDtWEh/IoRga/aVjiVHTXs/rAzaclVShsJiYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734539362; c=relaxed/simple;
	bh=v46VkEvF2XCdLAG/kLfE4ZYgEPbSof2yAmTVrSWQZyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NiZYqjYJRKPvkfYIAFJPQ4+PmchyMOr+dci0T0bzyRQ5yK4Ba/5YJy9fNJPKnn5nmjrcJHxOip456ayRlAw+X4q7D0ig7PV/GIeY3DvhP24BtsWzjYR9Lri8q451v4UFyR9SeRg1zwe4iWHV//7IJPDFznacipCUH2KzDuE25Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brJSOzXZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brJSOzXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67759C4CEDF;
	Wed, 18 Dec 2024 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734539361;
	bh=v46VkEvF2XCdLAG/kLfE4ZYgEPbSof2yAmTVrSWQZyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=brJSOzXZYa2rAZ1u76pplLLBFCG7Wg4EcMMxWaMFDV7k3Y/Bb10JPN9UiChuPtnHV
	 GqcberRhhztwQkZpuWl+pZDtrKUXatYZOnDu6iFXkgvy6arrli6MAdRHqJeMgDvrtu
	 Kg+oHV7X3eX996P6PxhFokIJ4grKYmhAjyYsJ/l3ZMCoFjfq+5aFu+R3DjfC/EixbZ
	 PD8mBTwyvfRprTYJNEocGyC6jK0jT30dhVJDkzm21hvH1ZpZYSt4GkVTgofBFO1X/n
	 3scrcU+c99dzQV636GJC5VdKIinyJnyRLdbJWjV8VbDn/Ci7eQWVJ3o3kDJTnxLP2e
	 Gz4twKcvWfIZQ==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e3a0acba5feso4791917276.2;
        Wed, 18 Dec 2024 08:29:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU725PEOu7Gs+fvwA+4jH1KLKN6c4WXCvHyMalCu8YyZTa+azwYbQ/6YLDC+oTbal7OQOdFiU+Dg9Vi@vger.kernel.org, AJvYcCVhntJxaN7wXBBbs5TMOvqT3ir4fdbc84WFeC6n5o7kd6/xvVHTT7izTNspMcdsrOigzARt9QwWzGMTZzcc@vger.kernel.org, AJvYcCXi7R4tR8AeMdKThYletHur3DeYrmmT85cOLm4V+buJcYzqQDsFCSwNuU6MC2Xf3WZbvyGqXuGQ+MDN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92koHWNSDk9lkrqXV5muAZhCiOr8aG6kvnXahCsQBr/iEGIiD
	8VIYx+t40ozjGH4aQ+e1dKVQ1WoXgn8P3BzehTl/qXBKuGZ2yMJFP98b5bhhxhT12l5kUEBbnAN
	9KovjbZhD0ulG9SLAh/NK1qJwTw==
X-Google-Smtp-Source: AGHT+IHB21i+vEJwjKeS9tzZq5LUDb6CR91yRVDS6nbc/W437gxtybw5tYweKLSc7Uogx4veLw7GodstYm9PdIL4FWE=
X-Received: by 2002:a05:6902:1a48:b0:e48:6cf9:4716 with SMTP id
 3f1490d57ef6-e536215064dmr3005330276.25.1734539360545; Wed, 18 Dec 2024
 08:29:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217183711.2525863-1-robh@kernel.org> <Z2K_u6jK5aLDqaam@pathway.suse.cz>
In-Reply-To: <Z2K_u6jK5aLDqaam@pathway.suse.cz>
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Dec 2024 10:29:09 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0Gd=-U-99KFHwkKJ7LRyMG+jL5z3xXdczB2QP63EpGw@mail.gmail.com>
Message-ID: <CAL_Jsq+0Gd=-U-99KFHwkKJ7LRyMG+jL5z3xXdczB2QP63EpGw@mail.gmail.com>
Subject: Re: lock in vsprintf(): was: Re: [PATCH] of: Add printf '%pOFm' for
 generating modalias
To: Petr Mladek <pmladek@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jonathan Corbet <corbet@lwn.net>, Saravana Kannan <saravanak@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, John Ogness <john.ogness@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 6:27=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> Adding Linus and some other guys into Cc.
>
> My concern is taking a lock when processing a printf format, see
> below for more details.
>
> On Tue 2024-12-17 12:37:09, Rob Herring (Arm) wrote:
> > The callers for of_modalias() generally need the module alias as part o=
f
> > some larger string. That results in some error prone manipulation of th=
e
> > buffer prepend/append the module alias string. In fact,
> > of_device_uevent_modalias() has several issues. First, it's off by one
> > too few characters in utilization of the full buffer. Second, the error
> > paths leave OF_MODALIAS with a truncated value when in the end nothing
> > should be added to the buffer. It is also fragile because it needs
> > internal details of struct kobj_uevent_env. add_uevent_var() really
> > wants to write the env variable and value in one shot which would need
> > either a temporary buffer for value or a format specifier.
> >
> > Fix these issues by adding a new printf format specifier, "%pOFm". With
> > the format specifier in place, simplify all the callers of
> > of_modalias(). of_modalias() can also be simplified with vsprintf()
> > being the only caller as it avoids the error conditions.
> >
> > Cc: Zijun Hu <quic_zijuhu@quicinc.com>
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  Documentation/core-api/printk-formats.rst |  1 +
> >  drivers/of/device.c                       | 25 ++--------------
> >  drivers/of/module.c                       | 35 +++++------------------
> >  drivers/of/unittest.c                     |  2 ++
> >  include/linux/of.h                        |  8 +++---
> >  lib/vsprintf.c                            |  7 +++--
> >  6 files changed, 22 insertions(+), 56 deletions(-)
> >
> > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/=
core-api/printk-formats.rst
> > index ecccc0473da9..d72fe3d8c427 100644
> > --- a/Documentation/core-api/printk-formats.rst
> > +++ b/Documentation/core-api/printk-formats.rst
> > @@ -496,6 +496,7 @@ equivalent to %pOFf.
> >       - F - device node flags
> >       - c - major compatible string
> >       - C - full compatible string
> > +     - m - module alias string
> >
> >  The separator when using multiple arguments is ':'
> >
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index edf3be197265..ae8c47d5db8e 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -256,24 +251,10 @@ EXPORT_SYMBOL_GPL(of_device_uevent);
> >
> >  int of_device_uevent_modalias(const struct device *dev, struct kobj_ue=
vent_env *env)
> >  {
> > -     int sl;
> > -
> >       if ((!dev) || (!dev->of_node) || dev->of_node_reused)
> >               return -ENODEV;
> >
> > -     /* Devicetree modalias is tricky, we add it in 2 steps */
> > -     if (add_uevent_var(env, "MODALIAS=3D"))
> > -             return -ENOMEM;
> > -
> > -     sl =3D of_modalias(dev->of_node, &env->buf[env->buflen-1],
> > -                      sizeof(env->buf) - env->buflen);
> > -     if (sl < 0)
> > -             return sl;
> > -     if (sl >=3D (sizeof(env->buf) - env->buflen))
> > -             return -ENOMEM;
> > -     env->buflen +=3D sl;
> > -
> > -     return 0;
> > +     return add_uevent_var(env, "MODALIAS=3D%pOFm", dev->of_node);
>
> The proposed %pOFm format takes a lock inside. It calls:
>
> size_t of_modalias(const struct device_node *np, char *str, size_t len)
> {
> [...]
>         csize =3D snprintf(str, len, "of:N%pOFn%c%s", np, 'T',
>                          of_node_get_device_type(np));
> [...]
>
> which calls:
>
>   + of_node_get_device_type()
>     + of_get_property()
>       + of_find_property()
>
> , where
>
> struct property *of_find_property(const struct device_node *np,
>                                   const char *name,
>                                   int *lenp)
> {
> [...]
>         raw_spin_lock_irqsave(&devtree_lock, flags);
>         pp =3D __of_find_property(np, name, lenp);
>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
> [...]   return pp;
>
> I personally think that taking locks when formatting string is
> a way to hell.
>
> In this case, add_uevent_var() is lockless so that it should not
> cause any problem. But just imagine that it does:
>
> int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...)
> {
>
>         some_lock();
>
>         va_start(args, format);
>         len =3D vsnprintf(&env->buf[env->buflen],
>                         sizeof(env->buf) - env->buflen,
>                         format, args);
>         va_end(args);
>
>         some_unlock();
>
>         return 0;
> }
>
> Would anyone consider that the vsprintf() here might need to take a lock?
>
> Also, the format might be used in printk(). We put a huge effort into
> creating a lockless ringbuffer and safe console locking. I would
> really appreciate to avoid any locking in the formatting part.
>
>
> That said, we already have a precedent. "%pOFf" might take a lock,
> for example, via:
>
>   + fwnode_full_name_string()

If this doesn't take the DT spinlock, it is a bug (though next to 0
chance of hitting it). Getting the full path requires walking parent
nodes which should take the spinlock (See of_get_parent()). I think we
discussed this issue when this got converted to fwnode API...

The compatible format specifiers also take the lock... Those are
somewhat rarely used IIRC, so perhaps could get rid of them if "no
locks allowed" becomes the rule and we ignore the issue for getting
parent nodes.

>     + fwnode_handle_put()
>       + of_fwnode_put()
>         + of_node_put()
>           + kobject_put()
>             + kref_put()
>               + schedule_delayed_work()
>                 + queue_delayed_work()
>                   + queue_delayed_work_on()
>                     + __queue_delayed_work()
>                       + add_timer_on()
>                         + add_timer_on()
>                           + lock_timer_base()
>                            + raw_spin_lock_irqsave(&base->lock, *flags);
>
> But this would happen only when the last reference is released
> when formatting the string which is kind of corner case.

I would also consider a put that goes to 0 a bug. A caller using the
format strings should hold a ref to the node already.

Rob
