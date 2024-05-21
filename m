Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E96174BE0
	for <linux-doc@vger.kernel.org>; Tue, 21 May 2024 11:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716292674; cv=none; b=oO/YYiuN9MIw96BaYS8Xy1psF567vaTX8LZMZ6lwOvTgijdbSM9Rdh2ACPJYuboIN1M7BnYb0aPyhxIJurowD2334l06uOVgd1WH1soyWQY23+wkD8wI2TSPx48TBjnD7CUSKwebkr456FG25ALlT/KlNR4qYfmL/22NOzOnym0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716292674; c=relaxed/simple;
	bh=q9fIW/kokRy/aqoKrTmpSlBLPOxD6/t6kfcGLcryXr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7iIriq04xPvIbJlfLQAkRCSqIhVeBOhEIh3LMo0xyMSAoRIlauu+7m2cAWmFZJRV6xBY/K78fnS8hUl4+5alQntORvDMaqiuPK+Gj2quRyJHmeYiE3fxKemqKwwIGbununZH0K5O5oT4OvLyDRKbFXtTNRBI9D/RVydBengYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WqDMMX7J; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WqDMMX7J"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52389c1308dso4910734e87.3
        for <linux-doc@vger.kernel.org>; Tue, 21 May 2024 04:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716292670; x=1716897470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Md6P1tR1u5fc1z/ZbkZnU+iRNw88rkv2FOhweb3h/ZA=;
        b=WqDMMX7JyoXxig871PgfKzwjhu8LeEIg8tBUq5kK9MuHzstczsirhuahm2NgWH+nR5
         WtS73pdIN0796DFRjuLY6KVQnmoVeVEEbjzxw6kDXa7Nsut+pDcGRI3LwNQhQN9h9A/8
         Tn3hBPjsEHIouWgCmgt/1Pdgf3GmQuijdYs1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716292670; x=1716897470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Md6P1tR1u5fc1z/ZbkZnU+iRNw88rkv2FOhweb3h/ZA=;
        b=DV2AxgKymDPe+k4BBh0oUNv8+l7UxdeloleStygWcNsCnLVncCGNQPPyRrghPng5+e
         lPTVaYGScV+iKetV+wZRDXnoHxnuAXoh70SuuLh0NrNhCbetY/LOL5XoNnLJDs0lx+lf
         3McdhG0BlQ2jyQCgqnAyorc8nC+/VG0Wwzn5VjoTU5zdfyTFYNmsmCl2Lv9OeSk6DZyH
         PAg7dIqa1LIUmCX/9Ix3Emn6GVy1hHgrsP/ufusS+OCKxX8SsgmfzNQpKCbpXKUBXi84
         ArFR9VWI7tZIZ3lu1dbeLSdnlAJrx9WhE3uDXTuu0LSIf2mFR6Xr452oVH1hggil3k7m
         bCTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEmOdXPzH4KJ81AYejZwFkxCgCtmrEto4+P5xYG2BIB+QIbWm6o2jX/wdLNAWC+Txy1riV8XvXjfj8ujKo8xp7vcyobMW4AVPg
X-Gm-Message-State: AOJu0Yyd9fi9OqY0Wu+nR4jvbq3o7e+JF78HsDYqv6vCpP9f19XoSL0i
	7KGBAEJ0XygsHyZLL9qeyA6Gqrn6VN4kcQPQj7dmJCppZnvwNyPEKpDOBNv4cKZVEG9jFQonhux
	PvLl8LOoUvrPd+WjVLTv5G/B291TQnvZH+8c=
X-Google-Smtp-Source: AGHT+IF8gWYCjzK4VBQThJnN/naCIuZULqmffSLif/Bdak01khAvPP2yw/yX4C7oyauFBTx6Y1In2u4yiOm9RZxiHiM=
X-Received: by 2002:a19:641c:0:b0:517:87ba:aff3 with SMTP id
 2adb3069b0e04-523573cfdd1mr14170012e87.43.1716292670481; Tue, 21 May 2024
 04:57:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240516174357.26755-1-jim.cromie@gmail.com> <20240516174357.26755-20-jim.cromie@gmail.com>
In-Reply-To: <20240516174357.26755-20-jim.cromie@gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 21 May 2024 13:57:38 +0200
Message-ID: <CALwA+NYNPfpyM8ZH3L-fbrqSpzKw61gZU+u_uxP6tjnFe7UJ-w@mail.gmail.com>
Subject: Re: [PATCH v8-RESEND 19/33] dyndbg-doc: add classmap info to howto
To: Jim Cromie <jim.cromie@gmail.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, 
	mcgrof@kernel.org, daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, 
	jani.nikula@intel.com, ville.syrjala@linux.intel.com, seanpaul@chromium.org, 
	robdclark@gmail.com, groeck@google.com, yanivt@google.com, bleung@google.com, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 7:45=E2=80=AFPM Jim Cromie <jim.cromie@gmail.com> w=
rote:
>
> Describe the 3 API macros providing dynamic_debug's classmaps
>
> DYNDBG_CLASSMAP_DEFINE - create, exports a module's classmap

create, exports a module's classmap - > creates and exports a module's clas=
smap

> DYNDBG_CLASSMAP_USE    - refer to exported map

DYNDBG_CLASSMAP_USE - refers to exported map

> DYNDBG_CLASSMAP_PARAM  - bind control param to the classmap

bind -> binds

> DYNDBG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug
>

+ use module's storage - __drm_debug -> - uses module's storage (for
example __drm_debug)

> cc: linux-doc@vger.kernel.org
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> v5 adjustments per Randy Dunlap
> v7 checkpatch fixes
> v8 more
> ---
>  .../admin-guide/dynamic-debug-howto.rst       | 63 ++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Document=
ation/admin-guide/dynamic-debug-howto.rst
> index 6a8ce5a34382..742eb4230c6e 100644
> --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> @@ -225,7 +225,6 @@ the ``p`` flag has meaning, other flags are ignored.
>  Note the regexp ``^[-+=3D][fslmpt_]+$`` matches a flags specification.
>  To clear all flags at once, use ``=3D_`` or ``-fslmpt``.
>
> -
>  Debug messages during Boot Process
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> @@ -375,3 +374,65 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
>  For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string=
 is
>  its ``prefix_str`` argument, if it is constant string; or ``hexdump``
>  in case ``prefix_str`` is built dynamically.
> +
> +Dynamic Debug classmaps
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Dyndbg allows selection/grouping of *prdbg* callsites using structural
> +info: module, file, function, line.  Classmaps allow authors to add
> +their own domain-oriented groupings using class-names.  Classmaps are
> +exported, so they referencable from other modules.

Typo referencable -> are referenceable



> +
> +  # enable classes individually
> +  :#> ddcmd class DRM_UT_CORE +p
> +  :#> ddcmd class DRM_UT_KMS +p
> +  # or more selectively
> +  :#> ddcmd class DRM_UT_CORE module drm +p
> +
> +The "class FOO" syntax protects class'd prdbgs from generic overwrite::
> +
> +  # IOW this doesn't wipe any DRM.debug settings
> +  :#> ddcmd -p
> +
> +To support the DRM.debug parameter, DYNDBG_CLASSMAP_PARAM* updates all
> +classes in a classmap, mapping param-bits 0..N onto the classes:
> +DRM_UT_<*> for the DRM use-case.
> +
> +Dynamic Debug Classmap API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +DYNDBG_CLASSMAP_DEFINE - modules use this to create classmaps, naming
> +each of the classes (stringified enum-symbols: "DRM_UT_<*>"), and
> +type, and mapping the class-names to consecutive _class_ids.
> +
> +By doing so, modules tell dyndbg that they have prdbgs with those
> +class_ids, and they authorize dyndbg to accept "class FOO" for the
> +module defining the classmap, and its contained classnames.
> +
> +DYNDBG_CLASSMAP_USE - drm drivers invoke this to ref the CLASSMAP that
> +drm DEFINEs.  This shares the classmap definition, and authorizes
> +dyndbg to apply changes to the user module's class'd pr_debugs.  It
> +also tells dyndbg how to initialize the user's prdbgs at modprobe,
> +based upon the current setting of the parent's controlling param.
> +
> +There are 2 types of classmaps:
> +
> + DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
> + DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
> +
> +DYNDBG_CLASSMAP_PARAM - modelled after module_param_cb, it refers to a
> +DEFINEd classmap, and associates it to the param's data-store.  This
> +state is then applied to DEFINEr and USEr modules when they're modprobed=
.
> +
> +This interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
> +amongst the contained classnames; all classes are independent in the
> +control parser itself.
> +
> +Modules or module-groups (drm & drivers) can define multiple
> +classmaps, as long as they share the limited 0..62 per-module-group
> +_class_id range, without overlap.
> +
> +``#define DEBUG`` will enable all pr_debugs in scope, including any
> +class'd ones.  This won't be reflected in the PARAM readback value,
> +but the class'd pr_debug callsites can be forced off by toggling the
> +classmap-kparam all-on then all-off.
> --
> 2.45.0
>
