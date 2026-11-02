Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641902;
	b=MTKhjm/pApZIRw6AuYqPsGFRM7LIvzDHTBk0buzyyjpYu3a8bUdvk4il4Q6ncOfaP70O
	 Kef9Fpkgc98mNbVzl7VpYm+XKhLERT88ko6FxjqHRoV5SkcdwmeVtBMXaKuQaOApLoUHF
	 TDZNv1OLahN+7EvCnpyfhpyryAQrhnSgzSFNkogYcyIfMrsJ5WwXnihQclSrorRRkDS0G
	 hT2e5F9F0RZKyjwN+fWZQgdjSbEWPeOZp2707oBxLX1LaV0dnnGAH0KironIkRRpXgefB
	 kpcHCDJXcX+UnPWDIBMcumx6ZnQYu/aW/8xuLx3WBvwIotzOjvYebM0sCBVfG/M0ERg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1UTj7D8U8+hxOmWus5onNXedkTK0UKM+sEpe8PoDcXs=;
	b=COiEDZ3O71GcrpxIuSC0yHYqTPe1lgqpyjfThCnGySAs+wKgJDJvPT4Vlvpw2EjE6f75
	 AZbD6b26mIuzcUyQ1U6k5nkE/kcbNwaipLvHyzVTGMQmf2P4nNZu3G4Kf4XahgX4/ZdYO
	 D0RfQ+XvWVDeFo0hWyRcvhDZrsMtem5h1C+FYqmC2SSt3fg+u+G11tPXs5T1qhFmFUtxJ
	 86GYzSxvi9NWa4tQGIW2YmmqirN5e5YAnJL/9XuciopHMVXrwNc3GGTXrDTLJK8ZGwGQY
	 1vfo95E4n8CvBc8YI6fU/gyUuQCyYc6u6nAfinLri03YAyxM+h70SNfUPV5QSrJyAGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hqPVBVye;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62CA606AEB4
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 17:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C62CA606AEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hqPVBVye
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so20381735e9.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 09:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793641899; x=1794246699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1UTj7D8U8+hxOmWus5onNXedkTK0UKM+sEpe8PoDcXs=;
        b=hqPVBVyeqcglbHKcEb1sJBqvh+MKf32nBKhsUOi9Ua7qjPAX3tJ+tqADzcPut8FFh8
         X1bRUoD+eEFrQKl/X43FairBw7U5XO20F0BsPJrkaYsSxVeJfnj51Ow6UukY45G/eFCf
         Zt1uFXpkhil08pRRWUYwEwxGwG7amPjPiCER02O7aQl+MYZwdAgkGtzt96CFrcJXvBpk
         uuAiPjyszHDhp61/j6LeQcEAW/EQpqQamJdq/whie/RoAkbodBT83fBAqDPg6S5+Vnih
         VWdF0b2uukGg3hH2GspRDeXPSgdJvVnQVyBvykfGj05b3OjgutR2M1wvBYnoaWm6E2D4
         Aliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641899; x=1794246699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UTj7D8U8+hxOmWus5onNXedkTK0UKM+sEpe8PoDcXs=;
        b=Js1D0W77ZR6sZ98ObkQDZOiWtBsFLfykLlxPkT0CG/h4tjOXgDz7RMCmlvJJWmQo0c
         8Kwob29s5ulqNdQ7oirJ/Kb9GZrWsnTqPM5hSIiWf/CYv4YfFMFD8QJ4v1qVnOVUBU+v
         ARUzrNxSUhtm3Zi08qZO/SV0hspSpI8W6afmj7TQIIsbInB8zyzaxxvMm4cyK7C/F5M5
         /JldC0q6y2UenFWCbtkmhsGxDkQocyTVq3CW/lXtww86U//coJ6SXyMpPdzrtQwPpNCr
         lqgpKXjLvNmkTuyuMFXpKXmxVOUzEEY4K6vVRi4wA18Rr46v1nBwbxBvveinocedHSOH
         7Taw==
X-Forwarded-Encrypted: i=1; AKwUvByPwXNsyUivFhTAYOexMZsHwT2YWu5lhlkiQbvZq+WyT+V2LnLQIiKy2SS8LD28zRpKCBpb9uZKsiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0HF9vwuquPokhzfTtiGMeA1rW8G59lWZ7/JPxN4aRc14zSqdG
	V/irxYbqVxvI/mW+Mb1vbChBdMmFaMI4ARmb0f3Ehxinr58KyEyQHum0iTg8KNIj1fg=
X-Gm-Gg: AYBFou06SXtT+nYMfwl2kuAFRHC8Qpp7q5faW9tXDgfHhlJpFDH6B2rlgVV1WtJ9v4n
	UJ/tdwc73UA6DL3TuKkjBM90A2OwEiSORL5LeurhjZ165BBF0ARkZj1e1nju96muzKZtAChkuMh
	PDgulZiHZiXs5qhT9q56udpiDuRebe0o3FMNwD2434Ts0sopprlz3WoZuEGZXzsravXZaFkPNC9
	J/i1PQloTGUhS137omSFQ0CgB+/V03ULtFIxvZY9/vDtA+5vCzBOcyyGk3IsCAL24JWn4tEJYFl
	BfaUevBwR58IiOMLKAu1hLCYCes6/5jAU3bWZ7n9sWBr6TDAU12CQSgnYv/0bCwP7StgRDszVMd
	+H2vC9f+9CTpbr6RBorTC38qpyPqDQ+Vl0gaHVlofQ1TiYHbV1Gz3qDI2Rei6iqRn7FYzQ1Y5xe
	GrB9J3YgUwTxyqwJimjB7VDmzOZpJ2tsmAHbonANFW888SupEh6WcW1aDZunAmH0fKm8Q3vnXON
	yZJfWgvsIsrKeyPmOcBFu1nLjKueQNK46c15bhpWKqGY123TWEJlD+XLv3ytiqR1Q9R/0GGwl18
	uHuAPtlXXJmkRcbdfiBxAmn8h5mPsP7mwjExHDuWWdKdkr/UaZ5DCkxPnBTBQ6enT1OX9UNYj2k
	5+UmvtAauDUWN1ck=
X-Received: by 2002:a05:600c:1c0f:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4ac19233381mr245619445e9.26.1793641899045;
        Mon, 02 Nov 2026 09:51:39 -0800 (PST)
Received: from localhost (p200300f65f19a904293c83a06545501e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:293c:83a0:6545:501e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e71b9eaeesm21154811f8f.49.2026.11.02.09.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:51:38 -0800 (PST)
Date: Mon, 2 Nov 2026 18:51:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, bpf@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] bpf: Use "new" URL to show if net-next is open
Message-ID: <aujNf7TVDcwMYeLC@monoceros>
References: <20261102111509.357269-2-u.kleine-koenig@baylibre.com>
 <DMKVOUX2GDZN.2Y8MKLR367NU8@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rzmmr7d67z34n3v7"
Content-Disposition: inline
In-Reply-To: <DMKVOUX2GDZN.2Y8MKLR367NU8@gmail.com>


--rzmmr7d67z34n3v7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH bpf-next] bpf: Use "new" URL to show if net-next is open
MIME-Version: 1.0

Hello,

On Mon, Nov 02, 2026 at 04:50:37PM +0000, Alexei Starovoitov wrote:
> On Mon, Nov 02, 2026 at 03:15 AM Uwe Kleine-K=F6nig <u.kleine-koenig@bayl=
ibre.com> wrote:
> >  For non-subscribers to kernel mailing lists, there is also a status
> >  page run by David S. Miller on net-next that provides guidance:
> >
> > -  http://vger.kernel.org/~davem/net-next.html
> > +  https://netdev.bots.linux.dev/net-next.html
>=20
> The link is not the only stale part. The whole paragraph is wrong.
> We apply patches during the merge window too.
>=20
> diff --git a/Documentation/bpf/bpf_devel_QA.rst b/Documentation/bpf/bpf_d=
evel_QA.rst
> index 4729efd..f6b9533 100644
> --- a/Documentation/bpf/bpf_devel_QA.rst
> +++ b/Documentation/bpf/bpf_devel_QA.rst
> @@ -231,19 +231,9 @@ load or urgency.
>=20
>  Q: Are patches applied to bpf-next when the merge window is open?
>  -----------------------------------------------------------------
> -A: For the time when the merge window is open, bpf-next will not be
> -processed. This is roughly analogous to net-next patch processing,
> -so feel free to read up on the netdev docs at
> -Documentation/process/maintainer-netdev.rst about further details.
> -
> -During those two weeks of merge window, we might ask you to resend
> -your patch series once bpf-next is open again. Once Linus released
> -a ``v*-rc1`` after the merge window, we continue processing of bpf-next.
> -
> -For non-subscribers to kernel mailing lists, there is also a status
> -page run by David S. Miller on net-next that provides guidance:
> -
> -  http://vger.kernel.org/~davem/net-next.html
> +A: Yes.

Even better. Do you care to get this change in then?

Best regards
Uwe

--rzmmr7d67z34n3v7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrozaYACgkQj4D7WH0S
/k7W1wf+JQLcRbGrPXFvyGP1EZsRgK9324kSWU2Dh/RKoKN9FOlcL96jqZziPjF5
syGXM8YlngzCcmImpq+2qARXjs7pO3Jrh7omKGHQEo2yjxC2XnMNpGK9fdz3i6zC
BfE8234a0mFNL3SUDwGeDxTCxmbJ1C8xiT78fbxe7fp0jwPjX2dFt0f/FRSOeeoR
uOQLavO+AKRpxiTiG2wuXjkDN/sx55ZKJTOncUWSgORfWcrFpim8R1EShjodADRN
R9vcG/RSZjmwHpFYgmtsqP9w2c+3yG/RiKfRpiX08sxOwpDxfl4NybXQE4dVg82F
B9VXlziJD8NyUXDQ5aM2FPOSQZY2bQ==
=EFpF
-----END PGP SIGNATURE-----

--rzmmr7d67z34n3v7--
