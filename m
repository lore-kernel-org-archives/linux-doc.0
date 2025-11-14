Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BDF2FB967
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763144975; cv=none; b=HJ93JjXFkIgyfj+NohYquKEeUiSaf4RPtaf9rAK5mTHpVvsBlwzY8BZN1IIVQDhTZHxmzOOCo+VW1z0vmwtbo8Vx6T2Q3Vr8Jg8+QjOWTh1tLDrWegCJEL+xks3/8SH8iuk9IVEquxZN9wYHA9HaOaZaEWtE3wEn5zY0kjsFRNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763144975; c=relaxed/simple;
	bh=V+os3BBZVwF/PrLDunpQ8w9lhgRvpQnhZ1tdXiJr0Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSLWw8pii4y86vCItbwsvbbvwymPg1HHLtfbfJYiQzrEKT7Q2j2QUEyvXmiFg0nGEXsvwitJ5WLUDNldmvEfzvXZsLnnSlEkK4HEmVUbjS5bHM4GCvsLniP4nB4Elfdj/7ZV/Y0NmSsZ8p9bbgC43rpspEm1uOsVJxybvDUjwPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RJbPo++5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RJbPo++5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so26134205e9.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 10:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763144971; x=1763749771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rs6KuXzAAad7sbRP025YxG1G/WsCswtNWwIDQpANIbg=;
        b=RJbPo++5wNv5rMNXTV+GeN14ISgMPC/3K7VSFi9s6J2rV8C9c3A66+ecEG29j72MxK
         qRy0rel6NAPfA9xImlkWhRHvC5nGHkFmquW4nI556G4LyDr8HWeVLegnUsTDf8gz7gV2
         VhmQTqeLZHl946mS4UocJIEqTfA2XUt4tBu+qPl1sPYV/A25Zpez5cYkVQvp4jJdg59M
         0MPgNSLV5IDmb33WqFGSnWbz9rpgWwM5zTSZ956B0WJqy9F3A0VWSon/O3mbm5fB3H8i
         9LixIjF+EYI/lewA4H6xrkr7/j3s0Jx5t1Dnoept3bPw87WPq+/5gb/7ZRNIz+LD0Ph6
         g3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763144971; x=1763749771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs6KuXzAAad7sbRP025YxG1G/WsCswtNWwIDQpANIbg=;
        b=syuH2OJDEhSeaDpe65lqhVVezdxaUzVlvCrdIQnv53Rw+YMI4JhI2dtONSO5UjR55p
         GgZYastXZGzxKTodLDrGvV0MzSg6QAzcP0MyPt6w4EWN84A8aX17c7EnMg80jaZbDNgn
         LZ2nCOCkThz5G6NHmjMH4o557CqtThOCpX83NtdBi+HarchxbSY3bEr2x5Mh80yBDlyy
         33iSsfmjHH9RkpfdrgvhZuSArbmsZj9dQ0hV4kvWS1l3JAzKWOr6xfEiAfApQ4uAh5JX
         WXYt6UqrnBmlIfGThkZ5re2Xo5lALiCCYIKeXf7BwP9h1YLsCcrs5xKwuCzHOlZb4lUg
         RzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9EMFj8I13j3bMIC26jIDHQfL2CVkO8ZZ66ffpmu/tA1OhqprdGlM1ZE6m2ChU+dJCzuyeqbZex50=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl/xLGW8oHRsoklUSSFrkwo8WRguvw6sMDc27xNAJDtHKeARFM
	/Q7TePwQ0qd3DTBJO3e6jMC7J47aGFbPiwkb9zooKWxJPW+jiWlmFi2tkPMKWhnHEVM=
X-Gm-Gg: ASbGncusVXareFxxUQ71OCK+PE1/4mBMT51Wl8EnYGwMfdTve8lVWuy3B+bHQ2Z89il
	0dBUePgm1Q16BzBzTwwAGCi4xliOSd4sEqhtpE+KV/8gc/euCyxOa2XCw9Lisfne+U9cSQyxkXP
	AFktAHTr94lh1venyabwZLi8Wbt7OSCS36TbjnX1S4NYMvXKHC0pejn5K+ZKf7eqX8KPkoYOiOZ
	2GamKw5YMHpulQ24uhG6iRxnQk9zlVHpn6qkx2n5ELEVX9COjwlKCh8Azc3RbO0+dyBKOprmIyV
	8l5hWQlQu0baOVwRQPQUqMuh2gCCuF7W/B6XA43MY9DUya25oeuUFI3crNHRskL4bBh449YqFrG
	r4h7Jvc7syYx4YhbIuKkRqIwd2LZgD7+i7B95s8HvSIE2Wwdkhz1UU6/N0PX84vvRGJeddQaSBC
	/T93njynEuWLa5yPCgfL6s9ag5NjBopmw=
X-Google-Smtp-Source: AGHT+IGiVuh5NjUH3OUXRwywEj3dAAcLkuSOQxnMCr/Tjl01waowqDE5+kN/bovUGSqLMkvh7dTWrw==
X-Received: by 2002:a05:600c:630d:b0:477:89d5:fdac with SMTP id 5b1f17b1804b1-4778fea1becmr45809045e9.31.1763144970812;
        Fri, 14 Nov 2025 10:29:30 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787daab3fsm184371285e9.0.2025.11.14.10.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:29:30 -0800 (PST)
Date: Fri, 14 Nov 2025 19:29:28 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Natalie Vock <natalie.vock@gmx.de>, 
	Maarten Lankhorst <dev@lankhorst.se>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [PATCH RESEND 1/3] docs: cgroup: Explain reclaim protection
 target
Message-ID: <qhywsiwlbrpe4el3pcprtnpwdyifmfxesmsdgxuze6ho3d4wqe@mweffv3yoxlt>
References: <20251110193638.623208-1-mkoutny@suse.com>
 <20251110193638.623208-2-mkoutny@suse.com>
 <87wm3xwtcm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iit6ajlbncbnam5z"
Content-Disposition: inline
In-Reply-To: <87wm3xwtcm.fsf@trenco.lwn.net>


--iit6ajlbncbnam5z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND 1/3] docs: cgroup: Explain reclaim protection
 target
MIME-Version: 1.0

On Mon, Nov 10, 2025 at 01:00:41PM -0700, Jonathan Corbet <corbet@lwn.net> =
wrote:
> > @@ -53,7 +53,8 @@ v1 is available under :ref:`Documentation/admin-guide=
/cgroup-v1/index.rst <cgrou
> >       5-2. Memory
> >         5-2-1. Memory Interface Files
> >         5-2-2. Usage Guidelines
> > -       5-2-3. Memory Ownership
> > +       5-2-3. Reclaim Protection
> > +       5-2-4. Memory Ownership
>=20
> I always have to ask...do we really need the manually maintained TOC
> here?=20

Tejun [1] (and maybe some others) like it.

Thanks,
Michal

[1] https://lore.kernel.org/r/aMwo-IW35bsdc1BM@slm.duckdns.org/

--iit6ajlbncbnam5z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaRd1BhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AgYPQEApUkkuPc8jpbhA9W1qLNR
2OzJ5OQuiJ+KJRVk9vv4/AQBAInGMLPC1Ye6Oy6vRBeNzV+ocTcDynZ9usjxMN5D
Jf0P
=7GH6
-----END PGP SIGNATURE-----

--iit6ajlbncbnam5z--
