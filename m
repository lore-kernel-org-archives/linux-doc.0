Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498B332548B
	for <linux-doc@vger.kernel.org>; Wed, 10 Dec 2025 20:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765398103; cv=none; b=fvttdNgP85XZDXDhUBxTSQKZAhLp2VJUkaG7/PpsJ/8yR4b5NUIRpS/U/cDZVl5viW8aTTT2CKgHgfETjCAD2S8KmGRsPXbI2dHkTqUA1ok1wxYUAhcajQ6e4w6vP91iNhERNvVAvBHhCGtjgnhaIwkkigLhXw8c5OPk7SFYmXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765398103; c=relaxed/simple;
	bh=Nh3LqW/V/g9OoYLBsahmVu0Rp5IT8lmJ8DlsUsb9erI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftojfPpo1rs4NB9GfQAc40R9Nzcorbfxx0bTtKgiKYizRZ3NCik0LBqKSTjWi7n+86mCaqBkP0vpPA48IwL/46MhPeDARuicN3/c9ghmghpwHcmZy7zMuaxrwBAJ5FXUaMc0koX2G+h5ZdvWJq+qWrKCqS5KdfE3mRXpqVNai/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJWPCjpL; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJWPCjpL"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-640d4f2f13dso232905d50.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Dec 2025 12:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765398101; x=1766002901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZInM0NiQ7nFRNVeTnm9fViGpDJsRjTXAmkv4itoNQY=;
        b=TJWPCjpLPdp+X4hUWs4UEDevPaY6V0Hh8YzG8om511l38o97I/MaWkOT8ZkwoTwzpk
         HbpIE2QOtUbWRfWBlhQEvIH8jEYazD5le1gKc01Z8Cw/Sa+TcoKUn5YdYnEV8Q2M/7T8
         9ips2xQ9yfvU2ao7BYLHJ28UzSDO6KuUkx2ENm7QEzjv3qWyfTl+Z6jCvaHt1EqH9MVv
         yck7d0lE/bh6DkOxTIMelQfKwZon2RO6JGHtKaeCvINM9voxRip5/A7T/KOmamyP0PV2
         dU2+kZpSZ7w2As1fFY+35P4Drqnd7rISWF3U5etB/NULiOoRPrz25loBlb9J+rDwEdX9
         dtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765398101; x=1766002901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ZInM0NiQ7nFRNVeTnm9fViGpDJsRjTXAmkv4itoNQY=;
        b=C9P6uifCd5gyL2ntM/IHDvnHnEdJahWRqkVAd4YYYhl4sDrDM1KWoZ3CXepaFJ4Ssd
         iLErBMhGpKEmFYHH1t1VEQrkIEl3GYnBVDnDoY4U+oHSIDHPGp3IhSaT/btDYaDLJMQm
         slzHRM03iH9hadg5jlK0tCkCJbRr7OgRAMcwPX8u+j0tnGfRjOGJagCCyRHp+eDfK9E5
         ySUxmUGr98gCWA8P6vKNQa/Tjk4GwZttSsqkwlBovxvavNXrEs3jpycr8gq6fBjkTtam
         IJ+UNxDgkfZ1CNDXRLFC6v+5gFuXJwgtQaJoqI8ljNIonWn4Z0XIEgmjK61X6t+hIFot
         P+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR6gnG+kkVZJLPTdMmcnqp76oWJXsGxjmNR95/P1XSK3Sm8P/hHHChJU+7DTXTo0n4Y5TRxuX4mOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy76kM+ZgxPfRXOB1ZL8wyurSQxX9YKokw9RNl3bwljawLXBKMT
	mPDz8mMWu5QWSTn357qNtikwHcSs7aTBotzzXZjxFfev//CsNAMQEmBY00LYdpGPW0vjSS04H1O
	ksapbG8Tlla69GQKW8HSfKhotTy/VXRA=
X-Gm-Gg: AY/fxX5v2R3qvVH0sOCsLR9+GhJm0qzPl3CDBUdQajDssXdfi4fBPJGxe9/M6cKtAE5
	5wcgvIcuVuXcf9sR856OKl6wIg5e0wTKbeO+RKAaNZ5TpNDNKRKPtmAmRK7yHJC+/u1l4sw0KEr
	l0k0XKviloFk/6ebizLpkUeRUzl1uxBwGehqGGkanaEWUul4L6Bq6rKhYfg+EzDkoE7LGl8VcXi
	XdXkXsub9OXEvLnbDpEOcmN+SQZ7cqqoAGZ3vCR+xDbl5Vs49iIQo6kXaM7mw+nl8UkMW1Z/w==
X-Google-Smtp-Source: AGHT+IEd9Yp9ouRQjIqIHHL1BlQLYeX2qiLXcyiE+UEnu7ZeLOvh/BJcmz8Vq8ERwxLtQQLqXX/tsXg0aWvRF87WFhI=
X-Received: by 2002:a05:690e:118e:b0:63f:a5ff:46a4 with SMTP id
 956f58d0204a3-6446e8fbc61mr2766089d50.6.1765398101139; Wed, 10 Dec 2025
 12:21:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-17-jim.cromie@gmail.com> <fcb2532d-5627-4bc3-a990-ed361b56ccd3@akamai.com>
 <CAJfuBxxeaZDY+-f=7R0RSnE7FAyPtB_O+S3E4L_OckKNRK+7ag@mail.gmail.com> <9f36429d-1d6e-4501-a092-fbf45254d116@akamai.com>
In-Reply-To: <9f36429d-1d6e-4501-a092-fbf45254d116@akamai.com>
From: jim.cromie@gmail.com
Date: Thu, 11 Dec 2025 09:21:15 +1300
X-Gm-Features: AQt7F2rPGZR4Rg44iJ3Xr_UOgelrQ39K4qdCvflmk1RdZDQ43aUgkyzsJSQAuHE
Message-ID: <CAJfuBxw8xV2RrbTWpmQFpCpiSp9A7KCLP74T_bu+4mxBROf1sg@mail.gmail.com>
Subject: Re: [PATCH v6 16/31] dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
To: Jason Baron <jbaron@akamai.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Linux Documentation List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 8:14=E2=80=AFAM Jason Baron <jbaron@akamai.com> wro=
te:
>
>
>
> On 12/10/25 1:33 AM, jim.cromie@gmail.com wrote:
> > !-------------------------------------------------------------------|
> >    This Message Is From an External Sender
> >    This message came from outside your organization.
> > |-------------------------------------------------------------------!
> >
> > On Wed, Dec 10, 2025 at 11:43=E2=80=AFAM Jason Baron <jbaron@akamai.com=
> wrote:
> >>
> >> Hi Jim,
> >>
> >> Very minor nit below about the kernel-doc ordering for args...
> >>
> >
> >>> +/*
> >>> + * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
> >>> + * the contiguous subrange of elements matching on ->mod_name.  Copy
> >>> + * the subrange into @_dst.  This depends on vars defd by caller.
> >>> + *
> >>> + * @_i:   caller provided counter var, init'd by macro
> >>> + * @_sp:  cursor into @_vec.
> >>> + * @_box: contains member named @_vec
> >>> + * @_vec: member-name of a type with: .start .len fields.
> >>> + * @_dst: an array-ref: to remember the module's subrange
> >>> + */
> >>
> >> Not sure if the odering matters for the docs, but it makes it a bit
> >> harder read when these don't go in order.
> >>
> >> Thanks,
> >>
> >> -Jason
> >>
> >
> > I chose that doc ordering for clarity,  the easy ones 1st,
> > and @dst last since it gets the subrange info.
> > I think reordering might mean more words trying to connect
> > the pieces, and with less clarity.
> > It does work against the macro arg ordering,
> > which places @dst near the front,
> > I did that to follow  LHS =3D RHS(...)   convention.
> >
> > Im happy to swap it around if anyone thinks that convention
> > should supercede these reasons,
> > but Im in NZ on vacation right now,
> > and I forgot to pull the latest rev off my desktop before I left.
> > so I dont want to fiddle with the slightly older copy I have locally,
> > and then have to isolate and fix whatever is different.
> >
> > the same applies to the Documentation tweaks that Bagas noted.
>
> Couldn't you then re-order the function args to match the doc order inste=
ad?
>

As you might surmise, the code was written before the kdoc.
Since it is setting the @_dst, it feels like an assignment.
Therefore the LHS =3D RHS convention seemed pertinent,
and the macro args are ordered to conform to this.
For the (pseudo- since its not /** ) kdoc,
the linear explanation was simplest and clearest, ending with @_dst.

So I see these options (in my preferred order), please pick one.
1. leave as is
2. add an NB: that arg order differs from doc-order
3. change macro arg order
4. change kdoc arg order

If 2-4 can wait, I can do that trivially once Im home (in Jan)
Doing it now, from here, will require fiddling with git am on the mbox.gz
with which Ive had mixed results/troubles in the past.

thanks,
Jim

> Thanks,
>
> -Jason
>
>
> >
> >
> >
> >
> >
> >>> +#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({       =
         \
> >>> +     typeof(_dst) __dst =3D (_dst);                                 =
   \
> >>> +     int __nc =3D 0;                                                =
   \
> >>> +     for_subvec(_i, _sp, _box, _vec) {                              =
 \
> >>> +             if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {      =
 \
> >>> +                     if (!__nc++)                                   =
 \
> >>> +                             (__dst)->info._vec.start =3D (_sp);    =
   \
> >>> +             } else {                                               =
 \
> >>> +                     if (__nc)                                      =
 \
> >>> +                             break; /* end of consecutive matches */=
 \
> >>> +             }                                                      =
 \
> >>> +     }                                                              =
 \
> >>> +     (__dst)->info._vec.len =3D __nc;                               =
   \
> >>> +})
> >>> +
> >>>    /*
> >>>     * Allocate a new ddebug_table for the given module
> >>>     * and add it to the global list.
> >>> @@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(struct=
 ddebug_table *dt, struct _ddebug
> >>>    static int ddebug_add_module(struct _ddebug_info *di, const char *=
modname)
> >>>    {
> >>>        struct ddebug_table *dt;
> >>> +     struct _ddebug_class_map *cm;
> >>> +     int i;
> >>>
> >>>        if (!di->descs.len)
> >>>                return 0;
> >>> @@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_inf=
o *di, const char *modname)
> >>>
> >>>        INIT_LIST_HEAD(&dt->link);
> >>>
> >>> +     dd_mark_vector_subrange(i, dt, cm, di, maps);
> >>> +
> >>>        if (di->maps.len)
> >>>                ddebug_attach_module_classes(dt, di);
> >>>
> >>
>
