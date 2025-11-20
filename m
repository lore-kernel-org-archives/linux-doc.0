Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A3C2EFDA5
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 03:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763608138; cv=none; b=D3Z64X/ZnwOGMMtx6v/Ym9juwDJh27XcsW3DOaB/AfS8HgQzyBuXrkWiUeJTHZw5Lswb12qRewsuSmfjHnLC8q492eYJdcyuap17Y9DTjhAq9yuoNkvjZaj2KMe+zieoh6e021so8IANls+rWxj+C0xxQMiwtLyZ7KtcDnrCTcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763608138; c=relaxed/simple;
	bh=LDJQXStJhxuIVFUh0KGEALQ5QGsnk3BU7P04araX8Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A283FN8rdjSbxeJ4DhX7EwhPY08U3XEjJ8G3frsFy305hV0WET1j4alj/nfm5pBnds8bIyd4azvdf24755CwoSMKnajEOeeGrRmeldt8opFr/k6xENy+snLJ3T2h5XeQHmt9Q3+C3ulLvBAITC4lF/ZW/W4eCerA4UiIF62Rw1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCeLUvJy; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCeLUvJy"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29812589890so5052105ad.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 19:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763608133; x=1764212933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=obhMPXIkkdooRW9j/Fgg6xtfxvhQxt5QkqAkScu5Ygg=;
        b=HCeLUvJyRY55d6qXu4vyz62YnNnmbD2QKBRVxhnZGBNy4ryUFIWeudOnQYZtH906JB
         7nN8Pyju33EDRmFssiOANgO8rUMh/kESSbEgwuaRm5jOVr7j+lGOqC7kh2/fcGZxrP0t
         flzMlIM5uMqxziDnaMAZihE6jha0EjmyuVWZzFhbZJNZl3WVUu5q5u2xoV1gGi56hO7R
         fJLhOyA5AAxdAJLg6KsJsP/blTZP1QmlgC6CLGthnSx0RNdLX2mAtHOHUbu1202EZwLD
         tY/dYt/0/ClxvQaa2lnkBmVF+ETe0zFBlhXFgzjyFKqFB2ux0klUp4Sq+4w9vnq3q57E
         MTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763608133; x=1764212933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obhMPXIkkdooRW9j/Fgg6xtfxvhQxt5QkqAkScu5Ygg=;
        b=ZGp5ht4dPxuMlXz+j9vo8aysigrstQXjkU4TgixtH5F3kw3thMeTFQ9JQYcKOdrFh6
         DbPGTQkryTFFniid6EVT9PpNEAEaE0NbkGVMEwRLpTUxBOvnjRQoVrKK9uJm8WMfzKZS
         +U3MSd/k0rhxHMMFXGZp/OjqpIZvcjD90jxqwXIuhVyJzjH+iOFEDCPfUuTyPHqPwiKE
         JvrPAEnet0cH6hBufpwKyBuBiD2oEjM9rxf+6nQ7gZhveuZ3ecWsn3JLAMS8IVVWFLpc
         jZyI5LidudI/clkEB8xV0Vi9DuvGkG0VJK/9vzUQ19t+A+0IBjZ8au/HnfO9mlCyExgk
         JyiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPXZdPyj+b0JA+W1viY4heShYwpZt6KLHh1wR/iederz1YGCIH6Ze82dx//pmv5tCNBVOz3RU1ZB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnatnUQGCsU4V8G9Enk5v9MoRcX7Jr4WB4fYcXpusJ7nKllhjZ
	/7IPa/lOcovQdPKIryzwNt0ZvE6PjeazmCKQqIuQfIpbSONhdUSkIoLt
X-Gm-Gg: ASbGncsQ/Xtrd+hkUF51G6spZVlhqxcO4Rfmr6h/CRgTGW71DoP3afkZJ9e+dWVHGPR
	4wsj02x/vRh0Ulh9IA2EZHR5Io4V2/fkrOGMtCADk30/+S73xIMgO7owt1z2Efd5nU2fSvH5n8E
	p8+ehLla0lY3WAEL30T3GyYUMvd6xVGCXhhq/zg1Wgqy0a5Y5J7SBCdvsjHC5ileNwH0tJ7RoLu
	wqiRBRX2kVcq9nP/iRsf5MCyxq1Lo9er7cClB2Wb0/ZNtZwsu8JbGfjy89sDBsvpsxZtP/rXj8F
	UTtcopfwNnWd4oXAUHoNcCaQTy/pO4bfcKC3t5HeDXzIEnhD0XAeujIlqbTgnLaOo3Jf71VU4fV
	dw2e+d6AKUCcuVecj7kg1RLGk3UfiAilAPScKyh15KdRm22AtWA9JHRTbf3DfLQXIktUXHa6LQs
	RPYyBsYNfObWI=
X-Google-Smtp-Source: AGHT+IF+i7eRVDL93AayD7pCpjsON/H/qC8/CmYibw5k9KhxkFq0GDgTD2VE7/kyvTrhs6frphltCQ==
X-Received: by 2002:a17:903:40cb:b0:297:df17:54cd with SMTP id d9443c01a7336-29b5ebe28a2mr7905725ad.27.1763608132801;
        Wed, 19 Nov 2025 19:08:52 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b29d706sm8451995ad.80.2025.11.19.19.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 19:08:51 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id AAB3D41D96E5; Thu, 20 Nov 2025 10:08:49 +0700 (WIB)
Date: Thu, 20 Nov 2025 10:08:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
	jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 31/31] docs/dyndbg: add classmap info to howto
Message-ID: <aR6GQeLW-sh9-A3W@archie.me>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-32-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HVQbqimanuPfAVD/"
Content-Disposition: inline
In-Reply-To: <20251118201842.1447666-32-jim.cromie@gmail.com>


--HVQbqimanuPfAVD/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 01:18:41PM -0700, Jim Cromie wrote:
> diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Document=
ation/admin-guide/dynamic-debug-howto.rst
> index 1ceadf4f28f9..adac32a5cd23 100644
> --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> @@ -146,7 +146,9 @@ keywords are:::
>    "1-30" is valid range but "1 - 30" is not.
> =20
> =20
> -The meanings of each keyword are:
> +Keywords:::
> +
> +The meanings of each keyword are::
> =20
>  func
>      The given string is compared against the function name
> @@ -194,16 +196,6 @@ format
>  	format "nfsd: SETATTR"  // a neater way to match a format with whitespa=
ce
>  	format 'nfsd: SETATTR'  // yet another way to match a format with white=
space
> =20
> -class
> -    The given class_name is validated against each module, which may
> -    have declared a list of known class_names.  If the class_name is
> -    found for a module, callsite & class matching and adjustment
> -    proceeds.  Examples::
> -
> -	class DRM_UT_KMS	# a DRM.debug category
> -	class JUNK		# silent non-match
> -	// class TLD_*		# NOTICE: no wildcard in class names
> -
>  line
>      The given line number or range of line numbers is compared
>      against the line number of each ``pr_debug()`` callsite.  A single
> @@ -218,6 +210,24 @@ line
>  	line -1605          // the 1605 lines from line 1 to line 1605
>  	line 1600-          // all lines from line 1600 to the end of the file
> =20
> +class
> +
> +    The given class_name is validated against each module, which may
> +    have declared a list of class_names it accepts.  If the class_name
> +    accepted by a module, callsite & class matching and adjustment
> +    proceeds.  Examples::
> +
> +	class DRM_UT_KMS	# a drm.debug category
> +	class JUNK		# silent non-match
> +	// class TLD_*		# NOTICE: no wildcard in class names
> +
> +.. note ::
> +
> +    Unlike other keywords, classes are "name-to-change", not
> +    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
> +
> +Flags:::
> +
>  The flags specification comprises a change operation followed
>  by one or more flag characters.  The change operation is one
>  of the characters::
> @@ -238,11 +248,15 @@ The flags are::
>    s    Include the source file name
>    l    Include line number
> =20
> +Notes:
> +
> +To query without changing	``+_`` or ``-_``.
> +To clear all flags		``=3D_`` or ``-fslmpt``.
> +
>  For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only
>  the ``p`` flag has meaning, other flags are ignored.
> =20
> -Note the regexp ``^[-+=3D][fslmpt_]+$`` matches a flags specification.
> -To clear all flags at once, use ``=3D_`` or ``-fslmpt``.
> +The regexp ``^[-+=3D][fslmpt_]+$`` matches a flags specification.
> =20
> =20
>  Debug messages during Boot Process
> @@ -394,3 +408,92 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
>  For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string=
 is
>  its ``prefix_str`` argument, if it is constant string; or ``hexdump``
>  in case ``prefix_str`` is built dynamically.
> +
> +Dynamic Debug Classmaps
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The "class" keyword selects prdbgs based on author supplied,
> +domain-oriented names.  This complements the nested-scope keywords:
> +module, file, function, line.
> +
> +The main difference from the others: classes must be named to be
> +changed.  This protects them from unintended overwrite:
> +
> +  # IOW this cannot undo any drm.debug settings
> +  :#> ddcmd -p
> +
> +This protection is needed; /sys/module/drm/parameters/debug is ABI.
> +drm.debug is authoritative when dyndbg is not used, dyndbg-under-DRM
> +is an implementation detail, and must not behave erratically, just
> +because another admin fed >control something unrelated.
> +
> +So each class must be enabled individually (no wildcards):
> +
> +  :#> ddcmd class DRM_UT_CORE +p
> +  :#> ddcmd class DRM_UT_KMS +p
> +  # or more selectively
> +  :#> ddcmd class DRM_UT_CORE module drm +p
> +
> +That makes direct >control wordy and annoying, but it is a secondary
> +interface; it is not intended to replace the ABI, just slide in
> +underneath and reimplement the guaranteed behavior.  So DRM would keep
> +using the convenient way, and be able to trust it.
> +
> +  :#> echo 0x1ff > /sys/module/drm/parameters/debug
> +
> +That said, since the sysfs/kparam is the ABI, if the author omits the
> +CLASSMAP_PARAM, theres no ABI to guard, and he probably wants a less
> +pedantic >control interface.  In this case, protection is dropped.
> +
> +Dynamic Debug Classmap API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +DYNAMIC_DEBUG_CLASSMAP_DEFINE(clname,type,_base,classnames) - this maps
> +classnames (a list of strings) onto class-ids consecutively, starting
> +at _base.
> +
> +DYNAMIC_DEBUG_CLASSMAP_USE(clname) & _USE_(clname,_base) - modules
> +call this to refer to the var _DEFINEd elsewhere (and exported).
> +
> +DYNAMIC_DEBUG_CLASSMAP_PARAM(clname) - creates the sysfs/kparam,
> +maps/exposes bits 0..N as class-names.
> +
> +Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
> +dyndbg to update those classes.  "class FOO" queries are validated
> +against the classes, this finds the classid to alter; classes are not
> +directly selectable by their classid.
> +
> +NB: It is an inherent API limitation (due to int class_id defn) that
> +the following are possible:
> +
> +  // these errors should be caught in review
> +  __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
> +  __pr_debug_cls(62, "un-known classid msg"); // this compiles, does not=
hing
> +
> +There are 2 types of classmaps:
> +
> + DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like drm.debug
> + DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
> +
> +DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
> +refers to a DEFINEd classmap, and associates it to the param's
> +data-store.  This state is then applied to DEFINEr and USEr modules
> +when they're modprobed.
> +
> +The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
> +amongst the contained classnames; all classes are independent in the
> +control parser itself.  There is no implied meaning in names like "V4"
> +or "PL_ERROR" vs "PL_WARNING".
> +
> +Modules or module-groups (drm & drivers) can define multiple
> +classmaps, as long as they (all the classmaps) share the limited 0..62
> +per-module-group _class_id range, without overlap.
> +
> +If a module encounters a conflict between 2 classmaps its _USEing or
> +_DEFINEing, it can invoke the extended _USE_(name,_base) macro to
> +de-conflict the respective ranges.
> +
> +``#define DEBUG`` will enable all pr_debugs in scope, including any
> +class'd ones.  This won't be reflected in the PARAM readback value,
> +but the class'd pr_debug callsites can be forced off by toggling the
> +classmap-kparam all-on then all-off.

Hmmm... the resulting htmldocs looks messy so I clean it up:

---- >8 ----
diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentat=
ion/admin-guide/dynamic-debug-howto.rst
index adac32a5cd232d..fd3dbae00cfc60 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -146,9 +146,10 @@ keywords are:::
   "1-30" is valid range but "1 - 30" is not.
=20
=20
-Keywords:::
+Keywords
+--------
=20
-The meanings of each keyword are::
+The meanings of each keyword are:
=20
 func
     The given string is compared against the function name
@@ -221,12 +222,13 @@ class
 	class JUNK		# silent non-match
 	// class TLD_*		# NOTICE: no wildcard in class names
=20
-.. note ::
+.. note::
=20
     Unlike other keywords, classes are "name-to-change", not
-    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
+    "omitting-constraint-allows-change".  See :ref:`dyndbg-classmaps`.
=20
-Flags:::
+Flags
+-----
=20
 The flags specification comprises a change operation followed
 by one or more flag characters.  The change operation is one
@@ -248,10 +250,10 @@ The flags are::
   s    Include the source file name
   l    Include line number
=20
-Notes:
+.. note::
=20
-To query without changing	``+_`` or ``-_``.
-To clear all flags		``=3D_`` or ``-fslmpt``.
+   * To query without changing:	``+_`` or ``-_``.
+   * To clear all flags:	``=3D_`` or ``-fslmpt``.
=20
 For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only
 the ``p`` flag has meaning, other flags are ignored.
@@ -409,6 +411,8 @@ For ``print_hex_dump_debug()``/``print_hex_dump_bytes()=
``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
=20
+.. _dyndbg-classmaps:
+
 Dynamic Debug Classmaps
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
@@ -417,7 +421,7 @@ domain-oriented names.  This complements the nested-sco=
pe keywords:
 module, file, function, line.
=20
 The main difference from the others: classes must be named to be
-changed.  This protects them from unintended overwrite:
+changed.  This protects them from unintended overwrite::
=20
   # IOW this cannot undo any drm.debug settings
   :#> ddcmd -p
@@ -427,7 +431,7 @@ drm.debug is authoritative when dyndbg is not used, dyn=
dbg-under-DRM
 is an implementation detail, and must not behave erratically, just
 because another admin fed >control something unrelated.
=20
-So each class must be enabled individually (no wildcards):
+So each class must be enabled individually (no wildcards)::
=20
   :#> ddcmd class DRM_UT_CORE +p
   :#> ddcmd class DRM_UT_KMS +p
@@ -437,7 +441,7 @@ So each class must be enabled individually (no wildcard=
s):
 That makes direct >control wordy and annoying, but it is a secondary
 interface; it is not intended to replace the ABI, just slide in
 underneath and reimplement the guaranteed behavior.  So DRM would keep
-using the convenient way, and be able to trust it.
+using the convenient way, and be able to trust it::
=20
   :#> echo 0x1ff > /sys/module/drm/parameters/debug
=20
@@ -464,7 +468,7 @@ against the classes, this finds the classid to alter; c=
lasses are not
 directly selectable by their classid.
=20
 NB: It is an inherent API limitation (due to int class_id defn) that
-the following are possible:
+the following are possible::
=20
   // these errors should be caught in review
   __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
@@ -472,8 +476,8 @@ the following are possible:
=20
 There are 2 types of classmaps:
=20
- DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like drm.debug
- DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+* DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like drm.debug
+* DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
=20
 DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
 refers to a DEFINEd classmap, and associates it to the param's

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--HVQbqimanuPfAVD/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaR6GPAAKCRD2uYlJVVFO
o82NAP9o9bKdHzQr2WUnsmQEo2y9z1jOdX8J+HgUei4iaKFGoAEA7aYmQOKNkEme
AThPfWzYb2VtrLEG2zkxC0iPslgWTAg=
=vmiO
-----END PGP SIGNATURE-----

--HVQbqimanuPfAVD/--
