Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D727A30AAB8
	for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757938865; cv=none; b=X0zkRnErYyBBHFwl//SbgOFQ2zPI4lxVgv8OBRdt2mUBoQzk0g6el3c04L9PNL//CvxBd7Nky8Rrjkac045f7C1ZsA1irA77eIVZFzFlGDKeGxrYysjAzg6e1SCKOYrwhnK96b+/TB6cQ2LWXJ1pz5COVgpX3tUniFLsVM/Gs0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757938865; c=relaxed/simple;
	bh=dRXGhWojN/zmxVhLhhV7UBCFaTwMPK23OlCcE6/vJA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SE1LEmwhmW7WbPWu5dqmbU/FUvsxJxqoH4/ZxkILlSDsVFCxzktI8WfK2gEUrF0yNY5Fb+7z9pVuJU6Rxr1S1qlBYZk2jLnPcsLKSe+z7cfF+gY2aKaMQoO7Np7rcNXMkEaTxQVAmvxo3Q7+dm9CE6LcU0Lc4L4rf1wBK+dlkdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A0svqQWY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A0svqQWY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3df726ecff3so2250183f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 05:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757938862; x=1758543662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dRXGhWojN/zmxVhLhhV7UBCFaTwMPK23OlCcE6/vJA0=;
        b=A0svqQWYY98nAXTi9kuDSTEPPipJjudbrmhCo2ftEGwGqaqCr9QiYUsuHjrBfWrfAD
         +Uan2JVN+pog/3GfkAhB5tvG2HWwNGSS2DkT+/bqXwcrzDh4oAPFcltxjeShd9BzrxE9
         dCLq9atUMYZHGakoVjG59DEO8Y4YRX7d37eV4KQ+LctVHUnIB0lcVEiUaMF5s1So/P7z
         sTY7dXsQaHTYiNUmB5pSr5F7vpRbJ9MWO7XDcYMrAnt1sW6etYKyPuT+fGRKs57wfj0O
         8vQuNXDUnvTWxiPeO8Fr32Y4BCpfD1AZmeXRehOH9CqysvfDylpp5FfWZN3YcJWIFso0
         eD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757938862; x=1758543662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRXGhWojN/zmxVhLhhV7UBCFaTwMPK23OlCcE6/vJA0=;
        b=hqZYAtJNitRurXWAGUdzC9txkrR9Pdo2VqW8ojCXzxeX4mQrSJSaTecHloiRO3eceo
         NQFEdrFiL5eMJ8N2E6iMQKJ1ken5dtXEU8yc5UjPOoOVHk4VX6+JTI6Ah6JVRq+aaWSM
         GQyPbUiLFfPkAqQIBIQ4Gz0rM3AMtkmXIi2RDJpnA6QC+HwQFJUzgmeud7SVg0UGQN1S
         yNrWOTT0aivK4Rav4JD6oLQLU8bjkIkm+ahw6d96yQKg4kuJIHTnrhEr/vePXkaddZgE
         ndYEVrZqR8J6RHUCotgYRjo07DIZj95kPlf6j8gCDNJqbIB5+CtZHAkpJC3C3EgPMs17
         /w0w==
X-Forwarded-Encrypted: i=1; AJvYcCVVGneHmxYnnjdB7IscARewSJMEsffViNT/XVUVfm4bee8wIdMqHsDoJTtNvcoh+Kab9ieBDgBZlww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLR7FH6G6yqXzmYPY8ai/1/b0VdxDZZbdKJnTIsMpgWTMM3Pw8
	S1XWHeGflItU+e+YptadQWTEbGtBq6fjNegyyPruBdZvxPtUZFyoGmpP1HpH+Q0bfyQ=
X-Gm-Gg: ASbGncuaaEsRxXkqzJmY9lPBBmwat5iBQ/05iqevvTRCarVUakmqYqsjDvUuqMm6g4I
	EYHWnK5A/YEeQOdiUkjL1caHSLns/4lj0b2aF1DZLNIXKVzoZ2hbh4YezYM3zInXZfLUdRjp5AL
	zm2Y+jqslFHx+GuYQFXUANEWzXSpHJStVoIdqGrXSs9SSSU2VHGZ7cNxy+p2shnkY01G47xVDaG
	YTl3TmTT7mQz470atq8SBHC4ZG9FuMOr0yziCHLhGJ+ubKR9BM3Q75PjXWbl6kP87RtqIByfIUB
	PORgpPUuaD6ovKEHTedomwlKMpgRJ6eahlRNedaYpVg+5WpR18S86LX2sGxaSvWRNViiy+Xabyj
	KOMi7O4ffdG9WgOEIu/vZhffh
X-Google-Smtp-Source: AGHT+IHZxjPiVftQFFSVsD2VxpuAkBezLqcbHM5N6FMX7Nja48uVvgnW5IZJk5T4dZviTmbAHvCxyQ==
X-Received: by 2002:a5d:64c3:0:b0:3d1:42dc:c710 with SMTP id ffacd0b85a97d-3e76579317emr9382433f8f.16.1757938862113;
        Mon, 15 Sep 2025 05:21:02 -0700 (PDT)
Received: from blackbook2 ([84.19.86.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e96dee54d8sm7498070f8f.12.2025.09.15.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 05:21:01 -0700 (PDT)
Date: Mon, 15 Sep 2025 14:20:59 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux cgroups <cgroups@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Andrea Righi <arighi@nvidia.com>, Johannes Bechberger <me@mostlynerdless.de>, 
	Changwoo Min <changwoo@igalia.com>, Shashank Balaji <shashank.mahadasyam@sony.com>, 
	Ingo Molnar <mingo@kernel.org>, Jake Rice <jake@jakerice.dev>, Cengiz Can <cengiz@kernel.wtf>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 2/4] Documentation: cgroup-v2: Add section numbers
Message-ID: <duppgeomaflt6fbymdk5443glmw7d3bgli2yu7gx6awb7q2dhn@syjq5mmia6pb>
References: <20250915081942.25077-1-bagasdotme@gmail.com>
 <20250915081942.25077-3-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ml2yrs6lektswjhv"
Content-Disposition: inline
In-Reply-To: <20250915081942.25077-3-bagasdotme@gmail.com>


--ml2yrs6lektswjhv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/4] Documentation: cgroup-v2: Add section numbers
MIME-Version: 1.0

On Mon, Sep 15, 2025 at 03:19:25PM +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> Add section numbers, following the numbering scheme in the manual
> toctree. Note that sectnum:: directive cannot be used as it also
> numbers the docs title.

Erm, so in addition to keeping manual ToC in sync, we'd also need to
maintain the section numbers manually?

What about dropping the numbers from manual ToC and sections? (If manual
ToC is to be preserved.)

Thanks,
Michal

--ml2yrs6lektswjhv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaMgEqBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AgBMAEA5FwahNfScmcGEHeTMPg/
fK1406QYr3ODWMP8GdbwXk8A/3ZGZNF3X3LOGQ4Okk40J612ukJscIDXRv9sFEbP
V8UC
=5Zpi
-----END PGP SIGNATURE-----

--ml2yrs6lektswjhv--
