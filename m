Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AD72144C9
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 02:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761099366; cv=none; b=jaZQDKhofv+cY1uy4LDZMAzU7ZJWYaGP8/UMOcKIoVx/GE7+/bG6e8aU+/THK4fDPYadDjW7naeRCBZGEbGWtPh+wbrnzXPoixyr9Nssao9nbe/cd7fvk4CtGe0tBrpn/jEMuOrveCurgdQCYyUY/zyQf0+Kbfw7Iw1y5GUY2K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761099366; c=relaxed/simple;
	bh=ZNYpaJWfK2uX7fNuNpV/cydFuI7wkAz8CLs/mB6yfTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNLMcCd4Xl/k2icNdV9r+jEV86tHLQdwOSXtkceyThSdOUEuJ8t8ZoUrpUoiw56cGb+iL2KOC5Adnd+TuEdq2lJcEtJipyo/CPdmGgcVoneOhIiABYRvZzoMN57nf6bil1CmLPSRRwzMo9Cflc+z510QR4YJDJQJVUEZF2ogc88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGvnAwwZ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGvnAwwZ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a265a02477so308167b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 19:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761099363; x=1761704163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+yFbQwKVrg4ulSzHTYcdE0/YBPiD7WzPZ8N0zJ6yfUg=;
        b=dGvnAwwZt24nsiLUJRQ+UeeMvxr4qhMK7hbIRNA/JtjRZm+MyX5aOyGPmAE9+aG63s
         sIPjbmktHkBIYrux7vtL2hYmwgKy0ZO3SrjGJoinbBzGJ0vhWAzp3oFa2NwKF+6HSpaF
         U33/acgsn/aL38aB64HDrZvRVH3aNZwo/M+146H2/AR8b2/2Bsd1Sx4Ti5+ucnXNz4rP
         jDfYjgKGeoOKPPUszAjZK8/F2YJ5RlC+Z7nmDvQ5Hymjjng1sFkw+m7TSR13ClGpOhwb
         mWuP6aVNTUZKshV9RAdycFKEF39Uue+m3oIL87XatFOPv0ffaBxrpAiEi6kShMe0dkda
         r2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761099363; x=1761704163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yFbQwKVrg4ulSzHTYcdE0/YBPiD7WzPZ8N0zJ6yfUg=;
        b=qk5DIRDpHStzAirp/mVy55ID4PpNk4Pux1R1r/qu7THtSRD1nXvvKnqRMgwMQagwWU
         v8/NFGItxFEdd6SgrgmmbwuuDsMeX+CU6YEoDrOm76V+9YOAoRwnlh1rYGPCWeuNNKpJ
         4ijSJ+59T8bX4IjVQQLdSNsduI0l57Keb5SNNO+lJ/7E0qxbLRUlEOjYL2WnTz4f5Ydw
         1ZRQaDwFglO+BqXtbO9Pta7nxwMt65PthObeC1rNejOOWkU9AdKK3hb/dVWNrM+VVXka
         v/d+ykDXROGxiHKsIFXY62wc4i4rDD41aITcCCuZc/bUpDVGHQkxpKuM0BSKrjaEOC8l
         Jh3w==
X-Forwarded-Encrypted: i=1; AJvYcCWD+IDENeFKSfCo7G0d+ZiKad3KZ29tK503N14B4VxUfdKgYHiNbP6QW3Msk/RU2k22idgLitQTslc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk/AhkeatL2HiDUgnQq3zP8vn/9fWmjxEy2XuCYDtlbWB7eT5T
	tx+HaB2SOu9HesRlfyenfE7XaHSjK+HB0HSIh2pA5195AeFh0iNN+MyB
X-Gm-Gg: ASbGncsBjN03A5orilFv/e4kpxrmN+h9c+9CE91f8sMZJTNCbjih4jP8gsBS+l0cRF2
	hF+ZtjJZTRSxjlu+AQJc2Q4rmEWGU+7KsBUPFKEH68RsW23nZ+etObnJk9gRnR4iEEZJ29RRzuY
	X2rD2mPT5GqiAgqw0UkPFVY3TtBKwWUb5KCAIrWUcxkhdoVzTwvUmiUxHsFaJ5FVB1Y7rWcRuRv
	57RYANF+3CTpDCf1czPb0UhL8wad+5yMEXWLGNW2k0hMyqqFr10ibVnAj8gXZjAvoX6O502W+eS
	uMlG3U618sDo7WV/dzCbaScKjYMwhFfyKzIk4hlo7/QxJrSLSPNGBlr3iy+jw2vZbwazrofoo7c
	/pLWFJPMxInLPNgb9eAWPjp/1mdo8uWPyUg3F8YZKXKnS7ErKKcVWwc489B3/9fUHzhaj5O54KF
	pnwG8kgN4ukHy9
X-Google-Smtp-Source: AGHT+IHgcLczGY0gNkz46ZH3wqYDdp+xytg9WZxLoXNNek71M0Z3I+LEtQXMo7LSXlQTlq9C1XGtow==
X-Received: by 2002:a05:6a20:5493:b0:304:4f7c:df90 with SMTP id adf61e73a8af0-334a861852amr26222250637.50.1761099363079;
        Tue, 21 Oct 2025 19:16:03 -0700 (PDT)
Received: from archie.me ([103.124.138.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23010da0bsm12753936b3a.55.2025.10.21.19.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 19:16:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 48C344209E4B; Wed, 22 Oct 2025 09:16:00 +0700 (WIB)
Date: Wed, 22 Oct 2025 09:16:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Askar Safin <safinaskar@gmail.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org, linux-block@vger.kernel.org,
	initramfs@vger.kernel.org, linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
	Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Dave Young <dyoung@redhat.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Jessica Clarke <jrtc27@jrtc27.com>,
	Nicolas Schichan <nschichan@freebox.fr>,
	David Disseldorp <ddiss@suse.de>, patches@lists.linux.dev
Subject: Re: [PATCH v3 2/3] initrd: remove deprecated code path (linuxrc)
Message-ID: <aPg-YF2pcyI-HusN@archie.me>
References: <20251017060956.1151347-1-safinaskar@gmail.com>
 <20251017060956.1151347-3-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m/ueW+980/ea0Wf8"
Content-Disposition: inline
In-Reply-To: <20251017060956.1151347-3-safinaskar@gmail.com>


--m/ueW+980/ea0Wf8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 06:09:55AM +0000, Askar Safin wrote:
> +		if (rd_load_image()) {
> +			pr_warn("using deprecated initrd support, will be removed in Septembe=
r 2026; "
> +				"use initramfs instead or (as a last resort) /sys/firmware/initrd; "
> +				"see section \"Workaround\" in "
> +				"https://lore.kernel.org/lkml/20251010094047.3111495-1-safinaskar@gm=
ail.com\n");
>  		}

Do you mean that initrd support will be removed in LTS kernel release of 20=
26?

Thanks.=20

--=20
An old man doll... just what I always wanted! - Clara

--m/ueW+980/ea0Wf8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPg+YAAKCRD2uYlJVVFO
o9OtAQCr/giTF4+FVt9hiDGkb1l4yn/kE0D0NKGYI1gigRnAqAEAhLIU0ssllGOB
IgSBphGX7ddV9bgZvHiqagtFYOgJwwo=
=plLG
-----END PGP SIGNATURE-----

--m/ueW+980/ea0Wf8--
