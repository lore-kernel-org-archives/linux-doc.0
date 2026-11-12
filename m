Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794525273;
	b=L2P85P/9aBAJs0BRKvVwMWoxeKjx8nMcWTnew0ViK613th8l6tiHiXf6OHLfW7OiFBht
	 pwex5+lnEUpXgimYxDj+g/cCI0tlQ0t9QRB7qCWsfuhQNmVIdb793edpXD3Oc3hVC731U
	 8+xdri4Xm1ijF79PWw7xxMLHwhwtLlVeqFq0nQxnoK6JSZoaWlEX49HGT2TIvaKTtnWRp
	 +6tu7GApr3W3u3lPRmU1Tj+Yi9SH8SnfxtlNRQzG9mDRNrek4rWa0Q1096fUom6AUb4fj
	 /M6jkRXkMc0bBk2KRMpzwk36u2Zc7w9MvOCG9pKPi1GtBqNspYpIXh6OI4Zn2U7gRbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=DN/qNmYDsOB9nL6rphMvlGN6Wu4Xb8ATnikeAxhxNfo=;
	b=wa9/6NhRbBEl9DIciwQezD8ubtkJwBR3E+qjCgABnoNAzoNt98DAUInjRE/dy/cxw2U2
	 pNVIsDyR630hP/3mvOBcouEziobVD/ZV45f1H5N6P+kmcfXhsxU03tGgkVYUgZBEzYR/l
	 ++XC4PzG+l6wcMkKAQaIYkdBVFDjnKLABX6DDYncg/sG9lYBI8LeGmHkW9vWxaJYZ4faA
	 xs3pcjun9IWOJNbzrZ9oAjrSPeGGVL/JOuBSN914V71V2gAGwvJFExXvz8IQlriwm31rC
	 CndDOeootIBPGAhAloec/dEyMVjmhwOi4UQgdhuUjg/agYNUOrxjyz7kjbAav1ixCog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EsvJdqN+;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8760F606A321
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 23:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8760F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EsvJdqN+
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so2400055e9.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 15:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794525272; x=1795130072; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DN/qNmYDsOB9nL6rphMvlGN6Wu4Xb8ATnikeAxhxNfo=;
        b=EsvJdqN+wWCfOMVWs6MUfw7XtuobuRCUPvEe6yaTTEFIspcg/SFHUzBExrtZtJMH+/
         WfIz7fdJHXtBzhFUxWQ/vq9c2Y71iKDMQOjJM099c77pSaaK3RtGVGFNi9grouSdUDYx
         d/Xw3C5QjmcT0YCXCLUQNfKxeqDOLGmvrP9bhZhxEycST49kjuObKaXrXzJonXajTTD8
         ItxcN/ZJpvZ2Kd38Tkvl/LO+v9rvYVLaGNtZr2F/tTd0ejZ5cQhKzW8y9QcZBJVficIz
         N2DVpC+JtYfBVIfCGC/Zs1ayz3EM8nKfaJCkx5jf5B+1tf5Hk2rqteKfCXH6HiVyYDk1
         kCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794525272; x=1795130072;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DN/qNmYDsOB9nL6rphMvlGN6Wu4Xb8ATnikeAxhxNfo=;
        b=SktVr68CCOP0uR7MMDdkx5V5nFWA8Jq1RGl7ddKY0ppmj05VXQc9WOoK7JYCJ9am+p
         o7ubJwNPnI6PU+JQ6Vk7MitN1eYTk0oiCDJZ/2NIXoDW5MAaEbcA0Sxc6oqnvQhrKTT7
         nXxNv+Pv3J5u2hDM3QIkPeZSkODzuN2ZMdpI0VAMgapQpknyvTMrAIXusyAVns7wqk29
         59IwQkqBSfff0ln/4z+csGcZp3xoHcp1QL+ClpdRXDWZu70bLuQWUoDBtkGXipU3bQdw
         XjOlBmpPYO83/Rt18VHZOoFrjs4TEcDvDAJ6PRrya7ijfwde7SX2CZnCr/pr9WJYvKrB
         PbvQ==
X-Forwarded-Encrypted: i=1; AL+hErFDV2ZDlBXkZxxRjhi14BKTwA/3a7CesLoXBZP45/luRVyjuRLzMvbwq9gqZVFeugpHH4lN9NSDUig=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sjmygLjSUyqIJmhci4Zyz4yzz3EfZhcZZg8pHyEIgx53jGafs
	xBVda3DVrVEMzWlJXQokS3qxF9GPcrolvgfn+m7OT/85NpP3Cvm4GG/5
X-Gm-Gg: AYBFou0xz75hqHc0Th5uz5gXV/4L3OqKKbNPgN10c4k1KF2vkMt8VldgzI4lEqJjHXq
	nwgIh4kXVNEv3vp3FQ6XoIs/JrPf3+QJUzhM3xZFn7LA0scfe3IsZsyGd6yZrWuBCoA29Ppj9ZW
	bKW/dJeqQNsLa4MBlHWJKEItxWhJ4PhQfT4jHtXKQJ3dXcvl4Tq/4odUW1lhpWkj4Imyx02pRcA
	UcEn8JvS5Be/lJref97RneOTc8m1sBAKaha73o+JgfcBJi/mo9dT0QrcNZfv5cgbNIYdpLVNZB4
	ukveTsQ0UtHbP4hHOc5pYhJTRZ/wN05McnhcO19mj6by+weaQtrLTioMLVFf8H14dFH5Sujw0tk
	yHni/FFBspB1ZsAoffzum6LaghJfQEpchApUgXZjvx/dl7CQO/Fow4WqqpOYRt7nG+MPwQAc+kT
	lBkiAro1Cap5USzH5vnNhHm5aaY1zkXq1NxbnvN66Dheku9ukCj/Bx9U74DSHg8ctEewnyqQ1g0
	JiVTiL0Ktei5UORdiCoJbw0Y2i8L6B3ts+J3//y5yX3SqzUK3ZWpavMs8dOhvHNeIfoKt8PGE1e
	8CN1zTenzj5d2SNfb2n9eRjx+vj9IZegQXGKcWSgaNYznSF6srUxRqly7CPrPkaMYX4ANPXe2IB
	P8FWwWoPgC3e0z/t4dg==
X-Received: by 2002:a05:600c:46d5:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4bb55a8329amr13702305e9.13.1794525271736;
        Thu, 12 Nov 2026 15:14:31 -0800 (PST)
Received: from [192.168.0.41] (bl22-190-205.dsl.telepac.pt. [2.83.190.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm96030325e9.14.2026.11.12.15.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 15:14:30 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <2226c85e-2902-4964-858a-2d1603263252@gmail.com>
Date: Thu, 12 Nov 2026 23:14:28 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
To: "Ahmed S. Darwish" <darwi@linutronix.de>, Nicolas Schier <nsc@kernel.org>
Cc: Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106091922.7560-1-darwi@linutronix.de>
 <avQNdicGzL3De556@derry.ads.avm.de> <avWy2r1BcDatzwo1@lx-t490>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <avWy2r1BcDatzwo1@lx-t490>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K2GKi8S106PfrZNN3W4EREbC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K2GKi8S106PfrZNN3W4EREbC
Content-Type: multipart/mixed; boundary="------------onQYsP5IVHvnHSUuO3vsIGv7";
 protected-headers="v1"; hp="clear"
Message-ID: <2226c85e-2902-4964-858a-2d1603263252@gmail.com>
Date: Thu, 12 Nov 2026 23:14:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
To: "Ahmed S. Darwish" <darwi@linutronix.de>, Nicolas Schier <nsc@kernel.org>
Cc: Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106091922.7560-1-darwi@linutronix.de>
 <avQNdicGzL3De556@derry.ads.avm.de> <avWy2r1BcDatzwo1@lx-t490>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <avWy2r1BcDatzwo1@lx-t490>

--------------onQYsP5IVHvnHSUuO3vsIGv7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/12/26 12:36, Ahmed S. Darwish wrote:
> Hi Nicolas,
>=20
> On Wed, 11 Nov 2026, Nicolas Schier wrote:
>> Thanks!  I know some people who are definitly interested in such a
>> config policy checker.
>>
> Great, thanks!
>=20
> I hope this leads to more mainline kernel configuration policies as wel=
l.
>=20
> On the user-space side, it's one of the reasons I'm versioning the sche=
ma
> in v2.  This way, projects like systemd can ship their own kernel polic=
y
> file, and that policy will be guaranteed to work with all future versio=
ns
> of this tool.
>=20
> So it's all mainline-first; both kernel upstream and userspace downstre=
am.
>=20
>> Please prepare a new MAINTAINERS entry in a respin.
> Sure.
>=20
> Beside a separate entry for the checker itself, I'll also add:
>=20
>     F: tools/kconfig-audit/policies/preempt_rt.yml
>=20
> to the 'Real-time Linux (PREEMPT_RT)' entry.
>=20
>> Are you planning to maintain it after inclusion?
> Yes, I'll be happy to maintain it.
>=20
> Would it be OK if one or two people from the Kconfig side also step-up =
as
> reviewrs?  Julian? Nicolas? Nathan?

I will politely decline the official title, but I will (unofficially)
watch and review some patches if merged :)

- Julian Braha

--------------onQYsP5IVHvnHSUuO3vsIGv7--

--------------K2GKi8S106PfrZNN3W4EREbC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavZIVQUDAAAAAAAKCRDElYPCBXNxICgY
AQCrg7omkjFSbzIwDbf86DhWih90vS9Sw1cD5XogAdL8JQEAugMEfkQyo0VYrMXEMxzxjaqaD4Dv
40JhZXotRyfJ9A8=
=Wy7B
-----END PGP SIGNATURE-----

--------------K2GKi8S106PfrZNN3W4EREbC--
