Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD04139D0A
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748339937; cv=none; b=d7AUm6ZRj1/mjcDkxQg27oKiKQhw1NfNxu9jNKoytC4N+K8/9FMAG+MxrNTSxTSBtfp6LHODR7BEoqd7xr/+a2MMjeVe56fL6Q/FgmzgIftRCHA43ymrZTiV05ETjpc2uWdwFxk2uwo71TXRyjEH2nKn9i+Cwj+i0esbVRd+JK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748339937; c=relaxed/simple;
	bh=gPXYMkam9e7YUM5qKqIBAC+BmfBK97NM0JOhRxCvlVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDAWbQJlPseUCV/JngfDj9LHxrIo2ztfJ/xH+rUZC/RSCr+FgObjWfPDJqwv4jnjf7uB02oO+WBseYBJMEx+6NL+9iYcCG499jkkqRE+5lz431wFBtpG04G+qMpSMI5sFrt/Yah1h/hpou2QMqv7q+agYF2Q6DFphhQIAbgMsQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eEzg4l66; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eEzg4l66"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so43684025e9.1
        for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748339933; x=1748944733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ovDeM7CFy59ro2G29zEI76iQj5LO8OiJCTjhuKqfgog=;
        b=eEzg4l66tQDN5pumWbXC13F9MqjmL8stt3aOAPNKrWn5mUs36jhHAb6D07pkKcFNQk
         jeqyA+vHBb08Pl7NFs/1PYhsnnMQH8Jam6wqKJA0/9vqcdD4grCjwx/XCdNTgEgsI6NO
         9zuVy0+rTIuV3unOb+1dVLFCBpl/qOENpDfvg9sBH1WFuzO9bS3FYFkB2GsH1H7WAcfM
         qqbhLL8BPgDfWaf0aUpsbZf1PnAEmWsp3G0zdg1SFNnnv2touQeIlNcrCjC1WpFjUm23
         P81ctXq7fhO9M1SIcC9MVEFV/7Rj3oN1p8315QYhBvlVPCPACw9yGUXBMdTMF2Ai1brF
         h7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748339933; x=1748944733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovDeM7CFy59ro2G29zEI76iQj5LO8OiJCTjhuKqfgog=;
        b=ckVEGmA9xYvYVftlWGdigJ/IzDeO+io1qSl4e4NmK7f0IKYn0/m2nxxF3MKCWbAyh0
         drGXn4ZeEGQUlClJUMQEGkvI4BqVzNlFPSAUurVCXH5IHhAdkm2a8Eq+QGnqexzzKnGh
         FJNyB3frB2rtvWIkV2iMmSgZX/kW6IRtjVIoneKPZPvv+J2jW6HUkKeBnhmbfRtD4kM9
         Kc/JKdzpXCIGsnLPIOG6K2EXJUTkEqLPY5R3eVX9UFwF9ttcspWGKGcNlYKqb39yVfTa
         kqYuyk5hmyfVY/7R7lqHKY9JTlgYOKgG/7bH7e/eHq9ct026jyYgR4y9DIQkij3yfjUj
         aQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEZvgm+ZBdlBga0Ey87ZR3Nkfg/rEkkAm8RzLM0FYEls7iNyYoAl/ixkpJ7swxLiRtiqRJjNq/ei4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUfoLARi5uMB1+rxb+pmkMD9QGUdbtohjLpdwkG+JieRlfcLkC
	EzeME2ZvNZXhK1zqvnAgN8eq3E58s3zqMLxvLf0w8Y0BPFNYkUDscB8k/f8VgeM1ieg=
X-Gm-Gg: ASbGncuDNlQJfeOtisPb7Y2k6a0s2maFqWm0GLt9LlqCadhleCUTrmSvtxLVSzBdaEf
	tNHGRVFu0ZpSXWpnuVvaB5fExDZlDxG8Qlc87AvOSGtBy7U0mLV5/1mKGGHdSwg50GMn5URXbjg
	/7fQNBZTV9yCOzftctKwZhijzet27IUi/M+qVjHs4BGIjt6Bbtem+syb5ofngmopOqfoY+nsTLn
	TIVoTC7uYWmL5MJq3rwCcJIK6vYYLAY2OYB6vTgqbB7bTUTbrE9RlwcB3FQKx1asMPqyfMckTFm
	GK0C1BjI8Tp7Jfj31Z1DRGWG6mjo5EPTaLBIyHIVGFJX9wo+YCvbvXIQ61osZZFP
X-Google-Smtp-Source: AGHT+IFtwTUjZn2K0uyc0dB9w9W6AVN79yBgYpvErxn26uh2Ttzg6hAA9ZousEeaV8G5tSv1mKe7kA==
X-Received: by 2002:a05:600c:4e16:b0:43d:98e7:38dc with SMTP id 5b1f17b1804b1-44c917f674amr93208125e9.5.1748339932904;
        Tue, 27 May 2025 02:58:52 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbe5c4edsm14789285e9.2.2025.05.27.02.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 02:58:52 -0700 (PDT)
Date: Tue, 27 May 2025 11:58:50 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: cgroup: clarify controller enabling
 semantics
Message-ID: <vzdrzqphpjnvrfynx7ajdrgfraavebig4edipde3kulxp2euqh@7p32zx7ql6k6>
References: <20250527085335.256045-2-vishalc@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rntxf4t2quqmp4ym"
Content-Disposition: inline
In-Reply-To: <20250527085335.256045-2-vishalc@linux.ibm.com>


--rntxf4t2quqmp4ym
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Documentation: cgroup: clarify controller enabling
 semantics
MIME-Version: 1.0

Hello.

On Tue, May 27, 2025 at 02:23:36PM +0530, Vishal Chourasia <vishalc@linux.i=
bm.com> wrote:
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -438,8 +438,8 @@ Controlling Controllers
>  Enabling and Disabling
>  ~~~~~~~~~~~~~~~~~~~~~~
> =20
> -Each cgroup has a "cgroup.controllers" file which lists all
> -controllers available for the cgroup to enable::
> +Each cgroup has a cgroup.controllers file, which lists all the controlle=
rs
> +available for that cgroup and which can be enabled for its children.
> =20
>    # cat cgroup.controllers
>    cpu io memory

Honestly, I see little difference between the two resulting formulations.
Could you perhaps add an example where the documentation confused you or
behavior was not what you expected based on the docs?

Thanks,
Michal

--rntxf4t2quqmp4ym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaDWM2AAKCRAt3Wney77B
SehkAP4m2JBDAcWV7UZtGTJZhDwiZgZ5EpMBCX5UXgau7TpWXwEAyQspYhrq2elF
Wq/V7UC4bJzdkIoiXD3ldrzKriS6VgQ=
=vJ3L
-----END PGP SIGNATURE-----

--rntxf4t2quqmp4ym--
