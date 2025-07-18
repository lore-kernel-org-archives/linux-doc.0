Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396B0202983
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752826825; cv=none; b=jho5dBGM1YJhwo+o0ErXN0beVYMxvhTPh80xQWdxwSsiKGsA7F/3VxPRMTpiRWcoFdoyH7gDc7Sgx1TeHJmm3iGiWeT56zW2jkQqzHN8LdhVfuehWCpY1/aITcuk8YlfGQUjNOF/Mgwgr29JiGUk3wd3DH6sob19lIWXpTjGae8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752826825; c=relaxed/simple;
	bh=dGKkJmaxhFVHM8HKQXN+ruzKyau0iJTAr3sXMaXEuLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pv1GAMue/GVg0rqMqOwOfzio1bKzp+mnD+a3Rw347icLW+pNqnA6Fz6XyEeQIFGNah8Fb4gj4yeJQZjMhefQK4OOlzcJpOkhSH/W6xvlbynkZ8oMz86S2L5NBBJnCPDUdorComTFc+FCcJGK7+rAO3OiV8psSKabQkLCzxvSY5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ayLmZxUC; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ayLmZxUC"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so3298309a12.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 01:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752826821; x=1753431621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ab4gQxsYWdk9x2tiurNH/DMpPwSVpR7XnZUZ/FhW6Xk=;
        b=ayLmZxUCnph7495FpfHRz5Julx3f4QFzSnlSJwHwgCKdyt80FAp94RXJWhdmj3ev0O
         bIa23o/5fsUJ5dVLEcqMdI1xLzx3OvW7aCnD5cOYiyg2U19Apmpg1EeJGkkbFzO91UCa
         33j7s25W7RheXYPljNKyrLORs9xWl3NXxDgH0SyqQ1muLRtDQ9GWLEd4Cw+T58xKFtxK
         SNrlh3Xh+ryC69zE6p0wfcpruiOaUzRrQLG2Np2GS1bY3jjTaa/0DK175CBNJwTbudhf
         iJ4Ulm/2Gsg7unpiRXCNsVmUcYdmmB8TZfhK9hgYwe4eTNCQc2oaA+vZ8Ia67JNe977u
         XnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752826821; x=1753431621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ab4gQxsYWdk9x2tiurNH/DMpPwSVpR7XnZUZ/FhW6Xk=;
        b=hPrwuArnYqkBqCB8t6Eom//avJma51IoBUCSUh3od6qUO5Op2H8ZiEgb9zK8xoL+Ds
         tcyxmcCVp7GJnnIe+ICk/YHQBm+UM4lIqxyPYpw0ZlBEqnSJ1awylA1KuvCkkRSe+SC2
         hK+Gl8u4R8kBA+Idt/J4X/nQyp/TkoyzbJJ27RL86lJHeLlwMa0NKLU2PZqkkmLmGhap
         S7isP1gP/sP61xnVwLDUiQU8ee+ks6vb71WgMKUN2XxER0FGrOx4OP2EtFWClqyI7dFA
         vwy4I77SD1Bx69Y4CbTJBIZzRZZCsfQekhetAdO/zzkdUwjY60ZcdwsWGW5bDTjmr2ee
         gA9w==
X-Forwarded-Encrypted: i=1; AJvYcCUgxZw6XFsWZRf7J1qBgj2e+wOeUdZUZFRpqQtnyg+VmDsU2ziIGy+T0maltEBRIWR4bhpcjUNNFUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTOkR6xN6q33iSB1WyFBlLe1XdlsuXIemOhVHCQV2qGFefi/E3
	jJ908n3mGNMFiFu3oIz9r5DzhVdqpcbUfRLiG4sFhiIHt9/BbLLSnbU6Hva82OyNVLI=
X-Gm-Gg: ASbGncsSMOQ87hYR5seveQlb0iY0ZmlHl254IyQ+0fo2c+D89J6V21CoHn+8gUb3yZw
	gGz5ehX//3R9qj0T5PZeVqfGtTYPGLj6l1b3Ts39MD/5/t6yq557/OM/O2OkSicHgVviS7deOZO
	o2osyzVyhs9GhPvyMcmvpNrJVQ4l1pFXKV9xeY+Z3BduE5kUIw2XPZjbZN+YItf6MC8SNI48glq
	lorsl3fFkAyY94WF2f/VwWfns2Si2lIuucSqP04sb5uY1SZEcUulecY5uTjBcQbrarrNe7LXdCR
	GbeaS4hw5Ux1QpXnWhKN3uoZEZ2C9DMr8OSrwlqch+iAplCKzo00u1xsJQvRxWL5R+u4tFGOVtH
	rC9BflrU5VkoJkd4HVIPOPIgDG5ZPO4C30gUP2nXd8Q==
X-Google-Smtp-Source: AGHT+IFlFmeWi6E0SMdOYun34OYAUB6SXhFoP9bJcXLK1nm2xdgsaBjOm4t+cnMR1jx+yUkBsFJYSA==
X-Received: by 2002:a05:6402:268c:b0:609:aa85:8d78 with SMTP id 4fb4d7f45d1cf-61285923522mr8734807a12.8.1752826821337;
        Fri, 18 Jul 2025 01:20:21 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f07e0fsm635217a12.13.2025.07.18.01.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 01:20:20 -0700 (PDT)
Date: Fri, 18 Jul 2025 10:20:18 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tejun Heo <tj@kernel.org>
Cc: Tiffany Yang <ynaffit@google.com>, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Chen Ridong <chenridong@huawei.com>, kernel-team@android.com, 
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2] cgroup: Track time in cgroup v2 freezer
Message-ID: <mknvbcalyaheobnfeeyyldytcoyturmeuq3twcrri5gaxtjojs@bbyqhshtjfab>
References: <20250714050008.2167786-2-ynaffit@google.com>
 <5rm53pnhpdeqljxqywh26gffh6vlyb5j5s6pzxhv52odhkl4fm@o6p7daoponsn>
 <aHktSgmh-9dyB7bz@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jv5tpzpajmrvvmyk"
Content-Disposition: inline
In-Reply-To: <aHktSgmh-9dyB7bz@slm.duckdns.org>


--jv5tpzpajmrvvmyk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH v2] cgroup: Track time in cgroup v2 freezer
MIME-Version: 1.0

On Thu, Jul 17, 2025 at 07:05:14AM -1000, Tejun Heo <tj@kernel.org> wrote:
> I wonder what hierarchical summing would look like for this.

So do I.
Thus I meant to expose this only in a *.local file not the hierarchical
one.

But I realize it should [1] match cpu.stat[.local]:thottled_usec
since they're similar quantities in principle.
- cpu.stat:thottled_usec
  - sums the time the cgroup's quota was in effect
  - not hierarchical (:-/)
- cpu.stat.local:thottled_usec
  - not hierarchical
  - sums the time cgroup's or ancestor's quota was in effect
    -> IIUC this is what's the motivation of the original patch

HTH,
Michal

[1] I'd find it more logical if
cpu.stat:thottled_usec were cpu.stat.local:thottling_usec and
cpu.stat.local:thottled_usec were cpu.stat.local:throttled_usec.
Only to illustrate my understanding of hierarchy in cpu.stat, it doesn't
matter since it's what it is now.

--jv5tpzpajmrvvmyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaHoDwAAKCRB+PQLnlNv4
CBlXAQCByFJfBP7Jk7Z1s3RPv9V0QeD7jkoLucvvfVRWjUYuhgEA4pHMWxkdHUIl
LfzPAnEZM/k+NpkUWf+uTYbOtaMqcAE=
=lUcY
-----END PGP SIGNATURE-----

--jv5tpzpajmrvvmyk--
