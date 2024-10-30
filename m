Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C14208A9
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 00:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730249102; cv=none; b=ViqLakBsXgnHElk69AnQUkAWCPfGyzwqLb9FtaqSZGmD0vHOjy7Wq+Q7ourwFhr7t067ZsyXMXd45qRR1DFrW/1GNZn9KIN8HLFfs5XV3fIvVteZF0mxx4mJCUIc9frSP0HhmKTmoHRM4q9+I6x1nLTMxjswI2KohIWZrExIC70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730249102; c=relaxed/simple;
	bh=pXio2wdUDMoiGFHfLw3/Vx7YceKDVC7pdKMIjgzX2OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDASkxIB2YoDFYsEd9mwm8sHs8FXc1Lpb2eA+C6OApTer0vLe6H5k58g+hJ+szrMQz53//VWldXOvH9qOevXcjk3RJnNtFlWcJGIvLdXB7WhEddultfAIXXjaUDC/vilhg+wBI3rgIdFvzrtQHqIWYSdHfQQS1BkAvPkSATpkdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpVSeU//; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpVSeU//"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c714cd9c8so64006165ad.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 17:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730249100; x=1730853900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A24LiSsyJiEk/qFejTrPE3fT4wSdNc0P2TRo47qCLuU=;
        b=ZpVSeU//cXAmbXc+ZA+Nb63pNk0g5NTF7r4bFUFj+TgJ97nUBScmpDvWJzqVzMezdt
         B10rbxtwceQE43oQ9DvTzAlovbHXl4bpaZ1XmnkT69ylT6GSsNeWlyq+cYvV6S2cA7Cb
         GI35G7VN3ZZZ6N6JGseq390NHRite2jOLbAIWsEc9AM9Z6fmROgjTT8M63XSBHQMvyL0
         HUP2t2QC3+pTkWkrBRJ0xJ5jHT93i0CIiHFbxNFOrM2xjXfbn5oKSjW3GH/nTYNV4G88
         uHB6L/r3uCewHkwLamdpa6BOqxxHxX7sT84WJ0Pc5VepCel8fU/6uwN9FswDei5iYD6l
         NPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730249100; x=1730853900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A24LiSsyJiEk/qFejTrPE3fT4wSdNc0P2TRo47qCLuU=;
        b=L+6+q0j8DSl8PJrANiRtf4Ekxi7q72BXkxLuADHWgER/p7UsORW0hdX96xdXPS/kZZ
         xqeePVuiet0oI2g9y0Z/BlqFW1JZptQLYmNAjOvRxD8elisKnSZVLVFsuxgqTel17eFE
         EhqNE8aCUCxHnLyFooxoeV1/ISXjOkKwsXeRcy0s8YJkKRgqCArxSqezVn69FGmJSYRI
         LMF6pZWo+mhMmgkHVnHhJuLccs62LSCslXFcxLgsPH5U7uf5S1YVmmAf1GT4+uuE/wg6
         F0Izz2UIMr6mM/wBhFmgaBaPL6HvbylIrkz3cH75wZHTeg1u7OHDiKzKEda9U//i2yTI
         Z9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCV6xteeJgn0noxM4253OXUokx5vEzjO3F2y0KSA6y0TW+b71d7U/NhqAVat5bWSKnhVKadufFck8bs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz9f5SGjLQdV9Xb08DaOAxhj0DfgKNFYkbrLQC/p8u+d3HRvCY
	XRMYrDjLtvHE67OTR3IvsjSoRUpHlQjWRtyg94OdHTJi8qZDkq/H4o57vg==
X-Google-Smtp-Source: AGHT+IGLFUz+xvFh/xCkAuS0PEoCSFQEaY+yvArAdCO8ZetW8ehW0ohQ7yGuHyH/hxr5H8CPb9Qxjg==
X-Received: by 2002:a17:903:234c:b0:20c:528d:7063 with SMTP id d9443c01a7336-210c689ce77mr184766895ad.19.1730249099454;
        Tue, 29 Oct 2024 17:44:59 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc01368csm72176725ad.164.2024.10.29.17.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 17:44:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 29FD8462A27B; Wed, 30 Oct 2024 07:44:49 +0700 (WIB)
Date: Wed, 30 Oct 2024 07:44:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: patches@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2] Documentation: admin: reorganize kernel-parameters
 intro
Message-ID: <ZyGBgN406j-K5BCh@archie.me>
References: <20241029180320.412629-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e4u8eU8RmbDUTVAt"
Content-Disposition: inline
In-Reply-To: <20241029180320.412629-1-rdunlap@infradead.org>


--e4u8eU8RmbDUTVAt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 11:03:20AM -0700, Randy Dunlap wrote:
> --- linux-next-20241025.orig/Documentation/admin-guide/kernel-parameters.=
rst
> +++ linux-next-20241025/Documentation/admin-guide/kernel-parameters.rst
> @@ -27,6 +27,16 @@ kernel command line (/proc/cmdline) and
>  when it loads a module, so the kernel command line can be used for
>  loadable modules too.
> =20
> +This document may not be entirely up to date and comprehensive. The comm=
and
> +"modinfo -p ${modulename}" shows a current list of all parameters of a l=
oadable
> +module. Loadable modules, after being loaded into the running kernel, al=
so
> +reveal their parameters in /sys/module/${modulename}/parameters/. Some o=
f these
> +parameters may be changed at runtime by the command
> +``echo -n ${value} > /sys/module/${modulename}/parameters/${parm}``.
> +
> +Special handling
> +----------------
> +
>  Hyphens (dashes) and underscores are equivalent in parameter names, so::
> =20
>  	log_buf_len=3D1M print-fatal-signals=3D1
> @@ -39,8 +49,8 @@ Double-quotes can be used to protect spa
> =20
>  	param=3D"spaces in here"
> =20
> -cpu lists:
> -----------
> +cpu lists
> +~~~~~~~~~
> =20
>  Some kernel parameters take a list of CPUs as a value, e.g.  isolcpus,
>  nohz_full, irqaffinity, rcu_nocbs.  The format of this list is:
> @@ -82,12 +92,17 @@ so that "nohz_full=3Dall" is the equivalen
>  The semantics of "N" and "all" is supported on a level of bitmaps and ho=
lds for
>  all users of bitmap_parselist().
> =20
> -This document may not be entirely up to date and comprehensive. The comm=
and
> -"modinfo -p ${modulename}" shows a current list of all parameters of a l=
oadable
> -module. Loadable modules, after being loaded into the running kernel, al=
so
> -reveal their parameters in /sys/module/${modulename}/parameters/. Some o=
f these
> -parameters may be changed at runtime by the command
> -``echo -n ${value} > /sys/module/${modulename}/parameters/${parm}``.
> +Metric suffixes
> +~~~~~~~~~~~~~~~
> +
> +The [KMG] suffix is commonly described after a number of kernel
> +parameter values. 'K', 'M', 'G', 'T', 'P', and 'E' suffixes are allowed.
> +These letters represent the _binary_ multipliers 'Kilo', 'Mega', 'Giga',
> +'Tera', 'Peta', and 'Exa', equaling 2^10, 2^20, 2^30, 2^40, 2^50, and
> +2^60 bytes respectively. Such letter suffixes can also be entirely omitt=
ed.
> +
> +Kernel Build Options
> +--------------------
> =20
>  The parameters listed below are only valid if certain kernel build optio=
ns
>  were enabled and if respective hardware is present. This list should be =
kept
> @@ -212,10 +227,5 @@ a fixed number of characters. This limit
>  and is between 256 and 4096 characters. It is defined in the file
>  ./include/uapi/asm-generic/setup.h as COMMAND_LINE_SIZE.
> =20
> -Finally, the [KMG] suffix is commonly described after a number of kernel
> -parameter values. These 'K', 'M', and 'G' letters represent the _binary_
> -multipliers 'Kilo', 'Mega', and 'Giga', equaling 2^10, 2^20, and 2^30
> -bytes respectively. Such letter suffixes can also be entirely omitted:
> -
>  .. include:: kernel-parameters.txt
>     :literal:

The docs LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--e4u8eU8RmbDUTVAt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZyGBfAAKCRD2uYlJVVFO
ozreAP98bImbnVqWw/hsvw9b4m7/9BAt1OopbPNjFN3Mw9GocwEA4BMrvhr02iVF
kMbYrGun7BKAOwC2PqC++WQOsqLaHgw=
=idfp
-----END PGP SIGNATURE-----

--e4u8eU8RmbDUTVAt--
