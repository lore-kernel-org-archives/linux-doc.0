Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1681DC1AB
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 06:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758868431; cv=none; b=ia9TFO/dGoFDceJ0OlhZlH1U8lja9By0lK8Iy48zpRsoJt06myHMPcP2XKNgP4uWSbXS//TzMCt+Snv/bh4UOEsybmm4TIyNX9PiPaQE+CsZVIZJ7h6fBRa67Nh6qpOQOpFMymqJlBAY7Xqc/ZTAMj6QQ1XO3OTPgT4GiCT1sUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758868431; c=relaxed/simple;
	bh=174L+H8kVDJsRS4TQ2VP/VcKaCyBSEO08UA9BTwVNws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzfxtkKKzK+4DdJzqYCAhnjHzZGHDNRzUVw4Vj5HoB7uMoI0uSCsMscI+RaV9U7LNbi37bxazHprZE5th+s02qYhRrk+ZHOMyAjsz5Lqlmk1/+PJ1b5Giwrz+3ecivnsQRhfLpbaPZ4xvl260w1ggaZSp+X8U8ktcNlp1yRv9PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k83p0+r2; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k83p0+r2"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso1555763a12.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 23:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758868430; x=1759473230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+NnL+BauktpgcQs087RtJ4g96feiVuu/zAj/7KT5F/M=;
        b=k83p0+r2fCp4r6X8io45RJdyE3xd6N0kZfYsi219lpFW8ESoPIefPwz1iQvOyhm6cg
         8bsh8CetIL1y+0RqS8E310xiPoYYPNQHqHNLnZ1ouZ4vd8ffwEOTIGhQMUxXXuwQxtxT
         UrYQLJ9ffBkNBUPNAEXV/G87GMlByO4yBjwmt8yw0oy9frBLxCplgsj1ssrSIfWYBM3d
         AI0bThEa3d/4oMCLP0LLs+Uu0GVmPBGCeshRPwPPr2I1TW1E2QEEK69FnokSQPTILMVC
         GyNWGvw/nxXZGAr7Xu6OqbJi/U0BQ8P9Oq/YnD8a2BKeO0PQ4x7lm6XEl2+dvdIzFmj0
         Ohrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758868430; x=1759473230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NnL+BauktpgcQs087RtJ4g96feiVuu/zAj/7KT5F/M=;
        b=a8x8yI57/HeOzEnVNOBpd8DVG8dN1Hea12mwOsmx2EU3b/6cw62Q2kvZDbDFt8HvwN
         dh46JEwuXUMYY5kyysuqWoMKYFsoWIL5WOcxxNiGx4XxqJvWn0LVgaBlWoEX3+anuoN6
         zDwmTv5bIqBCQOldWslzwFnSoNIgMCA8LymDehl28I5lrTAS5yoGhUi/MrQ9b3yVZtt2
         URldc5ldbvH/WDILzDbyD/UBancZybPHiSoJwlo3gXee/OfhSfah3Br4B0B5I5tqtKKl
         LjiOf2E3KtNrK3hzh/9bUdhJ8i7VGtP+DZahIDeFT+myWoQ5wGySZ/vQdeSXQzc8iVR8
         jpkA==
X-Gm-Message-State: AOJu0Yx4mCMmYo/322KmEfkWlnDAEW0Q3ZXMO1xG8ncMfzqTAZQ5IRLj
	4jzuTQVyo0CBayECIBw+UYiyiNwOqI6BXh0JUM7lk/M3fJMzNpgWi91i
X-Gm-Gg: ASbGncu1ZvhLwVyFBvdTIUiSgIXEGfMWjoXP0yQyi1EuVRk5YkOCoRDzbHtH0D+TYrQ
	MiTpChoCSmIL3maASj4w9fPoMK6KjWn8upcY3afAn5xf9Q0390caBqNyX8vKNOgy78vQZc2MrOa
	qakT1RL4ZcACljmt99J6gVxbRtL5nj2PYLJPx1aUcWwC3OXsu+sptEqR8zjqAOSp8Ose6tv2fXR
	d4pSQuDfLgMjjIgwPOVoye29i7IlLnm0NwLh5nN5540E1eQbsHic9madrvG0Swt7XUwE5OIc6Ix
	V5yEbbXFzShRsgCbrmdHh3jU+FZWU+kFxuvPFYfqeyXar+sNFHdhFKF90/Y0yhrepr0bcP+EBPP
	OXodoqdRi4vDWcP4Nv6sZ4Pqp6Q==
X-Google-Smtp-Source: AGHT+IE0W5KQPINQ9maEbC4Ovq+fa2iuSq15k4zps/1QAKqt1SuUwSmW8vclNmWC+/aXcFppv6YVgQ==
X-Received: by 2002:a17:902:d487:b0:267:a8d0:7ab3 with SMTP id d9443c01a7336-27ed4ad03femr63641485ad.61.1758868429354;
        Thu, 25 Sep 2025 23:33:49 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69bc273sm43196235ad.124.2025.09.25.23.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 23:33:48 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 10BC74206928; Fri, 26 Sep 2025 13:33:44 +0700 (WIB)
Date: Fri, 26 Sep 2025 13:33:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, corbet@lwn.net,
	will@kernel.org, yangyicong@hisilicon.com, fj2767dz@fujitsu.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] docs: perf: Fujitsu: Fix htmldocs build warnings and
 errors
Message-ID: <aNYzyJuuHHNvXM-9@archie.me>
References: <61aace07-890a-4b55-8e84-935ebc4a3be1@infradead.org>
 <20250926043748.3785-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NbO0R4EJyzKSY1Br"
Content-Disposition: inline
In-Reply-To: <20250926043748.3785-1-krishnagopi487@gmail.com>


--NbO0R4EJyzKSY1Br
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 10:06:12AM +0530, Gopi Krishna Menon wrote:
> diff --git a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst b/Docu=
mentation/admin-guide/perf/fujitsu_uncore_pmu.rst
> index 46595b788d3a..2ec0249e37b6 100644
> --- a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
> +++ b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
> @@ -15,15 +15,19 @@ The driver provides a description of its available ev=
ents and configuration
>  options in sysfs, see /sys/bus/event_sources/devices/mac_iod<iod>_mac<ma=
c>_ch<ch>/
>  and /sys/bus/event_sources/devices/pci_iod<iod>_pci<pci>/.
>  This driver exports:
> +
>  - formats, used by perf user space and other tools to configure events
>  - events, used by perf user space and other tools to create events
> -  symbolically, e.g.:
> +  symbolically, e.g.::
> +
>      perf stat -a -e mac_iod0_mac0_ch0/event=3D0x21/ ls
>      perf stat -a -e pci_iod0_pci0/event=3D0x24/ ls
> +
>  - cpumask, used by perf user space and other tools to know on which CPUs
>    to open the events
> =20
>  This driver supports the following events for MAC:
> +
>  - cycles
>    This event counts MAC cycles at MAC frequency.
>  - read-count
> @@ -77,6 +81,7 @@ Examples for use with perf::
>    perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
> =20
>  And, this driver supports the following events for PCI:
> +
>  - pci-port0-cycles
>    This event counts PCI cycles at PCI frequency in port0.
>  - pci-port0-read-count

LGTM, thanks!

Fixes: bad11557eed2 ("perf: Fujitsu: Add the Uncore PMU driver")
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--NbO0R4EJyzKSY1Br
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaNYzwwAKCRD2uYlJVVFO
o6N7AQDryZCN3xwFGEM7qlOOqBj76vCAWmEtkmo3TmPrjKyyYwEA49RtoROV15Bl
tuPYAUCrgFJsY2X1cHM56Ht54/EymgE=
=Fjiw
-----END PGP SIGNATURE-----

--NbO0R4EJyzKSY1Br--
