Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC8E19F40A
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 00:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762216329; cv=none; b=TBTZCqsa99CWYzFHvMBVq4rPYffCzI98sxsxziI4+mvTASWo/DZOHDNeH+PM3D4gs+KC9WSv/mxS5afvwwynChreoKy9SqQS3giFw/AxkZ4WVIxpU97HqAUHT/tAjonwEKoGbkrRqRMaum2QFp1I0Rf1kbHvWXoxeQZDMcwjdYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762216329; c=relaxed/simple;
	bh=EzjTBAwvU94v/bPzbfeTAElCW//N6OvPe+91MnzlLns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JR9TPNLqZDOFERCDZOjRufcPTUd6+y4hrFmtw86f1pCjrc/AG5vzuyqKlzm75rS/0gTl4ueiRbk4VVniwG4xWrdEDAWG9tbnsZXZAECW+yF2zE+D8D7ZKVhvUxvPXiq78CfUhD/rNmtdmjM2uI14bgo9B4WyFal9V5hKlQ/9nPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaWT1kTi; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaWT1kTi"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso2264365a91.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 16:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762216328; x=1762821128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EzjTBAwvU94v/bPzbfeTAElCW//N6OvPe+91MnzlLns=;
        b=VaWT1kTilT9EgtcjN7C08WUKB/4VziE5OCy9zmpmgs1cGYmkMlMYF3Awq/9kk72MpV
         bNlcdOp88ETlX/40cBNhahzmpZLt1D0iKlRG/UM8eH48nKM27fMMd0y31BveOZUyr5ai
         rXl9JErfm+98+3P0PIYBUQj48W6/uOZUrIbsqOW4rsXGszOxMI9UdYptyMJ8g+32VGnK
         Tc0AYWfvt9L6cRg9P6Pq0dEQ9A6P+e61EaNOPMMo/Swh8P07e95uf+rqK/DwJbdZeLQr
         a8/qZnxHes0ZqirYG2ZhMD6uja3Xp7dykUtz7S4I/vk26dcYkXVH8hCeZw70c7qF+YE3
         xNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762216328; x=1762821128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzjTBAwvU94v/bPzbfeTAElCW//N6OvPe+91MnzlLns=;
        b=fCoJuOoYf3sv1GjTy4HhqvZ7jpKbBWtG9tkmqaOJiLZDwJaiJKpAzqnbrwypUISV8u
         Pt+EYmnRxcT8gr6N4EonC0EJ4uFJqtLlXrLTXks7TpJMxVTW4bkRSwhjbUTaPTYhreFP
         n86KGyOadWJGo2gkf1ckm36yW9LwlW/zDSQ+9/OQCw3dmvklsQfVMLH6HpYY60sdbD+k
         6SyzXHo7yUFS6BAEeRLsHprRWlbw99zdOBbg7kXx0YofxhmSJmFOYDpALeeng/ispQvx
         fy50h9mOy6IFxGXxSQo3bmvW027/Dj9CpLXHqEpKKNhgkokT06SCh27O6odzWNQskezG
         qDNg==
X-Forwarded-Encrypted: i=1; AJvYcCXchJ0ArfSl/wHBwlHJ2RV3df/xwqcvLrbx56DCrqhogfzCIHesgWC9rToLOBcrE93WjSBe+i+WajY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Q5mAt52Nnyijjt48jBzPrAlaOACZRjyh4Hb5Bc2d1wgZ6sXU
	2/o6pDcTlI2WiXyo4JasdC6zQnELvHS0VkUmjYg2Y+fWDT6foTwEf1GV6w9IC+j2pY8=
X-Gm-Gg: ASbGncvmnbo1PRXhtf1M6N7t7sjP5OSCklv+L9JdI05JE7aDlctGuusmI+XK9StNksL
	YOX3H5ruFDtaOXh25NDQ7MDyIcU5uBIUYieO5uTRa5dhZ6+t0ZAM8ikq46+As/mmBPJGOELT5Gq
	j2PXreGRp1HVZucTB09bKZc49Z6xxOsvbV8X5Nc4vg5iweyfJcRFWRn/vXuO+DanKY4fATD8zjy
	NcwSz9VuMHqvXjcbeP32Kpd8S6ecWxyNtxhry8WGo0aXoLvowLMOuIE4BiS0I7qG68dKlqc6vIr
	mgqaF9EC4ib++q94Vw4sAiIIHZ2gpcVPdMajTcvJfJ2BpYSRicJtRxUAmcwbMimmKd/6UChx7Mt
	/+5rMDSES8jdcA9oVLk4CSHTbkkGbY5DDQzOSwXQ5J18MFEbhXlxkeErlcC6n3L1noCH2KCytcA
	gS
X-Google-Smtp-Source: AGHT+IFt5SeQ916AMUJsWNb7B1YpkjSR8t7K5b5b9UkptlPUrEQP5Z0SH3NkZ6tNCJj8hZeoDyxvEw==
X-Received: by 2002:a17:90b:3a8c:b0:335:28e3:81cd with SMTP id 98e67ed59e1d1-34083074e03mr17519671a91.18.1762216327673;
        Mon, 03 Nov 2025 16:32:07 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415a1c2f30sm2373376a91.7.2025.11.03.16.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 16:32:06 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id EC0FA420A6B9; Tue, 04 Nov 2025 07:32:03 +0700 (WIB)
Date: Tue, 4 Nov 2025 07:32:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, Tomas Glozar <tglozar@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	John Kacur <jkacur@redhat.com>,
	Luis Goncalves <lgoncalv@redhat.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Crystal Wood <crwood@redhat.com>,
	Attila Fazekas <afazekas@redhat.com>
Subject: Re: [PATCH 0/9] Documentation/rtla: Cover default options
Message-ID: <aQlJg91DeyBptaW8@archie.me>
References: <20251010083338.478961-1-tglozar@redhat.com>
 <87fraubsfv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o+8Q7yIiXGu8SIGG"
Content-Disposition: inline
In-Reply-To: <87fraubsfv.fsf@trenco.lwn.net>


--o+8Q7yIiXGu8SIGG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2025 at 04:35:32PM -0700, Jonathan Corbet wrote:
> Tomas Glozar <tglozar@redhat.com> writes:
>=20
> > RTLA has many options that have a default value that is used when
> > the option is not set associated with them. Those are not covered in
> > the documentation for the options, which creates confusion among users.
> >
> > Document the default behavior for all relevant options: -H, -P, -C,
> > --trace-buffer-size. Some of these are covered in general
> > descriptions, only missing from the option documentation.
> >
> > Also, fix a few typos and incorrect naming of tracers.
>=20
> So I see that this series is still unapplied...should I take it through
> docs?

Of course!

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--o+8Q7yIiXGu8SIGG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQlJfwAKCRD2uYlJVVFO
o4kEAP9UdSdSy1/W8h/KlyOlfloHW0w85gSQ+6a7ua03xKekQAD/cExKlLgpyLYY
xxOrG2MH2kQLhRRifqkbmlKwMtCFAwU=
=giGM
-----END PGP SIGNATURE-----

--o+8Q7yIiXGu8SIGG--
