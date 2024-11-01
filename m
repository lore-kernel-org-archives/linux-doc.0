Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED5B10F4
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 05:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730437337; cv=none; b=nRFZdCNK5SSFJWaMwUuTStdnp4nyqS7ZCGTnQ9OpE7+OqVHCiIhBV3FYwvTfBMACE7FuEg8jvU5YIWdYiidqp/HTF5XV7LbMgM+U1MpXjbrG7XCB38caLCejswVOsGYG35BnRT4thac2/G+VGLQwUhBqmO/WPjgPMsE6ircHGpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730437337; c=relaxed/simple;
	bh=Y8gZxQdfREOIzzQPwYVj2eKlRBZDAEK91UOhn2GgqKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMOFKlX+BisLt7twewz8dW/4jNZwITxlAkt+A8c1Q7JDsSS4T+IanWt4ZouWxBF6BuH37crYD71c6QYOKAnJ97AeyzkYC37Rek1C786saejB8Lr4UUzKluZKA0yp1NJniyO7WDrDuH2YUSDAK0Uv3TPWGU4CICR5lsxzqh35av0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9t8+97E; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9t8+97E"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-720b2d8bb8dso1266563b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 22:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730437335; x=1731042135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RO5VfpgViN9KLwjgnm5zpFKDo2oUASQKgBBxt9w72bc=;
        b=M9t8+97EJ634hELCcH/a+OOPldJdU/UA816K8hOtfgrXrXuc6O8Tdql35Y6Uq9HyRq
         u/eDoMqEgYfFfiutlnsxyiYJLo8z5ykl9utacgVYq6eg4LnjT0A1Un0OIY1Ir4JZoEIA
         HM9QuO21U1Yic+96rt04erEoWs2cZanLkRIP5pfgWMB6NYSqm1j3qfJoloX2fiZcIqqv
         lXk7A/R71N0Y+4J2n7gklCJJmySP2pQ4I7RGcSExzFKfEBGv3xeSzHlqhrJL7TSqKlm2
         78KtgdR3O51dihG3R7OGKJZWE2m5oLrYR8iNf1NgWgDWKMj9mM6OEdNpZ2vrHh768ZQy
         iPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730437335; x=1731042135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RO5VfpgViN9KLwjgnm5zpFKDo2oUASQKgBBxt9w72bc=;
        b=vC03VcIS2EUWaKX4eekQM36kcyYvLZHjmPOSAtXKRwrsYT71s3pOLA/XUoM+J2w7ki
         W/pzTb6DFLhcwCNBcornVhaU16oscnKAGgXpmGnlINTKOrD7ZAyE/ruChdrSG4K6A5Lf
         CmAWFdSRtolf9ARIoGww+X/Da9ik0Gtj8G/ua2CR5nan43mvIX9/rXLPUqoe1Bnqqzyq
         zt6ERdoVU3z5TiUmtqkW4GbLv0BxT220z1aNZn7Mcz7TINjlrVGmSrKfqWCzy6ihPHCV
         aJearvu/07BDuPQ4mBMRErvd2Q825ju+I4Th8Tvq90FjxyE3RO7SqwVfIOxGCQxCT1xI
         kDww==
X-Forwarded-Encrypted: i=1; AJvYcCU6oUGqzuiqmSnX0HcnSx3eCeFfnaMiS7iRST2/bi/XD3CedCHkPw67J4ia4b9pBaDmYWH1jd8/248=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFvD5xnawdHfCrM1RCNOIAbllTMxznOeOQvIR+f60hSHWp3k7R
	svCqa0bwqFXqJfGEsPlIcydfdj6YZ0/ukDfeetfiVvVoAEnB1Rgd
X-Google-Smtp-Source: AGHT+IEwih40dZP6CGspoj1OSZqvTe3UCY+vUHfa+d421LRm80OIrfQgq+YtepZOltOif/f8/DB11g==
X-Received: by 2002:a05:6a00:b96:b0:71e:688c:1edd with SMTP id d2e1a72fcca58-7206305a08cmr29107418b3a.27.1730437334594;
        Thu, 31 Oct 2024 22:02:14 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c4a0bsm1973717b3a.118.2024.10.31.22.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 22:02:13 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 08F7C420B6E7; Fri, 01 Nov 2024 12:02:04 +0700 (WIB)
Date: Fri, 1 Nov 2024 12:02:04 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	intel-gfx-trybot@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 29/63] dyndbg-doc: add classmap info to howto
Message-ID: <ZyRgzAY_PhABpAg3@archie.me>
References: <20241031084437.4010913-1-jim.cromie@gmail.com>
 <20241031084437.4010913-30-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1pCiqJrPoWcgGBGv"
Content-Disposition: inline
In-Reply-To: <20241031084437.4010913-30-jim.cromie@gmail.com>


--1pCiqJrPoWcgGBGv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 02:44:03AM -0600, Jim Cromie wrote:
> +The main difference from the others: class'd prdbgs must be named to
> +be changed.  This protects them from generic overwrite:
> +
> +  # IOW this cannot undo any DRM.debug settings
> +  :#> ddcmd -p
> +
> +So each class must be enabled individually (no wildcards):
> +
> +  :#> ddcmd class DRM_UT_CORE +p
> +  :#> ddcmd class DRM_UT_KMS +p
> +  # or more selectively
> +  :#> ddcmd class DRM_UT_CORE module drm +p
> +
> +Or the legacy/normal (more convenient) way:
> +
> +  :#> echo 0x1ff > /sys/module/drm/parameters/debug

Format command sequences as literal code blocks (like in the rest of docs):

---- >8 ----
diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentat=
ion/admin-guide/dynamic-debug-howto.rst
index 3068d134fcc6d9..a826b972461fe5 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -388,19 +388,19 @@ domain-oriented names.  This complements the nested-s=
cope keywords:
 module, file, function, line.
=20
 The main difference from the others: class'd prdbgs must be named to
-be changed.  This protects them from generic overwrite:
+be changed.  This protects them from generic overwrite::
=20
   # IOW this cannot undo any DRM.debug settings
   :#> ddcmd -p
=20
-So each class must be enabled individually (no wildcards):
+So each class must be enabled individually (no wildcards)::
=20
   :#> ddcmd class DRM_UT_CORE +p
   :#> ddcmd class DRM_UT_KMS +p
   # or more selectively
   :#> ddcmd class DRM_UT_CORE module drm +p
=20
-Or the legacy/normal (more convenient) way:
+Or the legacy/normal (more convenient) way::
=20
   :#> echo 0x1ff > /sys/module/drm/parameters/debug
=20
> +DYNDBG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
> +classnames onto class-ids starting at _base, it also maps the
> +names onto CLASSMAP_PARAM bits 0..N.
> +
> +DYNDBG_CLASSMAP_USE(var) - modules call this to refer to the var
> +_DEFINEd elsewhere (and exported).

Shouldn't these DYNDBG_CLASSMAP_* descriptions be list?

> +
> +Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
> +dyndbg to update those classes.  "class FOO" queries are validated
> +against the classes, this finds the classid to alter; classes are not
> +directly selectable by their classid.
> +
> +There are 2 types of classmaps:
> +
> + DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
> + DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)

For lists, format them as such otherwise these will be outputted as long
paragraphs:

---- >8 ----
diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentat=
ion/admin-guide/dynamic-debug-howto.rst
index a826b972461fe5..c70e34f01822a2 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -408,9 +408,10 @@ Dynamic Debug Classmap API
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
=20
 DRM.debug is built upon:
-  ~23 macros, all passing a DRM_UT_* constant as arg-1.
-  ~5000 calls to them, across drivers/gpu/drm/*
-  bits in /sys/module/drm/parameters/debug control all DRM_UT_* together
+
+- 23 macros, all passing a DRM_UT_* constant as arg-1.
+- 5000 calls to them, across ``drivers/gpu/drm/*`` bits in
+  ``/sys/module/drm/parameters/debug`` control all DRM_UT_* together
=20
 The const short ints are good for optimizing compilers; a classmaps
 design goal was to keep that.  So basically .classid =3D=3D=3D category.
@@ -438,8 +439,8 @@ directly selectable by their classid.
=20
 There are 2 types of classmaps:
=20
- DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
- DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+- ``DD_CLASS_TYPE_DISJOINT_BITS``: classes are independent, like DRM.debug
+- ``DD_CLASS_TYPE_LEVEL_NUM``: classes are relative, ordered (V3 > V2)
=20
 DYNDBG_CLASSMAP_PARAM - modelled after module_param_cb, it refers to a
 DEFINEd classmap, and associates it to the param's data-store.  This

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--1pCiqJrPoWcgGBGv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZyRgyQAKCRD2uYlJVVFO
o0UBAQCbUHQWzhcD/hmyliwfy4ZsZJ6jXz5leNleCOq2krPwvwEAjpPVDWYFcWaI
aMLjOgQKSFC6pDcgj5QB4qOiTzywdQc=
=tpLX
-----END PGP SIGNATURE-----

--1pCiqJrPoWcgGBGv--
