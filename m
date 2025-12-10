Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4001B2459FD
	for <linux-doc@vger.kernel.org>; Wed, 10 Dec 2025 06:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765348456; cv=none; b=PlykXdbxSPBpVJxQiWFsB0Fyes9skNT+AOlEXx5XHCOymULDRRqFQCfCaajJMCZxyhR/1S5j8kQt91vfzbKIaDZ06/4Z7sHLR6oIN72HcqUnla13IJkpUy6ixRBSA0go/oq9iBTk9L4KBXbwt00SXTbDdoZzq/+GHEZHrWpAS2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765348456; c=relaxed/simple;
	bh=B4Z7RcgnFFc74WJWUTPXknshhpD4++4oh9ox0olyT0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6xJoKCquNa8VLI3RenxGBPLwM77p3TDHIdz2K38t4qOtqujSIaFWzawowEmrWM9Qlh/MC/B6sRZi7GIqF40+jBZGP8UN6PXCQOA91D+hu83L49IYo/osz8wAxknQZ7q/nfOaj1EYII0jgla/hTJwODGJmRTZXynuGZFa0ahiIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGlBenjI; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGlBenjI"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6443bc360bdso5404984d50.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 22:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765348453; x=1765953253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPYSmj3nUU3qbQUbub7stHY6ioeYz9em6X0ByWKrVW4=;
        b=XGlBenjIV2QN5vKVlLO2N8saYK1Fpub+YAmCQk7oKBxvUwIcA8fdEVw+f20/8cb9Pb
         S4c4vPgOt9zXXCZjqTayPx+IPvxCEI0cPXErOeh9d+Oke5N7gUHnFLqNgng1o0pz+sUh
         Yx+w2kZqlHmZr4EFIxjz9FUgbogboUVpaokxg7fVER6TXhqEetoFu6vh5/M7lQI+x5bn
         /74g5qw7Wtpi4qkpz+5QNam8iQalUoR9Ufl4eOncIw+YGqqeznLoYUpaEC1gvn9VLGb7
         D/CyKfOvkhLa9TWpOP6buhpoJzd0sTj4+mj8vQxkaI5YEWcjdiIxxUuc3noerGKzc0C3
         BCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765348453; x=1765953253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gPYSmj3nUU3qbQUbub7stHY6ioeYz9em6X0ByWKrVW4=;
        b=nvJ7ZH8fgGA2NvsyCeUyaOFHWmEa1uK/WG9ZamW81wY7daPP3NGIV9GLDubEQy1gkG
         JGMQ7piupvLjTafvUcoNXlF5DTf/GidP98OVfYaT4HTO3cuWRqdex57aM9EEN0f6mbiX
         1Xo+ft5Rui9bpnAMOh40YXUUzatdIHZ7UE3C+a+Th4O3fr6K8W2fUytiumCcOUxk1+xf
         IoXMC21rN+G7kxv0iJBBSPxeqIxVTWn4BJIqNpNPE4Z+rK+lQZWRWTuZaCQ6a1H/4bJj
         1iB1stFYV+z+YNsZzypc0FE2riihGm7+d0aFhJnOigPT7d7f1tew3xgrraAbjS8XF756
         Bwsw==
X-Forwarded-Encrypted: i=1; AJvYcCWVTv+f8XhOXjAqSVy4RCsLDcPfT/D8Yp33ZAjO6Pi3FmlXN906JYDaAGg9hCfVHv8WOIVFp7chfvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2NC6diAiX1tncYi+WOQ2TCfF1P17ujwC/KMoBYXy2Vlhmttko
	+PTwayFZl/+1HNSyII1JUzvXXDtK1ahzrVLDMJBXaaPE8ML/dyJ2yxqJCQDDqOTskZ72Ewrg5gW
	+GSS8seprdM6AyprQSVw5E5LlWUFitJ1zV0rDZPw=
X-Gm-Gg: AY/fxX4I5D4zoq9RBNMwTpc4lt2bvjhxucjT9KCvEk57PxN/Ejni2Xjk3S8+thIAmpZ
	QyL+FrAnAPD0ysd2EY4Ssv1h1h+NpUC+jZjkkaMMAgcwGLuSKpdYk9fSqJ/VCfSzKiBeztnqsae
	5SNv55ydF6IPGWS8DAlYwx4xsejvK76SEzDVOJxAdMqN8rN3EIyRwnQFhJDZqsdFaAgLxVmX+dB
	NvNhFknZ2FKMxtFqEpK/v8JwalWdmfkMIwn0obpPLYvC5L2mEz2J1wx4D8NvB2G6iOdPpRSFA==
X-Google-Smtp-Source: AGHT+IH+UEovCe7kN6Nf7ccKLbaPzdFcb7zZEUyyX7Q4BkWaTU9tPaQqrTGnj0KHYSpSzqO7sIeiTEGWH+V2sNjruGw=
X-Received: by 2002:a05:690c:7303:b0:78c:5803:f698 with SMTP id
 00721157ae682-78c9d7264d9mr24677747b3.33.1765348453124; Tue, 09 Dec 2025
 22:34:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-17-jim.cromie@gmail.com> <fcb2532d-5627-4bc3-a990-ed361b56ccd3@akamai.com>
In-Reply-To: <fcb2532d-5627-4bc3-a990-ed361b56ccd3@akamai.com>
From: jim.cromie@gmail.com
Date: Wed, 10 Dec 2025 19:33:46 +1300
X-Gm-Features: AQt7F2qmJxELXQnowdSUwtjD8vBYrs2EF4Sxvs2wr409OK17Nbb572VDcYC5uPg
Message-ID: <CAJfuBxxeaZDY+-f=7R0RSnE7FAyPtB_O+S3E4L_OckKNRK+7ag@mail.gmail.com>
Subject: Re: [PATCH v6 16/31] dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
To: Jason Baron <jbaron@akamai.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Linux Documentation List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 11:43=E2=80=AFAM Jason Baron <jbaron@akamai.com> wr=
ote:
>
> Hi Jim,
>
> Very minor nit below about the kernel-doc ordering for args...
>

> > +/*
> > + * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
> > + * the contiguous subrange of elements matching on ->mod_name.  Copy
> > + * the subrange into @_dst.  This depends on vars defd by caller.
> > + *
> > + * @_i:   caller provided counter var, init'd by macro
> > + * @_sp:  cursor into @_vec.
> > + * @_box: contains member named @_vec
> > + * @_vec: member-name of a type with: .start .len fields.
> > + * @_dst: an array-ref: to remember the module's subrange
> > + */
>
> Not sure if the odering matters for the docs, but it makes it a bit
> harder read when these don't go in order.
>
> Thanks,
>
> -Jason
>

I chose that doc ordering for clarity,  the easy ones 1st,
and @dst last since it gets the subrange info.
I think reordering might mean more words trying to connect
the pieces, and with less clarity.
It does work against the macro arg ordering,
which places @dst near the front,
I did that to follow  LHS =3D RHS(...)   convention.

Im happy to swap it around if anyone thinks that convention
should supercede these reasons,
but Im in NZ on vacation right now,
and I forgot to pull the latest rev off my desktop before I left.
so I dont want to fiddle with the slightly older copy I have locally,
and then have to isolate and fix whatever is different.

the same applies to the Documentation tweaks that Bagas noted.





> > +#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({         =
       \
> > +     typeof(_dst) __dst =3D (_dst);                                   =
 \
> > +     int __nc =3D 0;                                                  =
 \
> > +     for_subvec(_i, _sp, _box, _vec) {                               \
> > +             if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {       \
> > +                     if (!__nc++)                                    \
> > +                             (__dst)->info._vec.start =3D (_sp);      =
 \
> > +             } else {                                                \
> > +                     if (__nc)                                       \
> > +                             break; /* end of consecutive matches */ \
> > +             }                                                       \
> > +     }                                                               \
> > +     (__dst)->info._vec.len =3D __nc;                                 =
 \
> > +})
> > +
> >   /*
> >    * Allocate a new ddebug_table for the given module
> >    * and add it to the global list.
> > @@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(struct d=
debug_table *dt, struct _ddebug
> >   static int ddebug_add_module(struct _ddebug_info *di, const char *mod=
name)
> >   {
> >       struct ddebug_table *dt;
> > +     struct _ddebug_class_map *cm;
> > +     int i;
> >
> >       if (!di->descs.len)
> >               return 0;
> > @@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_info =
*di, const char *modname)
> >
> >       INIT_LIST_HEAD(&dt->link);
> >
> > +     dd_mark_vector_subrange(i, dt, cm, di, maps);
> > +
> >       if (di->maps.len)
> >               ddebug_attach_module_classes(dt, di);
> >
>
