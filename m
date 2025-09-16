Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992AA16132F
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758032770; cv=none; b=aWf/UbDyvDvWVpbAwR9h0w2h0eEB5aPFW8S33QHihEHrK9VwYRdIaV5Tu6usiwtlD4CGOfQvNI2YlRdnmIM8VsNQoJ+yepHxCTWAwdvbJIs3n2XbeqdGVhqu2Rei5dWhSvN07L5eXaEWTLXr1HqPm/obCJew/DBzXuQQzXR7mWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758032770; c=relaxed/simple;
	bh=uMcNijcnMhNAb21qUVKzkgNAFVxzUGHz23fC60dNeIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCHqzvQQ0CCbElK3c9AxhmC5Lg+qPuVrQ0R8y/lrgMXxzNjI8kqLJFmtAvcm7/mClVwCTa9qM5eVBIAaS26qN/830fc8yH9S4XKlmzcMDucdzU6mfLDM8gY+vk4Ia1C9JqoAaxxZUG04bp7X357tv0UvRJVU0DfZngJZNyeOPFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5qR3kuQ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5qR3kuQ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7723cf6e4b6so4300622b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 07:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758032768; x=1758637568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMcNijcnMhNAb21qUVKzkgNAFVxzUGHz23fC60dNeIw=;
        b=i5qR3kuQul7ReRtJ1G689EkiiLGo4VjWuui5IT8xFrpYrkc6PTtOIk0m4yzjYJojCj
         je0uJOYIKVPyOsOToWRO0SnwhV+nDJo+EolO0Pfwc7TkUAskgpQ4MS0IJSQFfsWBonW+
         lcfeSHFOaZW+DzSDbvb94tXc+GF6t6pnzwvwWApUYDiCCT/zTvrE4alKa6FKDgml63BL
         StXy9hvUlJRrOPlg8KMZec5BPca6SRcNCBc7SMjrG8EZA7vsYzIpIUiNw8rkieCcri16
         T4Hb/YjYnOcRCnueAmAdXTixYVmDKQekNAvapwQiEFL2HZE3p+1HgfTZ/FKggc/wSx+Z
         eDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758032768; x=1758637568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMcNijcnMhNAb21qUVKzkgNAFVxzUGHz23fC60dNeIw=;
        b=lIw/cNL7yFLmaIDwRvZeVGDsAC+V9N9fB0QCT5Hf8w9rFkqMPolDg6Nui+IWJrbSoF
         DLz729QxPeMHqJINgVOwDyuH3bCheRtqDSH7ih7+CjZItl42xQ7UL7OMhyuzxxIleW+o
         +xzx6AknKpoGNPHZ/YabSjnr+ZDXHJiIXBx1Cde8Jg5lgRjHCkv2prEe0sNCZm9unN3a
         szDbsGsR8JtCwQve44ec3SlinwASbtB3zJRZfY6konieAzQ1E5emIuFBfnAajg2Ho+X9
         EDU211EewPhkTtsAA3cH48QDh6WHi/xQMTHTrvyZVcfI+Pb2mkySJnSqgdJydSnrAUne
         wGqA==
X-Forwarded-Encrypted: i=1; AJvYcCU0dmVVIB4AxQuEKjH/vOtWbWco2BFSkU3iuHvWDB9KSK6872ECHSzy3aJkXvH34X3d4tm0cZrBtwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YybKzTg0ZFW/4kiLaKdi+IDqVPbFUPQx6GUQ47lQWvwJwB5wcIO
	utOnrwCtpNyXfLjBK4a2n4I/ULlbCPG57zCyDI7pqlx4rPT0TIMvoWLt
X-Gm-Gg: ASbGncuAE0TmfJ87LTrgfLHX+Eg14jusbYlrt0zhXOUlwFhcQ4TgyWzIfWC92txnyuW
	FSnVydWCr8eP6Er2RDxqJ8tOW/We1CIAYqzF/dpn4r8FMYiaJwZlup5q0XrUIwHXkQVDT0WqoGH
	a20Di+ZrcCEUjYC9j192BYe0gBhCCyaDCk0Ph8Ld2a0t9sy/U0m5eNvShPi7GJDK2IiAPx7Dy2C
	0n0btYZqvJ/KmZ7nZjV9VahNYGsa7itNsH5MAsnOcMj/tIa1ecVuqGHcbUJ5+gmKX0uWZGyfmCw
	7dn3lff9TfYM9iUTrKUYSa0FP3eQkBBmG3XgbkxRNje1DH1THlxxBFYMU16dieMcaNld9VSzhkP
	SXoPON9Tbnbn2jkxt5lGZPY0K/FfF2rTn694n
X-Google-Smtp-Source: AGHT+IGvai1R9UV5qW0JLRvwDFGRIhjqqVqH1mBx2L0LjYmLE/VS4NAz9iq4LkE/Qr5K0/uaq6wsQw==
X-Received: by 2002:a05:6a20:1590:b0:263:52cb:bc49 with SMTP id adf61e73a8af0-26352cbbd14mr11711099637.35.1758032767863;
        Tue, 16 Sep 2025 07:26:07 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ac02de2bsm12128980a12.17.2025.09.16.07.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:26:06 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 9679A41F4135; Tue, 16 Sep 2025 21:26:03 +0700 (WIB)
Date: Tue, 16 Sep 2025 21:26:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hugo Osvaldo Barrera <hugo@whynothugo.nl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux EFI <linux-efi@vger.kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Documentation/x86: explain LINUX_EFI_INITRD_MEDIA_GUID
Message-ID: <aMlzeyu5Apwfp-1j@archie.me>
References: <20250916073244.590483-1-bagasdotme@gmail.com>
 <b629ff7e-a223-467f-8e32-78f825bd31ac@app.fastmail.com>
 <87zfaufrcq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pXurbY7g+wD8W3os"
Content-Disposition: inline
In-Reply-To: <87zfaufrcq.fsf@trenco.lwn.net>


--pXurbY7g+wD8W3os
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 07:40:21AM -0600, Jonathan Corbet wrote:
> "Hugo Osvaldo Barrera" <hugo@whynothugo.nl> writes:
>=20
> >> +When compiled with ``CONFIG_EFI_STUB=3Dy``, the kernel can be execute=
d=20
> >> as a
> >> +regular PE/COFF binary. See Documentation/admin-guide/efi-stub.rst for
> >> +implementation details.
> >
> > I must insist that it's a terrible idea to replace an actual link with =
the
> > name of the source file.
> >
> > This might be (marginally) more convenient for somebody who's editing t=
he
> > documentation, but it becomes completely useless for somebody who's REA=
DING
> > the documentation. Documentation needs to target readers.
> >
> > For someone reading https://www.kernel.org/doc/html/latest/arch/x86/boo=
t.html,
> > the above filename conveys no useful information.
>=20
> When the documentation is rendered into HTML, that file reference will
> be turned into a link automatically, and people reading it on kernel.org
> will not notice the difference.

That's why I keep the file cross-reference...

--=20
An old man doll... just what I always wanted! - Clara

--pXurbY7g+wD8W3os
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaMlzdgAKCRD2uYlJVVFO
o+8YAQCQPDGTVdHgN6kNhi8fzWdgDD87slM6RKRQ2aBrU7sBWgD/arfkPpsyhNCy
ne5Fs6gwrSn7y2ClBkaa/KtkpD7cGQs=
=bvi7
-----END PGP SIGNATURE-----

--pXurbY7g+wD8W3os--
