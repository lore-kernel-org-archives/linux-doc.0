Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E37B420E75
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553394; cv=none; b=j4Rub4MvR0tIhKPC9vUOBHxZPiy0rnurnLgUKH9txdGEh2ka0Rsbh4TsnF8E75BEsXxBtD+UPn3cbWwj/kr4exk7f1ifa4cBqsx+/hANEZX9oy5Z3oW8gjbozDMR78S7ZHE9IbiaJAYIiYtzAiBFNP16ULq3+TntH16TR23UgVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553394; c=relaxed/simple;
	bh=vax+aFL0WSjB4okz2i0tD/egGJ5gksI/+/yOw6Xy4rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oz/F45xkxX+4y/d/WkaaN8nvh4ewMHrPIZp6+3ONS++lDJuja/5WvDUdRujmOUBj8XFJNkvemhcRPT2Wl46EExGDUvpSA8MEENWJw9i77YJzEW2+O8nv60s5VOOHg5H9swU6zLYOlGUJKXf0v072c6jap5Q1h8h2rp+MD6Nw7Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MIlc38GD; arc=none smtp.client-ip=74.125.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MIlc38GD"
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-493b9643ab5so19597925e9.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 06:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784553391; x=1785158191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vax+aFL0WSjB4okz2i0tD/egGJ5gksI/+/yOw6Xy4rk=;
        b=MIlc38GDy7Z7bOsk5sgyBd8P5hGX51du7hIkpzk4RgHJc864dqgo6hgYqSEjSJQdNH
         un9dJgEUvtFSEti3ctJxKJZZNXY/fQpzOsSQqcS2ZJv4OfByyQ52vTJU6XQODj8YbjoC
         Qq3nFCCuxhSRgrUwTDF4o7F4i9i1YbNnZ1NkEH51LB6mTxm+T9RiN84R1ZEGlWxIUAfk
         xN2xhAvCDfxvzC5FGyRLdZkAgIHFkkeucq7fGCrLzRSJQgaiIJHCS6k3RdSVQaNjWisg
         95IIVvyn9zNuvTRay7lCCPIaOjxcVVPff47w6lvXqodeC4V7IWOMV7c7dBNve3VltgGB
         ZWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784553391; x=1785158191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vax+aFL0WSjB4okz2i0tD/egGJ5gksI/+/yOw6Xy4rk=;
        b=qH6H65WiTmUtOTbXbTGbB4y1xvzfrRLBNQMaGZuQGyQcDp+sAMyZMrju4KZZU6FauF
         SIpqCmvnNL6oVYRsusXoFa7FnFvWqWGjep3rnx+gwWnWrCWS3bfWHU/59C5W6E2SJ1Vw
         ipPsDK7f6hsC6tw8bKlbQmS7I2QfgCot1P1DAKTMlB1ybUs5/S9mpX1YVXn2KEpT6dlO
         1lW4Wbw5pn9dY9OHUX4R/bUdLEGXkNqsYj7uabIN51JeG+f7WYjv2mKNBGpz/8lt+gyv
         ZSsQSJ7URcRuZD2CEgeTI0+S+w6m/eh9Oi96/xrcGN2fhzeDUwPRSb3KKfVt1X9uFl3J
         EwZw==
X-Forwarded-Encrypted: i=1; AHgh+RoiaEw2lfU9K5aDek0O6lW7uB/El1GOTUtvkqAxw65QZgzxocL9/eL6wshm9BZaPpfnIEJkgkhdjGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJpvOz2e6ryKljRlUoZh8KeFU1MeWXPsFG6ALTNDyR2n9dTHpr
	L2kYCK+/I7y+ND9IZfL1zbzIzj3yBX1Y6uHGuC+1IOubkofnrinFVOJI9UrUMZl1BBs=
X-Gm-Gg: AfdE7cnL7wbLWmYEMLttt9fxC2pMe8HjwJ7SyiswqBlrSf5gaiEMrZJ4Ucl/tnIvB3P
	HBCdJio4zfBqhLkeb7zyPuIDvgbzjJNCyxBZG7KPSEZBQ+13A36jCBNiyOgzybXqI7/E8MaTe5R
	ZrRPObcMfFtuLG8qgCEMn0tkO3GoMW6+jfqclbkR0KigbVxFOYi9CfLWAnmwV3kt16whQupVPtI
	DAcGE23YBMhfe3ums6f4VVmGJgFCEjOSk17pdo4oFvBlXSu7wqIaqoNZiB5y+6vbLwCe3Ocd6OH
	Fw6pNt9qEySpKgmC3IRTy55hjlTbTD93EgTBrM8pQBeXi8t4y5pz3qBlt8rszPn8E7kiOBdseSp
	valSAVW5XdZm9ES2pltXg/SSeGrrmm+TppmtbjeUB80BtF34Aeqpg7qhq9c6UPbEgi8RCkbHImo
	rjM2MAEw==
X-Received: by 2002:a05:600c:3ba5:b0:495:4b42:8677 with SMTP id 5b1f17b1804b1-4954b42873emr163787355e9.18.1784553390578;
        Mon, 20 Jul 2026 06:16:30 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49564011868sm11989295e9.3.2026.07.20.06.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:16:30 -0700 (PDT)
Date: Mon, 20 Jul 2026 15:16:28 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shaojie Sun <sunshaojie@kylinos.cn>
Cc: tj@kernel.org, cgroups@vger.kernel.org, corbet@lwn.net, 
	cui.tao@linux.dev, hannes@cmpxchg.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: PING [PATCH v3] cgroup/cpu: document cpu.stat.local and clarify
 cpu.stat behavior
Message-ID: <al4fAmim8rdPCKlB@localhost.localdomain>
References: <20260629060636.200118-1-sunshaojie@kylinos.cn>
 <20260720100941.230825-1-sunshaojie@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ybx5ijmegvcly32d"
Content-Disposition: inline
In-Reply-To: <20260720100941.230825-1-sunshaojie@kylinos.cn>


--ybx5ijmegvcly32d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: PING [PATCH v3] cgroup/cpu: document cpu.stat.local and clarify
 cpu.stat behavior
MIME-Version: 1.0

Hi.

On Mon, Jul 20, 2026 at 06:09:41PM +0800, Shaojie Sun <sunshaojie@kylinos.c=
n> wrote:
> Just a gentle ping on this documentation patch. It received an
> Acked-by from Michal about three weeks ago. Any chance this could be
> picked up for the next merge window, or is there anything else needed
> from my side?
>=20
> The commit in linux-next is: 171569f8ee6724a4113a0100fea6ff83d9b70c6a

That's how linux-next works [1]:

| The linux-next tree is, by design, a snapshot of what the mainline is
| expected to look like after the next merge window closes.

So that patch is currently heading for-7.3.

HTH,
Michal

[1] https://www.kernel.org/doc/html/latest/process/2.Process.html#next-trees

--ybx5ijmegvcly32d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCal4fpxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ag+OQEA7QVOo55uPncb1q3RxLA6
eZ0HKmyB8oJPcD/lvV3W6k8BAOZtkzovQVeFXHW5v1X+aKubte1+Wyok4BcrQUdH
M70G
=Rl3J
-----END PGP SIGNATURE-----

--ybx5ijmegvcly32d--
