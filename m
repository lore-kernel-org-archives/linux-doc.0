Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FA844E053
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150867; cv=pass; b=mxfWk81S8P622+22vdR7kZu+pEJV2GJ3ZtUyNXLfsYWVdIHvb+E2/DRgC7LeChQpkJvQBQU+vwGMy7PduyBplRfYgYRi+fIhm7rTLwAQNLnegf/AXG7mIB7Cxyh/k9CgTOPBLkkMZgp0ix2eKcoS/nE6iwIGvPSf4aeVYbTJ4Ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150867; c=relaxed/simple;
	bh=ospiNi4mvJbHDyKvltQYpdK+X0l90zSr5sr0fKih89Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rD2jZmBpLzRInP2O0jWyHFhRPPSLrizF9ANL4SBSKCTUziJtB9cXdm9An/ddkEg4iALQJU2y4Tht+PV0QHWEXufnpYTE9jcAtUYjDaQxk/ffYIcuPCCfC4A0zLbNxCqADIqf6l3QTERi7TMpZpoMK6fvDN4nRIoI+Mo4Px6PMT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZy1O7nY; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZy1O7nY"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66bd7857841so1311722d50.3
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 11:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789150865; cv=none;
        d=google.com; s=arc-20260327;
        b=adW8iGmyzcq9A1m01OMZ3M5oZr1xN4+Hyf8Lc/QDFaJnvlzwylAf71uXlP4r7Enz/d
         XXNHaoQRA4UJTiWgnSR+LI4FDr90cpMB4unI5Fv8hHcEJ/ZPtWeaoSuNFspOIg/KHBJO
         65jwnx6iZPJCtHY9KrPFtk5J3NlaXO+ycQ2pEaDxUdKtMTgxW4jM2+CBqawLp16aVw6o
         wf0zF36wdCQ567/G2Y+GlJLHqgQT+/n3nmIGr+DaXgM3m1Czy2XLeZxaCgWXw2oUwkIU
         PBmrrQz6Op0J4WP04OAeXelVgr1qHYBcxZoY5ZDdrg5yL4yXWm70ZpfUEpcA0j7gaG9l
         TkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0PfkoOh/05AN64bzT3WIDHrUSVJxMax1VSqub7HGYzA=;
        fh=l8E2t66k1THa4g01jWPe4jNic4Qs4+aTZrbOaDaUywE=;
        b=NEuYz3vjWsbBXEc8Omk73e6MBOJi5TicHLEoXcSes/LaboleEZ6AR2Io4zEhxaBUv4
         phHT08P5oqMg7GRdbDBrosrlV26wVqiOfrE7X3GWxKhH2DaXefk/NdIaI98YpUteaU8u
         3v9hD7R6VXJSjhfTf0bjTTkGlOMdv9rtj8WVSXrPZEMMIUMrqUgfTyNgnuEQ89kmdo8Q
         B/jUkT2+5xVHRUQut4DLDVmPPzJvzBG2ULuUxLiSwt5c85eMZ+br04jFOnvg8wy6AJEE
         zHvAWJdHLE0nS73gsAqmOp0kuDvZR7Sfpq8UTocIhzF2UX22w/4BEH3ny3DgpN3w3IB2
         mwIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150865; x=1789755665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0PfkoOh/05AN64bzT3WIDHrUSVJxMax1VSqub7HGYzA=;
        b=fZy1O7nYX4F8RpCBL719cejwO2JBZBHCsQ4M29xWe4J1TICgnhFF4vaFKW0LcVXdmJ
         7JdqsQw8HdHi3qOgLEDUvZWJMdsBhJvjcwAlk7s4SAP6Ge1bQDyq7QlkphqhoqP2sjxu
         hlvtKZOtj97s5AEkAIFBG6SfqtoFA9gozAIKE/u7v19trAtrqTj1kwsXEWMxfPpYViU1
         A6r7wP8ya52+HMgnFwqsiTQib+gLaQKrY4yT8f7y2bOXz5s2XRFZO4o9qvbLDU28U4sZ
         lUNz9mwfWNtI+Bz1r1H2qcuU/MZANI+qNPsIsj2VRtTm7dbTNkjPC+WsuM/oSxn58NcQ
         vk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150865; x=1789755665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0PfkoOh/05AN64bzT3WIDHrUSVJxMax1VSqub7HGYzA=;
        b=BKpBE97KvQMLGd1Ir2gNEPgz2G+nYPE1L36f+SO5WQpTFoiz1Pt4ys88XBdr6jqkEU
         q75AwA8wkV4CY6tPziCQj34I/niuqfk2NuCYZehcHYRR7W9pTNIUnWed9wFTDhrPX+C0
         EECE2eDfsQAiDE3FQ6S/y3Sr+8ZW+KiBXNebHkuzB+/KMkmgOl/xXO6R0TPwyLoRRpG4
         GqT03xoaj/PDFR+1QZ0eQr3VTHdryiHReJ385WbmOdwJPoBnT/U8FvOZYR6FjylFTzAj
         eu+f2e0NgaQZtkrVxl8MEeHmZ4c73FYSok8but7NXRHTqiBJOFTpdNSa6vCb7TT2GYRZ
         nnWw==
X-Forwarded-Encrypted: i=1; AKwUvBwNA2kESzdKUTXOwsDNr/OSPPGTzIV8ZzzOvMAdaWhNcKKBIIaqgUThtWFc14Cb8LGbrafAfwdH2pQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lmgzHyol68IrZk2K424dEJ4Ae/s4A1dyJOi9oHeUtTL6H8PQm5
	FxP2ONTmfL82v/GTRZwXG8i/74B4C8JeOcVI5FjtD02Cap3Nm/78lgd8U+GU2P1mSC01FCSC9Nt
	wTPVHUlD8Adff54hzd0BWCkAUN0qLrB8=
X-Gm-Gg: AYBFou3lyBwm1iVKTpeLUx+5c9QJ8b1X6ybokwO41ejUigB2qN8vHRE07/WCfH/6ljB
	pqC4aTBJTEZBgmhY5H6f24i1dp9YeYKuY1KLnQXeuST3zNiBcVSesICPwlfgAPFc1yykwKHgmR9
	KwTGuF/s+M8rD2CPzUEut7y2Bu7v/VFPpFuLfI/N0Z7cAqRWGD/JmUOv3xrCiHKNOECTbWnZMgJ
	96p0NILboF7d/VM3gQAAJdtay3hgd0a3ds1Et9VhFQifE22CI7aAU/GtNMapqcPhsbu2u6QQR7B
	o+Kjgu2KdPpgsZo4EWku9WEul25M/IBkLrYvuorlvqugA/RKQ6YnL6kkGFEaMtIMvJz1RldtGdl
	5DrYnIrzEuaK2OvTz+GTWSrCsa8f+ee95Sg==
X-Received: by 2002:a05:690e:450f:20b0:66f:c1bc:c072 with SMTP id
 956f58d0204a3-671246c1531mr1637688d50.58.1789150864802; Fri, 11 Sep 2026
 11:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-dd-cmap-part2-clean-v9-0-3a3f621f4a10@gmail.com>
 <20260908-dd-cmap-part2-clean-v9-15-3a3f621f4a10@gmail.com> <20260909-primitive-nano-hound-8ee2aa@l-nschier-aarch64>
In-Reply-To: <20260909-primitive-nano-hound-8ee2aa@l-nschier-aarch64>
From: jim.cromie@gmail.com
Date: Fri, 11 Sep 2026 12:20:38 -0600
X-Gm-Features: AcwNN1UJu3AgSAwYav9ulJp2R_HPP-fzpsFCD13LL3sQevEBQ_irSbDy0UqSCw8
Message-ID: <CAJfuBxx0VFCS820JLqawLdcpb49Nj-=xnSYdg6ytOub6NidM4A@mail.gmail.com>
Subject: Re: [PATCH v9 15/39] kbuild, dyndbg: Clean up builtin module-name ambiguities
To: Nicolas Schier <n.schier@fritz.com>
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:50=E2=80=AFAM Nicolas Schier <n.schier@fritz.com> =
wrote:
>
> On Tue, Sep 08, 2026 at 06:55:11PM -0600, Jim Cromie via B4 Relay wrote:
> [...]
>
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docume=
ntation/admin-guide/dynamic-debug-howto.rst
> > index 9c2f096ed1d8..99bbae37d34e 100644
> > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> [...]
> > @@ -161,17 +161,21 @@ file
> >       file kernel/freezer.c   # ie column 1 of control file
> >       file drivers/usb/*      # all callsites under it
> >       file inode.c:start_*    # parse :tail as a func (above)
> > -     file inode.c:1-100      # parse :tail as a line-range (above)
> > +     file inode.c:1-100      # parse :tail as a line-range (below)
> >
> >  module
> > -    The given string is compared against the module name
> > -    of each callsite.  The module name is the string as
> > -    seen in ``lsmod``, i.e. without the directory or the ``.ko``
> > -    suffix and with ``-`` changed to ``_``.  Examples::
> > -
> > -     module sunrpc
> > -     module nfsd
> > -     module drm*     # both drm, drm_kms_helper
> > +    The query string is compared against the subsystem module name of
> > +    each callsite, as shown in the control file, or its simple name.
> > +    The simple module name is the string as seen in ``lsmod``,
> > +    i.e. without the directory or the ``.ko`` suffix and with ``-``
> > +    changed to ``_``.
> > +    Examples::
> > +
> > +        module nfsd        # simple modname (as from lsmod)
> > +     module init/main   # subsystem modname (as in control file)
> > +     module */main      # any subsystem ending in main
> > +        module main     # simple modname, selects same as above
> > +     module drm*        # both drm, drm_kms_helper
>
> The five lines above have mixed indentation, please switch them all to
> one tab (no spaces).
>

thanks, will fix.

>
> [...]
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 0a4fdd8bd975..e129c4d10ed8 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -23,6 +23,32 @@ modname_flags  =3D -DKBUILD_MODNAME=3D$(call name-fi=
x,$(modname)) \
> >                -D__KBUILD_MODNAME=3D$(call name-fix-token,$(modname))
> >  modfile_flags  =3D -DKBUILD_MODFILE=3D$(call stringify,$(modfile))
> >
> > +# Dynamic debug subsystem modname with clean heuristic and override su=
pport
> > +dd_modname_override =3D $(strip $(firstword $(DD_MODNAME_$(target-stem=
).o) \
> > +                                       $(DD_MODNAME)))
> > +dd_obj :=3D $(strip $(filter-out .,\
> > +             $(patsubst drivers/%,%,\
> > +             $(patsubst arch/$(SRCARCH)/%,%,\
> > +             $(patsubst arch/%/,%,$(obj))))))
>
> May it become problematic if there is a conflict with
>
>   arch/sh/drivers/dma/*
>   arch/sh/drivers/pci/*
>
> vs.
>
>   drivers/dma/*
>   drivers/pci/*
>
> ?

2 questions here really -
- what should happen ?   strip arch/sh/ and then also drivers ?
- what will happen - I will play with the expressions to find out.


>
>
> > +dd_modname_default =3D $(strip $(if $(filter $(notdir $(obj)),$(__modn=
ame)),\
> > +                      $(__modname),\
> > +                      $(if $(filter main core common util init snapsho=
t \
> > +                                    process,$(__modname)),\
> > +                          $(dd_obj),\
> > +                          $(if $(word 2,$(__modname)),\
> > +                              $(dd_obj),\
> > +                              $(if $(dd_obj),$(dd_obj),$(__modname))))=
))
>
> This looks quite complex.  I _think_ this should be equivalent, but
> perhaps a bit more simple to maintenance:
>
> dd_modname_default =3D \
>     $(or \
>         $(filter $(notdir obj), $(__modname)), \
>         $(filter-out main core common util init snapshot process, $(__mod=
name)), \
>         $(dd_obj)))
>
> (Removed $(strip) and the last $(__modname) fallback as both are already
> in definition of 'dd_modname'.)
>
> What do you think?

it does read better.  I will try it too.





> > +dd_modname =3D $(strip $(or $(dd_modname_override),\
> > +                       $(dd_modname_default),\
> > +                       $(__modname)))
> > +dd-name-subst =3D $(subst $(comma),_,$(subst -,_,$(strip $1)))
> > +dd-name-fix-token =3D $(subst $(space),_,$(call dd-name-subst,$1))
> > +dd_tok =3D $(call dd-name-fix-token,$(dd_modname))
> > +dd_modname_flags =3D $(if $(dd_modname),\
> > +     -DKBUILD_DD_MODNAME=3D$(call stringify,$(dd_tok)))
> > +
> > +modfile_flags +=3D $(dd_modname_flags)
>
> dd-name-subst and dd-name-fix-token are not needed, dd_modname_flags is
> used only once and can be folded:
>
>
> dd_tok =3D $(call name-fix,$(subst $(space),_,$(dd_modname)))
>
> modfile_flags +=3D $(if (dd_modname), -DKBUILD_DD_MODNAME=3D$(dd_tok))
>

yes, this all looks cleaner and more comprehensible. thanks.

>

>
>
> --
> Nicolas
