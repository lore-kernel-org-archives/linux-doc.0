Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F90F282F13
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741005; cv=none; b=TpRY0343fA+LoWW8auQxI92GdWCHzKHB8+SS2+gJcBI/d9tYmb7RPpVg1q6A2MawAMB29RsHDZyausKWoA9xMRJSQ17m+MAJPo7Yoef20ebZsh3rLEIkXDpQ/Rc1C4d0zcJZwOJMNRo8O68DW0KH6pn20+UcXEP+UDzDO7BfLcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741005; c=relaxed/simple;
	bh=oZQ+GwMytrTPHNJ1MesQiy5LlutyAVV/lnrR2pnvp7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdZVIJgFEU+GqP49xpP0zwwUpQD0HNNWz6KBvdSNsziOMSkUngCYTgbyPH1+eFkP2UTfxvuOGiC5y0/B94MujkLmz0hRA+ALmHjUjpRj748Yv1NmlWBP8HJ2MJ8CpquOaO+LLLLo+NeYGQwrp0mtff1X86fIPJ483irRzpe/y44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=biccHkv0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="biccHkv0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4924593f45dso43923935e9.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782741002; x=1783345802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wAT8dl0QuouSJVL6hKIvFeb/VtDClMwNys/m3MOu4Hs=;
        b=biccHkv0ELVBcZhjHQx47JVw0r/2DFF9ZOhiTWfvqdcqUz+xjZ1ZlmprP29s5P5pIp
         9PfK7VzhwHvU8Vf+gWgJzE5M1xg2pbsY2GpJs6A8tJzLcOk9xd3czl4PWZjJFr9mrG3q
         o3On2yZVHQgMsuqPiXbI7n3eDrwgF+3Yr4ygFbqAXOhIPM24elA6vFiDGEbOqv8Fnnde
         cBdLXlSje27HrV3qQvvonONTEpe7+VdYCN4CQO5o20IldtTmQlg886gnaORivqeBUdgi
         OE8EaZLm1r8hr2OWMgE8lLpb0HYBegz1OSbwoHiDCdlBLJLqDEYN+3DM/fr/0MrE7hTa
         akIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741002; x=1783345802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAT8dl0QuouSJVL6hKIvFeb/VtDClMwNys/m3MOu4Hs=;
        b=QohqEoRzbQ768zpeeEXXB2DxYcBiRIO7QeapclhfahYNNfWBk4SWqS7chw+m3BUFWC
         uAhJyViTG3c+d8nxsi5S3f7g1rEnACbCiOdQXZZAMPZY2FR1BKiJ4j3CZomn6/5J1K87
         9eXuQURtQGov5v80x2zckjMASA3piE74iac6c8RIj8hzljCr4+xJnOPxFZYEDNKObru/
         ZZP/nafhhtrC6qHqXxj2vVuCqS/JGSsVHt/mVS6ussfrqLTfq0pw4v1oRHeSpbZwX4YG
         yKEUfQzKvFzjZn+dOiK0OtY8XGJM6zOT7lR7vqvN5+ZEUhdiGh7fpUM16iDFFwX+rb69
         b1bQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YuMPL5vSijEBsvESTVZrizzWw8letd0/iCxzJEs5vYP2DbAyFpBkfkkcRsGnqSDcwsJvyt/Efkw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE0w4HKlX0umn7P4ytcjT/mDbWUcBb/Fkea+ag6wSbCioYeALT
	wpa97FZwwWTDaJqXF5HqTlpjQ1lVZvcXxkJp2cgJs6JsEA8U6RU53bUXHk7RnrFkdKw=
X-Gm-Gg: AfdE7cmnAojhoDgmRTPfAYUEyoTNqW9EzlMHUT0Zt9IVAyV8GDjwLX5g2k6oZbapDYO
	XEOIbOrzByEaXJj9oy9btdZAp3Iz8CsH9ISPFJXO7jplXQckB4G1s+knSaZ2+sZlLZyPx4DYN53
	/z8iR3kDB1GtDcztREA2wSj/f/6w06fe2Z8fJViDt6V0n+kimVrqlKhcqLjOTEZKZrKZeHhQGix
	SlAkJ1jyxWl3h7PqvJtsPU2/j7DtSN+xcfSy1kuyiu7BKsJwqeLlp3OJ7Tn4mgYibIFBezJ4seT
	8c3ba/vGex2dRkiJst2+6rydfpur4FdcURgUEou+DMzpQspMKsOegPP95ZFyjC1H3Mcha4djfnC
	QTdY/Zg9d1woQS0BC37qhcr159KE5lak+7hJCXKyzjw/gcK7fyzsNEYEiLZlGfDe3Nf1uDRbIqW
	PiYhxsNB2Xqms6qs252CoyVSR270Ye
X-Received: by 2002:a05:600c:4f8f:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-492668561cdmr258645505e9.13.1782741001997;
        Mon, 29 Jun 2026 06:50:01 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269071e49sm323349855e9.10.2026.06.29.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:50:01 -0700 (PDT)
Date: Mon, 29 Jun 2026 15:49:59 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Sun Shaojie <sunshaojie@kylinos.cn>
Cc: cgroups@vger.kernel.org, corbet@lwn.net, cui.tao@linux.dev, 
	hannes@cmpxchg.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, tj@kernel.org
Subject: Re: [PATCH v3] cgroup/cpu: document cpu.stat.local and clarify
 cpu.stat behavior
Message-ID: <akJ37sqf6nOTW9hW@localhost.localdomain>
References: <aj6PQPz4IDoVTnPL@localhost.localdomain>
 <20260629060636.200118-1-sunshaojie@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hahg446l5ehwp2pu"
Content-Disposition: inline
In-Reply-To: <20260629060636.200118-1-sunshaojie@kylinos.cn>


--hahg446l5ehwp2pu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] cgroup/cpu: document cpu.stat.local and clarify
 cpu.stat behavior
MIME-Version: 1.0

On Mon, Jun 29, 2026 at 02:06:36PM +0800, Sun Shaojie <sunshaojie@kylinos.c=
n> wrote:
> Add documentation for the cpu.stat.local interface file, which reports
> the throttled_usec stat -- the actual throttling time incurred by the
> cgroup's own runqueues, which may include throttling inherited from
> ancestor cgroup bandwidth limits. Unlike cpu.stat's throttled_usec
> which only accounts for throttling caused by the cgroup's own CFS
> bandwidth limit.
>=20
> When the controller is not enabled, the stat is not reported.
>=20
> Also clarify cpu.stat descriptions: note that the three base CPU usage
> stats (usage_usec, user_usec, system_usec) include descendant cgroups,
> and that the five CFS bandwidth stats are non-hierarchical -- they only
> account for throttling caused by the cgroup's own bandwidth limit.
>=20
> Signed-off-by: Sun Shaojie <sunshaojie@kylinos.cn>
> ---
> Changes in v3:
> - Clarify that the three base CPU usage stats include descendant
>   cgroups.
> - Add a note explaining that the five CFS bandwidth stats are
>   non-hierarchical.
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

Thanks!

--hahg446l5ehwp2pu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCakJ4AxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AgkVwEAlNPhk0y07Lvgta96yMTx
CLPWHx/DdRQqT7zBtXFBPlMBAMnF/6AANVrGAHXQGdGxQWg6nqe2FYZ38zgQ+Kf4
jOsF
=6Q2U
-----END PGP SIGNATURE-----

--hahg446l5ehwp2pu--
