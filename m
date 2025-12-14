Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEE928B4F0
	for <linux-doc@vger.kernel.org>; Sun, 14 Dec 2025 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765735815; cv=none; b=STvMrQnWQrQ1ARMr690PTJ7/wP6OqgnVdH8xkQxjKno3z60ptsmrifoH0Bl3qEGhvN4uydsWXTB0D7TRoFEzpsMy0xJRdImsc+qfOBNHcJR/qjpCyhEEEc6a+gJIjJnY5b6tF2YCB1OxRSPzM22tJQVOTutc5qx5s7FWDNP+MOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765735815; c=relaxed/simple;
	bh=qYJJVb49neyyMUqTfnWs9KyPEmP4EwQbKtp4Aw6/CTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRlz1CH0ABMftTOnZodFGJQC+6k2N1gbqdUJk1fU+6fAFJ8/2c48Zibpig+fH2v2mUCTO+d3ripqg0CklKg4WjVK7/WdlIIx0rGLWcDidORqPQvZb2WmyPw1N0pKyX+PhLqPSVQh5gDcI/Up+jVRiVaRnzrGDxtUxu//p0rBNqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjRfAwIt; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjRfAwIt"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78c35dc5806so25438697b3.1
        for <linux-doc@vger.kernel.org>; Sun, 14 Dec 2025 10:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765735809; x=1766340609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZqYkbEe/Xq+3mf6Qd1chR8xrEn1+HhKwYrS5bPNLz0=;
        b=RjRfAwItvUynBJEcNox0RBUEfuZ2ni5HIU2VDswIqSt3/yGr9hrgdj175zJdMoVA7a
         iCx6XNLTiUbeDlQdhuBNY7NZkIbEbxfxREZ1pIgg1NV1B0bN+7Ad8jstgyNj4LodvB20
         C9eAXBcb2j86RD4Uj6ZM9lBxWs1Ui1nuL58YyqHqjKzwuXebDZDt5DY9dC7SDzeBBAar
         rhk+mJYdmTmUm/E5uCUyA8fJNz09Y69WCieUVPifUKPgmaTjySxOqvRTsuYoJxKOGqEy
         VNBQEahNA6yQHJ/GVaBFj5TIu1kXFOn6kaxxo0KTD4DNvlB8GTEKBwtxqMzfz+gE5I0y
         LW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765735809; x=1766340609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zZqYkbEe/Xq+3mf6Qd1chR8xrEn1+HhKwYrS5bPNLz0=;
        b=W1ST3BrJzja0utLKgyKWiBrQSMYsEdwXLrce0AGpCAaO6w0Ql57O7kvLLIlCbbRwiO
         OUFSPOUwOuc3B15Jc/Jw1IteFvT/s6idFFtokvMJJ4P/uioTyWRnohfXQwpJU4wFezIC
         TDQzEijc5VRPNQskOztzhHUDUywtyuJqKgWsacY6UonCZFiZAZgOg1h3ZXY1a+JsfeFo
         hEENLgkYz1u99Cno/Z5Tl5tqu/OH3+LnzHIN/9Dun1UM3yf9wf+INner3YL7cCYXkpT1
         vDQQRdG7a/sUGZMHkLC5EdntXee7ad/xXrOfhGXxRCkRVmwiBj+FOVef1cV/bJRDf4D5
         7CuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk88uy6L+3SWxdV2trPbmdRNfup7IOONL8CeMheEnloUslNGrudZQDq8c2xFvyAeaFSb+iRWi3kkA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw51XbH7V80PLY9gCZSXBl5O6wm4flV/miIE4UoZcS9fJaIyEax
	bl0OT/ZOVoeL18KmWThboBfWgiGUup/nfTzjQdWFHY4bmKVoKwzM16lbxmPFdS+EOmBVVDqWbGt
	DrTXvamZaSbaoeiEK2IYbtmt1Ceq+u6I=
X-Gm-Gg: AY/fxX4BU8ndanAjmjDsf6y+4l/ij8NJrnIS476GK7afuTI7vpfbvW/GxDAyFdU/gx6
	eEHkVXqzhpoAHrStYkb7PfdtYrMZWGsKnvh+DXEZTvYfvos7dC9S6MsBoTzb7BqAp/hqnKnoZIU
	JfkFsWgG4WxCrTBxS2o4WJ5OAN6H6LY9qpx8BnKbDHwvjn9wBmyAF7a7ER3P/tq6CxVV4hMkwMk
	TmYScASohUPxKNtJ6CAHi9fE7BvIobz0MoZjQX+3dqePQHsaKxXAbDLtKqL4GtUfTsLNX8=
X-Google-Smtp-Source: AGHT+IGino1qHIDwJ6cEfIUzo6jCRJVXk0LuBRnXNQO/QH8pcfmRfAf3d3wzGz/SMhaMEyHjIdABfSVnP3NytN8IepA=
X-Received: by 2002:a05:690e:d05:b0:641:f5bc:68cb with SMTP id
 956f58d0204a3-64555667fb3mr6516934d50.72.1765735809547; Sun, 14 Dec 2025
 10:10:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-17-jim.cromie@gmail.com> <fcb2532d-5627-4bc3-a990-ed361b56ccd3@akamai.com>
 <CAJfuBxxeaZDY+-f=7R0RSnE7FAyPtB_O+S3E4L_OckKNRK+7ag@mail.gmail.com>
 <9f36429d-1d6e-4501-a092-fbf45254d116@akamai.com> <CAJfuBxw8xV2RrbTWpmQFpCpiSp9A7KCLP74T_bu+4mxBROf1sg@mail.gmail.com>
 <81ba7b82-facc-4254-b0d6-439146a42a4c@akamai.com>
In-Reply-To: <81ba7b82-facc-4254-b0d6-439146a42a4c@akamai.com>
From: jim.cromie@gmail.com
Date: Mon, 15 Dec 2025 07:09:43 +1300
X-Gm-Features: AQt7F2qgCbTMdEj1C-C9SWcxTgRqSBurkZmHZRWmEznBwW5oly5EANWs7QkGuCE
Message-ID: <CAJfuBxwC0iTi34jD0TMxLPQTN0vSv+-_Y67hzQfzQX3ie3z9Fg@mail.gmail.com>
Subject: Re: [PATCH v6 16/31] dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
To: Jason Baron <jbaron@akamai.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Linux Documentation List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 5:06=E2=80=AFAM Jason Baron <jbaron@akamai.com> wro=
te:
>
>
>
> On 12/10/25 3:21 PM, jim.cromie@gmail.com wrote:
> > !-------------------------------------------------------------------|
> >    This Message Is From an External Sender
> >    This message came from outside your organization.
> > |-------------------------------------------------------------------!
> >
> > On Thu, Dec 11, 2025 at 8:14=E2=80=AFAM Jason Baron <jbaron@akamai.com>=
 wrote:
> >>
> >>
> >>
> >> On 12/10/25 1:33 AM, jim.cromie@gmail.com wrote:
> >>> !-------------------------------------------------------------------|
> >>>     This Message Is From an External Sender
> >>>     This message came from outside your organization.
> >>> |-------------------------------------------------------------------!
> >>>
> >>> On Wed, Dec 10, 2025 at 11:43=E2=80=AFAM Jason Baron <jbaron@akamai.c=
om> wrote:
> >>>>
> >>>> Hi Jim,
> >>>>
> >>>> Very minor nit below about the kernel-doc ordering for args...
> >>>>
> >>>
> >>>>> +/*
> >>>>> + * Walk the @_box->@_vec member, over @_vec.start[0..len], and fin=
d
> >>>>> + * the contiguous subrange of elements matching on ->mod_name.  Co=
py
> >>>>> + * the subrange into @_dst.  This depends on vars defd by caller.
> >>>>> + *
> >>>>> + * @_i:   caller provided counter var, init'd by macro
> >>>>> + * @_sp:  cursor into @_vec.
> >>>>> + * @_box: contains member named @_vec
> >>>>> + * @_vec: member-name of a type with: .start .len fields.
> >>>>> + * @_dst: an array-ref: to remember the module's subrange
> >>>>> + */
> >>>>
> >>>> Not sure if the odering matters for the docs, but it makes it a bit
> >>>> harder read when these don't go in order.
> >>>>
> >>>> Thanks,
> >>>>
> >>>> -Jason
> >>>>
> >>>
> >>> I chose that doc ordering for clarity,  the easy ones 1st,
> >>> and @dst last since it gets the subrange info.
> >>> I think reordering might mean more words trying to connect
> >>> the pieces, and with less clarity.
> >>> It does work against the macro arg ordering,
> >>> which places @dst near the front,
> >>> I did that to follow  LHS =3D RHS(...)   convention.
> >>>
> >>> Im happy to swap it around if anyone thinks that convention
> >>> should supercede these reasons,
> >>> but Im in NZ on vacation right now,
> >>> and I forgot to pull the latest rev off my desktop before I left.
> >>> so I dont want to fiddle with the slightly older copy I have locally,
> >>> and then have to isolate and fix whatever is different.
> >>>
> >>> the same applies to the Documentation tweaks that Bagas noted.
> >>
> >> Couldn't you then re-order the function args to match the doc order in=
stead?
> >>
> >
> > As you might surmise, the code was written before the kdoc.
> > Since it is setting the @_dst, it feels like an assignment.
> > Therefore the LHS =3D RHS convention seemed pertinent,
> > and the macro args are ordered to conform to this.
> > For the (pseudo- since its not /** ) kdoc,
> > the linear explanation was simplest and clearest, ending with @_dst.
> >
> > So I see these options (in my preferred order), please pick one.
> > 1. leave as is
> > 2. add an NB: that arg order differs from doc-order
> > 3. change macro arg order
> > 4. change kdoc arg order
> >
> > If 2-4 can wait, I can do that trivially once Im home (in Jan)
> > Doing it now, from here, will require fiddling with git am on the mbox.=
gz
> > with which Ive had mixed results/troubles in the past.
> >
>
> Hi Jim,
>
> I am fine leaving this as is, but I do feel like we should perhaps do at
> least #2 at some point, to clarify things.
>
>

Im redoing the set anyway, so I'll do either 2 or 3.

thx


> Thanks,
>
> -Jason
>
>
>
>
>
>
>
>
> > thanks,
> > Jim
> >
> >> Thanks,
> >>
> >> -Jason
> >>
> >>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>>> +#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({     =
           \
> >>>>> +     typeof(_dst) __dst =3D (_dst);                               =
     \
> >>>>> +     int __nc =3D 0;                                              =
     \
> >>>>> +     for_subvec(_i, _sp, _box, _vec) {                            =
   \
> >>>>> +             if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {    =
   \
> >>>>> +                     if (!__nc++)                                 =
   \
> >>>>> +                             (__dst)->info._vec.start =3D (_sp);  =
     \
> >>>>> +             } else {                                             =
   \
> >>>>> +                     if (__nc)                                    =
   \
> >>>>> +                             break; /* end of consecutive matches =
*/ \
> >>>>> +             }                                                    =
   \
> >>>>> +     }                                                            =
   \
> >>>>> +     (__dst)->info._vec.len =3D __nc;                             =
     \
> >>>>> +})
> >>>>> +
> >>>>>     /*
> >>>>>      * Allocate a new ddebug_table for the given module
> >>>>>      * and add it to the global list.
> >>>>> @@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(stru=
ct ddebug_table *dt, struct _ddebug
> >>>>>     static int ddebug_add_module(struct _ddebug_info *di, const cha=
r *modname)
> >>>>>     {
> >>>>>         struct ddebug_table *dt;
> >>>>> +     struct _ddebug_class_map *cm;
> >>>>> +     int i;
> >>>>>
> >>>>>         if (!di->descs.len)
> >>>>>                 return 0;
> >>>>> @@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_i=
nfo *di, const char *modname)
> >>>>>
> >>>>>         INIT_LIST_HEAD(&dt->link);
> >>>>>
> >>>>> +     dd_mark_vector_subrange(i, dt, cm, di, maps);
> >>>>> +
> >>>>>         if (di->maps.len)
> >>>>>                 ddebug_attach_module_classes(dt, di);
> >>>>>
> >>>>
> >>
>
