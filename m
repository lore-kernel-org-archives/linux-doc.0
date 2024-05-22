Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB467AD2D
	for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 14:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716386521; cv=none; b=saHwAlN5Q/uq1QBz8iKZ+QpyLW8fVku8xteiTWiLYr1AinM8ypBsdwCNqXFX9o3R9NW4pAj4Gjnh4YBmEMCM2+ypHQrKe3OuvAyPlrXlvYsSU6Y7Sir3TFmP3Lt3/i0889RyFa9HKC3a7FV8n5HZSOXKMykKz6Ncj2bNAqdLEJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716386521; c=relaxed/simple;
	bh=myYHA+ZviKp/pX06xhXrEgiAUMeEmoKowIRkjh6lviY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VugGV27Mdk7+XkkHAh3xR83IpXROKJpCFADZHJRtU84h9+0268+xF0fu5mKZhNzkSKIEguhacmFHdYdhsOnFS3fsn2XsPiab4SbFPwG0TyZjSxhQ4blM5wAld3Kv/E6g+teMuY6NWqa1bWJ+6wyLrswbCssenDPe9IX0aMmbznQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XVeUk8Eq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XVeUk8Eq"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f74fa2a82so6703173e87.0
        for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 07:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716386516; x=1716991316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpcH2M2rE7fdWSwrlKhRsJ3VqP+ueP08PmnanHg+yOo=;
        b=XVeUk8Eqhxg3B8sV5qGvp25BhNKN7Df5h9yzHWQIahb2SXJuBDydsfFczYzG/O54eX
         58aj9/yNWeByAa5YyEuIulM649JRlZr42mK+2ieu9RJv3qA3pN86CgbJpEFinA65ykcT
         gze1Uzn8VGJRMszKY3hstnQlMVM4v7EdslKyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716386516; x=1716991316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpcH2M2rE7fdWSwrlKhRsJ3VqP+ueP08PmnanHg+yOo=;
        b=Bcu75e9uUIk0U+6OND/mtyKd0emoV7iLiG2sqJNKbQFnqeSugnrD1Bnj/62KuTqMmo
         r572eHktaqsdmbqafgiyQ5DcaG8nC+sdaOnWGUcl3Y1lkxFM5pmlu9qlOE/8NLJ4aXEE
         mj6Lmz+O5uRBMZefSfGkzEnYLul5icRcBdEE1dbAEdf4aNRlI2z9mqWs4523PV66R9GG
         WZ1mFMHbOx2Xqc4BL/Bn5BbiUJZZ3ymPQhqCJwW9FI9A8vCvL2usjiPSq/nfHHCoQ+aO
         avne0DuEH/+v5JTi4sp44NJEU1rG2jEWm2oAxSmz5GL16p9MF4A1Iwz1XWAilOyXWbi+
         4t5g==
X-Forwarded-Encrypted: i=1; AJvYcCXMboMvADRyArAno6pJFfaRjYrEUyuIcBIsGkPZkb28VZTiwsyGCAr4ZMLBxfkyVVPVxEYVYLwreO9vBAXcTeInHii20lQvSsfF
X-Gm-Message-State: AOJu0YyZpoMAxMqrRCjPdnkJxpCzeEK6mWxYfgGwOcwnBork1JkjXUFq
	2k0iKRlBpB8G89mqyfBj0NbiEbaAj1PTlRfQX1cxSKIhgdGfp+wWFOm35mNNYhU1IqvUF64Uc6A
	CaI1IaAr0RN443LpIPbJX7w9dsTDfoEYd/2E=
X-Google-Smtp-Source: AGHT+IE6TZAaLzabvqwAwFl1mEfPwAsDXOc379Dn3LSqMCtZDjWDWgjg8bKqPdMMj1IWp9/+7WQsG4Na0ieXFGEbGjs=
X-Received: by 2002:ac2:484c:0:b0:51b:1e76:4ea9 with SMTP id
 2adb3069b0e04-526beca954bmr1726704e87.4.1716386515921; Wed, 22 May 2024
 07:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240516174357.26755-1-jim.cromie@gmail.com> <20240516174357.26755-20-jim.cromie@gmail.com>
 <CALwA+NYNPfpyM8ZH3L-fbrqSpzKw61gZU+u_uxP6tjnFe7UJ-w@mail.gmail.com> <CAJfuBxyMBh-1BQMqgXj1GBZ=pwbFK3PuBhRDzM7DNd4ML2hSzw@mail.gmail.com>
In-Reply-To: <CAJfuBxyMBh-1BQMqgXj1GBZ=pwbFK3PuBhRDzM7DNd4ML2hSzw@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Wed, 22 May 2024 16:01:44 +0200
Message-ID: <CALwA+NaFsTx-ay=29e=6OZWCiawYPYOfFmPXkDv6xDB_odfC+A@mail.gmail.com>
Subject: Re: [PATCH v8-RESEND 19/33] dyndbg-doc: add classmap info to howto
To: jim.cromie@gmail.com
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, 
	mcgrof@kernel.org, daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, 
	jani.nikula@intel.com, ville.syrjala@linux.intel.com, seanpaul@chromium.org, 
	robdclark@gmail.com, groeck@google.com, yanivt@google.com, bleung@google.com, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 4:58=E2=80=AFPM <jim.cromie@gmail.com> wrote:
>
> On Tue, May 21, 2024 at 5:57=E2=80=AFAM =C5=81ukasz Bartosik <ukaszb@chro=
mium.org> wrote:
> >
> > On Thu, May 16, 2024 at 7:45=E2=80=AFPM Jim Cromie <jim.cromie@gmail.co=
m> wrote:
> > >
> > > Describe the 3 API macros providing dynamic_debug's classmaps
> > >
> > > DYNDBG_CLASSMAP_DEFINE - create, exports a module's classmap
> >
> > create, exports a module's classmap - > creates and exports a module's =
classmap
>
> I was going for an imperative "thou shalt" voice,
> rather than a descriptive/passive voice
> since its an API, and thou shalt use it "this way"
> ( s/creates/create/ if so)
>

Makes sense, thanks for the explanation

> Do we / linux-doc  have a preference in this regard ?
>
>
>
>
> >
> > > DYNDBG_CLASSMAP_USE    - refer to exported map
> >
> > DYNDBG_CLASSMAP_USE - refers to exported map
> >
> > > DYNDBG_CLASSMAP_PARAM  - bind control param to the classmap
> >
> > bind -> binds
> >
> > > DYNDBG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug
> > >
> >
> > + use module's storage - __drm_debug -> - uses module's storage (for
> > example __drm_debug)
> >
> > > cc: linux-doc@vger.kernel.org
> > > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > > ---
> > > v5 adjustments per Randy Dunlap
> > > v7 checkpatch fixes
> > > v8 more
> > > ---
> > >  .../admin-guide/dynamic-debug-howto.rst       | 63 +++++++++++++++++=
+-
> > >  1 file changed, 62 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docu=
mentation/admin-guide/dynamic-debug-howto.rst
> > > index 6a8ce5a34382..742eb4230c6e 100644
> > > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> > > @@ -225,7 +225,6 @@ the ``p`` flag has meaning, other flags are ignor=
ed.
> > >  Note the regexp ``^[-+=3D][fslmpt_]+$`` matches a flags specificatio=
n.
> > >  To clear all flags at once, use ``=3D_`` or ``-fslmpt``.
> > >
> > > -
> > >  Debug messages during Boot Process
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > @@ -375,3 +374,65 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)=
``.
> > >  For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format st=
ring is
> > >  its ``prefix_str`` argument, if it is constant string; or ``hexdump`=
`
> > >  in case ``prefix_str`` is built dynamically.
> > > +
> > > +Dynamic Debug classmaps
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > +
> > > +Dyndbg allows selection/grouping of *prdbg* callsites using structur=
al
> > > +info: module, file, function, line.  Classmaps allow authors to add
> > > +their own domain-oriented groupings using class-names.  Classmaps ar=
e
> > > +exported, so they referencable from other modules.
> >
> > Typo referencable -> are referenceable
> >
> >
> >
> > > +
> > > +  # enable classes individually
> > > +  :#> ddcmd class DRM_UT_CORE +p
> > > +  :#> ddcmd class DRM_UT_KMS +p
> > > +  # or more selectively
> > > +  :#> ddcmd class DRM_UT_CORE module drm +p
> > > +
> > > +The "class FOO" syntax protects class'd prdbgs from generic overwrit=
e::
> > > +
> > > +  # IOW this doesn't wipe any DRM.debug settings
> > > +  :#> ddcmd -p
> > > +
> > > +To support the DRM.debug parameter, DYNDBG_CLASSMAP_PARAM* updates a=
ll
> > > +classes in a classmap, mapping param-bits 0..N onto the classes:
> > > +DRM_UT_<*> for the DRM use-case.
> > > +
> > > +Dynamic Debug Classmap API
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > +
> > > +DYNDBG_CLASSMAP_DEFINE - modules use this to create classmaps, namin=
g
> > > +each of the classes (stringified enum-symbols: "DRM_UT_<*>"), and
> > > +type, and mapping the class-names to consecutive _class_ids.
> > > +
> > > +By doing so, modules tell dyndbg that they have prdbgs with those
> > > +class_ids, and they authorize dyndbg to accept "class FOO" for the
> > > +module defining the classmap, and its contained classnames.
> > > +
> > > +DYNDBG_CLASSMAP_USE - drm drivers invoke this to ref the CLASSMAP th=
at
> > > +drm DEFINEs.  This shares the classmap definition, and authorizes
> > > +dyndbg to apply changes to the user module's class'd pr_debugs.  It
> > > +also tells dyndbg how to initialize the user's prdbgs at modprobe,
> > > +based upon the current setting of the parent's controlling param.
> > > +
> > > +There are 2 types of classmaps:
> > > +
> > > + DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debu=
g
> > > + DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
> > > +
> > > +DYNDBG_CLASSMAP_PARAM - modelled after module_param_cb, it refers to=
 a
> > > +DEFINEd classmap, and associates it to the param's data-store.  This
> > > +state is then applied to DEFINEr and USEr modules when they're modpr=
obed.
> > > +
> > > +This interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
> > > +amongst the contained classnames; all classes are independent in the
> > > +control parser itself.
> > > +
> > > +Modules or module-groups (drm & drivers) can define multiple
> > > +classmaps, as long as they share the limited 0..62 per-module-group
> > > +_class_id range, without overlap.
> > > +
> > > +``#define DEBUG`` will enable all pr_debugs in scope, including any
> > > +class'd ones.  This won't be reflected in the PARAM readback value,
> > > +but the class'd pr_debug callsites can be forced off by toggling the
> > > +classmap-kparam all-on then all-off.
> > > --
> > > 2.45.0
> > >
